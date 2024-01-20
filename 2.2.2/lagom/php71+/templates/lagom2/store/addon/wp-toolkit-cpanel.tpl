{if file_exists("templates/$template/store/addon/overwrites/wp-toolkit-cpanel.tpl")}
    {include file="{$template}/store/addon/overwrites/wp-toolkit-cpanel.tpl"}  
{else}  
    <div class="site site-wp-toolkit">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{lang key='store.addon.wptk.redefined1'}</h1>
                    <div class="banner-desc">
                        <p>{lang key='store.addon.wptk.redefined2'} <strong>cPanel</strong></p> 
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
                <div class="section-content">
                    <div class="section-sides">
                        <div class="section-graphic">
                            <div class="browser browser-sm">
                                <div class="browser-top browser-top-transparent">
                                    <div class="browser-actions"><span></span><span></span><span></span></div>
                                </div>
                                <div class="browser-body">
                                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/graphic.png">                             
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <h2 class="section-title">{$rslang->trans('wptoolkit.smart_updates.title')}</h2>
                            <div class="section-desc">
                                <p>{lang key='store.addon.wptk.introTitle'}</p>
                                <p>{lang key='store.addon.wptk.introBody'}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key='store.addon.wptk.midTitle1' breaktag=''}</h2>
                <div class="section-content">
                    <div class="row row-eq-height row-eq-height-xs row-features">
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/sitebuilder.tpl")}
                                        {include file="$template/assets/svg-icon/sitebuilder.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle1'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody1'}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/unlimited-pages.tpl")}
                                        {include file="$template/assets/svg-icon/unlimited-pages.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle2'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody2'}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/extended-validation.tpl")}
                                        {include file="$template/assets/svg-icon/extended-validation.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle3'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody3'}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/icon-automatic-wordpress-update.tpl")}
                                        {include file="$template/assets/svg-icon/icon-automatic-wordpress-update.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle4'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody4'}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/icon-staging-of-restores.tpl")}
                                        {include file="$template/assets/svg-icon/icon-staging-of-restores.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle5'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody5'}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {if file_exists("templates/$template/assets/svg-icon/fast-automated-steup.tpl")}
                                        {include file="$template/assets/svg-icon/fast-automated-steup.tpl"}
                                    {/if}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.addon.wptk.featureTitle6'}</h4>
                                    <p class="feature-desc">{lang key='store.addon.wptk.featureBody6'}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>     
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key='store.addon.wptk.midTitle2'}</h2>
                <p class="section-subtitle">
                    {if $firstMatchingAddon && !$firstMatchingAddon->pricing()->first()->isFree()}
                        {lang key='store.addon.wptk.screenshotDesc' price=$firstMatchingAddon->pricing()->first()->price()}
                    {else}
                        {lang key='store.addon.wptk.screenshotDescFree'}
                    {/if}
                </p>
                <div class="section-content screenshots">
                    <div class="row">
                        <div class="col-md-6">
                            <a class="browser browser-zoom m-b-3x" href="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-01-full.png" target="_blank">
                                <div class="browser-top browser-top-transparent">
                                    <div class="browser-actions"><span></span><span></span><span></span></div>
                                </div>
                                <div class="browser-img">
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-01-full.png">
                                    <div class="browser-img-zoom"><i class="lm lm-search"></i></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a class="browser browser-zoom  m-b-3x" href="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-02-full.png" target="_blank">
                                <div class="browser-top browser-top-transparent">
                                    <div class="browser-actions"><span></span><span></span><span></span></div>
                                </div>
                                <div class="browser-img">
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-02-full.png">
                                    <div class="browser-img-zoom"><i class="lm lm-search"></i></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a class="browser browser-zoom  m-b-3x" href="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-03-full.png" target="_blank">
                                <div class="browser-top browser-top-transparent">
                                    <div class="browser-actions"><span></span><span></span><span></span></div>
                                </div>
                                <div class="browser-img">
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-03-full.png">
                                    <div class="browser-img-zoom"><i class="lm lm-search"></i></div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a class="browser browser-zoom  m-b-3x" href="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-04-full.png" target="_blank">
                                <div class="browser-top browser-top-transparent">
                                    <div class="browser-actions"><span></span><span></span><span></span></div>
                                </div>
                                <div class="browser-img">
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/store/wp-toolkit/screen-04-full.png">
                                    <div class="browser-img-zoom"><i class="lm lm-search"></i></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
            <div class="container">
                <h2 class="section-title">{lang key='store.addon.wptk.getStartedToday'}</h2>
                {if $loggedin && count($clientServices)}
                    {include file="$template/store/addon/wp-pricing.tpl"}  
                {else}
                    {if $loggedin}
                        <div class="package">
                            {if $firstMatchingAddon && !$firstMatchingAddon->pricing()->first()->isFree()}
                                <h4 class="package-title">{lang key='startingfrom'}</h4>
                                <div class="package-price m-b-16">
                                    <div class="price">
                                        {include file="$template/includes/common/price.tpl" 
                                            price=$firstMatchingAddon->pricing()->first()->price()
                                            priceCycle=$firstMatchingAddon->pricing()->first()->cycle()|lower
                                        }
                                    </div>
                                </div>
                            {/if}
                            <div class="package-actions">
                                <form method="post" action="{$browsePackagesAction}">
                                    <button type="submit" class="btn btn-primary">
                                        {lang key='store.addon.wptk.browsePackages'}
                                    </button>
                                </form>
                            </div>
                        </div>   
                    {else}                  
                        <form method="post" action="{$browsePackagesAction}">
                            <div class="message message-lg message-no-data">
                                <div class="message-image">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"} 
                                </div>
                                <h3 class="message-title">{lang key='store.addon.wptk.loginToSeePricing'}</h3>
                                <div class="message-actions">
                                    <button type="submit" class="btn btn-lg btn-primary">
                                        {lang key='store.addon.wptk.browsePackages'}
                                    </button>
                                    <a class="btn btn-lg btn-outline" href="{routePath('store-addon-login', $addonSlug, $serviceId)}">
                                        {lang key='store.addon.wptk.loginNow'}
                                    </a>
                                </div>
                            </div>
                        </form>
                    {/if}
                {/if}
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key="store.websiteBuilder.faq.title"}</h2>
                <div class="section-content m-w-lg m-a">
                    <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                        <div class="panel panel-accordion is-open">
                            <div class="panel-heading" data-toggle="collapse" data-target="#what_is_wp_toolkit" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.addon.wptk.faqQ1"}</h4>
                            </div>
                            <div id="what_is_wp_toolkit" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.addon.wptk.faqA1" webRoot=$WEB_ROOT}</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#how_is_wp_toolkit_deluxe" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.addon.wptk.faqQ2"}</h4>
                            </div>
                            <div id="how_is_wp_toolkit_deluxe" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.addon.wptk.faqA2" webRoot=$WEB_ROOT}</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#what_is_smart_updates" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.addon.wptk.faqQ3"}</h4>
                            </div>
                            <div id="what_is_smart_updates" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.addon.wptk.faqA3" webRoot=$WEB_ROOT}</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#How_much_does_wp_toolkit_cost" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.addon.wptk.faqQ4"}</h4>
                            </div>
                            <div id="How_much_does_wp_toolkit_cost" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.addon.wptk.faqA4" webRoot=$WEB_ROOT} <a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key="learnmore"}</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#how_do_i_access_wp_toolkit" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.addon.wptk.faqQ5"}</h4>
                            </div>
                            <div id="how_do_i_access_wp_toolkit" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.addon.wptk.faqA5" webRoot=$WEB_ROOT}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                 
    </div>
{/if}    