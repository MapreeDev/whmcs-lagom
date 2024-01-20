

{if file_exists("templates/$template/store/ssl/overwrites/wildcard.tpl")}
    {include file="{$template}/store/ssl/overwrites/wildcard.tpl"}  
{else}
    <div class="site site-ssl-certificates">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title"> {lang key="store.ssl.wildcard.title"} </h1>
                    <div class="banner-desc">
                        <p> {lang key="store.ssl.wildcard.tagline"} </p>
                    </div>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing'); return false">{$LANG.clientareaaddonpricing}</a>
                        <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview'); return false">{$LANG.learnmore}</a>
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
        {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}  
        <div class="site-section" id="overview">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-sm">
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-2"}
                        </div> 
                    </div>
                    <div class="section-content"> 
                        <h2 class="section-title">{lang key="store.ssl.wildcard.descriptionTitle"}</h2>
                        <div class="section-desc">
                            <p> {lang key="store.ssl.wildcard.descriptionContent"} </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}
        {include file="$template/store/ssl/shared/features.tpl" type="wildcard"}
        {include file="$template/store/ssl/shared/logos.tpl"}
    </div>
{/if}