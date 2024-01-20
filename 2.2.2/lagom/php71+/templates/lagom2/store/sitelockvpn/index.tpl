

{if file_exists("templates/$template/store/sitelockvpn/overwrites/index.tpl")}
    {include file="{$template}/store/sitelockvpn/overwrites/index.tpl"}  
{else} 
    <div class="site site-sitelockvpn">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">              
                <div class="banner-content">
                    <h1 class="banner-title"> {lang key='store.sitelockvpn.subtitle1'} {lang key='store.sitelockvpn.subtitle2'}</h1>
                    <div class="banner-desc">
                        <p>{lang key='store.sitelockvpn.tagline1'} {lang key='store.sitelockvpn.tagline2'}</p>
                    </div>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing');return false">{lang key='store.sitelockvpn.getStarted'}</a>
                        <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview');return false">{lang key='learnmore'}</a>
                    </div>
                </div>
                <div class="banner-background">
                    <div class="banner-graphic">
                        {if $RSThemes.styles.iconType == "modern"}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/sitelockvpn"}
                        {else}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/sitelockvpn"}
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
                            <div class="browser-top">
                                <div class="browser-actions"><span></span><span></span><span></span></div>
                            </div>
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/vpn-illustration-1"}
                        </div> 
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key='store.sitelockvpn.feature1.title'}</h2>
                        <div class="section-desc">
                            <p>{lang key='store.sitelockvpn.feature1.subtitle'}</p>
                            <ul class="check-list">
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.one'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.two'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.three'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.four'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.five'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature1.highlights.six'}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section">
            <div class="container">   
                <div class="section-sides">
                    <div class="section-graphic order-last">
                        <div class="browser browser-sm">
                            <div class="browser-top">
                                <div class="browser-actions"><span></span><span></span><span></span></div>
                            </div>
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/vpn-illustration-2"}
                        </div> 
                    </div>
                    <div class="section-content order-first">
                        <h2 class="section-title">{lang key='store.sitelockvpn.feature2.title'}</h2>
                        <div class="section-desc">
                            <p>{lang key='store.sitelockvpn.feature2.subtitle'}</p>
                            <ul class="check-list">
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.one'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.two'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.three'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.four'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.five'}</li>
                                <li><i class="lm lm-check"></i>{lang key='store.sitelockvpn.feature2.highlights.six'}</li>
                            </ul>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-sm">
                            <div class="browser-top">
                                <div class="browser-actions"><span></span><span></span><span></span></div>
                            </div>
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/vpn-illustration-3"}                            
                        </div> 
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key='store.sitelockvpn.feature3.title'}</h2>
                        <div class="section-desc">
                            <p><b>{lang key='store.sitelockvpn.feature3.subtitle'}</b></p>
                            <p>{lang key='store.sitelockvpn.feature3.subtitle2'}</p>
                            <sup class='text-muted'>{lang key='store.sitelockvpn.feature3.subtitle3'}</sup>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
            <div class="container">
                <h2 class="section-title">
                    {lang key='store.sitelockvpn.pricing.oneSubscription'} {lang key='store.sitelockvpn.pricing.fiveDevices'}
                </h2>
                <div class="section-content">
                    <div class="row row-eq-height row-eq-height-sm">
                        {if count($plans) > 0}
                            {foreach $plans as $plan}
                                {foreach $plan->pricing()->allAvailableCycles() as $pricing}
                                    <div class="col-lg-{if $pricing@total == 1}12{elseif $pricing@total == 2}6{elseif $pricing@total == 3}4{elseif $pricing@total == 4}3{elseif $pricing@total == 5}4{else}3{/if}">
                                        <div class="package{if $pricing->calculatePercentageDifference($highestMonthlyPrice) > 0} package-featured{/if}">                                            
                                            <div class="package-header">
                                                {if $pricing->calculatePercentageDifference($highestMonthlyPrice) > 0}
                                                    <span class="label-corner label-primary">
                                                        {lang key='store.save' saving=$pricing->calculatePercentageDifference($highestMonthlyPrice)}
                                                    </span>
                                                {/if}
                                                <h4 class="package-title">
                                                    {if $pricing->isYearly()}
                                                        {$pricing->cycleInYears()}
                                                    {else}
                                                        {$pricing->cycleInMonths()}
                                                    {/if}
                                                </h4>
                                                <div class="package-price">
                                                    {assign var=vpnPrice value="/"|explode:$pricing->toFullString()}
                                                    <div class="price">
                                                        {include file="$template/includes/common/price.tpl" 
                                                            price=$vpnPrice[0]
                                                            priceType="onetime"
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="package-body">
                                                <ul class="package-features">
                                                    {foreach $plan->planFeatures as $langKey => $feature}
                                                        <li>
                                                            {lang key="store.sitelockvpn.pricing.features.$langKey"}
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                                <div class="package-actions">
                                                    <form method="post" action="{routePath('cart-order')}">
                                                        <input type="hidden" name="pid" value="{$plan->id}">
                                                        <input type="hidden" name="billingcycle" value="{$pricing->cycle()}">
                                                        <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if} btn-signup{if $pricing@iteration == ($pricing@total - 1)} highlight1{elseif $pricing@iteration == $pricing@total} highlight2{/if}">
                                                            {lang key="signup"}
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>        
                                {/foreach}
                            {/foreach}
                        {elseif $inPreview}
                            <div class="lead text-center">
                                {lang key="store.sitelockvpn.adminPreview"}
                            </div>
                        {/if}    
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key='store.sitelockvpn.plans.features.allInclude'}:</h2>
                <div class="section-content">
                    <div class="row row-eq-height row-eq-height-xs features">
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="instant-issuance"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.noRestrictions'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="web-hosting"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.highSpeed'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="transfer-domain"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.unlimited'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="sitelock"}      
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.encryption'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="icon-staging-of-restores"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.protocol'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="templates"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.simultaneous'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="icon-automatic-daily-backup"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.switching'}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="feature feature-xs-left">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="email-archiving"}     
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key='store.sitelockvpn.plans.features.support'}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div> 
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key='store.sitelockvpn.world.features.title'}</h2>
                <div class="section-graphic">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="store/vpn/vpn-map"}
                </div>
                <div class="section-content m-w-lg m-h-a">
                    <div class="tiles row"> 
                        <div class="col-lg-4">
                            <div class="tile">
                                <span class="tile-stat tile-stat-sm">1000+</span>
                                <span class="tile-title">{$LANG.store.sitelockvpn.world.features.servers|capitalize}</span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="tile">
                                <span class="tile-stat tile-stat-sm">40+</span>
                                <span class="tile-title">{$LANG.store.sitelockvpn.world.features.countries|capitalize}</span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="tile">
                                <span class="tile-stat tile-stat-sm">{$LANG.store.sitelockvpn.world.features.unlimited}</span>
                                <span class="tile-title">{$LANG.store.sitelockvpn.world.features.bandwidth|capitalize}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}