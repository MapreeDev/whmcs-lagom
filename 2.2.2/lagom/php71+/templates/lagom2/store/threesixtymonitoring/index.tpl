{if file_exists("templates/$template/store/threesixtymonitoring/overwrites/index.tpl")}
    {include file="{$template}/store/threesixtymonitoring/overwrites/index.tpl"}
{else}
    <div class="site site-nordvpn">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                {if $websitePlanCount > 0}
                    <div class="banner-content tab-website">
                        <h1 class="banner-title">
                            {lang key="store.threesixtymonitoring.websiteHeading.title" tagOpen="" tagClose="</span>" tagBreak=""}
                        </h1>
                        <div class="banner-desc">{lang key="store.threesixtymonitoring.websiteHeading.tagline" tagBreak=""}
                        </div>
                        <form action="{routePath('cart-threesixtymonitoring-site-check')}" id="frmSiteCheck">
                            <div class="form-row m-b-neg-2x m-t-5x  m-r-neg-1x  m-l-neg-1x" >
                                <div class="col-12 col-sm-6 p-r-1x p-l-1x">
                                    <div class="form-group" data-custom-tooltip data-placement="top" title="Please enter URL" data-trigger="manual">
                                        <input type="text" class="form-control" name="url" placeholder="www.example.com">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 p-r-1x p-l-1x">
                                    <div class="form-group" data-custom-tooltip data-placement="top" title="Please select location" data-trigger="manual">
                                        <select class="form-control" name="probe_id" >
                                            <option value="">Select location</option>
                                            {foreach $threesixtymonitoring.probes as $probe}
                                                <option value="{$probe.id}">{$probe.name}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="banner-actions w-100">
                                <button type="submit" class="btn  btn w-100  btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}">
                                    <span>{$LANG.search}</span>
                                    <div class="loader hidden" >
                                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}    
                                    </div>
                                </button>
                          
                            </div>
                        </form>
                    </div>
                {/if}
                {if $serverPlanCount > 0}
                    <div class="banner-content tab-server" {if $websitePlanCount > 0} style="display: none;" {/if}>
                        <h1 class="banner-title">{lang key="store.threesixtymonitoring.serverHeading.tagline"}</h1>
                        <div class="banner-desc">
                            <p>{lang key="store.threesixtymonitoring.serverHeading.title"}</p>
                        </div>
                        <div class="banner-actions">
                            <a href="#"
                                class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if} btn-pricing-scroll"
                                onclick="smoothScroll('#serverSectionPricing');return false">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                        </div>
                    </div>
                {/if}
                <div class="banner-background">
                    <div class="banner-graphic">
                        {if $RSThemes.styles.iconType == "modern"}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/threesixtymonitoring"}
                        {else}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/threesixtymonitoring"}
                        {/if}
                    </div>
                    <div class="banner-shape">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section p-t-0 p-b-0" style="border-bottom: var(--site-section-border);">
            <div class="container">
                <ul class="nav nav-tabs nav-tabs-features justify-start  m-l-neg-2x m-b-0" role="tablist" id="pills-tab">
                    {if $websitePlanCount > 0}
                        <li role="presentation"><a id="pills-website-tab" class="{if $websitePlanCount > 0} active{/if}"
                                href="#pills-website" aria-controls="pills-website" role="pill"
                                data-toggle="pill">{lang key="store.threesixtymonitoring.navTab.website"}</a></li>
                    {/if}
                    {if $serverPlanCount > 0}
                        <li role="presentation"><a id="pills-server-tab" class="{if $websitePlanCount <= 0}active{/if}"
                                href="#pills-server" aria-controls="pills-server" role="pill"
                                data-toggle="pill">{lang key="store.threesixtymonitoring.navTab.server"}</a></li>
                    {/if}
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane tab-website fade{if $websitePlanCount > 0} show active{/if}" id="pills-website"
                role="tabpanel" aria-labelledby="pills-website-tab">
                <div class="site-section">
                    <div class="container">
                        <img class="w-100 img-overlap"
                            src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-full-site.png">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.websiteDiscover.title"}
                        </h2>
                        <p class="section-subtitle">
                            {lang key="store.threesixtymonitoring.websiteDiscover.tagline"}</p>
                        <div class="section-content">
                            <div class="row row-eq-height row-eq-height-xs features">
                                <div class="col-lg-4 col-sm-12">
                                    <div class="feature mob-feature-left">
                                        <div class="feature-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="sitelock"}
                                        </div>
                                        <div class="feature-content">
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteDiscover.i1" tagOpen="<strong>" tagClose="</strong>"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-12">
                                    <div class="feature mob-feature-left">
                                        <div class="feature-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="comments"}
                                        </div>
                                        <div class="feature-content">
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteDiscover.i2" tagOpen="<strong>" tagClose="</strong>"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-12">
                                    <div class="feature mob-feature-left">
                                        <div class="feature-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}
                                        </div>
                                        <div class="feature-content">
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteDiscover.i3" tagOpen="<strong>" tagClose="</strong>"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="section-actions">
                                <a href="#websiteSectionPricing"
                                    class="btn btn-xlg btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.startMonitoringLong"}</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="site-section" id="features">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.websiteFeatures.title"}</h2>
                        <ul class="nav nav-tabs nav-tabs-features" role="tablist">
                            <li role="presentation"> <a class="nav-link active" id="features-website-tab"
                                    data-toggle="pill" href="#features-website" role="tab"
                                    aria-controls="features-website" aria-selected="true">
                                    {lang key="store.threesixtymonitoring.navTab.website"}
                                </a></li>
                            <li role="presentation"><a class="nav-link" id="features-server-tab"
                                    data-toggle="pill" href="#features-server" role="tab"
                                    aria-controls="features-server" aria-selected="false">
                                    {lang key="store.threesixtymonitoring.navTab.full"}
                                </a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade active show" id="features-website">
                                <div class="section-content tab-content">
                                    <div class="features features-boxes row justify-center">
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i1a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i1b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i2a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i2b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i3a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i3b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i4a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i4b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i5a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i5b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i6a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i6b"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="features-server">
                                <div class="section-content tab-content">
                                    <div class="row row-eq-height row-eq-height-xs features">
                                        <div class="col-lg-6 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i1a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i1b"}<br>{lang key="store.threesixtymonitoring.websiteFeatures.i1c"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i2a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i2b"}<br>{lang key="store.threesixtymonitoring.websiteFeatures.i2c"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg64 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i3a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i3b"}<br>{lang key="store.threesixtymonitoring.websiteFeatures.i3c"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6">
                                            <div class="feature feature-xs-left">
                                                <div class="feature-icon">
                                                    {include file="$template/store/threesixtymonitoring/feature-check.tpl"}
                                                </div>
                                                <div class="feature-content">
                                                    <h4 class="feature-title">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i4a"}
                                                    </h4>
                                                    <p class="feature-desc">
                                                        {lang key="store.threesixtymonitoring.websiteFeatures.i4b"}<br>{lang key="store.threesixtymonitoring.websiteFeatures.i4c"}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="site-section">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.notifications.title"}
                        </h2>
                        <p class="section-subtitle">
                            {lang key="store.threesixtymonitoring.notifications.tagline"}</p>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0012_mail.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.email"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0011_sms.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.sms"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0008_push.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pushbullet"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0009_gch.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.googlechat"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0010_pb.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pushover"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0013_discord.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.discord"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0007_slack.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.slack"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0006_webhook.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.webhook"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0005_stride.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.stride"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0004_pager.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pagerduty"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0003_tg.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.telegram"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.flock"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0001_ms.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.microsoft365"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0000_genie.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.opsgenie"}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} text-center">
                    <div class="container">
                        <div class="section-sides">
                            <div class="section-graphic order-last">
                                <div class="browser browser-sm">
                                    <img
                                        src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-status.png">
                                </div>
                            </div>
                            <div class="section-content">
                                <h2 class="section-title">
                                    {lang key="store.threesixtymonitoring.websiteMonitor.title"}</h2>
                                <div class="section-desc">
                                    <p>{lang key="store.threesixtymonitoring.websiteMonitor.tagline"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-section" id="websiteSectionPricing">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.websitePricing.title"}</h2>
                        <div class="section-content">
                            <div class="packages row row-eq-height row-eq-height-sm">
                                {foreach $planComparisonData['website'] as $plan}
                                    <div class="col-lg-3">
                                        <div class="package package-monitoring">
                                            <div class="package-header">
                                                <h5 class="package-title">{$plan->name}</h5>
                                                <p class="package-subtitle">
                                                    {lang key="store.threesixtymonitoring.comparison."|cat:$plan->features['tagLine']}
                                                </p>
                                                <div class="package-price">
                                                    <div class="price monthly">
                                                        {if $inPreview && !$featurePrice}
                                                            <div class="price-amount">$1.23</div>
                                                        {elseif $plan->isFree()}
                                                            {lang key="orderpaymenttermfree"}
                                                        {else}
                                                            {$plan->pricing()->first()->toPrefixedString()}
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="package-body">
                                                <ul>
                                                    {foreach $plan->features as $featureKey => $featureValue}
                                                        {if $featureKey != 'tagLine'}
                                                            <li class="hidden">{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}</li>
                                                        {/if}
                                                    {/foreach}
                                                    {foreach $plan->features as $featureKey => $featureValue}
                                                        {assign var="line" value=false}
                                                        {if $featureKey != 'tagLine'}
                                                            {if !$featureValue}
                                                                <li class="line-through text-lighter">
                                                                    {lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}
                                                                </li>
                                                            {else}
                                                                <li>{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}
                                                                    -
                                                                    <strong>
                                                                        {if !$featureValue}
                                                                            <span style="">x</span>
                                                                        {elseif $featureKey == 'timeIntervals'}
                                                                            {if $featureValue == 1}
                                                                                60 {lang key="seconds"}
                                                                            {else}
                                                                                {$featureValue} {lang key="minutes"}
                                                                            {/if}
                                                                        {elseif $featureKey == 'dataRetention'}
                                                                            {if $featureValue == 1}
                                                                                24 {lang key="hours"}
                                                                            {else}
                                                                                {$featureValue} {lang key="days"}
                                                                            {/if}
                                                                        {elseif $featureValue == 'yes'}
                                                                            {lang key="yes"}
                                                                        {elseif is_string($featureValue)}
                                                                            {lang key="store.threesixtymonitoring.comparison."|cat:$featureValue tagOpen="<strong>" tagClose="</strong>"}
                                                                        {else}
                                                                            {$featureValue}
                                                                        {/if}
                                                                    </strong>
                                                                </li>
                                                            {/if}
                                                        {/if}
                                                    {/foreach}
                                                </ul>
                                            </div>
                                            <div class="package-actions">
                                                <form method="post" action="{routePath('cart-order')}">
                                                    <input type="hidden" name="checkout" value="1">
                                                    <input type="hidden" name="pid" value="{$plan->id}">
                                                    <button class="btn btn-lg btn-primary" type="submit" {if $inPreview}
                                                        disabled="disabled" {/if}>
                                                        {lang key="ordertitle"}
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                            {if $serverPlanCount > 0}<p class="text-center pricing-text">
                                    {lang key="store.threesixtymonitoring.websitePricing.cta" tagOpen="" tagClose=""}
                                    <a href="#serverSectionPricing">{lang key="clickHere"}</a>
                            </p>{/if}
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane tab-server fade {if $websitePlanCount <= 0} show active{/if}"
                id="pills-server" role="tabpanel" aria-labelledby="pills-server-tab">
                <div class="site-section">
                    <div class="container">
                        <img class="w-100 img-overlap"
                            src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-dash.png">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.serverDiscover.title"}</h2>
                        <p class="section-subtitle">{lang key="store.threesixtymonitoring.serverDiscover.tagline"}</p>
                        <div class="section-content">
                            <div class="features features-boxes row justify-center">
                                <div class="col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="clock-time-box"}
                                        </div>
                                        <div class="feature-content">

                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.serverDiscover.i1"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation"}
                                        </div>
                                        <div class="feature-content">
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.serverDiscover.i2"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-section">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.serverMonitor.title"}</h2>
                        <p class="section-subtitle">{lang key="store.threesixtymonitoring.serverMonitor.tagline"}
                            {lang key="store.threesixtymonitoring.serverMonitor.lostRevenue"}</p>
                        <div class="section-content">
                            <div class="features features-boxes row justify-center">
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="feature feature-lg feature-boxed">
                                        <div class="feature-content">
                                            <div class="feature-number">99.9%</div>
                                            <h5 class="feature-title">
                                                {lang key="store.threesixtymonitoring.serverMonitor.uptime"}<br>
                                                <b>= $500{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</b>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="feature feature-lg feature-boxed">
                                        <div class="feature-content">
                                            <div class="feature-number">99.8%</div>
                                            <h5 class="feature-title">
                                                {lang key="store.threesixtymonitoring.serverMonitor.uptime"}<br>
                                                <b>= $1000{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</b>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="feature feature-lg feature-boxed">
                                        <div class="feature-content">
                                            <div class="feature-number">99.7%</div>
                                            <h5 class="feature-title">
                                                {lang key="store.threesixtymonitoring.serverMonitor.uptime"}<br>
                                                <b>= $1,500{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</b>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <div class="feature feature-lg feature-boxed">
                                        <div class="feature-content">
                                            <div class="feature-number">98%</div>
                                            <h5 class="feature-title">
                                                {lang key="store.threesixtymonitoring.serverMonitor.uptime"}<br>
                                                <b>=
                                                    $10,000{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</b>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="text-center m-t-3x text-small">
                            {lang key="store.threesixtymonitoring.serverMonitor.asterisk"}</p>
                        <div class="section-actions text-center">
                            <a href="#serverSectionPricing"
                                class="btn btn-primary btn-lg btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.startMonitoringShort"}</a>
                        </div>
                    </div>
                </div>
                <div class="site-section">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.websiteFeatures.title"}</h2>
                        <div class="section-content">
                            <div class="features features-boxes row justify-center">
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i1a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i1b"}
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i1c"}
                                            </p>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i2a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i2b"}
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i2c"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i3a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i3b"}
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i3c"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i4a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i4b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i5a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i5b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i6a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i6b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i7a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i7b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i8a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i8b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-12">
                                    <div class="feature">
                                        <div class="feature-icon">
                                            {include file="$template/assets/img/store/threesixtymonitoring/check.tpl"}
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i9a"}
                                            </div>
                                            <p class="feature-desc">
                                                {lang key="store.threesixtymonitoring.websiteFeatures.i9b"}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="section-actions text-center">
                            <a href="#serverSectionPricing"
                                class="btn btn-primary btn-lg btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                        </div>
                    </div>
                </div>
                <div class="site-section">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.notifications.title"}</h2>
                        <p class="section-subtitle">{lang key="store.threesixtymonitoring.notifications.tagline"}</p>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0012_mail.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.email"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0011_sms.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.sms"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0008_push.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pushbullet"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0009_gch.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.googlechat"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0010_pb.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pushover"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0013_discord.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.discord"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0007_slack.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.slack"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0006_webhook.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.webhook"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0005_stride.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.stride"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0004_pager.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.pagerduty"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0003_tg.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.telegram"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.flock"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0001_ms.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.microsoft365"}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-row-7 col-sm-4 col-6">
                                    <div class="feature feature-sm">
                                        <div class="feature-icon">
                                            <img
                                                src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0000_genie.png">
                                        </div>
                                        <div class="feature-content">
                                            <div class="feature-title weight-500">
                                                {lang key="store.threesixtymonitoring.notifications.opsgenie"}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-section" id="serverSectionPricing">
                    <div class="container">
                        <h2 class="section-title">{lang key="store.threesixtymonitoring.websitePricing.title"}</h2>
                        <div class="section-content">
                            <div class="packages row row-eq-height row-eq-height-sm">
                                {foreach $planComparisonData['server'] as $plan}
                                    <div class="col-lg-3">
                                        <div class="package package-monitoring">
                                            <div class="package-header">
                                                <h5 class="package-title">{$plan->name}</h5>
                                                <p class="package-subtitle">
                                                    {lang key="store.threesixtymonitoring.comparison."|cat:$plan->features['tagLine']}
                                                </p>
                                                <div class="package-price">
                                                    <div class="price monthly">
                                                        {if $inPreview && !$featurePrice}
                                                            <div class="price-amount">$1.23</div>
                                                        {elseif $plan->isFree()}
                                                            {lang key="orderpaymenttermfree"}
                                                        {else}
                                                            {$plan->pricing()->first()->toPrefixedString()}
                                                        {/if}
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="package-body">
                                                <ul>
                                                    {foreach $plan->features as $featureKey => $featureValue}
                                                        {if $featureKey != 'tagLine'}
                                                            <li class="hidden">{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}</li>
                                                        {/if}
                                                    {/foreach}
                                                    {foreach $plan->features as $featureKey => $featureValue}
                                                        {assign var="line" value=false}
                                                        {if $featureKey != 'tagLine'}
                                                            {if !$featureValue}
                                                                <li class="line-through text-lighter">
                                                                    {lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}</li>
                                                            {else}
                                                                <li>{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey} -
                                                                    <strong>
                                                                        {if !$featureValue}
                                                                            <span style="">x</span>
                                                                        {elseif $featureKey == 'timeIntervals'}
                                                                            {if $featureValue == 1}
                                                                                60 {lang key="seconds"}
                                                                            {else}
                                                                                {$featureValue} {lang key="minutes"}
                                                                            {/if}
                                                                        {elseif $featureKey == 'dataRetention'}
                                                                            {if $featureValue == 1}
                                                                                24 {lang key="hours"}
                                                                            {else}
                                                                                {$featureValue} {lang key="days"}
                                                                            {/if}
                                                                        {elseif $featureValue == 'yes'}
                                                                            {lang key="yes"}
                                                                        {elseif is_string($featureValue)}
                                                                            {lang key="store.threesixtymonitoring.comparison."|cat:$featureValue tagOpen="<strong>" tagClose="</strong>"}
                                                                        {else}
                                                                            {$featureValue}
                                                                        {/if}
                                                                    </strong>
                                                                </li>
                                                            {/if}
                                                        {/if}
                                                    {/foreach}
                                                </ul>
                                            </div>
                                            <div class="package-actions">
                                                <form method="post" action="{routePath('cart-order')}">
                                                    <input type="hidden" name="checkout" value="1">
                                                    <input type="hidden" name="pid" value="{$plan->id}">
                                                    <button class="btn btn-lg btn-primary" type="submit" {if $inPreview}
                                                        disabled="disabled" {/if}>
                                                        {lang key="ordertitle"}
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                            {if $serverPlanCount > 0}<p class="text-center pricing-text">
                                    {lang key="store.threesixtymonitoring.websitePricing.cta" tagOpen="" tagClose=""}
                                    <a href="#serverSectionPricing">{lang key="clickHere"}</a>
                            </p>{/if}
                        </div>
                    </div>

                </div>
            </div>
            <div class="site-section" style="border-top: var(--site-section-border);">
                <div class="container">
                    <h2 class="section-title">{lang key="store.websiteBuilder.faq.title"}</h2>
                    <div class="section-content m-w-lg m-a">
                        <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                            <div class="panel panel-accordion is-open">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-1"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q1"}</h4>
                                </div>
                                <div id="threesixty-question-1" class="panel-collapse collapse show" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a1"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-3"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q3"}</h4>
                                </div>
                                <div id="threesixty-question-3" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a3"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-5"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q5"}</h4>
                                </div>
                                <div id="threesixty-question-5" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a5"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-7"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q7"}</h4>
                                </div>
                                <div id="threesixty-question-7" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a7"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-9"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q9"}</h4>
                                </div>
                                <div id="threesixty-question-9" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a9"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-11"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q11"}</h4>
                                </div>
                                <div id="threesixty-question-11" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a11"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-2"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q2"}</h4>
                                </div>
                                <div id="threesixty-question-2" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a2"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-4"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q4"}</h4>
                                </div>
                                <div id="threesixty-question-4" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a4"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-6"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q6"}</h4>
                                </div>
                                <div id="threesixty-question-6" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a6"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-8"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q8"}</h4>
                                </div>
                                <div id="threesixty-question-8" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a8"}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-accordion">
                                <div class="panel-heading" data-toggle="collapse" data-target="#threesixty-question-10"
                                    aria-expanded="true">
                                    <h4 class="panel-title"><i
                                            class="lm lm-plus"></i>{lang key="store.threesixtymonitoring.faq.q10"}</h4>
                                </div>
                                <div id="threesixty-question-10" class="panel-collapse collapse" aria-expanded="true"
                                    style="" data-parent="#accordion">
                                    <div class="panel-body">
                                        <p>{lang key="store.threesixtymonitoring.faq.a10"}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal modal-results modal-lg fade" id="modalTestResults" data-cms-modal-container="body" tabindex="-1" role="dialog"
            aria-labelledby="modalTestResultsTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <i class="fas fa-globe-asia"></i>
                        <h5 class="modal-title" id="modalTestResultsTitle">
                            {$LANG['store']['threesixtymonitoring']['modal']['subtitle']}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="{$LANG['close']}">
                            <i class="lm lm-close"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <div class="text-center  modal-body-header">
                                <h5 class="modal-url"><span class="weight-300">{$rslang->trans('threesixty.url')}: </span><span
                                        class="modal-url-value"></span></h5>
                                <h5 class="modal-location"><span class="weight-300">{$rslang->trans('threesixty.location')}:
                                    </span><span class="modal-location-value"></span></h5>
                            </div>
                            <div class="modal-results">
                                <div class="row result-values">
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="modal-results-box modal-results-box--positive">
                                            <span>{$LANG['store']['threesixtymonitoring']['modal']['currentStatus']}</span>
                                            <div class="metric-icon">
                                                <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                                    alt="default" />
                                                <i aria-hidden="true" class="ls ls-info-circle"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                                <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                                <h3 class="metric-value" data-metric="host_status" data-metric-type="label">
                                                    Online</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="modal-results-box modal-results-box--positive">
                                            <span>{$LANG['store']['threesixtymonitoring']['modal']['resolvingTime']}</span>
                                            <div class="metric-icon">
                                                <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                                    alt="default" />
                                                <i aria-hidden="true" class="ls ls-info-circle"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                                <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                                <h3 class="metric-value" data-metric="time_dns" data-metric-type="time">0.009 s
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="modal-results-box modal-results-box--info">
                                            <span>{$LANG['store']['threesixtymonitoring']['modal']['connectionTime']}</span>
                                            <div class="metric-icon">
                                                <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                                    alt="default" />
                                                <i aria-hidden="true" class="ls ls-info-circle"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                                <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                                <h3 class="metric-value" data-metric="time_connect" data-metric-type="time">
                                                    0.013 s</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="modal-results-box modal-results-box--negative">
                                            <span
                                                class="">{$LANG['store']['threesixtymonitoring']['modal']['totalTime']}</span>
                                            <div class="metric-icon ">
                                                <img src="{$WEB_ROOT}/templates/{$template}/assets/img/check-positive.svg"
                                                    alt="default" />
                                                <i aria-hidden="true" class="ls ls-info-circle"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                                <i aria-hidden="true" class="ls ls-exclamation-circle pulse-text"
                                                    title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>     
                                                <h3 class="metric-value" data-metric="time_total" data-metric-type="time">1.257
                                                    s</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-actions">
                                <a href="#websiteSectionPricing"
                                    class="btn btn-lg btn-primary btn-pricing-scroll btn-modal-get-started">{$LANG['store']['threesixtymonitoring']['button']['startMonitoringLong']}
                                    <i class="lm lm-arrow-fat-right"></i></a>
                            </div>
                            <div class="div-cloneable-results d-none">
                                <div class="metric-icon result-positive">
                                    <i aria-hidden="true" class="fas fa-circle"
                                        title="{$LANG['store']['threesixtymonitoring']['modal']['positive']}"></i>
                                    <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['positive']}</span>
                                </div>
                                <div class="metric-icon result-concern">
                                    <i aria-hidden="true" class="fas fa-circle"
                                        title="{$LANG['store']['threesixtymonitoring']['modal']['concern']}"></i>
                                    <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['concern']}</span>
                                </div>
                                <div class="metric-icon result-negative">
                                    <i aria-hidden="true" class="fas fa-circle"
                                        title="{$LANG['store']['threesixtymonitoring']['modal']['negative']}"></i>
                                    <span class="sr-only">{$LANG['store']['threesixtymonitoring']['modal']['negative']}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            (function($) {
                $(document).ready(function() {
                    $('#frmSiteCheck').submit(function(e) {
                        e.preventDefault();
                        var form = this;
                        var btnSubmit = $(form).find('button[type=submit]');
                        var url = jQuery(form).find('[name="url"]');
                        var select = jQuery(form).find('[name="probe_id"]');
                        var probe = jQuery(form).find('[name="probe_id"] option:selected');
                        
                        var searchField = $(url).closest('.form-group');
                        var dropdown = $(select).closest('.form-group');
                        var searchBtnIcon = $(form).find('i');
                        if (probe.val().length == 0 || url.val().length == 0) {
                            if (url.val().length == 0) {
                                searchField.tooltip('show');
                            }
                            if (probe.val().length == 0) {
                                dropdown.tooltip('show');
                            }
                            return false;
                        }

                        $(btnSubmit).find('.main-icon').hide();
                        $(btnSubmit).find('.fa-spinner').show();

                        btnSubmit.find('span').addClass('hidden');
                        btnSubmit.find('.loader').removeClass('hidden');

                        WHMCS.http.jqClient.jsonPost({
                            url: $(form).attr('action'),
                            data: $(form).serialize(),
                            success: function(response) {
                                var isHostUp = !response.result['down_now'];
                                console.log(response);
                                jQuery('.modal-url-value').text(
                                    "https://" + url.val()
                                );
                                jQuery('.modal-location-value').text(
                                    probe.text() 
                                );

                                

                                $(".result-values [data-metric]").each(function (
                                    index,
                                    metricElement
                                ) {
                                    var metric = $(metricElement).data("metric");
                                    var dataType = $(metricElement).data("metric-type");
                                    var metricData = response.result[metric];
                        
                                    if (metricData && isHostUp) {
                                    if (dataType === "time") {
                                        metricData.value = metricData.value + " S";
                                    }
                                    } else if (!isHostUp && dataType === "time") {
                                    metricData = {
                                        value: "---",
                                        icon: "negative",
                                    };
                                    }
                        
                                    $(metricElement).text(metricData.value);
                                    let box = $(this).closest('.modal-results-box');
                                    box.removeClass('modal-results-box--positive modal-results-box--info modal-results-box--negative');
                                    if (metricData.icon == "positive"){
                                        box.addClass('modal-results-box--positive');
                                    }   
                                    else if(metricData.icon == "concern"){
                                        box.addClass('modal-results-box--info');
                                    }
                                    else if (metricData.icon == "negative"){
                                        box.addClass('modal-results-box--negative');
                                    }
                                });

                                $(modalTestResults).modal('show');
                            },
                            fail: function() {
                                WHMCS.ui.effects.errorShake(searchBtnIcon);
                                btnSubmit.find('span').removeClass('hidden');
                                btnSubmit.find('.loader').addClass('hidden');
                            },
                            always: function() {
                                btnSubmit.find('span').removeClass('hidden');
                                btnSubmit.find('.loader').addClass('hidden');
                            }
                        });

                        return false;
                    });
                    jQuery('.btn-link').on('click', function() {
                        var isExpanded = jQuery(this).attr('aria-expanded');
                        var toggleIcon = jQuery(this).closest('div').find('i');
                        var allCards = jQuery(this).closest('section').find('i');
                        if (isExpanded == 'true') {
                            toggleIcon.removeClass('fa-minus').addClass('fa-plus');
                        } else {
                            allCards.each(function() {
                                jQuery(this).removeClass('fa-minus').addClass('fa-plus');
                            });
                            toggleIcon.removeClass('fa-plus').addClass('fa-minus');
                        }
                    });
                    jQuery('.btn-pricing-scroll').on('click', function(event) {
                        var element = jQuery(this);
                        var targetId = element.attr('href');

                        event.preventDefault();
                        if (element.hasClass('btn-modal-get-started')) {
                            jQuery('#modalTestResults').modal('hide');
                        }
                        jQuery('html, body').animate({
                            scrollTop: jQuery(targetId).offset().top
                        }, 500);
                    });

                    jQuery('#pills-website-tab, #pills-server-tab').on('click', function(event) {
                        var element = jQuery(this);

                        event.preventDefault();
                        if (element.attr('id') == 'pills-website-tab') {
                            jQuery('.site-banner .tab-server').hide();
                            jQuery('.site-banner .tab-website').fadeToggle();
                        } else {
                            jQuery('.site-banner .tab-website').hide();
                            jQuery('.site-banner .tab-server').fadeToggle();
                        }
                    });
                    jQuery('.p-pricing-cta a').on('click', function(event) {
                        var element = jQuery(this);
                        var targetId = element.attr('href');

                        event.preventDefault();
                        if (targetId == '#serverSectionPricing') {
                            jQuery('.site-banner .tab-website').hide();
                            jQuery('.site-banner .tab-server').fadeToggle();
                            jQuery('#pills-website').removeClass('active show');
                            jQuery('#pills-server').addClass('active show');
                            jQuery('#pills-website-tab').removeClass('active').attr('aria-selected',
                                'false');
                            jQuery('#pills-server-tab').addClass('active').attr('aria-selected',
                                'true');
                        } else {
                            jQuery('.site-banner .tab-server').hide();
                            jQuery('.site-banner .tab-website').fadeToggle();
                            jQuery('#pills-server').removeClass('active show');
                            jQuery('#pills-website').addClass('active show');
                            jQuery('#pills-server-tab').removeClass('active').attr('aria-selected',
                                'false');
                            jQuery('#pills-website-tab').addClass('active').attr('aria-selected',
                                'true');
                        }
                        jQuery('html, body').animate({
                            scrollTop: jQuery(targetId).offset().top
                        }, 0);
                    });
                    $('[data-custom-tooltip]').each(function(){
                        $(this).tooltip();
                    });
                     $('[data-custom-tooltip]').on('click', function(){
                        $(this).tooltip('hide');
                    });
                });
            })(jQuery);
        </script>


<script>
    $('.btn-search').on('click', function (e) {
            let btnSearch = $(this);
            btnSearch.find('span').addClass('invisible');
            btnSearch.find('.loader').addClass('visible');
        }
    );

    $("#modalTestResults").on("hide.bs.modal", function () {
        $('.btn-search').find('span').removeClass('invisible');
        $('.btn-search').find('.loader').removeClass('visible');
    });

</script>

{/if}