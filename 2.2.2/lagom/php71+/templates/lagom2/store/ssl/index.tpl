
{if file_exists("templates/$template/store/ssl/overwrites/index.tpl")}
    {include file="{$template}/store/ssl/overwrites/index.tpl"}
{else}
<div class="site site-ssl-certificates">       
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{lang key="store.ssl.landingPage.title"}</h1>
                <div class="banner-desc">
                    <p>{lang key="store.ssl.landingPage.tagline1"} {lang key="store.ssl.landingPage.tagline2"}</p>
                </div>
                <div class="banner-actions">
                    <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#choose-lvl');return false">{lang key='store.ssl.shared.switch'}</a>
                    <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview');return false">{$LANG.learnmore}</a>
                </div>
            </div>
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/symantec"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/symantec"}
                    {/if}
                </div>
                <div class="banner-shape">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                </div>
            </div>
        </div>  
    </div>
    {include file="$template/store/ssl/shared/nav.tpl" current="index"}
    <div class="site-section" id="choose-lvl">
        <div class="container">
            <h2 class="section-title">{lang key="store.ssl.landingPage.chooseLevel"}</h2>
            <div class="section-content">
                {if count($certificates) > 0}
                    {foreach $certificates as $type => $products}
                        {foreach $products as $product}
                            {if $type == "dv"}
                                {if $dv_lower}
                                    {if $product->pricing()->best()->yearlyPrice()|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":"" < $dv_lower|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                        {assign var="dv_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                    {/if}
                                {else}
                                    {assign var="dv_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                {/if}
                            {elseif $type == "ov"}
                                {if $ov_lower}
                                    {if $product->pricing()->best()->yearlyPrice()|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":"" < $ov_lower|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                        {assign var="ov_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                    {/if}
                                {else}
                                    {assign var="ov_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                {/if}
                            {elseif $type == "ev"}
                                {if $ev_lower}
                                    {if $product->pricing()->best()->yearlyPrice()|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":""|replace:".":""|replace:",":"" < $ev_lower|replace:$activeCurrency.suffix:""|replace:$activeCurrency.prefix:""|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                        {assign var="ev_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                    {/if}
                                {else}
                                    {assign var="ev_lower" value=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""}
                                {/if}
                            {/if}
                        {/foreach}
                    {/foreach}
                {/if}
                <div class="row row-eq-height row-eq-height-sm">
                    <div class="col-lg-4 col-sm-12">
                        <div class="package package-lg">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="domain-validation"}                                     
                            </div>
                            <h4 class="package-title">{lang key="store.ssl.landingPage.dv"}</h4>
                            <div class="package-desc">
                                <p class="package-desc">{lang key="store.ssl.landingPage.dvInformation"}</p>
                            </div>    
                            <div class="package-price">
                                <div class="price">
                                    <div class="price-starting-from">{$LANG.startingfrom}</div>
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$dv_lower
                                        priceCycle="annually" 
                                    }
                                </div>
                            </div>
                            <div class="package-actions">
                                <a href="{routePath('store-product-group', $routePathSlug, 'dv')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="package package-lg">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation"}                                    
                            </div>
                            <h4 class="package-title">{lang key="store.ssl.landingPage.ov"}</h4>
                            <div class="package-desc">
                                <p class="package-desc">{lang key="store.ssl.landingPage.ovInformation"}</p>
                            </div>
                            <div class="package-price">
                                <div class="price">
                                    <div class="price-starting-from">{$LANG.startingfrom}</div>
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$ov_lower
                                        priceCycle="annually" 
                                    }
                                </div>
                            </div>
                            <div class="package-actions">
                                <a href="{routePath('store-product-group', $routePathSlug, 'ov')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="package package-lg">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="extended-validation"}                                    
                            </div>
                            <h4 class="package-title">{lang key="store.ssl.landingPage.ev"}</h4>
                            <div class="package-desc">
                                <p class="package-desc">{lang key="store.ssl.landingPage.evInformation"}</p>
                            </div>
                            <div class="package-price">
                                <div class="price">
                                    <div class="price-starting-from">{$LANG.startingfrom}</div>
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$ev_lower
                                        priceCycle="annually" 
                                    }
                                </div>
                            </div>
                            <div class="package-actions">
                                <a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section" id="overview">
        <div class="container">
            <h2 class="section-title">{lang key="store.ssl.landingPage.what"}</h2>
            <p class="section-subtitle">{lang key="store.ssl.landingPage.whatInfo"}</p>
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-2"}                                   
                    </div>
                </div>
                <div class="section-content">
                    <div class="section-desc">
                        <ul class="check-list">
                            <li> <i class="lm lm-check"></i> {lang key="store.ssl.landingPage.secureConnection"} </li>
                            <li> <i class="lm lm-check"></i> {lang key="store.ssl.landingPage.encrypts"} </li>
                            <li> <i class="lm lm-check"></i> {lang key="store.ssl.landingPage.padlock"} </li>
                            <li> <i class="lm lm-check"></i> {lang key="store.ssl.landingPage.authenticates"} </li>
                        </ul>
                        <p>{lang key="store.ssl.landingPage.certTypeInfo" dvLink=routePath('store-product-group', $routePathSlug, 'dv') ovLink=routePath('store-product-group', $routePathSlug, 'ov') evLink=routePath('store-product-group', $routePathSlug, 'ev')}</p>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-graphic order-last">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-1"}
                    </div>
                </div>
                <div class="section-content order-first">
                    <h2 class="section-title section-title-sm">{lang key="store.ssl.landingPage.benefits.title"}</h2>
                    <div class="section-desc">
                        <p><strong>{lang key="store.ssl.landingPage.benefits.subtitle"}</strong></p>
                        <p>{lang key="store.ssl.landingPage.benefits.higherResults"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.ssl.landingPage.benefits.reasons"}:</h2>
            <div class="section-content">
                <div class="features row row-eq-height-xs">
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="encryp-sensitive-data"}  
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.encrypt"}</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"}   
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.privacy"}</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="secure-online-transactions"}
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.secure"}</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="prove-legitimacy"}   
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.legitimacy"}</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="activate-HTTPS-and-the-lock-icon"}   
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.https"}</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 m-safari">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}   
                            </div>
                            <h5 class="feature-title">{lang key="store.ssl.landingPage.benefits.seo"}</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} section-center section-ssl-upgrade">
        <div class="container">
            <h2 class="section-title">{lang key="store.ssl.landingPage.browser.title"}</h2>
            <div class="section-content">
                <div class="browser browser-lg browser-ssl">
                    <div class="browser-top">
                        <div class="browser-actions"> <span></span> <span></span> <span></span> </div>
                        <div class="browser-searchbar">
                            <span><span class="text-danger">http://</span>yourwebsite.com</span>
                        </div>
                    </div>
                    <div class="browser-body">
                        <div class="browser-notice">
                            <div class="browser-image"> 
                                {include file="$template/assets/svg-illustrations/store/ssl/padlock.tpl"}   
                            </div>
                            <p>{lang key="store.ssl.landingPage.browser.insecureNotice"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ssl-upgrade">
            <h5 class="section-title">{lang key="store.ssl.landingPage.secureInMinutes"}</h5>
        </div>
    </div> 
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.ssl.landingPage.help.title"}</h2>
            <p class="section-subtitle ">{lang key="store.ssl.landingPage.help.guide"}</p>
            <div class="section-sides">
                <div class="section-graphic order-last">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/library-card"}                             
                    </div>
                </div>
                <div class="section-content order-first">
                    <h3 class="section-title section-title-sm">{lang key="store.ssl.landingPage.help.dv.title"}</h3>
                    <div class="section-desc">
                        <ul>
                            <li>{lang key="store.ssl.landingPage.help.dv.verify"}</li>
                            <li>{lang key="store.ssl.landingPage.help.dv.issued"}</li>
                            <li>{lang key="store.ssl.landingPage.help.dv.compliance"}</li>
                        </ul>
                        <p><b class="text-dark">{lang key="store.ssl.landingPage.help.dv.for"}</b></p>
                        <p>{lang key="store.ssl.landingPage.help.dv.type"}</p>
                    </div>
                    <div class="section-actions">
                        <a href="{routePath('store-product-group', $routePathSlug, 'dv')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/driver-license"}                               
                    </div>
                </div>
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.ssl.landingPage.help.ov.title"}</h3>
                    <div class="section-desc">
                        <ul>
                            <li>{lang key="store.ssl.landingPage.help.ov.verify"}</li>
                            <li>{lang key="store.ssl.landingPage.help.ov.issued"}</li>
                            <li>{lang key="store.ssl.landingPage.help.ov.compliance"}</li>
                        </ul>
                        <p><b class="text-dark">{lang key="store.ssl.landingPage.help.ov.for"}</b></p>
                        <p>{lang key="store.ssl.landingPage.help.ov.type"}</p>
                        <div class="section-actions">
                            <a href="{routePath('store-product-group', $routePathSlug, 'ov')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-graphic order-last">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/passport"}                               
                    </div>
                </div>
                <div class="section-content order-first">
                    <h3 class="section-title section-title-sm">{lang key="store.ssl.landingPage.help.ev.title"}</h3>
                    <div class="section-desc">
                        <ul>
                            <li>{lang key="store.ssl.landingPage.help.ev.verify"}</li>
                            <li>{lang key="store.ssl.landingPage.help.ev.issued"}</li>
                            <li>{lang key="store.ssl.landingPage.help.ev.compliance"}</li>
                        </ul>
                        <p><b class="text-dark">{lang key="store.ssl.landingPage.help.ev.for"}</b></p>
                        <p>{lang key="store.ssl.landingPage.help.ev.type"}</p>
                        <div class="section-actions">
                            <a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn btn-lg btn-primary">{$LANG.learnmore}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{$LANG.store.ssl.title}</h2>
            {include file="$template/store/ssl/shared/ssl-filters.tpl" current="index"}
            <div class="section-content ssl-filters" id="all">
                <div class="row row-eq-height" data-filter-grid>
                    {if count($certificates) > 0}
                        {foreach $certificates as $type => $products}
                            {foreach $products as $product}
                                <div class="col-xl-6 col-lg-12 filtr-item" data-groups='["{$type}"]'>
                                    <div class="package package-sm package-left{if $product->isFeatured} package-featured{/if}">
                                        <h4 class="package-title">{$product->name}</h4>
                                        <div class="package-content">
                                            <p>{$product->description}</p>
                                        </div>
                                        <div class="package-footer">
                                            <div class="package-price">
                                                <div class="package-starting-from ">{$LANG.startingfrom}</div>
                                                <div class="price price-sm price-inline">
                                                    {include file="$template/includes/common/price.tpl" 
                                                        price=$product->pricing()->best()->yearlyPrice()|replace:"/`$LANG.pricingCycleShort.annually`":""
                                                        priceCycle="annually"
                                                        priceCycleShort=true
                                                    }
                                                </div>
                                            </div>
                                            <div class="package-actions">
                                                <a href="{routePath("store-product-group", $routePathSlug, $type)}" class="btn btn-lg btn-default">{$LANG.learnmore}</a>
                                                <form method="post" action="{routePath('cart-order')}">
                                                    <input type="hidden" name="pid" value="{$product->id}">
                                                    <button type="submit" class="btn btn-lg btn-primary btn-block">{lang key="store.ssl.landingPage.buyNow"}</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        {/foreach}
                    {elseif $inPreview}
                        <div class="lead text-center"> {lang key="store.ssl.shared.noProducts"} </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key='store.ssl.landingPage.multiYear.title'}</h2>
            <div class="section-content m-w-lg m-a">
                <p>{lang key='store.ssl.landingPage.multiYear.p1'}</p>
                <p>{lang key='store.ssl.landingPage.multiYear.p2'}</p>
                <p>{lang key='store.ssl.landingPage.multiYear.p3'}</p>
                <p>
                    {lang key='store.ssl.landingPage.multiYear.p4'}
                    <img class="img-fluid mx-auto d-block py-3" alt="SSL certificate lifecycle" src="{$WEB_ROOT}/assets/img/marketconnect/symantec/multi-year-flow.png">
                </p>
                <p>{lang key='store.ssl.landingPage.multiYear.p5'}</p>
                <h3>{lang key='store.ssl.landingPage.multiYear.benefits.title'}</h3>
                <ul>
                    <li>{lang key='store.ssl.landingPage.multiYear.benefits.b1'}</li>
                    <li>{lang key='store.ssl.landingPage.multiYear.benefits.b2'}</li>
                    <li>{lang key='store.ssl.landingPage.multiYear.benefits.b3'}</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.websiteBuilder.faq.title"}</h2>
            <div class="section-content m-w-lg m-a">
                <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                    <div class="panel panel-accordion is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_is_an_SSL_Certificate" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ssl.landingPage.faq.q1"}</h4>
                        </div>
                        <div id="what_is_an_SSL_Certificate" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ssl.landingPage.faq.a1"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#why_do_i_need_codeGuard" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ssl.landingPage.faq.q2"}</h4>
                        </div>
                        <div id="why_do_i_need_codeGuard" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ssl.landingPage.faq.a2"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_are_the_different_types_of_SSL" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ssl.landingPage.faq.q3"}</h4>
                        </div>
                        <div id="what_are_the_different_types_of_SSL" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ssl.landingPage.faq.a3"}</p>
                            </div>
                        </div>
                    </div>
                    {if $certTypes.wildcard > 0 || $inPreview}
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#what_is_a_Wildcard_SSL_Certificate" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ssl.landingPage.faq.q4"}</h4>
                            </div>
                            <div id="what_is_a_Wildcard_SSL_Certificate" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.ssl.landingPage.faq.a4"} <a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key="learnmore"}</a></p>
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if $certTypes.ev > 0 || $inPreview}
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#what_are_the_advantages_of_an_EV_SSL_Certificate" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ssl.landingPage.faq.q5"}</h4>
                            </div>
                            <div id="what_are_the_advantages_of_an_EV_SSL_Certificate" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.ssl.landingPage.faq.a5"}</p>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    {include file="$template/store/ssl/shared/logos.tpl"}
    {*{include file="$template/get-started.tpl"} *}
</div>
<script>
    $(function() {

        $('.show-all').click(function(e) {
            e.preventDefault();
            if (!$('#collapseAllCerts').hasClass('in')) {
                $('#collapseAllCerts').collapse('show');
            }
            $('html, body').animate({
                scrollTop: $('#sslDetail').offset().top
            }, 500);
        });
    });
</script>
{/if}
