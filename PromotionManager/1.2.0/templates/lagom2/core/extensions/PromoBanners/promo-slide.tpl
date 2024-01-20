{assign var=sliderCounter value=false}
{foreach from=$promoSliderExtension item=slide key=k name=slideLoop}
    {if ($slide->slide_begin_time <= $smarty.now && $slide->slide_end_time >= $smarty.now) || ($slide->slide_begin_time eq 0 && $slide->slide_end_time eq 0) || ($slide->slide_begin_time <= $smarty.now && !$slide->slide_end_time)}
        {if $slide->slide_options.promotion[$setting] eq '1' && $slide->slide_show eq '1'}
            {$sliderCounter = $sliderCounter +1}
        {/if}
    {/if}
{/foreach}

{if $sliderCounter}
<style>
    {literal}
    .promo-slider {
        display: none;
    }
    .promo-slider-background>* {
        display: flex;
        justify-content: center;
    }
    .promo-slider-background>* img {
        object-fit: inherit;
    }
    .promo-slider-icons.promo-slider-icons--image .promo-slider-icon {
        right: unset;
        top: unset;
        bottom: unset;
        left: unset;
    }
    .promo-slider-xs #bannerIcon {
        left: 0;
        right: 0;
    }
    .promo-slider-xs,
    .promo-slider-xs .promo-slider-slide,
    .promo-slider-xs .promo-slider-wrapper {
        min-height: 200px;
    }
    .promo-slider-xs .promo-slider-slide {
        height: auto !important;
    }
    .promo-slider-xs .promo-slider-slide.slider-slide-default {
        padding-top: 0
    }
    .promo-slider-xs .promo-slider-title,
    .promo-slider-xs .promo-slider-more {
        text-shadow: 0 2px 8px rgba(0, 0, 0, 0.16);
    }
    .m-t-3x {
        margin-top: 24px !important;
    }
    @media (max-width: 768px) {
        .short-name {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #ffffff;
            overflow: hidden;
            opacity: .5;
        }

        .promo-slider-nav li.active .short-name {
            opacity: 1;
        }
    }
    #Promotion img {
        opacity: 0;
    }
    .promo-slider-slide.slider-slide-custom-icon .promo-slider-icons {
        height: auto;
    }
    @media (max-width: 991px) {
        .promo-slider-xs .promo-slider-content {
            margin-top: 0 !important;
        }
    }
    @media (max-width: 480px) {
        .promo-slider-slide.slider-slide-custom-icon .promo-slider-icons {
            justify-content: center!important; /* force icons to be centered on mobile phones */
        }
        .promo-slider-slide.slider-slide-custom-icon .promo-slider-icons .promo-slider-custom-icon {
            margin-right: 0!important; /* force remove right icon spacing */
            margin-left: 0!important; /* force remove left icon spacing */
        }
        .promo-slider-background > div > img {
            opacity: 32%!important; /* force background opacity */
        }
    }
    {/literal}

    {$promotionStyles}
</style>

    <div id="Promotion" class="promo-slider {if $class}{$class}{/if}" data-promo-slider>
    <div class="promo-slider-header">
        <ul class="promo-slider-nav promo-slider-nav-dots" data-promo-slider-pagination>
            {foreach from=$promoSliderExtension item=slide key=k name=slideLoop}
                {if ($slide->slide_begin_time <= $smarty.now && $slide->slide_end_time >= $smarty.now) || ($slide->slide_begin_time eq 0 && $slide->slide_end_time eq 0) || ($slide->slide_begin_time <= $smarty.now && !$slide->slide_end_time)}
                    {if $slide->slide_options.promotion[$setting] eq '1' && $slide->slide_show eq '1'}
                        <li data-promo-slider-pagination-item data-background="{if ($slide->slide_options['config']['color'] == "transparent") && ($slide->slide_options['config']['color2'] == "transparent") && $slide->slide_options['config']['graphic_type'] eq "background"}light{else}dark{/if}">
                            <span class="short-name">{$slide->getField('slide_name' , $activeLocale.language)|truncate:2:"":true:true}</span>
                            <span class="full-name">{$slide->getField('slide_name' , $activeLocale.language)}</span>
                        </li>
                    {/if}
                {/if}
            {/foreach}
        </ul>
        {if $promotionClose}
            <div onclick="writeCookie({$promotionCloseTime})" class="promo-slider-close" data-promo-slide-close data-toggle="tooltip" data-title="Close" data-container="body">
                <i class="ls ls-close"></i>
            </div>
        {/if}
            </div>
    <div class="promo-slider-wrapper">
        <div class="promo-slider-background" data-promo-slider-background>
            {foreach from=$promoSliderExtension item=slide key=k2}
                {if ($slide->slide_begin_time <= $smarty.now && $slide->slide_end_time >= $smarty.now) || ($slide->slide_begin_time eq 0 && $slide->slide_end_time eq 0) || ($slide->slide_begin_time <= $smarty.now && !$slide->slide_end_time)}
                    {if $slide->slide_options.promotion[$setting] eq '1' && $slide->slide_show eq '1'}
                    <div {if $slide->slide_options['config']['banner_style_active']}id="promo-slide-{$slide->id}-bg"{else} class="promo-slide-{$promoSliderStyle}-bg"{/if}>
                        {if !$slide->slide_options['config']['banner_style_active'] || (!$slide->slide_options['config']['color'] && !$slide->slide_options['config']['color2'] && $slide->slide_options['config']['graphic_type'] neq "background") }
                            <div></div>
                            <div></div>
                            <div class="promo-slider-shape">
                                {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                            </div>
                        {/if}
                        {if $slide->slide_icon_custom && $slide->slide_options['config']['graphic_type'] eq "background"}
                        <img id="promo-slide-{$slide->id}-bg-image" src="{$systemurl}/templates/{$template}/core/extensions/PromoBanners/uploads/{$slide->slide_icon_custom}">
                        {/if}
                    </div>
                    {/if}
                {/if}
            {/foreach}
        </div>
        <div class="promo-slider-slides" data-promo-slider-wrapper>
            {foreach from=$promoSliderExtension item=slide key=k2}
                {if ($slide->slide_begin_time <= $smarty.now && $slide->slide_end_time >= $smarty.now) || ($slide->slide_begin_time eq 0 && $slide->slide_end_time eq 0) || ($slide->slide_begin_time <= $smarty.now && !$slide->slide_end_time)}
                    {if $slide->slide_options.promotion[$setting] eq '1' && $slide->slide_show eq '1'}
                    <a class="promo-slider-slide {if $slide->slide_options['config']['banner_style_active']}promo-slide-{$promoSliderStyle}{/if} {if $slide->slide_options['config']['graphic_type'] eq "background"}slider-slide-custom-bg{elseif $slide->slide_options['config']['graphic_type'] eq "custom_icon"}slider-slide-custom-icon{else}slider-slide-default{/if}{if ($slide->slide_options['config']['color'] != "transparent") && ($slide->slide_options['config']['color2'] != "transparent") || ($slide->slide_options['config']['graphic_type'] == "background")} slider-slide-transparent{/if}{if ($slide->slide_options['config']['color'] == "transparent") && ($slide->slide_options['config']['color2'] == "transparent") && ($slide->slide_options['config']['graphic_type'] == "background")} dark-font{/if}" id="promo-slide-{$slide->id}" href="{$slide->slide_product_url}" data-animation-type="{$slide->slide_options['config']['animation']}" {$slide->slide_options['config']['graphic_type']}>
                        <div class="promo-slider-body">
                            <div class="promo-slider-content" data-animation-content>
                                <h2 class="promo-slider-title" {if $slide->slide_options['config']['banner_style_active'] && $slide->slide_options['config']['color_title']}style="color: {$slide->slide_options['config']['color_title']};"{/if}>
                                    {$slide->getField('slide_description',$activeLocale.language)|unescape:'html'}
                                </h2>
                            </div>
                            <div class="promo-slider-more" data-animation-more><i class="ls ls-basket"></i>{$slide->getField('slide_text_btn' , $activeLocale.language)}</div>
                        </div>
                        {if $slide->slide_options['config']['graphic_type'] != "background"}
                        <div class="promo-slider-icons" id="promo-slide-{$slide->id}-icon-wrapper" data-animation-icons>
                            {if $slide->slide_icon_custom}
                                <img class="promo-slider-custom-icon" id="promo-slide-{$slide->id}-icon" src="{$systemurl}/templates/{$template}/core/extensions/PromoBanners/uploads/{$slide->slide_icon_custom}" alt="">
                            {else}
                                {if $absTemplate && file_exists("$absTemplate/assets/svg-illustrations/products/{$slide->slide_icon}.tpl")}
                                    {include file="$absTemplate/assets/svg-illustrations/products/{$slide->slide_icon}.tpl"}
                                {elseif file_exists("templates/$template/assets/svg-illustrations/products/{$slide->slide_icon}.tpl") }
                                    {include file="$template/assets/svg-illustrations/products/{$slide->slide_icon}.tpl"}
                                {/if}
                            {/if}
                        </div>
                         {/if}
                    </a>
                    {/if}
                {/if}
            {/foreach}
        </div>
    </div>
</div>

<script type="text/javascript">
    {literal}

    if(getCookie('RS_Promotion') != '1'){
        document.getElementById('Promotion').style.display = "block";
    }

    function writeCookie (days) {
        var date = new Date();
        days = days || 1;
        date.setTime(+ date + (days * 86400000)); //24 * 60 * 60 * 1000
        window.document.cookie = 'RS_Promotion' + "=" + '1' + "; expires=" + date.toGMTString() + "; path=/";
        return;
    }

    function getCookie(name) {
        var v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return v ? v[2] : null;
    }

    {/literal}
</script>
{/if}
