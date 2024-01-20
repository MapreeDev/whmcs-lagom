
{if file_exists("templates/$template/store/ox/overwrites/index.tpl")}
    {include file="{$template}/store/ox/overwrites/index.tpl"}  
{else}
<div class="site site-ox">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title">{lang key="store.ox.promoHeading"}</h1>
                <div class="banner-actions">
                    <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing');return false">{lang key="store.ox.viewPricing"}</a>
                    <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview');return false">{lang key='learnmore'}</a>
                </div>
            </div>
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/ox"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/ox"}
                    {/if}                   
                </div>
                <div class="banner-shape">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                </div>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        <div class="browser-top browser-top-transparent">
                            <div class="browser-actions"><span></span><span></span><span></span></div>
                        </div>
                        <div class="browser-body">
                            {include file="$template/includes/common/svg-icon.tpl" icon="156-incoming-filter-1"}  
                        </div>
                    </div> 
                </div>
                <div class="section-content">
                    <h2 class="section-title">{lang key="store.ox.standout.feature1.title"}</h2>
                    <div class="section-desc">
                        <ul class="check-list">
                            <li><i class="lm lm-check"></i>{lang key="store.ox.standout.feature1.bullet1"}</li>
                            <li><i class="lm lm-check"></i>{lang key="store.ox.standout.feature1.bullet2"}</li>
                            <li><i class="lm lm-check"></i>{lang key="store.ox.standout.feature1.bullet3"}</li>
                            <li><i class="lm lm-check"></i>{lang key="store.ox.standout.feature1.bullet4"}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>   
    <div class="site-section" id="overview">
        <div class="container">
            <div class="section-sides">
                <div class="section-graphic order-last">
                    <div class="browser browser-sm">
                        <div class="browser-top browser-top-transparent">
                            <div class="browser-actions"><span></span><span></span><span></span></div>
                        </div>
                        <div class="browser-body">
                            {include file="$template/includes/common/svg-icon.tpl" icon="156-outgoing-filter-2"}
                        </div>
                    </div>
                </div> 
                <div class="section-content order-first">
                    <h2 class="section-title">{lang key="store.ox.standout.feature2.title"}</h2>
                    <p class="section-desc">{lang key="store.ox.standout.feature2.detail"}</p>
                </div>
            </div>
        </div>
    </div>   
    <div class="site-section">
        <div class="container">
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        <div class="browser-top browser-top-transparent">
                            <div class="browser-actions"><span></span><span></span><span></span></div>
                        </div>
                        <div class="browser-body">
                            {include file="$template/includes/common/svg-icon.tpl" icon="156-incoming-filter-3"}
                        </div> 
                    </div> 
                </div>
                <div class="section-content">
                    <h2 class="section-title">{lang key="store.ox.standout.feature3.title"}</h2>
                    <p class="section-desc">{lang key="store.ox.standout.feature3.detail"}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
        <div class="container">
            <h2 class="section-title">
                {lang key="store.ox.pricingHeadline"}
            </h2>                            
            <div class="row row-eq-height row-eq-height-sm justify-content-md-center">
                {if count($plans) > 0}
                    {foreach $plans as $plan}
                        <div class="col-lg-{if $plan@total == 1}4 {if $plan@first}col-md-offset-4{/if}{elseif $plan@total == 2}4 {if $plan@first}col-md-offset-2{/if}{elseif $plan@total == 3}4{elseif $plan@total == 4}3{elseif $plan@total == 5}4{else}3{/if}">
                            <div class="package">
                                <h4 class="package-title">{$plan->name}</h4>
                                <div class="package-price"> 
                                    <div class="price">   
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
                                        {if $plan->pricing()->first()}
                                            <div class="price-starting-from ">{$rslang->trans('ox.per_user')}</div>
                                        {/if}
                                    </div>
                                </div>
                                <ul class="package-features">
                                    {foreach $plans[0]['features'] as $feature => $value}
                                        <li>
                                            {if $plan['features'][$feature] !== '-'}
                                                <span>{$feature}</span> 
                                                {if !is_bool($plan['features'][$feature])}<b>{$plan['features'][$feature]}</b>{/if}
                                            {/if}
                                        </li>
                                    {/foreach}
                                </ul>
                                <div class="package-actions">
                                    <form method="post" action="{routePath('cart-order')}">
                                        <input type="hidden" name="pid" value="{$plan->id}">
                                        <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if}">
                                            {lang key="store.ssl.landingPage.buyNow"}
                                        </button>
                                    </form>
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
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.ox.featuresHeadline"}</h2>
            <div class="section-content">
                <div class="row row-eq-height row-eq-height-xs features">
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="cloud-hosting"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature1.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature1.detail"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="issued-in-1-2-days"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature2.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature2.detail"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="email-archiving"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature3.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature3.detail"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="icon-website-time-maschine"}
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature4.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature4.detail"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="icon-wordpress-plugin-updates"}                                
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature5.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature5.detail"}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="feature feature-xs-left">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"}                               
                            </div>
                            <div class="feature-content">
                                <h4 class="feature-title">{lang key="store.ox.feature6.title"}</h4>
                                <p class="feature-desc">{lang key="store.ox.feature6.detail"}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.sitelock.faqTitle"}</h2>
            <div class="section-content m-w-lg m-a"> 
                <div class="panel-group panel-group-condensed panel-faq panel-faq accordion" id="accordion">
                    <div class="panel panel-default panel-accordion panel-faq is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq1" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq1.question"}</h4>
                        </div>
                        <div id="faq1" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq1.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq2" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq2.question"}</h4>
                        </div>
                        <div id="faq2" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq2.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq3" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq3.question"}</h4>
                        </div>
                        <div id="faq3" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq3.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq4" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq4.question"}</h4>
                        </div>
                        <div id="faq4" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq4.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq5" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq5.question"}</h4>
                        </div>
                        <div id="faq5" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq5.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq6" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq6.question"}</h4>
                        </div>
                        <div id="faq6" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq6.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq7" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq7.question"}</h4>
                        </div>
                        <div id="faq7" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq7.answer"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-default panel-accordion panel-faq">
                        <div class="panel-heading" data-toggle="collapse" data-target="#faq8" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.ox.faq8.question"}</h4>
                        </div>
                        <div id="faq8" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.ox.faq8.answer"}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/if}