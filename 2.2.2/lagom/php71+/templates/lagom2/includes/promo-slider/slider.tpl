{if file_exists("templates/$template/includes/promo-slider/overwrites/slider.tpl")}
    {include file="{$template}/includes/promo-slider/overwrites/slider.tpl"}  
{else}
    {if $setting == "client-home"}
        {assign var="items" value=$addons_html['0']['RSMarketConnectServices']}
    {else}
        {assign var="items" value=$RSMarketConnectServices}
    {/if}    
    {assign var="slidesAmount" value=0}
    {foreach from=$items item=item key=k name=foo}
        {if $item.settings.promotion.$setting}
            {assign var="slidesAmount" value=$slidesAmount+1}
        {/if}
    {/foreach}
    <div class="promo-slider promo-slider-{$promoSliderStyle}{if $class} {$class}{/if}" data-promo-slider>
        <div class="promo-slider-header">
            <ul class="promo-slider-nav{if $slidesAmount > 6} promo-slider-nav-dots{/if}" data-promo-slider-pagination>
                {foreach from=$items item=item key=k name=foo}
                    {if $item.settings.promotion.$setting}
                        {include file="$template/includes/promo-slider/nav-item.tpl" name=$item.name}
                    {/if}
                {/foreach}
            </ul>
            <div class="promo-slider-close" data-promo-slide-close data-toggle="tooltip" data-title="Close" data-container="body">
                <i class="ls ls-close"></i>
            </div>
        </div>
        <div class="promo-slider-wrapper">
            <div class="promo-slider-background" data-promo-slider-background>
                <div></div>
                <div></div>
                <div class="promo-slider-shape">
                    {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                </div>
            </div>
            <div class="promo-slider-slides" data-promo-slider-wrapper>
                {foreach from=$items item=item key=k name=foo}
                    {if $item.settings.promotion.$setting}
                        <a href="{routePath('store-product-group', $item.productGroup.slug)}" class="promo-slider-slide">
                            <div class="promo-slider-body">
                                <div class="promo-slider-content" data-animation-content>
                                    <h2 class="promo-slider-title">
                                        {$item.productGroup.headline} -
                                        {$item.productGroup.tagline}.
                                    </h2>
                                </div>
                                <div class="promo-slider-more" data-animation-more><i class="ls ls-basket"></i>{$rslang->trans('market_connect.order')}</div>
                            </div>
                            <div class="promo-slider-icons" data-animation-icons>
                                {if $RSThemes.styles.iconType == "modern"}
                                    {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/{$item.name}"}  
                                {else}
                                    {include file="$template/includes/common/svg-illustration.tpl" illustration="products/{$item.name}"}  
                                {/if}
                            </div>
                        </a>
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{/if}              