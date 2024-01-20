

{if file_exists("templates/$template/store/spamexperts/overwrites/index.tpl")}
    {include file="{$template}/store/spamexperts/overwrites/index.tpl"}  
{else} 
<div class="site site-spamexperts">
    <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
                <h1 class="banner-title"> {lang key="store.emailServices.headline"} </h1>
                <div class="banner-desc">
                    <p>{lang key="store.emailServices.tagline"}</p>
                </div>
                <div class="banner-actions">
                    <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing'); return false">{$LANG.clientareaaddonpricing}</a>
                    <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview'); return false">{$LANG.learnmore}</a>
                </div>
            </div>  
            <div class="banner-background">
                <div class="banner-graphic">
                    {if $RSThemes.styles.iconType == "modern"}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/spamexperts"}
                    {else}
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="products/spamexperts"}
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
            <h2 class="section-title">{lang key="store.emailServices.tagline"}</h2>
            <div class="section-content">
                {if $numberOfFeaturedProducts > 0}
                    <div class="row row-eq-height row-eq-height-sm">
                        {if $products.incoming}
                            <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-lg-4 col-sm-12 col-md-12{/if}">
                                <div class="package">
                                    <div class="package-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="incoming-email-filtering"} 
                                    </div>
                                    <h4 class="package-title">{lang key="store.emailServices.incoming.title"}</h4>
                                    <p class="package-desc">{lang key="store.emailServices.overview.incoming.tagline"}</p>
                                    {if $products.incoming->pricing()->best()}
                                    <div class="package-price">
                                        {assign var="prodCycle" value="/"|explode:$products.incoming->pricing()->best()->toFullString()}
                                        <div class="price">                                        
                                            <div class="price-starting-from">{$LANG.startingfrom}</div>
                                            {include file="$template/includes/common/price.tpl" 
                                                price=$products.incoming->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                                priceCycle=$products.incoming->pricing()->best()->cycle()
                                            }  
                                            <div class="price-cycle">{$LANG.metrics.pricePer|replace:$LANG.domainprice:""|lower} {lang key="store.emailServices.domain"}</div>
                                        </div>
                                    </div>
                                    {elseif $inPreview}
                                        <div class="package-price"><div class="price">-</div></div>
                                    {/if}                                   
                                    <div class="package-actions"> 
                                        <a href="#" class="btn btn-lg btn-primary btn-buy" data-target="incoming">{lang key="store.emailServices.overview.buy"}</a>
                                        <a href="#" class="package-learn-more"onclick="smoothScroll('#incoming-filtering'); return false">{lang key="store.emailServices.overview.learn"}</a> 
                                    </div>
                                </div>
                            </div>            
                        {/if}
                        {if $products.outgoing}
                            <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-lg-4 col-sm-12 col-md-12{/if}">
                                <div class="package">
                                    <div class="package-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="outgoing-email-filtering"}
                                    </div>
                                    <h4 class="package-title">{lang key="store.emailServices.outgoing.title"}</h4>
                                    <p class="package-desc">{lang key="store.emailServices.overview.outgoing.tagline"}</p>
                                    {if $products.outgoing->pricing()->best()}
                                    <div class="package-price">   
                                        {assign var="prodCycle" value="/"|explode:$products.outgoing->pricing()->best()->toFullString()}
                                        <div class="price">
                                            <div class="price-starting-from">{$LANG.startingfrom}</div>
                                            {include file="$template/includes/common/price.tpl" 
                                                price=$products.outgoing->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                                priceCycle=$products.outgoing->pricing()->best()->cycle()
                                            } 
                                            <div class="price-cycle">{$LANG.metrics.pricePer|replace:$LANG.domainprice:""|lower} {lang key="store.emailServices.domain"}</div>
                                        </div>
                                    </div>
                                    {elseif $inPreview}
                                        <div class="package-price"><div class="price">-</div></div>
                                    {/if}   
                                <div class="package-actions"> 
                                    <a href="#" class="btn btn-lg btn-primary btn-buy" data-target="outgoing">{lang key="store.emailServices.overview.buy"}</a>
                                    <a href="#" class="package-learn-more" onclick="smoothScroll('#outgoing-filtering'); return false">{lang key="store.emailServices.overview.learn"}</a>
                                </div>
                            </div>
                        </div>
                        {/if}
                        {if $products.incomingarchiving || $products.outgoingarchiving || $products.incomingoutgoingarchiving}
                            <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-lg-4 col-sm-12 col-md-12{/if}">
                                <div class="package">
                                    <div class="package-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="email-archiving"}                                        
                                    </div>
                                    <h4 class="package-title">{lang key="store.emailServices.archiving.title"}</h4>
                                    <p class="package-desc">{lang key="store.emailServices.overview.archiving.tagline"}</p>
                                    {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                                        <div class="package-price">
                                            {assign var="prodCycle" value="/"|explode:$products.incomingarchiving->pricing()->best()->toFullString()}
                                            <div class="price">
                                                <div class="price-starting-from ">{$LANG.startingfrom}</div>
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$products.incomingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                                    priceCycle=$products.incomingarchiving->pricing()->best()->cycle()
                                                    
                                                }                                                 
                                                <div class="price-cycle">{$LANG.metrics.pricePer|replace:$LANG.domainprice:""|lower} {lang key="store.emailServices.domain"}</div>
                                            </div>
                                        </div>
                                    {elseif $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()}
                                        <div class="package-price">                                            
                                            {assign var="prodCycle" value="/"|explode:$products.outgoingarchiving->pricing()->best()->toFullString()}
                                            <div class="price">
                                                <div class="price-starting-from">{$LANG.startingfrom}</div>
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$products.outgoingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                                    priceCycle=$products.outgoingarchiving->pricing()->best()->cycle()
                                                }    
                                                <div class="price-cycle">{$LANG.metrics.pricePer|replace:$LANG.domainprice:""|lower} {lang key="store.emailServices.domain"}</div>
                                            </div>                                                
                                        </div>
                                    {elseif $products.incomingoutgoingarchiving->pricing()->best()}
                                        <div class="package-price">                                           
                                            {assign var="prodCycle" value="/"|explode:$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}
                                            <div class="price">
                                                <div class="price-starting-from">{$LANG.startingfrom}</div>
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$products.incomingoutgoingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                                    priceCycle=$products.incomingoutgoingarchiving->pricing()->best()->cycle()
                                                }    
                                                <div class="price-cycle">{$LANG.metrics.pricePer|replace:$LANG.domainprice:""|lower} {lang key="store.emailServices.domain"}</div> 
                                            </div>                                                 
                                        </div>
                                    {elseif $inPreview}
                                        <div class="package-price"><div class="price">-</div></div>
                                    {/if}      
                                    <div class="package-actions"> 
                                        <a href="#" class="btn btn-lg btn-primary btn-buy" data-target="incomingoutgoingarchiving">{lang key="store.emailServices.overview.buy"}</a> 
                                        <a href="#" class="package-learn-more" onclick="smoothScroll('#archiving'); return false">{lang key="store.emailServices.overview.learn"}</a> 
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>
                {elseif $inPreview}
                    <div class="text-center lead preview-text">{lang key="store.emailServices.preview"}</div>
                {/if}
            </div>    
        </div>
    </div>            
    <div class="site-section" id="incoming-filtering">
        <div class="container">
            <h2 class="section-title">{lang key="store.emailServices.incoming.title"}</h2>
            <p class="section-subtitle">{lang key="store.emailServices.benefits.incoming.a2"}</p>
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
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.incoming.q3"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.incoming.a3"}</p>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.incoming.q2"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.incoming.a1"}</p>
                    </div>
                </div>
                <div class="section-content">
                    <div class="features features-boxes row row-eq-height">
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="icon-malware-detection-and-restore"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.2"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="codeguard"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.3"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="addon-email-forwarding"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.4"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="forms"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.5"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="sitebuilder"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.6"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.incoming.7"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>            
    <div class="site-section" id="outgoing-filtering">
        <div class="container"> 
            <h2 class="section-title">{lang key="store.emailServices.outgoing.title"}</h2>
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        <div class="browser-top browser-top-transparent">
                            <div class="browser-actions"><span></span><span></span><span></span></div>
                        </div>
                        <div class="browser-body">
                            {include file="$template/includes/common/svg-icon.tpl" icon="156-outgoing-filter-1"}
                        </div>
                    </div>
                </div>
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.outgoing.q1"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.outgoing.a1"}</p>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.outgoing.q2"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.outgoing.a2"}</p>
                    </div>
                </div>
                <div class="section-content">
                    <div class="features features-boxes row row-eq-height">
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.1"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="sitelock"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.2"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="secure-online-transactions"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.3"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="outgoing-email-filtering"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.4"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.5"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="icon-full-automation"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.outgoing.6"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <div class="site-section" id="archiving">
        <div class="container">
            <h2 class="section-title">{lang key="store.emailServices.archiving.title"}</h2>
            <div class="section-sides">
                <div class="section-graphic">
                    <div class="browser browser-sm">
                        <div class="browser-top browser-top-transparent">
                            <div class="browser-actions"><span></span><span></span><span></span></div>
                        </div>
                        <div class="browser-body">
                            {include file="$template/includes/common/svg-icon.tpl" icon="156-archiving-1"}
                        </div>
                    </div>
                </div>
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.incoming.q3"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.archiving.a1"}</p>
                    </div>
                </div>
            </div>
            <div class="section-sides">
                <div class="section-content">
                    <h3 class="section-title section-title-sm">{lang key="store.emailServices.benefits.archiving.q2"}</h3>
                    <div class="section-desc">
                        <p>{lang key="store.emailServices.benefits.archiving.a2a"}</p>
                        <p>{lang key="store.emailServices.benefits.archiving.a2b"}</p>
                    </div>
                </div>
                <div class="section-content"> 
                    <div class="features features-boxes row row-eq-height">
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="transfer-domain"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.1"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm  feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="sitebuilder"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.5"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="icon-email-backup"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.6"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="ticket"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.4"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="article"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.2"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-12 col-xl-6">
                            <div class="feature feature-sm feature-left feature-boxed">
                                <div class="feature-icon">
                                    {include file="$template/includes/common/svg-icon.tpl" icon="addon"}
                                </div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.emailServices.benefits.archiving.3"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>          
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
        <div class="container">
            <h2 class="section-title">{lang key="store.emailServices.signup.title"}</h2>
            <div class="section-content">
                <form class="m-w-lg m-a" method="post" action="{routePath('cart-order')}">
                    <input type="hidden" name="productkey" value="{$products.incoming->productKey}" id="productKey">
                    <div class="package-get-started">
                        <div class="package-get-started-content">
                            <h5>{lang key="store.emailServices.signup.choose"}</h5>
                            {if $numberOfFeaturedProducts > 0}
                                <div class="btn-group choose-product" role="group"> 
                                    {if $products.incoming}
                                        <button type="button" class="btn btn-lg btn-default active" data-product="incoming">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="incoming-email-filtering"}  
                                        <span>
                                            <i class="lm lm-check"></i>
                                        </span>
                                            {lang key="store.emailServices.options.incomingFilter"}
                                        </button>
                                    {/if}
                                    {if $products.outgoing}
                                        <button type="button" class="btn btn-lg btn-default" data-product="outgoing">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="outgoing-email-filtering"}                                             
                                            <span>
                                                <i class="lm lm-check"></i>
                                            </span>
                                                {lang key="store.emailServices.options.outgoingFilter"}
                                        </button>
                                    {/if} 
                                </div>
                            {elseif $inPreview}
                                {lang key="store.emailServices.preview"}
                            {/if}
                            <h5>{lang key="store.emailServices.signup.additional"}</h5>
                            <div class="additional-options"> 
                                {foreach $productOptions as $productKey => $options}
                                    <div class="option options-{$productKey}"> 
                                        {foreach $options as $option}
                                            <label class="checkbox">
                                                <input class="icheck-control" type="checkbox" name="options" value="{$option.product}">
                                                <span>{lang key="store.emailServices.options.addFor" description=$option.description pricing="<b>{$option.pricing->toFullString()}</b>"}</span>
                                            </label>
                                        {foreachelse}
                                            {lang key="store.emailServices.signup.none"}
                                        {/foreach} 
                                    </div>
                                {/foreach} 
                            </div>
                        </div>
                        <div class="package-get-started-summary"> 
                            <span class="package-starting-from">{$LANG.ordersummary|replace:$LANG.ordertitle:""}</span> 
                            {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                                {assign var="prodCycle" value="/"|explode:$products.incomingarchiving->pricing()->best()->toFullString()}
                                <span class="price price-incomingarchiving">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.incomingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.incomingarchiving->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }  
                                </span>      
                            {/if}
                            {if $products.incoming && $products.incoming->pricing()->best()}        
                                {assign var="prodCycle" value="/"|explode:$products.incoming->pricing()->best()->toFullString()}                                
                                <span class="price price-incoming">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.incoming->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.incoming->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }    
                                </span>                                       
                            {/if}
                            {if $products.outgoing && $products.outgoing->pricing()->best()} 
                                {assign var="prodCycle" value="/"|explode:$products.outgoing->pricing()->best()->toFullString()}
                                <span class="price price-outgoing">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.outgoing->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.outgoing->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }   
                                </span>                                       
                            {/if}
                            {if $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()} 
                                {assign var="prodCycle" value="/"|explode:$products.outgoingarchiving->pricing()->best()->toFullString()}
                                <span class="price price-outgoingarchiving">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.outgoingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.outgoingarchiving->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }  
                                </span>                                       
                            {/if}
                            {if $products.incomingoutgoing && $products.incomingoutgoing->pricing()->best()} 
                                {assign var="prodCycle" value="/"|explode:$products.incomingoutgoing->pricing()->best()->toFullString()}
                                <span class="price price-incomingoutgoing">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.incomingoutgoing->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.incomingoutgoing->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }  
                                </span>                                       
                            {/if}
                            {if $products.incomingoutgoingarchiving && $products.incomingoutgoingarchiving->pricing()->best()} 
                                {assign var="prodCycle" value="/"|explode:$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}
                                <span class="price price-incomingoutgoingarchiving">
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$products.incomingoutgoingarchiving->pricing()->best()->toFullString()|replace:'/':''|replace:$prodCycle[1]:''
                                        priceCycle=$products.incomingoutgoingarchiving->pricing()->best()->cycle()
                                        priceCycleShort=true
                                        priceInlineAmount=true
                                    }  
                                </span>                                       
                            {/if} 
                            <br />
                            <button type="submit" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if} btn-block btn-order-now">{lang key="store.emailServices.signup.order"}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key="store.emailServices.faqs.title"}</h2>
            <div class="section-content m-w-lg m-a">
                <div class="panel-group panel-group-condensed panel-faq accordion" id="accordion">
                    <div class="panel panel-accordion is-open">
                        <div class="panel-heading" data-toggle="collapse" data-target="#how_does_it_work" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q1"}</h4>
                        </div>
                        <div id="how_does_it_work" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a1"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#how_accurate_is_the_filtering" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q2"}</h4>
                        </div>
                        <div id="how_accurate_is_the_filtering" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a2"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#can_I_recover_messages_that_get_blocked" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q3"}</h4>
                        </div>
                        <div id="can_I_recover_messages_that_get_blocked" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a3"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#how_long_does_it_take_to_setup" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q4"}</h4>
                        </div>
                        <div id="how_long_does_it_take_to_setup" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a4"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#what_is_Email_Archiving" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q5"}</h4>
                        </div>
                        <div id="what_is_Email_Archiving" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a5"}</p>
                            </div>
                        </div>        
                    </div>
                    <div class="panel panel-accordion">
                        <div class="panel-heading" data-toggle="collapse" data-target="#how_much_email_can_I_store" aria-expanded="true">
                            <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.emailServices.faqs.q6"}</h4>
                        </div>
                        <div id="how_much_email_can_I_store" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                            <div class="panel-body">
                                <p>{lang key="store.emailServices.faqs.a6"}</p>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
    </div>
    {*{include file="$template/get-started.tpl"}*}
</div>
<script src="{$WEB_ROOT}/templates/{$template}/store/spamexperts/master.js"></script> 
{/if}    