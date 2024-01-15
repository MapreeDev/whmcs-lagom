
{if $secondarySectionStyle == 'primary' ||  $secondarySectionStyle == 'secondary'}
    {assign var="SecondaryIconOnDark" value="true"}
{/if}

{assign var="homepageTemplate" value=$RSThemes.pages.homepage.name}

{* =====================================

 PROMOTED PRODUCT GROUPS
 Enter product group IDs, which you want to promote

 ======================================= *}

 {if $RSThemes['pages'][$templatefile]['config']['showProducGroups'] == '1'}
{assign var=productGroupId value=[

    [
        'gid' => 1,
        'icon' => 'shared-hosting.tpl',
        'featured' => false
    ],
    [
        'gid' => 2,
        'icon' => 'vps-hosting.tpl',
        'featured' => true
    ],
    [
        'gid' => 3,
        'icon' => 'dedicated-servers.tpl',
        'featured' => false
    ]
]}
{foreach from=$productGroupId key=k item=product}
    {if $homepage->productGroup($product.gid)->product}
        {assign var=showGroup value=true}
    {/if}
{/foreach}
{/if}

{* =====================================

 TESTIMONIALS
 Add new testimonials simply by adding new array records below

 ======================================= *}
 
{if $RSThemes['pages'][$templatefile]['config']['showTestimonials'] == '1'}
{assign var=testimonials value=[
[
    'author'=> 'Sonia Stephens',
    'avatar' => 'homepage-avatar-1.png',
    'website'=> 'lagom.rsstudio.net',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'John Doe',
    'avatar' => 'homepage-avatar-2.png',
    'website'=> 'rsstudio.net',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'Alexandra Chapman',
    'avatar' => 'homepage-avatar-3.png',
    'website'=> 'rsstudio.net',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'James Bond',
    'avatar' => 'homepage-avatar-4.png',
    'website'=> 'lagom.rsstudio.com',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'Alice Smith',
    'avatar' => 'homepage-avatar-5.png',
    'website'=> 'lagom.rsstudio.com',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'Emily Turner',
    'avatar' => 'homepage-avatar-6.png',
    'website'=> 'lagom.rsstudio.com',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
],
[
    'author'=> 'Brandon Quinn',
    'avatar' => 'homepage-avatar-7.png',
    'website'=> 'lagom.rsstudio.com',
    'description' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, doloremque doloribus impedit incidunt minus natus officiis omnis perspiciatis ullam.'
]
]}
 {/if}

<div class="site site-index">
    {if $homepage->getPromotionExtensionStatus()}
        {include file="$template/core/extensions/PromoBanners/promotion-home.tpl"}
    {else}
        {include file="$template/core/pages/homepage/$homepageTemplate/shared/banner-slider.tpl"}
    {/if}
    {if $registerdomainenabled && $RSThemes['pages'][$templatefile]['config']['showDomainSearch'] == '1'}
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.find_domain.title')}</h2>
            <div class="section-content">
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <div class="search-group search-group-combined">
                        <div class="search-field search-field-lg">
                            <div class="search-field-icon"><i class="lm lm-search"></i></div>
                            <input class="form-control form-control-lg" type="text" name="domain" placeholder="{$rslang->trans('homepage.find_domain.example_domain')}" autocapitalize="none"/>
                        </div>
                        <div class="search-group-btn">
                            <input type="submit" class="btn btn-primary btn-lg search {if in_array($captcha, ['invisible']) && $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}{$captcha->getButtonClass($captchaForm)}{/if}" value="{$rslang->trans('homepage.find_domain.search')}"/>
                        </div>
                    </div>
                </form>
                {if $homepage->getSpotlight()}
                    <div class="domain-tlds row">
                        {foreach $homepage->getSpotlight() as $domain}
                            <div class="col-sm">
                                <div class="domain-tld">
                                    <div class="tld-name">
                                        {$domain.ext|replace:".":"<span>.</span>"}
                                    </div>
                                    <div class="tld-price">
                                        <span>{$domain.price}</span>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            </div>
        </div>
    </div>
    {/if}   
    {if $productGroupId && $showGroup && $RSThemes['pages'][$templatefile]['config']['showProducGroups'] == '1'}
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.products.title')}</h2>
            <div class="section-content">
                <div class="row row-lg row-eq-height row-eq-height-sm">
                    {foreach from=$productGroupId key=k item=product}
                        {if $homepage->productGroup($product.gid)->product}
                            <div class="col">
                                <div class="package package-lg">
                                    <div class="package-icon">
                                        {if $product.icon|strstr:".tpl"}
                                            {include file="$template/includes/common/svg-icon.tpl" icon="{$product.icon|replace:'.tpl':''}"}
                                        {else}
                                            <img class="w-100" src="{$WEB_ROOT}/templates/{$template}/assets/img/products/{$product.icon}">
                                        {/if}
                                    </div>
                                    <h3 class="package-title">{$homepage->productGroup($product.gid)->product->productGroup->name}</h3>
                                    <p class="package-desc">{$homepage->productGroup($product.gid)->product->productGroup->headline}</p>
                                    <div class="package-price">
                                        <div class="package-starting-from ">{$LANG.startingat}</div>
                                        <div class="price">
                                            {$homepage->productGroup($product.gid)->price}
                                            {if $homepage->productGroup($product.gid)->billing eq 'free' || $homepage->productGroup($product.gid)->cycle eq 'onetime'}
                                            {else}
                                                <span class="price-cycle">
                                                    {if $homepage->productGroup($product.gid)->billing eq "monthly"}
                                                        {$LANG.orderpaymenttermmonthly}
                                                    {elseif $homepage->productGroup($product.gid)->billing eq "quarterly"}
                                                        {$LANG.orderpaymenttermquarterly}
                                                    {elseif $homepage->productGroup($product.gid)->billing eq "semiannually"}
                                                        {$LANG.orderpaymenttermsemiannually}
                                                    {elseif $homepage->productGroup($product.gid)->billing eq "annually"}
                                                        {$LANG.orderpaymenttermannually}
                                                    {elseif $homepage->productGroup($product.gid)->billing eq "biennially"}
                                                        {$LANG.orderpaymenttermbiennially}
                                                    {elseif $homepage->productGroup($product.gid)->billing eq "triennially"}
                                                        {$LANG.orderpaymenttermtriennially}
                                                    {/if}
                                                </span>
                                            {/if}
                                        </div>
                                        {if $homepage->productGroup($product.gid)->discount}
                                            <div class="price-save">
                                                <span class="line-through">{$homepage->productGroup($product.gid)->discount_price_before}</span>
                                                <span class="label label-faded label-info">Save {$homepage->productGroup($product.gid)->discount_percentage}%</span>
                                            </div>
                                        {/if}
                                    </div>
                                    <div class="package-actions">
                                        <a href="{$systemurl}cart.php?gid={$homepage->productGroup($product.gid)->product->productGroup->id}" class="btn btn-lg btn-primary" data-target="incoming">{$rslang->trans('homepage.products.product_btn')}</a>
                                    </div>
                                </div>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    {/if}        
    {if $RSThemes['pages'][$templatefile]['config']['showFeatures'] == '1'}
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.features.title')}</h2>
            <p class="section-subtitle">{$rslang->trans('homepage.features.subtitle')}</p>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-xs features">
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="addon-email-forwarding" onDark=$SecondaryIconOnDark }
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-1.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-1.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank" onDark=$SecondaryIconOnDark}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-2.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-2.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="free-reissues" onDark=$SecondaryIconOnDark}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-3.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-3.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="seo" onDark=$SecondaryIconOnDark}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-4.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-4.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation" onDark=$SecondaryIconOnDark}                                    
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-5.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-5.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="free-reissues" onDark=$SecondaryIconOnDark}                                   
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-6.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-6.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="encryp-sensitive-data" onDark=$SecondaryIconOnDark}                                    
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-7.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-7.desc')}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="content-delivery-network" onDark=$SecondaryIconOnDark}                                    
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{$rslang->trans('homepage.features.feature-8.title')}</h4>
                                <p class="feature-desc">{$rslang->trans('homepage.features.feature-8.desc')}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {/if}
    {if $testimonials && $RSThemes['pages'][$templatefile]['config']['showTestimonials'] == '1'}
    <div class="site-section overflow-hidden">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.testimonials.title')}</h2>
            <p class="section-subtitle">{$rslang->trans('homepage.testimonials.subtitle')}</p>
            <div class="section-content">
                {if $testimonials|@count < 4}
                <div class="testimonials row row-eq-height">
                    {foreach from=$testimonials item=testimonial key=testimonial_key}
                    <div class="col-xl-4">
                        <div class="testimonials-item">
                            {if file_exists("templates/$template/core/pages/homepage/$homepageTemplate/shared/testimonial.tpl")}
                                {include file="$template/core/pages/homepage/$homepageTemplate/shared/testimonial.tpl"}
                            {/if}
                        </div>
                    </div>
                    {/foreach}
                </div>
                {/if}
                {if $testimonials|@count > 3}
                <div class="slider testimonials" data-testimonial-slider>
                    <div class="content-slider" data-slider-container>
                        <div class="content-slider-wrapper" data-slider-wrapper>
                            {foreach from=$testimonials item=testimonial key=testimonial_key}
                            <div class="content-slider-item testimonials-item">
                                {if file_exists("templates/$template/core/pages/homepage/$homepageTemplate/shared/testimonial.tpl")}
                                    {include file="$template/core/pages/homepage/$homepageTemplate/shared/testimonial.tpl"}
                                {/if}
                            </div>
                            {/foreach}
                        </div>
                    </div>
                </div>
                {/if}
            </div>
        </div>
    </div>
    {/if}
    {if $announcements && $RSThemes['pages'][$templatefile]['config']['showNews'] == '1'}
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.latest_news.title')}</h2>
            <p class="section-subtitle">{$rslang->trans('homepage.latest_news.subtitle')}</p>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-xs news">
                    {foreach $announcements as $announcement}
                        <div class="{if $announcements|@count == 2} col-xl-6 col-md-6{else if $announcements|@count == 3} col-xl-4 col-md-6{else if $announcements|@count == 1} col-xl-12 col-md-12{else} col-xl-3 col-md-6{/if}">
                            <a href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" class="news-box">
                                <div class="news-body">
                                    <div class="news-date">
                                        <i class="lm lm-calendar"></i>
                                        <span>{$carbon->translatePassedToFormat($announcement.rawDate, 'M jS')}</span>
                                    </div>
                                    <div class="news-desc">
                                        <p>{$announcement.title}</p>
                                    </div>
                                </div>
                                <div class="news-actions">
                                    <span>{$rslang->trans('homepage.latest_news.read_more')}</span>
                                </div>
                            </a>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    {/if}
    {if $RSThemes['pages'][$templatefile]['config']['showGetStarted'] == '1'}
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} text-center">
        <div class="container">
            <h2 class="section-title">{$rslang->trans('homepage.get_started.title')}</h2>
            <p class="section-subtitle">{$rslang->trans('homepage.get_started.subtitle')}</p>
            <a href="{$WEB_ROOT}/contact.php" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if}">{$rslang->trans('homepage.get_started.btn_contact_text')}</a>
        </div>
    </div>
    {/if}
</div>
