{if file_exists("templates/$template/includes/sidebar/overwrites/sidebar-promo.tpl")}
    {include file="{$template}/includes/sidebar/overwrites/sidebar-promo.tpl"}
{else}
    {if $RSMarketConnectServices}
        {foreach from=$RSMarketConnectServices item=addon_html key=k name=foo}
            {foreach from=$addon_html.settings.promotion item=promotion key=k name=foo}
                {if $k == "product-list" && $promotion}
                    {assign var="show_promo_prods" value=true}
                {/if}
                {if $k == "product-details" && $promotion}
                    {assign var="show_promo_proddet" value=true}
                {/if}
            {/foreach}
        {/foreach}
    {/if}
    {if $templatefile == 'clientareaproducts'}
        {if $promoSliderExtension && $promoBannerStatus eq '1'}
            {include file="$template/core/extensions/PromoBanners/promo-slide.tpl" setting="product-list" class="promo-slider-xs"}
        {elseif $show_promo_prods}
            {include file="$template/includes/promo-slider/slider.tpl" setting="product-list" class="promo-slider-xs"}
        {/if}
    {/if}
    {if $templatefile == 'clientareaproductdetails'}
        {if $promoSliderExtension && $promoBannerStatus eq '1'}
            {include file="$template/core/extensions/PromoBanners/promo-slide.tpl" setting="product-details" class="promo-slider-xs"}
        {elseif $show_promo_proddet}
            {include file="$template/includes/promo-slider/slider.tpl" setting="product-details" class="promo-slider-xs"}
        {/if}
    {/if}
    {if $templatefile == 'clientareadomains'}
        {if $promoSliderExtension && $promoBannerStatus eq '1'}
            {include file="$template/core/extensions/PromoBanners/promo-slide.tpl" setting="domain-list" class="promo-slider-xs"}
        {/if}
    {/if}
{/if}