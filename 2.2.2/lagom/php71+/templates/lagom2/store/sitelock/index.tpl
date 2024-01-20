
{if file_exists("templates/$template/store/sitelock/overwrites/index.tpl")}
    {include file="{$template}/store/sitelock/overwrites/index.tpl"}  
{else}
<div class="site site-sitelock">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{lang key="store.sitelock.contentHeadline"}</h1>
                <div class="banner-desc">
                    <p>{lang key="store.sitelock.tagline"}</p>
                </div>
                <div class="banner-actions">
                    <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing');return false">{lang key="store.websiteBuilder.tab.pricing"}</a>
                    <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview');return false">{lang key="learnmore"}</a>
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
    <div class="site-section" id="overview">
        <div class="container">
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="store/ssl/ssl-preview-2"}
                    </div> 
                </div>
                <div class="section-content">
                    <h2 class="section-title">{lang key="store.sitelock.comparePlansSubtitle"}</h2>
                    <div class="section-desc">
                        <p>{lang key="store.sitelock.contentBodyParagraph1"}</p>
                        <p>{lang key="store.sitelock.contentBodyParagraph2"}</p>
                        <p>{lang key="store.sitelock.contentBodyParagraph3"}</p>
                    </div>
                </div>
            </div>
            <div class="section-content"> 
                <div class="features features-boxes row justify-center">
                    <div class="col-md col-md-4 col-sm-6">
                        <div class="feature feature-bordered feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="site-lock-trust-seal"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresTrustSealTitle"}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md col-md-4 col-sm-6">
                        <div class="feature feature-bordered feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="daily-malware-scanning"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.features.malwareScanning"}</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md col-md-4 col-sm-6">
                        <div class="feature feature-bordered feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="vulnerability-scan"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresVulnerabilityTitle"}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>                
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.comparePlans"}</h2>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm">
                {foreach $plans as $plan}
                    <div class="col-lg-{if count($plans) == 4}3{elseif count($plans) == 3}4{elseif count($plans) == 2}6{else}12{/if} col-md-{if count($plans) == 3}6{/if} col-sm-12">
                        <div class="package">
                            <div class="package-header">
                                <h4 class="package-title">{$plan->name} </h4>
                                <p class="package-subtitle">{$plan->description}</p>
                                <div class="package-price"> 
                                    {if $plan->isFree()}
                                        {include file="$template/includes/common/price.tpl" 
                                            price=$LANG.orderpaymenttermfree
                                        }   
                                    {elseif $plan->pricing()->annually()}   
                                        <div class="price">
                                        {include file="$template/includes/common/price.tpl" 
                                            price=$plan->pricing()->annually()->price()
                                            priceCycle=$plan->pricing()->annually()->cycle()
                                        }
                                        </div>
                                    {elseif $plan->pricing()->first()}   
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
                                    {foreach $plan->features as $label => $value}
                                        <li> {$label} {if is_bool($value)}{else} - <b>{$value}</b>
                                        {/if} </li>
                                    {/foreach}
                                </ul>
                                <div class="package-actions">
                                    <form method="post" action="{routePath('cart-order')}">
                                        <input type="hidden" name="pid" value="{$plan->id}">
                                        <select name="billingcycle" class="form-control">
                                            {foreach $plan->pricing()->allAvailableCycles() as $cycle}
                                                <option value="{$cycle->cycle()}"> {if $cycle->isRecurring()}
                                                    {if $cycle->isYearly()}
                                                        {$cycle->cycleInYears()}
                                                    {else}
                                                        {$cycle->cycleInMonths()}
                                                    {/if}
                                                        -
                                                    {/if}
                                                    {$cycle->toFullString()}
                                                </option>
                                            {/foreach}
                                        </select>
                                        <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if} btn-block">{lang key="store.sitelock.buyNow"}</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/foreach} 
                </div>
            </div>
        </div>
    </div>                
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.featuresTitle"}</h2>
            <p class="section-subtitle">{lang key="store.sitelock.featuresHeadline"}</p>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-xs features">
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="malware-scan"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresMalwareTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresMalwareContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="automatic-malware-removal"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresMalwareRemovalTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresMalwareRemovalContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="vulnerability-scan_2"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresVulnerabilityTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresVulnerabilityContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="OWASP-protection"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresOWASPTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresOWASPContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="firewall"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresFirewallTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresFirewallContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="protect-your-reputation"}
                            </div>
                            <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.sitelock.featuresReputationTitle"}</h4>
                            <p class="feature-desc">{lang key="store.sitelock.featuresReputationContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="fast-automated-steup"}
                            </div>
                            <div class="feature-content">
                            <h4 class="feature-title">{lang key="store.sitelock.featuresSetupTitle"}</h4>
                            <p class="feature-desc">{lang key="store.sitelock.featuresSetupContent"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="feature mob-feature-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="content-delivery-network"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.sitelock.featuresCDNTitle"}</h4>
                                <p class="feature-desc">{lang key="store.sitelock.featuresCDNContent"}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    {if !is_null($emergencyPlan)}                        
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.emergencyPlanTitle"}</h2>
            <p class="section-subtitle">{lang key="store.sitelock.emergencyPlanBody"}</p>
            <div class="section-content" >
                <div class="emergency-promo" id="emergency">
                    <div class="emergency-promo-title">
                        <span></span><h3 class="h4">{lang key="store.sitelock.emergencyPlanHeadline"}</h3><span></span>
                    </div>
                    <div class="row row-eq-height row-eq-height-xs">
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 1. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanResponseTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanResponseContent"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 2. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanMalwareTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanMalwareContent"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 3. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanPriorityTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanPriorityContent"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 4. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanAftercareTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanAftercareContent"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 5. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanUpdatesTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanUpdatesContent"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-number"> 6. </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.sitelock.emergencyPlanPaymentTitle"}</h4>
                                    <p class="feature-desc">{lang key="store.sitelock.emergencyPlanPaymentContent"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="emergency-promo-banner">
                        <h4 class="h3">{lang key="store.sitelock.emergencyPlanOnlyCost" price="<span>{if $emergencyPlan->pricing()->best()}{$emergencyPlan->pricing()->best()->toFullString()}{else}-{/if}</span>" }</h4>
                        <form method="post" action="{routePath('cart-order')}">
                            <input type="hidden" name="pid" value="{$emergencyPlan->id}">
                            <button type="submit" class="btn btn-lg btn-primary-faded">{lang key="store.sitelock.buyNow"}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {/if}
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.faqTitle"}</h2>
            <div class="section-content m-w-lg m-a">    
                <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                    <div class="panel panel-accordion is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_is_SiteLock" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqOneTitle"}</h4>
                        </div>
                        <div id="what_is_SiteLock" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqOneBody"}</p>
                                <p>{lang key="store.sitelock.faqOneBodyLearnMore" learnMoreLink={$learnMoreLink}}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_does_SiteLock_do" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqTwoTitle"}</h4>
                        </div>
                        <div id="what_does_SiteLock_do" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqTwoBody"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_types_of_issues_does_SiteLock_scan_for" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqThreeTitle"}</h4>
                        </div>
                        <div id="what_types_of_issues_does_SiteLock_scan_for" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqThreeBody"} </p>
                                <ul>
                                    <li><strong>{lang key="store.sitelock.faqThreeBodyList1Title"}:</strong> {lang key="store.sitelock.faqThreeBodyList1"}</li>
                                    <li><strong>{lang key="store.sitelock.faqThreeBodyList2Title"}:</strong> {lang key="store.sitelock.faqThreeBodyList2"}</li>
                                    <li><strong>{lang key="store.sitelock.faqThreeBodyList3Title"}:</strong> {lang key="store.sitelock.faqThreeBodyList3"}</li>
                                </ul>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_are_vulnerabilities_and_malware" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqFourTitle"}</h4>
                        </div>
                        <div id="what_are_vulnerabilities_and_malware" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqFourBodyParagraph1" vulnerabilityStrong="<strong>{lang key="store.sitelock.websiteVulnerability"}</strong>"}</p>
                                <p>{lang key="store.sitelock.faqFourBodyParagraph2" malwareStrong="<strong>{lang key="store.sitelock.malware"}</strong>"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#will_SiteLock_impact_website_performance" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqFiveTitle"}</h4>
                        </div>
                        <div id="will_SiteLock_impact_website_performance" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqFiveBody"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#are_the_backups_encrypted" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.sitelock.faqSixTitle"}</h4>
                        </div>
                        <div id="are_the_backups_encrypted" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.sitelock.faqSixBody"}</p>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}