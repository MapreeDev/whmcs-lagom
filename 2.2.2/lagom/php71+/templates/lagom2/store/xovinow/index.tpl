{if file_exists("templates/$template/store/xovinow/overwrites/index.tpl")}
    {include file="{$template}/store/xovinow/overwrites/index.tpl"}  
{else} 
<div class="site site-xovinow">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{lang key="store.xoviNow.tagline" lineBreak='<div class="d-none d-lg-block"></div>'}</h1>
                <div class="banner-actions">
                    <a href="#" class="btn  btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#cpsPricing'); return false">{lang key="store.xoviNow.getStarted"}</a>
                    <a href="#" class="btn  {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview'); return false">{$LANG.learnmore}</a>
                </div>
            </div>
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/marketgoo"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/marketgoo"}
                    {/if}                   
                </div>
                <div class="banner-shape">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                </div>
            </div>
        </div>
    </div>
    <div class="site-section overflow-hidden" id="overview">
        <div class="container">
            <h2 class="section-title">{lang key="store.xoviNow.measureResultsTitle"}</h2>
            <p class="section-subtitle">{lang key="store.xoviNow.measureResults1" startBold="<strong>" endBold="</strong>"}{lang key="store.xoviNow.measureResults2" startBold="<strong>" endBold="</strong>"}</p>
            <div class="section-content">
                <div class="slider testimonials" data-testimonial-slider>
                    <div class="content-slider" data-slider-container>
                        <div class="content-slider-wrapper" data-slider-wrapper>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/dashboard.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/rankings.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/keyword_research_keywords.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/tracked_keywords.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/projects.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/site_audit.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/advisor_overview_column.png">
                            </div>
                            <div class="content-slider-item content-slider-item-img">
                                <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/advisor_task_details.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <ul class="nav nav-tabs nav-tabs-features" role="tablist">
                <li role="presentation"><a class="active" href="#keywords" aria-controls="keywords" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.keywords.title"}</a></li>
                <li role="presentation"><a href="#advisor" aria-controls="advisor" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.advisor.title"}</a></li>
                <li role="presentation"><a href="#ranktracker" aria-controls="ranktracker" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.rankTracker.title"}</a></li>
                <li role="presentation"><a href="#siteaudit" aria-controls="siteaudit" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.siteAudit.title"}</a></li>
                <li role="presentation"><a href="#textoptimizer" aria-controls="textoptimizer" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.textOptimizer.title"}</a></li>
                <li role="presentation"><a href="#benchmarking" aria-controls="benchmarking" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.benchmarking.title"}</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active show" id="keywords">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.keywords.title"}</h4>
                                <p>{lang key="store.xoviNow.features.keywords.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet3"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet4"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet5"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.keywords.bullet6"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img class="browser-sm" src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/keywords.svg">
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="advisor">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.advisor.title"}</h4>
                                <p>{lang key="store.xoviNow.features.advisor.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.advisor.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.advisor.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.advisor.bullet3"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.advisor.bullet4"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.advisor.bullet5"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/advisor.svg">
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="ranktracker">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.rankTracker.title"}</h4>
                                <p>{lang key="store.xoviNow.features.rankTracker.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.rankTracker.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.rankTracker.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.rankTracker.bullet3"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.rankTracker.bullet4"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.rankTracker.bullet5"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/rank-tracker.svg">
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="siteaudit">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.siteAudit.title"}</h4>
                                <p>{lang key="store.xoviNow.features.siteAudit.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.siteAudit.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.siteAudit.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.siteAudit.bullet3"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.siteAudit.bullet4"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.siteAudit.bullet5"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/site-audit.svg">
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="textoptimizer">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.textOptimizer.title"}</h4>
                                <p>{lang key="store.xoviNow.features.textOptimizer.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.textOptimizer.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.textOptimizer.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.textOptimizer.bullet3"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/text-optimizer.svg">
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="benchmarking">
                    <div class="section-sides">
                        <div class="section-content">
                            <div class="section-desc">
                                <h4 class="" style="font-weight: 500;">{lang key="store.xoviNow.features.benchmarking.title"}</h4>
                                <p>{lang key="store.xoviNow.features.benchmarking.line1"}</p>
                                <ul class="check-list">
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.benchmarking.bullet1"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.benchmarking.bullet2"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.benchmarking.bullet3"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.benchmarking.bullet4"}</li>
                                    <li><i class="lm lm-check"></i>{lang key="store.xoviNow.features.benchmarking.bullet5"}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="section-graphic">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/benchmarking.svg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} text-center">
        <div class="container">
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-sm">
                    <div class="col-lg-6 col-sm-12">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="our-team"}                                            
                            </div>
                            <h5 class="pacakge-title h5" style="font-weight: 500!important;">{lang key="store.xoviNow.audience.freelancersTitle"}</h5>
                            <p class="package-desc">{lang key="store.xoviNow.audience.freelancersDesc"}</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12">
                        <div class="package">
                            <div class="package-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="company"}                                            
                            </div>
                            <h5 class="package-title h5" style="font-weight: 500!important;">{lang key="store.xoviNow.audience.smbizTitle"}</h5>
                            <p class="package-desc">{lang key="store.xoviNow.audience.smbizDesc"}</p>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <div class="site-section" id="cpsPricing">
        <div class="container">
            <h2 class="section-title">
                {lang key="store.xoviNow.moneyBackGuarantee" guaranteeStart="<br><span>" guaranteeEnd="</span>"}
            </h2>
            <div class="section-content">                     
                <div class="packages row row-eq-height row-eq-height-sm">
                    {if count($plans) > 0}
                        {foreach $plans as $plan}
                            <div class="col-lg-{if $plan@total == 1}4{elseif $plan@total == 2}4{elseif $plan@total == 3}4{elseif $plan@total == 4}3{elseif $plan@total == 5}4{else}3{/if}">
                                <div class="package">
                                    <div class="package-header">
                                        <h4 class="package-title">{$plan->name}</h4>                                    
                                        <div class="package-price"> 
                                            <div class="price monthly">
                                                {if $plan->isFree()}
                                                    {include file="$template/includes/common/price.tpl" 
                                                        price=$LANG.orderpaymenttermfree
                                                        priceType="free"
                                                    }                                                    
                                                {elseif $plan->pricing()->first()}
                                                    {include file="$template/includes/common/price.tpl" 
                                                        price=$plan->pricing()->first()->price()
                                                        priceCycle=$plan->pricing()->first()->cycle()
                                                    }
                                                {else}
                                                    {include file="$template/includes/common/price.tpl" 
                                                        price="-"
                                                        priceType="free"
                                                    }
                                                {/if}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="package-body">
                                        <ul class="package-features">
                                            {foreach $plan->features as $label => $value}
                                                <li>
                                                    <span>{lang key="store.xoviNow.featurematrix."|cat:$value@iteration}</span> 
                                                    {if is_bool($value)}{else} - <b>{$value}</b>{/if}
                                                </li>
                                            {/foreach}
                                        </ul>
                                        <div class="package-actions">
                                            <form action="{routePath('cart-order')}" method="post">
                                                <input type="hidden" name="pid" value="{$plan->id}">
                                                <button type="submit" class="btn btn-lg btn-primary btn-block btn-signup">
                                                    {lang key="store.emailServices.signup.order"}
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>    
                            </div>
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
            <h2 class="section-title">{lang key="store.websiteBuilder.faq.title"}</h2>
            <div class="section-content m-w-lg m-a">
                <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                    <div class="panel panel-accordion is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-1" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq1"}</h4>
                        </div>
                        <div id="xovinow-question-1" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq1ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-2" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq2"}</h4>
                        </div>
                        <div id="xovinow-question-2" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq2ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-3" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq3"}</h4>
                        </div>
                        <div id="xovinow-question-3" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq3ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-4" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq4"}</h4>
                        </div>
                        <div id="xovinow-question-4" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq4ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-5" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq5"}</h4>
                        </div>
                        <div id="xovinow-question-5" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq5ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-6" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq6"}</h4>
                        </div>
                        <div id="xovinow-question-6" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq6ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-7" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq7"}</h4>
                        </div>
                        <div id="xovinow-question-7" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq7"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-8" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq8"}</h4>
                        </div>
                        <div id="xovinow-question-8" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq8"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-9" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq9"}</h4>
                        </div>
                        <div id="xovinow-question-9" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq9"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-10" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq10"}</h4>
                        </div>
                        <div id="xovinow-question-10" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq10ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-11" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq11"}</h4>
                        </div>
                        <div id="xovinow-question-11" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq11"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#xovinow-question-12" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.xoviNow.faq12"}</h4>
                        </div>
                        <div id="xovinow-question-12" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.xoviNow.faq12ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}</p>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
{/if}