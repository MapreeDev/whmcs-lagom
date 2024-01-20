
{if file_exists("templates/$template/store/weebly/overwrites/index.tpl")}
    {include file="{$template}/store/weebly/overwrites/index.tpl"}  
{else}
    <div class="site site-webbly">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{lang key="store.websiteBuilder.headline"} </h1>
                    <div class="banner-desc">
                        <p>{lang key="store.websiteBuilder.tagline"}</p>
                    </div>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing'); return false">{$LANG.clientareaaddonpricing}</a>
                        <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview'); return false">{$LANG.learnmore}</a>
                    </div>
                </div>
                <div class="banner-background">
                    <div class="banner-graphic">
                        {if $RSThemes.styles.iconType == "modern"}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/weebly"}
                        {else}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/weebly"}
                        {/if}
                    </div>
                    <div class="banner-shape">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section" id="overview">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-sm">
                            <div class="browser-top browser-top-transparent">
                                <div class="browser-actions"><span></span><span></span><span></span></div>
                            </div>
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/weebly/weebly-preview-1"}                               
                        </div>
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key="store.websiteBuilder.ddEditor"}</h2>
                        <div class="section-desc">
                            <p>{lang key="store.websiteBuilder.introduction"}</p>
                            <p>{lang key="store.websiteBuilder.ddEditorDescription"}</p>
                        </div>
                    </div>
                </div>
                <div class="section-content">
                    <div class="features features-boxes row row-eq-height justify-center">
                        <div class="col-lg col-md-12 col-sm-12">
                            <div class="feature feature-bordered feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="drag-drop-builder"}                                    
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.ddEditor"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg col-md-12 col-sm-12">
                            <div class="feature feature-bordered feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="unlimited-pages"}                                     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.pricing.features.pages"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg col-md-12 col-sm-12">
                            <div class="feature feature-bordered feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="trusted-by-over-40"}                                   
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.trust"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>              
        <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} section-pricing" id="pricing">
            <div class="container">
                <h2 class="section-title">{lang key="store.websiteBuilder.tab.pricing"}</h2>
                <div class="product-billing-switcher">
                    <div class="btn-group hidden-sm hidden-xs" role="group">
                        {foreach $billingCycles as $cycle}                                    
                            <button type="button" class="btn btn-sm cycle-change {if $cycle@first} active{/if}" data-cycle="{$cycle}"> {lang key={'orderpaymentterm'|cat:$cycle}} </button>
                        {/foreach}
                    </div>
                    <div class="dropdown visible-sm visible-xs">
                        <button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">
                            <span id="cycle-text">{$LANG.orderpaymenttermmonthly}</span>
                            <i class="ls ls-caret"></i>
                        </button>
                        <div class="dropdown-menu">
                            {foreach $billingCycles as $cycle}
                                <button type="button" class="dropdown-item cycle-change {$cycle}{if $cycle@first} active{/if}" data-cycle="{$cycle}"> {lang key={'orderpaymentterm'|cat:$cycle}} </button>
                            {/foreach}
                        </div>
                    </div>
                </div>             
                {if $litePlan}
                <div class="package package-horizontal">
                    <div class="package-side package-side-left">
                        <div class="package-header">
                            <h4 class="package-title">{lang key="store.websiteBuilder.pricing.free.headline"}</h4>
                            <div class="package-price">
                                {foreach $litePlan->pricing()->allAvailableCycles() as $pricing}
                                    <div class="pricing-text {$pricing->cycle()}">
                                        {include file="$template/includes/common/price.tpl" 
                                            price=$pricing->price()
                                            priceCurrency=$activeCurrency.prefix
                                            priceCurrencySuffix=$activeCurrency.suffix
                                            priceCycle=$pricing->cycle()
                                            priceCycleShort=true
                                        }
                                    </div>
                                {foreachelse}
                                {/foreach}
                                <div class="not-available hidden">-</div>
                            </div>
                        </div>
                        <div class="package-body">
                            <div class="package-content">
                                <p>{lang key="store.websiteBuilder.pricing.free.tagline"}</p>
                                <p>{$litePlan->description}</p>
                            </div>
                         </div>
                    </div>        
                    <div class="package-footer package-side package-side-right">    
                        <div class="package-price">
                            {foreach $litePlan->pricing()->allAvailableCycles() as $pricing}
                                <div class="price pricing-text {$pricing->cycle()}">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$pricing->price()
                                        priceCurrency=$activeCurrency.prefix
                                        priceCurrencySuffix=$activeCurrency.suffix
                                        priceCycle=$pricing->cycle()
                                        priceCycleShort=true
                                    }
                                </div>
                            {foreachelse}
                            {/foreach}
                            <div class="not-available hidden">-</div>
                        </div>
                        <form method="post" action="{routePath('cart-order')}" >
                            <input type="hidden" name="pid" value="{$litePlan->id}">
                            <input type="hidden" name="billingcycle" value="">
                            <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if} btn-lg btn-signup">
                                {lang key='getStartedNow'}
                            </button>
                        </form>
                    </div>
                </div>
                {/if}
                <div class="row row-eq-height row-eq-height-sm"> 
                    {if count($products) > 0}
                        {foreach $products as $key => $product}
                            <div class="{if count($products) == 1}col-sm-6 col-sm-offset-3{elseif count($products) == 2}col-sm-5{if $key == 0} col-sm-offset-1{/if}{else}col-lg-4 col-md-6 col-sm-12{/if}">
                                <div class="package package-lg">
                                    <div class="package-header">
                                        <h4 class="package-title">{$product->name}</h4>
                                        <p class="package-subtitle">{lang key="store.websiteBuilder.pricing.idealFor" for=$product->idealFor}</p>
                                        <div class="package-price">                                                
                                            {foreach $product->pricing()->allAvailableCycles() as $pricing}                                            
                                                <div class="pricing-text price {$pricing->cycle()}{if !$pricing@first} hidden{/if}">
                                                    {include file="$template/includes/common/price.tpl" 
                                                        price=$pricing->price()
                                                        priceCycle=$pricing->cycle()
                                                    }
                                                </div>
                                            {foreachelse}
                                            {/foreach}
                                             <div class="price not-available hidden">-</div>
                                        </div>
                                    </div>
                                    <div class="package-body">
                                        <ul class="package-features">
                                            <li class="features-heading">{lang key='store.websiteBuilder.pricing.siteFeatures'}</li>
                                            {foreach $product->siteFeatures as $langKey => $feature}
                                                <li>{lang key="store.websiteBuilder.pricing.features.$langKey"}</li>
                                            {/foreach}
                                            <li class="features-heading">{lang key='store.websiteBuilder.pricing.eCommerceFeatures'}</li>
                                            {foreach $product->ecommerceFeatures as $langKey => $feature}
                                                <li>{lang key="store.websiteBuilder.pricing.features.$langKey"}</li>
                                            {/foreach}
                                        </ul>
                                        <div class="package-actions">
                                            <form method="post" action="{routePath('cart-order')}">
                                                <input type="hidden" name="pid" value="{$product->id}">
                                                <input type="hidden" name="billingcycle" value="">
                                                <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if}">{lang key='signup'}</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {if count($products)> 4 && ($key % 3 == 0)}</div><div class="row plans">{/if}
                        {/foreach}
                    {elseif $inPreview}
                        <div class="col-12 lead text-center">{lang key='store.websiteBuilder.admin.Preview'}</div>
                    {/if}
                </div>
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <div class="section-content">
                    <div class="row row-eq-height row-eq-height-xs features">
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="builder"}                                   
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.builder"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.builderDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="ecommerce"}                                   
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.ecommerce"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.ecommerceDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="forms"}                                    
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.forms"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.formsDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="templates"}                                   
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.templates"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.templatesDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="photos"}                                   
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.gallery"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.galleryDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="blogging"}                                    
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.blogging"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.bloggingDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="video"}                                    
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.video"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.videoDescription"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="feature mob-feature-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="seo"}                                  
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.websiteBuilder.features.seo"}</h4>
                                    <p class="feature-desc">{lang key="store.websiteBuilder.features.seoDescription"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key="store.websiteBuilder.faq.title"}</h2>
                <div class="section-content m-w-lg m-a">
                    <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                        {foreach [1,2,3,4,5,6,7,8] as $columns}
                            <div class="panel panel-accordion">
                                {foreach $columns as $row}
                                <div id="toggle-{$row}" class="panel-heading" data-toggle="collapse" data-target="#id-{$row}" aria-expanded="true" aria-controls="id-{$row}">
                                    <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.websiteBuilder.faq.q$row"}</h4>
                                </div>
                                <div id="id-{$row}" class="panel-collapse collapse" aria-labelledby="toggle-{$row}" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.websiteBuilder.faq.a$row"}</p>
                                    </div>
                                </div>
                                    {if $row@last && $row != 8}
                                        <div class="hidden-md hidden-lg"></div>
                                    {else}
                                    {/if}
                                {/foreach}
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div> 
        </div>
        <div class="site-section">
            <div class="container"> 
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2 class="section-title">
                            {if $LANG.store.websiteBuilder.trust|strstr:"40,000,000"}
                                {$LANG.store.websiteBuilder.trust|replace:'4':'<span class="text-primary">4'|replace:"0 ":"0</span> "}
                            {else}
                                {lang key='store.websiteBuilder.trust'}
                            {/if}
                        </h2> 
                        <img class="logo"src="{$WEB_ROOT}/assets/img/marketconnect/weebly/logo.png" width="260px"> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="{$WEB_ROOT}/templates/{$template}/store/weebly/master.js"></script> 
{/if}