<div class="site site-nordvpn">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{lang key="store.nordvpn.hero.title" tagOpen="" tagClose="" tagBreak=" "}</h1>
                <div class="banner-desc">{lang key="store.nordvpn.hero.tagline" tagBreak=" "}</div>
                <div class="banner-actions">
                    <a 
                        href="#" 
                        class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}"
                        onclick="smoothScroll('#pricing');return false"
                    >
                        {lang key="store.nordvpn.shared.get"}
                    </a>
                    <a 
                        href="#"
                        class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}"
                        onclick="smoothScroll('#overview');return false"
                    >
                        {lang key='learnmore'}
                    </a>
                </div>
                <div class="banner-icons">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/windows"} 
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/apple"} 
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/android"} 
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/macos"} 
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/firefox"} 
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/chrome"} 
                </div>
                <div class="banner-subtitle">
                    {lang key="store.nordvpn.hero.guarantee"}
                </div>
            </div>
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/nordvpn"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/nordvpn"}
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
            <h2 class="section-title">{lang key="store.nordvpn.features.icon.title1"}</h2>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm">
                    <div class="col-lg-3 col-sm-12 col-md-6">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="video"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.icon.video"}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12 col-md-6">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="domain"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.icon.global"}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12 col-md-6">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="addon-id-protection"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.icon.hacker"}</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12 col-md-6">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="feature-boxes"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.icon.property"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section feature comparison">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.comparison.title"}</h2>
            <div class="comparison-container">
                <div class="row no-gutters">
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters comparision-images">
                            <div class="col-2"></div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/vpn-nord.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/vpn-express.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/vpn-private.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/vpn-proton.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/vpn-pure.png"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.speed1"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    <strong>
                                        {lang key="store.nordvpn.features.comparison.speed2"}
                                    </strong>
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.speed3"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.speed4"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.speed5"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.speed6"}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.wireguard"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-no.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-no.png"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.vpn1"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    <strong>
                                        {lang key="store.nordvpn.features.comparison.vpn2"}
                                    </strong>
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.vpn3"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.vpn4"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.vpn5"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.vpn6"}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.log"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2">
                                <span>
                                    {lang key="store.nordvpn.features.comparison.chat"}
                                </span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                            <div class="col-2">
                                <span><img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/tick-yes.png"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row no-gutters">
                            <div class="col-2"></div>
                            <div class="col-2">
                                <span>
                                    <button class="btn btn-primary btn-get-nord" onclick="smoothScroll('#pricing')">
                                        {lang key="store.nordvpn.shared.get"}
                                    </button>
                                </span>
                            </div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                            <div class="col-2"></div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="comparison-note">
                {lang key="store.nordvpn.features.comparison.asterisk" tagOpen="<a href=\"https://go.whmcs.com/1745/av-test-report\" target=\"_blank\">" tagClose="</a>"}
            </p>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="section-sides section-sides-nordvpn">
                <div class="section-graphic order-last">
                    <div>
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/img-girl.png">
                    </div>
                </div>
                <div class="section-content order-first">
                    <div class="section-desc">
                        <p class="section-subtitle">{lang key="store.nordvpn.features.device.title1"}</p>
                        <p>{lang key="store.nordvpn.features.device.tagline1"}</p>
                    </div>
                    <div class="section-desc">
                        <p class="section-subtitle">{lang key="store.nordvpn.features.device.title2"}</p>
                        <p>{lang key="store.nordvpn.features.device.tagline2"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} text-center">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.threat.title"}</h2>
            <p class="section-subtitle">{lang key="store.nordvpn.features.threat.tagline" tagOpen="" tagClose=""}</p>
                    <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm">
                    <div class="col-lg-4 col-sm-12">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="no-control-panel"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.threat.protection" tagOpen="<strong>" tagClose="</strong>"}</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="automatic-malware-removal"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.threat.malware" tagOpen="<strong>" tagClose="</strong>"}</p>
                        </div>
                    </div> 
                    <div class="col-lg-4 col-sm-12">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="mobile-friendly"}                                            
                            </div>
                            <p class="package-desc">{lang key="store.nordvpn.features.threat.safe" tagOpen="<strong>" tagClose="</strong>"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="section-sides section-sides-nordvpn">
                <div class="section-graphic">
                    <div>
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/nordvpn/img-app.png">
                    </div>
                </div>
                <div class="section-content">
                    <h4 class="section-title">{lang key="store.nordvpn.features.security.title1"}</h4>
                    <p>{lang key="store.nordvpn.features.security.tagline1"}</p>
                    <p>{lang key="store.nordvpn.features.security.tagline2" tagOpen="" tagClose=""}</p>
                </div>
            </div>
            <div class="row row-content row-content-lg row-custom">
                <div class="col-lg-4 col-sm-12">
                    <h4 class="h5">{lang key="store.nordvpn.features.security.title2"}</h4>
                    <p>{lang key="store.nordvpn.features.security.tagline3"}</p>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <h4 class="h5">{lang key="store.nordvpn.features.security.title3"}</h4>
                    <p>{lang key="store.nordvpn.features.security.tagline4"}</p>
                </div>
                <div class="col-lg-4 col-sm-12">
                    <h4 class="h5">{lang key="store.nordvpn.features.security.title4"}</h4>
                    <p>{lang key="store.nordvpn.features.security.tagline5" tagOpen="" tagClose=""}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section text-center">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.icon.title2"}</h2>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm row-custom">
                    <div class="col-lg-4 col-sm-12">
                        <div>
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="sitelock"}                                            
                            </div>
                            <h4 class="feature-title">{lang key="store.nordvpn.features.icon.check1"}</h4>
                            <p class="feature-desc">{lang key="store.nordvpn.features.icon.check2"}</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div>
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="malware-scan"}                                            
                            </div>
                            <h4 class="feature-title">{lang key="store.nordvpn.features.icon.bug1"}</h4>
                            <p class="feature-desc">{lang key="store.nordvpn.features.icon.bug2"}</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div>
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="OWASP-protection"}                                            
                            </div>
                            <h4 class="feature-title">{lang key="store.nordvpn.features.icon.shield1"}</h4>
                            <p class="feature-desc">{lang key="store.nordvpn.features.icon.shield2"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section text-center">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.world.title"}</h2>
            <p class="section-subtitle">{lang key="store.nordvpn.features.world.tagline"}</p>
            <div class="section-graphic section-graphic-custom">
                {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/vpn-map"}
            </div>
            <div class="section-content m-h-a">
                <div class="tiles row row-content"> 
                    <div class="col-lg-3">
                        <div class="tile">
                            <span class="tile-stat tile-stat-sm">{lang key="store.nordvpn.features.world.count1"}</span>
                            <span class="tile-title">{lang key="store.nordvpn.features.world.bullet1"}</span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="tile">
                            <span class="tile-stat tile-stat-sm">{lang key="store.nordvpn.features.world.count2"}</span>
                            <span class="tile-title">{lang key="store.nordvpn.features.world.bullet2"}</span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="tile">
                            {$bullet3 = $LANG.store.nordvpn.features.world.bullet3|capitalize}
                            <span class="tile-stat tile-stat-sm">{$bullet3|replace:' ':'</span><span class="tile-title">'}</span>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="tile">
                            <span class="tile-stat tile-stat-sm">{$_LANG['store']['nordvpn']['features']['world']['bullet4']|replace:" ":"</span><span class='tile-title'>"|capitalize}</span>
                        </div>
                    </div>
                </div>
                <div class="slider icons-network" data-nordvpn-slider>
                    <div class="content-slider" data-slider-container>
                        <div class="content-slider-wrapper" data-slider-wrapper>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/wired.png"></div>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/huffpost.png"></div>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/buzzfeed.png"></div>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/forbes.png"></div>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/tedx.png"></div>
                            <div class="content-slider-item"><img src="{$WEB_ROOT}/templates/lagom2/assets/img/store/nordvpn/bbc.png"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section text-center">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.use.title1"}</h2>
            <p class="section-subtitle">{lang key="store.nordvpn.features.use.tagline1" tagOpen="<strong>" tagClose="</strong>" tagBreak=" "}</p>
            <div class="section-content section-content-custom">
                <div class="row row-content row-custom">
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title2"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline2"}</p>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title3"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline3"}</p>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title4"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline4"}</p>
                    </div>
                </div>
                <div class="row row-content row-custom">
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title5"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline5"}</p>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title6"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline6"}</p>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <h4 class="h5 text-start">{lang key="store.nordvpn.features.use.title7"}</h4>
                        <p class="text-start">{lang key="store.nordvpn.features.use.tagline7"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} text-center" id="pricing">
        <div class="container">
            <h2 class="section-title">{lang key="store.nordvpn.features.pricing.title"}</h2>
            <div class="section-content">
                <div class="packages packages-custom row row-eq-height row-eq-height-sm">
                    {foreach $plans as $plan}
                        {foreach $pricings[$plan->id] as $pricing}  
                             <div class="col-lg-4">
                                <div class="package">
                                    <div class="package-header">
                                        <h4 class="package-title">
                                            {if $inPreview}
                                                -
                                            {else}
                                                {lang key="orderpaymentterm{$pricing->cycle()}"}
                                            {/if}
                                        </h4>
                                        <div class="package-price">
                                            <div class="price monthly">
                                                <div class="price-amount">
                                                    {if $inPreview}
                                                        -
                                                    {else}
                                                        {$pricing->monthlyPrice()}
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="package-body">
                                        <div class="package-actions">
                                            <form action="{routePath('cart-order')}" method="post">
                                                <input type="hidden" name="pid" value="{$plan->id}">
                                                <button type="submit" class="btn btn-lg btn-primary btn-block btn-signup">
                                                    {$LANG.signup}
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/foreach} 
                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.faqTitle"}</h2>
            <div class="section-content m-w-lg m-a">    
                <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                    <div class="panel panel-accordion is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq-1" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.nordvpn.features.faq.question1"}</h4>
                        </div>
                        <div id="faq-1" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.nordvpn.features.faq.answer1" tagOpen="<strong>" tagClose="</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq-2" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.nordvpn.features.faq.question2"}</h4>
                        </div>
                        <div id="faq-2" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.nordvpn.features.faq.answer2" tagOpen="<strong>" tagClose="</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq-3" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.nordvpn.features.faq.question3"}</h4>
                        </div>
                        <div id="faq-3" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.nordvpn.features.faq.answer3" tagOpen="<strong>" tagClose="</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq-4" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.nordvpn.features.faq.question4"}</h4>
                        </div>
                        <div id="faq-4" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.nordvpn.features.faq.answer4" tagOpen="<strong>" tagClose="</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq-5" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.nordvpn.features.faq.question5"}</h4>
                        </div>
                        <div id="faq-5" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.nordvpn.features.faq.answer5" tagOpen="<strong>" tagClose="</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(document).ready(function() {
        jQuery('.accordion .card-header .btn').on('click', function() {
            var icon = jQuery(this).find('i');
            if (icon.hasClass('fa-plus')) {
                jQuery('.accordion .card-header .btn i.fa-minus').removeClass('fa-minus').addClass(
                    'fa-plus');
                icon.removeClass('fa-plus').addClass('fa-minus');
            } else {
                icon.removeClass('fa-minus').addClass('fa-plus');
            }
        });
    });
</script>