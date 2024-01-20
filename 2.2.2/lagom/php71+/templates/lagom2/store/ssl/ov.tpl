

{if file_exists("templates/$template/store/ssl/overwrites/ov.tpl")}
    {include file="{$template}/store/ssl/overwrites/ov.tpl"}  
{else}
    <div class="site site-ssl-certificates">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{lang key="store.ssl.ov.title"}</h1>
                    <div class="banner-desc">
                        <p> {lang key="store.ssl.ov.tagline"} </p>
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
        {include file="$template/store/ssl/shared/nav.tpl" current="ov"}  
        <div class="site-section" id="overview">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-sm">
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-2"}
                        </div> 
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key="store.ssl.ov.descriptionTitle"}</h2>
                        <div class="section-desc">
                            <p>{lang key="store.ssl.ov.descriptionContent"}</p>
                        </div>
                    </div>
                </div>
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.ssl.useCases.title"}</h3>
                    <div class="features row row-eq-height">
                        <div class="col-sm-4">
                            <div class="feature feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.loginPages"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="feature  feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="strongest-fastest-SSL"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.intranetSites"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="feature feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="ticket"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.ssl.useCases.webmail"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ov"}   
        <div class="site-section">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="graphic">
                            <img class="has-shadow" src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ov.png">
                        </div>
                    </div>
                    <div class="section-content"> 
                        <h2 class="section-title">{lang key="store.ssl.ov.orgInfo"}</h2>
                        <div class="section-desc">
                            <p>{lang key="store.ssl.ov.orgInfoDescription"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        {include file="$template/store/ssl/shared/features.tpl" type="ov"}
        {include file="$template/store/ssl/shared/logos.tpl"}
    </div>
{/if}
