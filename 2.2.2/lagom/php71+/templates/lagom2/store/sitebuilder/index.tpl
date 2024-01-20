
{if file_exists("templates/$template/store/sitebuilder/overwrites/index.tpl")}
    {include file="{$template}/store/sitebuilder/overwrites/index.tpl"}
{else}
<div class="site site-sitebuilder">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{$rslang->trans('sitebuilder.banner.title')}</h1>
                <div class="banner-desc">
                    <p>{$rslang->trans('sitebuilder.banner.desc')}</p>
                    <p>{$rslang->trans('sitebuilder.banner.desc_1')}</p>
                </div>
                <div class="banner-actions">
                    <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing'); return false">{$rslang->trans('sitebuilder.banner.btn_pricing_text')}</a>
                    <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview'); return false">{$LANG.learnmore}</a>
                </div>
            </div>
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/sitebuilder"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/sitebuilder"}
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
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/sitebuilder/sitebuilder-preview-1"}
                    </div>
                </div>
                <div class="section-content">
                    <h2 class="section-title">{lang key="store.siteBuilder.introHeadline"}</h2>
                    <div class="section-desc">
                        <p class="text-light"><strong>{lang key="store.siteBuilder.intro1"}</strong></p>
                        <p>{lang key="store.siteBuilder.intro2"}</p>
                    </div>
                    <div class="section-actions">                                    
                        <a href="#" class="btn btn-lg btn-primary" onclick="smoothScroll('#features');return false">{$LANG.learnmore}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section" id="features">
        <div class="container">
            <h2 class="section-title">{lang key="store.siteBuilder.featuresTitle"}</h2>
            <p class="section-subtitle">{lang key="store.siteBuilder.features.essentials.tagline"}</p>
            <ul class="nav nav-tabs nav-tabs-features" role="tablist">
                <li role="presentation"><a class="active" href="#essentials" aria-controls="essentials" role="tab" data-toggle="tab">{lang key="store.siteBuilder.featuresEssentials"}</a></li>
                <li role="presentation"><a href="#social" aria-controls="social" role="tab" data-toggle="tab">{lang key="store.siteBuilder.featuresSocial"}</a></li>
                <li role="presentation"><a href="#store" aria-controls="store" role="tab" data-toggle="tab">{lang key="store.siteBuilder.featuresStore"}</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active show" id="essentials">
                    <div class="section-content">
                        <div class="row row-eq-height row-eq-height-xs features">
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="drag-drop-builder"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.1"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.1"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-wordpress-plugin-updates"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.2"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.2"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="encryp-sensitive-data"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.3"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.3"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="mobile-friendly"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.4"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.4"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="photos"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.5"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.5"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-daily-automatic-website-backups"} 
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.essentials.6"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.essentials.6"}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="social">
                    <div class="section-content">
                        <div class="row row-eq-height row-eq-height-xs features">
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="malware-scan"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.1"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.1"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="article"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.2"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.2"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-file-change-monitoring"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.3"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.3"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="social-sharing"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.4"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.4"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="comments"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.5"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.5"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="instagram-twitter-connect"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.blog.6"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.blog.6"}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="store">
                    <div class="section-content">
                        <div class="row row-eq-height row-eq-height-xs features">
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-automatic-daily-backup"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.1"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.1"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="secure-online-transactions"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.2"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.2"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="quick-checkout"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.3"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.3"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-file-change-alert-monitoring"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.5"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.5"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="coupon-discount"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.6"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.6"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="encryp-sensitive-data"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.7"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.7"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="shared-hosting"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.8"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.8"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="vat-taxes"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.9"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.9"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <div class="feature feature-xs-left">
                                    <div class="feature-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="ecommerce"}
                                    </div>
                                    <div class="feature-content">
                                        <h4 class="feature-title">{lang key="store.siteBuilder.features.store.10"}</h4>
                                        <p class="feature-desc">{lang key="store.siteBuilder.featuresdescriptions.store.10"}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-actions text-center">
                <a href="#" class="btn btn-primary btn-lg" onclick="smoothScroll('#pricing');return false">
                    {lang key="store.siteBuilder.viewPricing"}
                </a>
            </div>
        </div>
    </div>
    <div class="site-section section-templates">
        <div class="container">
            <h2 class="section-title">{lang key="store.siteBuilder.templatesTitle"}</h2>
            <p class="section-subtitle">{lang key="store.siteBuilder.templatesOutro"}</p>
            <div class="section-content">
                <div class="templates">
                    <ul class="nav nav-tabs justify-content-center" role="tablist">
                        <li>
                            <a href="#" class="templates-filter-btn" data-type="single">{lang key="store.siteBuilder.templates.singlePage"}</a>
                        </li>
                        <li>
                            <a href="#" class="templates-filter-btn" data-type="multi">{lang key="store.siteBuilder.templates.multiPage"}</a>
                        </li>
                        <li>
                            <a href="#" class="templates-filter-btn" data-type="ecom">{lang key="store.siteBuilder.templates.eCommerce"}</a>
                        </li>
                    </ul>
                    <div class="previews">
                        <div class="row">
                            {foreach $templates as $i => $template}
                                <div class="col-md-6 col-lg-4 type-{$template['type']} show-more-item" {if $i < 6} style="display: block;" {else} style="display: none;" {/if}>
                                    <a href="{$template['preview']}" target="_blank">
                                        <div class="thumb-wrapper">
                                            <img src="{$template['thumbnail']}" class="deferred">
                                            <span class="type-label">{lang key="store.siteBuilder.templates.typeLabels.{$template['type']}"}</span>
                                        </div>
                                        <span class="tplname">{$template['name']}</span>
                                    </a>
                                </div>
                            {/foreach}
                            <button class="btn btn-lg btn-primary show-more-btn">{$rslang->trans('sitebuilder.templates.show_more')}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section" id="pricing">
        <div class="container">
            {if $trialPlan}
                <h2 class="section-title">{lang key="store.siteBuilder.tryFree"}</h2>
                <p class="section-subtitle">{lang key="store.siteBuilder.tryFreeIntro"}{lang key="store.siteBuilder.tryFreeIntro2"}</p>
                <div class="text-center m-b-7x">
                    <form method="post" action="{routePath('cart-order')}">
                        <input type="hidden" name="pid" value="{$trialPlan->id}">
                        <input type="hidden" name="billingcycle" value="">
                        <button type="submit" class="btn btn-primary btn-lg">
                            {lang key='store.siteBuilder.tryFreeCta'}
                        </button>
                    </form>
                </div>
            {else}
                <h2 class="section-title">{lang key="store.siteBuilder.pricingTitle"}</h2>
            {/if}
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm">
                    {foreach $plans as $plan}
                        <div class="col">
                            <div class="package">
                                <div class="package-header">
                                    <h4 class="package-title">{$plan->name}</h4>
                                    <div class="package-price">
                                        {if  $plan->pricing()->first()}
                                            <div class="price">
                                            {include file="$template/includes/common/price.tpl" 
                                                price=$plan->pricing()->first()->price()
                                                priceCycle=$plan->pricing()->first()->cycle()
                                            }
                                            </div>
                                        {else}
                                            -
                                        {/if}
                                    </div>
                                </div>
                                <div class="package-body">
                                    <ul class="package-features">
                                        {foreach $promoHelper->getFeatures() as $featureKey => $feature}
                                            {if $feature@iteration > count($promoHelper->getFeatures())-2}
                                                <li>
                                                    <strong>
                                                        {if isset($plan->features[$feature])}
                                                            {if is_bool($plan->features[$feature])}
                                                            {else}
                                                                {$plan->features[$feature]}
                                                            {/if}
                                                        {/if}
                                                    </strong>
                                                    {lang key="store.siteBuilder.featuresLabels.$featureKey"}
                                                </li>
                                            {/if}
                                        {/foreach}
                                    </ul>
                                    <div class="package-actions">
                                        <form action="{routePath('cart-order')}" method="post">
                                            <input type="hidden" name="pid" value="{$plan->id}">
                                            <button type="submit" class="btn btn-primary btn-lg">
                                                {lang key='buy'}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                {/foreach}
                </div>
                <div class="includes-features m-t-8x">
                    <h3 class="text-center">{$rslang->trans('sitebuilder.packages.features_subtitle')}</h3>
                    <div class="row check-features">
                        {foreach $promoHelper->getFeatures() as $featureKey => $feature}
                            {if $feature@iteration <= count($promoHelper->getFeatures())-2}
                                <div class="col-md-6">
                                    <i class="lm lm-check"></i>
                                    {lang key="store.siteBuilder.featuresLabels.$featureKey"}
                                    {if isset($plan->features[$feature])}
                                        {if is_bool($plan->features[$feature])}
                                        {else}
                                            {$plan->features[$feature]}
                                        {/if}
                                    {/if}
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.siteBuilder.compareTitle"}</h2>
            <div class="row row-eq-height row-eq-height-xs features justify-center">
                <div class="col-lg-4 col-sm-6">
                    <div class="feature feature-xs-left">
                        <div class="feature-icon">                        
                            {include file="$template/includes/common/svg-icon.tpl" icon="builder"}
                        </div>
                        <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.siteBuilder.compare1"}</h4>
                            <p class="feature-desc">{lang key="store.siteBuilder.compare1desc"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature feature-xs-left">
                        <div class="feature-icon">                        
                            {include file="$template/includes/common/svg-icon.tpl" icon="99.9-browser-compatibility"}
                        </div>
                        <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.siteBuilder.compare2"}</h4>
                            <p class="feature-desc">{lang key="store.siteBuilder.compare2desc"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature feature-xs-left">
                        <div class="feature-icon">                        
                            {include file="$template/includes/common/svg-icon.tpl" icon="addon"}
                        </div>
                        <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.siteBuilder.compare3"}</h4>
                            <p class="feature-desc">{lang key="store.siteBuilder.compare3desc"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature feature-xs-left">
                        <div class="feature-icon">                        
                            {include file="$template/includes/common/svg-icon.tpl" icon="icon-one-click-restore"}
                        </div>
                        <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.siteBuilder.compare4"}</h4>
                            <p class="feature-desc">{lang key="store.siteBuilder.compare4desc"}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="feature feature-xs-left">
                        <div class="feature-icon">                        
                            {include file="$template/includes/common/svg-icon.tpl" icon="comissions"}
                        </div>
                        <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.siteBuilder.compare5"}</h4>
                            <p class="feature-desc">{lang key="store.siteBuilder.compare5desc"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}

{literal}
<script>
    var baseRef = '.section-templates .templates';
    function showAllTemplates() {
        jQuery(baseRef + ' .previews .show-more').remove();
        jQuery(baseRef + ' .previews .hidden').hide().removeClass('hidden').fadeIn();
        jQuery(baseRef + ' .previews img.deferred').each(function() {
            jQuery(this).attr('src', jQuery(this).data('src'));
        }).removeClass('deferred');
    }

    var itemType = "";
    jQuery(document).ready(function() {
        jQuery(baseRef + ' .templates-filter-btn').click(function(e) {
            e.preventDefault();
            jQuery(baseRef + ' .templates-filter-btn').removeClass('active');
            jQuery(this).addClass('active');
            /*showAllTemplates();*/
            jQuery(baseRef + ' .previews .type-single,' + baseRef + ' .previews .type-multi,' + baseRef + ' .previews .type-ecom').hide();
            jQuery(baseRef + ' .previews .type-' + jQuery(this).data('type')).slice(0,6).show();

            itemType = jQuery(this).data('type');

            $(".show-more-btn").css("display", "inline-flex");

        });
        /*jQuery(baseRef + ' .previews .show-more a').click(function(e) {
            e.preventDefault();
            showAllTemplates();
        });*/

        $(".show-more-btn").click(function(e){
            if(itemType) {
                    $(".previews .show-more-item.type-"+itemType+":hidden").slice(0,6).fadeIn();
                if ($(".previews .show-more-item.type-"+itemType+":hidden").length < 1) $(this).fadeOut();
            }
            else{
                $(".previews .show-more-item:hidden").slice(0,6).fadeIn();
                if ($(".previews .show-more-item:hidden").length < 1) $(this).fadeOut();

            }
        });
    });
</script>
{/literal}