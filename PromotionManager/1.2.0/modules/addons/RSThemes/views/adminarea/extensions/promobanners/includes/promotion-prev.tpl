<style>
    .promo-slider-background>* img {
        width: 100%;
        height: 100%;
    }
</style>

<div id="alertDisplay" style="display: none;">
    <div class="alert alert--danger">
        <div class="alert__body">Preview not available</div>
    </div>
</div>

<div class="promo-preview horizontal">
    <div class="promo-slider" data-promo-slider="background">
        <div class="promo-slider-header">
            <ul class="promo-slider-nav">
                <li class="active"> <span class="short-name">W</span> <span class="full-name">{$extension->getSlideContent()->slide_name}</span></li>
            </ul>
            <div class="promo-slider-close" data-toggle="tooltip" data-title="Close" data-container="body"> <i class="ls ls-close"></i> </div>
        </div>
        <div class="promo-slider-wrapper">
            <div class="promo-slider-background">
                <div id="promo-slide-1-bg" data-promo-slider-bg class="active" data-start="{$extension->getSlideConfig()->slide_options['config']['color']}" data-stop="{$extension->getSlideConfig()->slide_options['config']['color2']}" style="background: linear-gradient(to right, {$extension->getSlideConfig()->slide_options['config']['color']} 0%, {$extension->getSlideConfig()->slide_options['config']['color2']} 100%);">
                    <img id="promo-slide-1-bg-image" src="{$whmcsURL}/templates/{$extension->template->license->templateName}/core/extensions/PromoBanners/uploads/{$extension->getSlideConfig()->slide_icon_custom}">
                </div>
            </div>
            <div class="promo-slider-slides">
                <a href="#" class="promo-slider-slide promo-slide-bg-image active" id="promo-slide-1">
                    <div class="promo-slider-body">
                        <div class="promo-slider-content">
                            <h2 class="promo-slider-title">{$extension->getSlideContent()->slide_description|unescape:'html'}</h2>
                        </div>
                        <div class="promo-slider-more">{$extension->getSlideContent()->slide_text_btn}</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="promo-slider" data-promo-slider="custom_icon">
        <div class="promo-slider-header">
            <ul class="promo-slider-nav">
                <li class="active"> <span class="short-name">W</span> <span class="full-name">{$extension->getSlideContent()->slide_name}</span></li>
            </ul>
            <div class="promo-slider-close" data-toggle="tooltip" data-title="Close" data-container="body"> <i class="ls ls-close"></i> </div>
        </div>
        <div class="promo-slider-wrapper">
            <div class="promo-slider-background">
                <div id="promo-slide-2-bg" data-promo-slider-bg class="active" data-start="{$extension->getSlideConfig()->slide_options['config']['color']}" data-stop="{$extension->getSlideConfig()->slide_options['config']['color2']}" style="background: linear-gradient(to right, {$extension->getSlideConfig()->slide_options['config']['color']} 0%, {$extension->getSlideConfig()->slide_options['config']['color2']} 100%);">
                </div>
            </div>
            <div class="promo-slider-slides">
                <a href="#" class="promo-slider-slide promo-slide-bg-image active" id="promo-slide-2">
                    <div class="promo-slider-body">
                        <div class="promo-slider-content">
                            <h2 class="promo-slider-title">{$extension->getSlideContent()->slide_description|unescape:'html'}</h2>
                        </div>
                        <div class="promo-slider-more">{$extension->getSlideContent()->slide_text_btn}</div>
                    </div>

                    <span class="promo-slider-icons" id="promotionIconPrev">
                        {if $extension->getSlideConfig()->slide_icon_custom}
                            <img class="promo-slider-custom-icon" src="{$whmcsURL}/templates/{$extension->template->license->templateName}/core/extensions/PromoBanners/uploads/{$extension->getSlideConfig()->slide_icon_custom}">
                        {elseif $extension->getSlideContent()->id}
                            {if $extension->getSlideConfig()->slide_icon}
                                {include file="../../../../../../../../templates/{$template->license->templateName}/assets/svg-illustrations/products/{$extension->getSlideConfig()->slide_icon}.tpl"}
                            {/if}
                        {/if}
                    </span>
                </a>
            </div>
        </div>
    </div>
</div>
