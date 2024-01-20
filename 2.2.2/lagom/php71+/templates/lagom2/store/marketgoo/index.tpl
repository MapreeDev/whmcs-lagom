

{if file_exists("templates/$template/store/marketgoo/overwrites/index.tpl")}
    {include file="{$template}/store/marketgoo/overwrites/index.tpl"}  
{else} 
    <div class="site site-marketgoo">
        <div class="site-banner banner banner-sides banner-{$siteBannerStyle}">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{lang key="store.marketgoo.headline"} {lang key="store.marketgoo.tagline"}</h1>
                    <div class="banner-actions">
                        <a href="#" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}" onclick="smoothScroll('#pricing');return false">{lang key='store.sitelockvpn.getStarted'}</a>
                        <a href="#" class="btn btn-lg {if $siteBannerStyle == 'default'}btn-primary-outline{else}btn-light-outline{/if}" onclick="smoothScroll('#overview');return false">{lang key='learnmore'}</a>
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
        <div class="site-section section-steps" id="overview">
            <div class="container">
                <div class="section-content">
                    <div class="features features-steps row row-eq-height">
                        <div class="col-md">
                            <div class="feature feature-lg feature-boxed {if $RSThemes.styles.name == 'default'}feature-bordered{/if}">
                                <div class="feature-number feature-number-circled">1</div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.marketgoo.features.1"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="feature feature-lg feature-boxed {if $RSThemes.styles.name == 'default'}feature-bordered{/if}">
                                <div class="feature-number feature-number-circled">2</div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.marketgoo.features.2"}</h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="feature feature-lg feature-boxed {if $RSThemes.styles.name == 'default'}feature-bordered{/if}">
                                <div class="feature-number feature-number-circled">3</div>
                                <div class="feature-content">
                                    <h4 class="feature-title">{lang key="store.marketgoo.features.3"}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section section-video">
            <div class="container">
                <div class="section-content">
                    <div class="embed-responsive">                 
                        <iframe src="https://player.vimeo.com/video/394484913" class="embed-responsive-item" allow="autoplay; fullscreen" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>     
        <div class="site-section">
            <div class="container">
                <div class="section-sides">
                    <div class="section-graphic">
                        <div class="browser browser-md">
                            <img class="w-100" src="{$WEB_ROOT}/templates/{$template}/assets/img/store/marketgoo/start-improving.gif" alt="{lang key="store.marketgoo.features.4"}" />
                        </div> 
                    </div>
                    <div class="section-content">
                        <h2 class="section-title">{lang key="store.marketgoo.features.4"}</h2>
                        <p class="section-desc">{lang key="store.marketgoo.featuresdetail.4"}</p>
                    </div>
                </div>
            </div>
        </div>   
        <div class="site-section">
            <div class="container">
                <div class="section-sides"> 
                    <div class="section-graphic order-last">
                        <div class="browser browser-md">
                            <img class="w-100" src="{$WEB_ROOT}/templates/{$template}/assets/img/store/marketgoo/track.gif" alt="{lang key="store.marketgoo.features.5"}" />
                        </div> 
                    </div>   
                    <div class="section-content order-first">
                        <h2 class="section-title">{lang key="store.marketgoo.features.5"}</h2>
                        <p class="section-desc">{lang key="store.marketgoo.featuresdetail.5"}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if}" id="pricing">
            <div class="container">
                <h2 class="section-title">
                    {lang key='store.marketgoo.tab.features'}
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
                                                        <span>{lang key="store.marketgoo.featurematrix."|cat:$value@iteration}</span> 
                                                        {if is_bool($value)}{else} - <b>{$value}</b>{/if}
                                                    </li>
                                                {/foreach}
                                            </ul>
                                            <div class="package-actions">
                                                <form action="{routePath('cart-order')}" method="post">
                                                    <input type="hidden" name="pid" value="{$plan->id}">
                                                    <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if} btn-block btn-signup">
                                                        {lang key='store.marketgoo.signup'}
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
        {assign var=testimonials value=[
            [
            'author'=> 'Heather Figi',
            'avatar' => 'user-testimonial-1.jpg',
            'website'=> 'https://www.marketgoo.com/blog-post/2018/08/30/review-music-for-violinists/',
            'description' => 'marketgoo made the complicated simple for me. I never knew where to start with SEO until I started using this service. Literally, I more than doubled my traffic when I started using this.'
            ],
            [
            'author'=> 'Ian Glass',
            'avatar' => 'user-testimonial-2.jpg',
            'website'=> 'https://www.marketgoo.com/blog-post/2019/10/29/review-ian-glass-fitness/',
            'description' => 'Without marketgoo I would never have been able to have my website on the first page of google for all the keywords that are linked to my business, its ease of use and the customer service when I’ve needed help has been first class.'
            ],
            [
            'author'=> 'Simon Saleh',
            'avatar' => 'user-testimonial-3.jpg',
            'website'=> 'https://www.marketgoo.com/blog-post/2019/09/09/review-wanderlust-ironworks/',
            'description' => 'Such a simple reliable platform! It’s helped me see where we stand next to our local competitors. Its part of our day to day. The best feature is the keyword tool.'
            ],
            [
            'author'=> 'Svein Koningen',
            'avatar' => 'user-testimonial-4.jpg',
            'website'=> 'https://www.marketgoo.com/blog-post/2018/06/24/marketgoo-review-koningen-art/',
            'description' => 'marketgoo reports give me everything I need to know for my site’s SEO. I am constantly fine tuning my site to work towards a higher rating. I read various marketgoo reports then immediately work out how to implement recommendations.'
            ]
        ]}
        <div class="site-section">
            <div class="section-content">
                <div class="container">
                    <h2 class="section-title">{$rslang->trans('homepage.testimonials.title')}</h2>
                    <p class="section-subtitle">{$rslang->trans('homepage.testimonials.subtitle')}</p>
                    <div class="slider testimonials" data-testimonial-slider>
                        <div class="content-slider" data-slider-container>
                            <div class="content-slider-wrapper" data-slider-wrapper>
                                {foreach from=$testimonials item=testimonial key=testimonial_key}
                                    <div class="content-slider-item testimonials-item">
                                        <div class="testimonials-desc">
                                            <p>{$testimonial.description}</p>
                                        </div>
                                        <div class="testimonials-details">
                                            <div class="testimonials-avatar">
                                                <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/{$testimonial.avatar}" alt="{$testimonial.author}">
                                                <span>”</span>
                                            </div>
                                            <div class="testimonials-author">
                                                <span>{$testimonial.author}</span><br>
                                                <a href="{$testimonial.website}" target="_blank">{lang key="store.marketgoo.testimonials.casestudy"}</a>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <div class="site-section">
            <div class="container">
                <h2 class="section-title">{lang key="store.marketgoo.faqs.title"}</h2>
                <div class="section-content m-w-lg m-a">
                <div class="panel-group panel-group-condensed panel-faq panel-faq" id="accordion">
                    <div class="panel panel-default panel-accordion panel-faq is-open">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq1" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.marketgoo.faqs.q1"}</h4>
                            </div>
                            <div id="faq1" class="panel-collapse collapse show" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.marketgoo.faqs.a1"}</p>
                                    <a href="https://vimeo.com/whmcs/marketgoo-lite-vs-pro" target="_blank">
                                        <img style="min-width: 50%"src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/video-comparison.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion panel-faq">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq2" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.marketgoo.faqs.q2"}</h4>
                            </div>
                            <div id="faq2" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.marketgoo.faqs.a2"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-accordion panel-faq">
                            <div class="panel-heading" data-toggle="collapse" data-target="#faq3" aria-expanded="true">
                                <h4 class="panel-title"><i class="lm lm-plus"></i>{lang key="store.marketgoo.faqs.q3"}</h4>
                            </div>
                            <div id="faq3" class="panel-collapse collapse" aria-expanded="true" style="" data-parent="#accordion">
                                <div class="panel-body">
                                    <p>{lang key="store.marketgoo.faqs.a3"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>

{/if}



