{assign var="visibleFontIcons" value=false}
{assign var="visiblePredefinedIcons" value=false}
{assign var="visiblePredefinedIllustrations" value=false}

{assign var="activeFontIcons" value=false}
{assign var="activePredefinedIcons" value=false}
{assign var="activePredefinedIllustrations" value=false}
{assign var="activeMediaLibrary" value=false}



{if $type == "item-add" || $type == "item-edit" || $type == "product-add" || $type == "product-edit" || $type == "group-add" || $type == "group-edit"}
    {assign var="visibleFontIcons" value=true}
    {assign var="activeFontIcons" value=true}
{/if}

{if $type == "item-add" || $type == "item-edit" || $type == "product-add" || $type == "product-edit" || $type == "group-add" || $type == "group-edit"}
    {assign var="visiblePredefinedIcons" value=true}
{/if}

{* {if $type == "product-add" || $type == "product-edit" || $type == "group-add" || $type == "group-edit"}
    {assign var="activePredefinedIcons" value=true}
{/if} *}

{if $type == "graphic-add" || $type == "graphic-edit" || $type == "product-add" || $type == "product-edit" || $type == "group-add" || $type == "group-edit"}
    {assign var="visiblePredefinedIllustrations" value=true}
{/if}

{if $type == "graphic-add" || $type == "graphic-edit"}
    {assign var="activePredefinedIllustrations" value=true}
{/if}

{if $type == "testimonial-add" || $type == "testimonial-edit" || $type == "seo-image"}
    {assign var="activeMediaLibrary" value=true}
{/if}

<ul class="nav nav--h nav--tabs m-b-2x">
    {if $visibleFontIcons}
        <li class="nav__item {if $activeFontIcons}is-active{/if}">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-small" data-media-load>
                <span>{$lang.menu.menu_items.modal.icon.ls}</span>
            </a>
        </li>
        <li class="nav__item">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-medium" data-media-load>
                <span>{$lang.menu.menu_items.modal.icon.lm}</span>
            </a>
        </li>
        <li class="nav__item ">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-font-awesome" data-media-load>
                <span>{$lang.menu.menu_items.modal.icon.fa}</span>
            </a>
        </li>
    {/if}
    {if $visiblePredefinedIcons}
        <li class="nav__item {if $activePredefinedIcons}is-active{/if}">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-predefined-icons" data-media-predefined data-media-load>
                <span>SVG Icons</span>
            </a>
        </li>
    {/if}
    {if $visiblePredefinedIllustrations}
        <li class="nav__item {if $activePredefinedIllustrations}is-active{/if}">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-predefined-illustration" data-media-illustrations data-media-load>
                <span>SVG Illustrations</span>
            </a>
        </li>
    {/if}
    <li class="nav__item {if $activeMediaLibrary && !empty($media)}is-active{/if} {if empty($media)}is-hidden{/if}">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-media-library" data-media-upload data-media-load>
            <span>Library</span>
        </a>
    </li>
    <li class="nav__item {if $activeMediaLibrary && empty($media)}is-active{/if}">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-media-upload" data-media-custom-graphic>
            <span>Upload</span>
        </a>
    </li>
</ul>

<div class="tab-content">
    {if $visibleFontIcons}
        <div class="tab-pane {if $activeFontIcons}is-active{/if}" id="{$type}-lagom-small" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media">
            <div class="media__list has-scroll" data-media-list data-media-insert="lagomsmall">

                </div>
                <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="{$type}-lagom-medium" data-media-container> 
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media">
                <div class="media__list has-scroll" data-media-list data-media-insert="lagommedium">

                </div>
                <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="{$type}-font-awesome" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media">
                <div class="media__list has-scroll" data-media-list data-media-insert="fontawesome">

                </div>
                <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
            </div>
        </div>
    {/if}
    {if $visiblePredefinedIcons}
        <div class="tab-pane tab-pane--predefined-icons {if $activePredefinedIcons}is-active{/if}" id="{$type}-predefined-icons" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media">
                <div class="media__list has-scroll" data-media-list data-media-insert="icons">

                </div>
                <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
            </div>
        </div>
    {/if}
    {if $visiblePredefinedIllustrations}
        <div class="tab-pane tab-pane--predefined-illustrations {if $activePredefinedIllustrations}is-active{/if}" id="{$type}-predefined-illustration" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media">
                <div class="media__list has-scroll" data-media-list data-media-insert="illustrations">

                </div>
                <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
            </div>
        </div>
    {/if}
    <div class="tab-pane tab-pane--media {if $activeMediaLibrary && !empty($media)}is-active{/if}" id="{$type}-media-library" data-media-container>
        <div class="media__search input-group">
            <i class="input-group__addon lm lm-search"></i>
            <input type="text" class="form-control" placeholder="Search" data-media-search>
        </div>
        <div class="media">
            <div class="media__list has-scroll" data-media-list data-media-manager data-media-insert="media">
            </div>
            <div class="media__preloader preloader is-hidden" data-media-preloader>
            </div>
        </div>
    </div>
  
    <div class="tab-pane tab-pane--media-custom {if $activeMediaLibrary && empty($media)}is-active{/if}" id="{$type}-media-upload">
        <div class="media media--custom" data-media-custom>
            <div class="media__wrapper" data-media-custom-btn>
                <i class="media__icon ls ls-upload"></i>
                <strong class="media__title p-md">Click to Upload</strong>
                <span class="media__desc p-xs">Allowed extensions .PNG, .JPG, .SVG, .GIF. Max size {$max_upload_size['max_size_formated']}.</span>
            </div>
            <input type="file" multiple name="customIcon" data-media-custom-input accept="image/*" data-max-file-size={$max_upload_size['max_size_bytes']} data-ajax-url="{$helper->url('Page@seoImage',['templateName' => $template->getMainName()])}" data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"/>            
            <div class="media__list row w-100 is-hidden" data-media-image-container>
                <div class="media__item media__item--lg col-md-12">
                    <div class="media__item-content">
                        <div class="media__item-icon" data-media-icon>
                            <img class="media__image" data-media-image data-graphic src="" alt=""/>
                        </div>
                        <span class="media__item-border"></span>
                        <span class="media__item-label"></span>
                        <div class="media__item-footer">
                            <span class="media__item-filename" data-media-image-filename></span>
                            {*<a href="#" class="btn btn--icon btn--sm media__item-delete" data-media-image-delete data-toggle="lu-tooltip" data-title="{$lang.general.remove}"><i class="btn__icon lm lm-trash"></i></a>*}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>