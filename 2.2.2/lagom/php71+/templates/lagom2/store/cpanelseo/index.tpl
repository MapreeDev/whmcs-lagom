{if file_exists("templates/$template/store/marketgoo/overwrites/index.tpl")}
    {include file="{$template}/store/marketgoo/overwrites/index.tpl"}
{else}
    <div class="site site-cpanelseo">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{lang key="store.cPanelSEO.tagline" lineBreak='<div class="d-none d-lg-block"></div>'}</h1>
                    <div class="banner-desc">
                        <p>{$rslang->trans('cpanelseo.banner.desc')}</p>
                    </div>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#cpsPricing'); return false">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                        <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#productTour');return false">{$LANG.learnmore}</a>
                    </div>
                </div>
                <div class="banner-background">
                    <div class="banner-graphic">
                        {if $RSThemes.styles.iconType == "modern"}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/cpanelseo"}
                        {else}
                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/cpanelseo"}
                        {/if}
                    </div>
                    <div class="banner-shape">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section" id="productTour">
            <div class="container">
                <h2 class="section-title">{lang key="store.cPanelSEO.measureResultsTitle"}</h2>
                <p class="section-subtitle">{lang key="store.cPanelSEO.measureResults1" startBold="<strong>" endBold="</strong>"}</p>
                <div class="section-content">
                    <div class="slider cpanelseo-slider" data-cpanelseo-slider>
                        <div class="content-slider" data-slider-container>
                            <div class="content-slider-wrapper" data-slider-wrapper>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/dashboard.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/rankings.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/keyword_research_keywords.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/tracked_keywords.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/projects.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/site_audit.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/advisor_overview_column.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/advisor_task_details.png">
                                </div>
                                <div class="content-slider-item content-slider-item-img">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/screenshots/advisor_task_details.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <p class="text-center section-subtitle section-subtitle-bottom"><strong>{$rslang->trans('cpanelseo.easier_way')}</strong> {$rslang->trans('cpanelseo.easier_way_2')}</p>
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <h2 class="section-title m-b-6x">{$rslang->trans('cpanelseo.seo_features')}</h2>
                <div class="section-content">
                    <ul class="nav nav-tabs justify-content-center" role="tablist">
                        <li role="presentation"><a class="tab-cpanelseo-controller active" href="#keywords" aria-controls="keywords" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.keywords.title"}</a></li>
                        <li role="presentation"><a class="tab-cpanelseo-controller" href="#advisor" aria-controls="advisor" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.advisor.title"}</a></li>
                        <li role="presentation"><a class="tab-cpanelseo-controller" href="#ranktracker" aria-controls="ranktracker" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.rankTracker.title"}</a></li>
                        <li role="presentation"><a class="tab-cpanelseo-controller" href="#siteaudit" aria-controls="siteaudit" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.siteAudit.title"}</a></li>
                        <li role="presentation"><a class="tab-cpanelseo-controller" href="#textoptimizer" aria-controls="textoptimizer" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.textOptimizer.title"}</a></li>
                        <li role="presentation"><a class="tab-cpanelseo-controller" href="#benchmarking" aria-controls="benchmarking" role="tab" data-toggle="tab">{lang key="store.cPanelSEO.features.benchmarking.title"}</a></li>
                    </ul>
                    <div class="tab-content tab-content-cpanelseo">
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo active" id="keywords">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{$LANG.store.cPanelSEO.features.keywords.title}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{$LANG.store.cPanelSEO.features.keywords.line1}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet3"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet4"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet5"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.keywords.bullet6"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-illustration>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/keywords-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/keywords.svg"}
                                    {/if}
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo" id="advisor">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{lang key="store.cPanelSEO.features.advisor.title"}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{lang key="store.cPanelSEO.features.advisor.line1"}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.advisor.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.advisor.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.advisor.bullet3"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.advisor.bullet4"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.advisor.bullet5"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-icons>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/advisor-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/advisor.svg"}
                                    {/if}                           
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo" id="ranktracker">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{lang key="store.cPanelSEO.features.rankTracker.title"}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{lang key="store.cPanelSEO.features.rankTracker.line1"}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.rankTracker.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.rankTracker.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.rankTracker.bullet3"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.rankTracker.bullet4"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.rankTracker.bullet5"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-icons>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/rank-tracker-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/rank-tracker.svg"}
                                    {/if}              
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo" id="siteaudit">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{lang key="store.cPanelSEO.features.siteAudit.title"}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{lang key="store.cPanelSEO.features.siteAudit.line1"}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.siteAudit.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.siteAudit.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.siteAudit.bullet3"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.siteAudit.bullet4"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.siteAudit.bullet5"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-icons>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/site-audit-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/site-audit.svg"}
                                    {/if}                           
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo" id="textoptimizer">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{lang key="store.cPanelSEO.features.textOptimizer.title"}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{lang key="store.cPanelSEO.features.textOptimizer.line1"}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.textOptimizer.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.textOptimizer.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.textOptimizer.bullet3"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-icons>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/text-optimizer-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/text-optimizer.svg"}
                                    {/if}                              
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane tab-pane-cpanelseo" id="benchmarking">
                            <div class="section-sides">
                                <div class="section-content">
                                    <div class="section-title m-b-4x">{lang key="store.cPanelSEO.features.benchmarking.title"}</div>
                                    <div class="section-desc">
                                        <h5 class="text-default">{lang key="store.cPanelSEO.features.benchmarking.line1"}</h5>
                                        <ul class="check-list">
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.benchmarking.bullet1"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.benchmarking.bullet2"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.benchmarking.bullet3"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.benchmarking.bullet4"}</li>
                                            <li> <i class="lm lm-check"></i> {lang key="store.cPanelSEO.features.benchmarking.bullet5"}</li>
                                        </ul>
                                    </div>
                                    <div class="section-actions">
                                        <a href="#" onclick="smoothScroll('#cPanelSeoPricing');" class="btn btn-lg btn-primary">{$rslang->trans('cpanelseo.btn_pricing_text')}</a>
                                    </div>
                                </div>
                                <div class="section-graphic section-graphic-illustration" data-animation-icons>
                                    {if $RSThemes.styles.name == 'futuristic'}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/benchmarking-ondark.svg"}
                                    {else}
                                        {include file="$template/assets/svg-illustrations/cpanelseo-whmcs/benchmarking.svg"}
                                    {/if}                         
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section">
            <div class="container">
                <div class="section-title">{$rslang->trans('cpanelseo.seo_who_can')}</div>
                <div class="section-content m-w-lg m-a">
                    <div class="features row row-eq-height">
                        <div class="col-sm-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="our-team"} 
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.cPanelSEO.audience.freelancersTitle"}</h4>
                                    <p>{lang key="store.cPanelSEO.audience.freelancersDesc"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="feature feature-lg feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="company"} 
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.cPanelSEO.audience.smbizTitle"}</h4>
                                    <p>{lang key="store.cPanelSEO.audience.smbizDesc"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section {if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="cpsPricing">
            <div class="container">
                <h2 class="section-title">{lang key="store.cPanelSEO.moneyBackGuarantee" guaranteeStart="<br><span>" guaranteeEnd="</span>"}</h2>
                <div class="section-content">
                     <div class="packages row row-eq-height row-eq-height-sm">
                            {foreach $plans as $plan}
                                <div class="col-lg-{if count($plans) == 4}3{elseif count($plans) == 3}4{elseif count($plans) == 2}4{else}12{/if} col-md-{if count($plans) == 3}6{/if} col-sm-12">
                                    <div class="package{if $plan->is_featured} featured{/if}">
                                        <div class="package-header">
                                            <h4 class="package-title">{$plan->productGroup->name} {$plan->name}</h4>
                                            <div class="package-price">
                                                <div class="price">
                                                    {if $plan->isFree()}
                                                        {include file="$template/includes/common/price.tpl" 
                                                            price=$LANG.orderpaymenttermfree
                                                        }  
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
                                        </div>
                                        <div class="package-body">
                                            <ul class="package-features">
                                                {foreach $plan->features as $label => $value}
                                                    <li> {$label} {if is_bool($value)}{else} - <b>{$value}</b>
                                                    {/if} </li>
                                                {/foreach}
                                            </ul>
                                            <div class="package-actions">
                                                <form action="{routePath('cart-order')}" method="post">
                                                    <input type="hidden" name="pid" value="{$plan->id}">
                                                    <button type="submit" class="btn btn-primary btn-lg {if $plan->is_featured}btn-cpanelseo{else}btn-default{/if}{if $secondarySectionStyle == 'primary'}-faded{/if} btn-block">
                                                        {lang key="store.sitelock.buyNow"}
                                                    </button>
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
                <h2 class="section-title">{lang key="store.cPanelSEO.faqTitle"}</h2>
                <div class="section-content m-w-lg m-a">
                    <div class="panel-group panel-group-condensed panel-faq panel-faq" id="accordion">
                        <div class="panel panel-default panel-accordion is-open">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq1" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq1"}</h4>
                            </div>
                            <div id="faq1" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq1ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq2" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq2"}</h4>
                            </div>
                            <div id="faq2" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq2ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq3" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq3"}</h4>
                            </div>
                            <div id="faq3" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq3ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq4" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq4"}</h4>
                            </div>
                            <div id="faq4" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq4ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq5" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq5"}</h4>
                            </div>
                            <div id="faq5" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq5ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq6" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq6"}</h4>
                            </div>
                            <div id="faq6" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq6ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq7" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq7"}</h4>
                            </div>
                            <div id="faq7" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq7ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq8" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq8"}</h4>
                            </div>
                            <div id="faq8" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq8ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq9" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq9"}</h4>
                            </div>
                            <div id="faq9" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq9ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq10" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq10"}</h4>
                            </div>
                            <div id="faq10" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq10ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq11" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq11"}</h4>
                            </div>
                            <div id="faq11" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq11ans" image1='<img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/faq-advisor.png">' image2='<img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png">' image3='<img src="{$WEB_ROOT}/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png">' googleWebmasterGuidelinesUrl="https://developers.google.com/search/docs/advanced/guidelines/webmaster-guidelines" waybackMachineUrl="https://archive.org/web/"}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq12" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.cPanelSEO.faq12"}</h4>
                            </div>
                            <div id="faq12" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    {lang key="store.cPanelSEO.faq12ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/cpanelseo/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}