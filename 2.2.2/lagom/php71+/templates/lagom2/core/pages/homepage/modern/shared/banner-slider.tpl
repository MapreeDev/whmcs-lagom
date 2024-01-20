{if $homepage->getMarketConnectCount() != 0 && !empty($homepage->getPromotionBanner())}
    <div data-promo-slider>
        <div class="site-banner site-slider banner banner-sides banner-{$siteBannerStyle}{if $homepage->getMarketConnectCount() == 1 || !$RSThemes['pages'][$templatefile]['config']['showSliderNavigation']} slider-single{/if}">
            <div class="container">
                <div class="slider-wrapper">
                    <div class="slider-slides" data-promo-slider-wrapper>
                        {foreach from=$homepage->getPromotionBanner() item=item}
                            {if  strpos($item.settings, '"client-home":true,"') != false}
                                <div class="slider-slide">
                                    <div class="banner-content" data-animation-content>
                                        <h1 class="banner-title">{$item['headline']}</h1>
                                        <div class="banner-desc">
                                            <p>{$item['tagline']}</p>
                                        </div>
                                        <div class="banner-actions">
                                            <a href="{$systemurl}cart.php?a=add&pid={$item['pid']}" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}">{$LANG.getStartedNow}</a>
                                            <a href="{routePath('store-product-group', $item['slug'])}" class="btn btn-lg {if $siteBannerStyle == 'default' && !$RSThemes.styles.vars.futuristic}btn-primary-outline{else}btn-light-outline{/if}">{$LANG.learnmore}</a>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                </div>
                <div class="banner-background">
                    <div class="banner-shape">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"} 
                    </div>
                    <div class="banner-graphics" data-promo-slider-homepage>
                        {foreach from=$homepage->getPromotionBanner() item=item}
                            {if strpos($item.settings, '"client-home":true,"') != false}
                                <div>
                                    <div class="banner-graphic" data-animation-icons>
                                        {if $RSThemes.styles.iconType == "modern"}
                                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/{$item.name}"}  
                                        {else}
                                            {include file="$template/includes/common/svg-illustration.tpl" illustration="products/{$item.name}"}  
                                        {/if}
                                    </div>
                                </div>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        {if $homepage->getMarketConnectCount() > 1 && $RSThemes['pages'][$templatefile]['config']['showSliderNavigation'] == '1'}
            <div class="site-section section-slider-btn">
                <div class="container">
                    <div class="section-content">
                        <div class="slider-navigation row" data-promo-slider-pagination>
                            {foreach from=$homepage->getPromotionBanner() item=item}
                                {if strpos($item.settings, '"client-home":true,"') != false}
                                    <div class="col-lg">
                                        <div class="tile" data-promo-slider-pagination-item>     
                                            {include file="$template/includes/common/svg-icon.tpl" icon="{$item['name']}"}                
                                            <span class="title">{$item['tabname']}</span>
                                        </div>
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
{/if}