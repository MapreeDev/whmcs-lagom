

{if file_exists("templates/$template/store/ssl/overwrites/ev.tpl")}
    {include file="{$template}/store/ssl/overwrites/ev.tpl"}  
{else}
    <div class="site site-ssl-certificates">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title"> {lang key="store.ssl.ev.title"} </h1>
                    <div class="banner-desc">
                        <p>{lang key="store.ssl.ev.tagline"}</p>
                    </div>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing');return false">{$LANG.clientareaaddonpricing}</a>
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
        {include file="$template/store/ssl/shared/nav.tpl" current="ev"} 
        <div class="site-section" id="overview">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-sm">
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-2"}
                        </div> 
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key="store.ssl.ev.descriptionTitle"}</h2>
                        <div class="section-desc">
                            <p>{lang key="store.ssl.ev.descriptionContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.ssl.useCases.title"}</h3>
                    <div class="features features-boxes row row-eq-height">
                        <div class="col-sm-4">
                            <div class="feature feature-boxed">
                                <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="content-delivery-network"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.criticalDomains"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="feature feature-boxed">
                                <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="comissions"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.ecommerce"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="feature feature-boxed">
                                <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="strongest-fastest-SSL"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.signupPages"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ev"}
        <div class="site-section">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="section-graphic">
                            <img class="has-shadow" src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ov.png">
                        </div>
                    </div>
                    <div class="section-content"> 
                        <h2 class="section-title">{lang key="store.ssl.ev.orgInfo"}</h2>
                        <div class="section-desc">
                            <p>{lang key="store.ssl.ev.orgInfoDescription"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="$template/store/ssl/shared/features.tpl" type="ev"}
        {include file="$template/store/ssl/shared/logos.tpl"}
    </div>    
{/if}