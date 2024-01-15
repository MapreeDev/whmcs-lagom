{assign var="iconLocation" value="./../../../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../../../templates/{$themeName}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

<ul class="nav nav--h nav--tabs">
    {if $type !== 'testimonial-add' && $type !== 'testimonial-edit' && $type !== 'seo-image'}
        <li class="nav__item is-active">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-predefined-icons" data-media-predefined data-media-load>
                <span>Predefined Icons</span>
            </a>
        </li>
    {/if}
    {if $type == 'button-add' || $type == 'button-edit' || $type == 'graphic-add' || $type == 'graphic-edit'}
        <li class="nav__item">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-predefined-illustration" data-media-illustrations data-media-load>
                <span>Predefined Illustration</span>
            </a>
        </li>
    {/if}
    <li class="nav__item {if ($type == 'testimonial-add' || $type == 'testimonial-edit' || $type == 'seo-image') && !empty($media)}is-active{/if} {if empty($media)}is-hidden{/if}">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-media-upload" data-media-upload>
            <span>Media Library</span>
        </a>
    </li>
    {if $type !== 'button-add' && $type !== 'button-edit' && $type !== 'graphic-add' && $type !== 'graphic-edit'}
        <li class="nav__item {if empty($media)}is-active{/if}">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-custom-icon" data-media-custom>
                <span>Upload Custom Icon</span>
            </a>
        </li>
    {/if}
    {if $type == 'graphic-add' || $type == 'graphic-edit'}
        <li class="nav__item">
            <a class="nav__link" data-toggle="lu-tab" href="#{$type}-custom-graphic" data-media-custom-graphic>
                <span>Upload Graphic</span>
            </a>
        </li>
    {/if}
</ul>

<div class="tab-content">
    {if $type !== 'testimonial-add' && $type !== 'testimonial-edit' && $type !== 'seo-image'}
        <div class="tab-pane is-active" id="{$type}-predefined-icons">
            <div class="media" data-media-container>
                <div class="media__search input-group">
                    <i class="input-group__addon lm lm-search"></i>
                    <input type="text" class="form-control" placeholder="Search" data-media-search>
                </div>
                <div class="media__list" data-media-list data-media-insert="icons">
                </div>
            </div>
        </div>
    {/if}
    <div class="tab-pane" id="{$type}-predefined-illustration">
        <div class="media" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media__list" data-media-list data-media-insert="illustrations">
            </div>
        </div>
    </div>
    <div class="tab-pane {if ($type == 'testimonial-add' || $type == 'testimonial-edit' || $type == 'seo-image') && !empty($media)}is-active{/if}" id="{$type}-media-upload" data-media-container>
        <div class="media__search input-group">
            <i class="input-group__addon lm lm-search"></i>
            <input type="text" class="form-control" placeholder="Search" data-media-search>
        </div>
        <div class="media"> {*media--img*}
            <div class="media__list row" data-media-list data-media-manager>
                {foreach $media as $media_img}
                    <label class="media__item media__item--lg col-md-4" data-media-item="{$media_img['filename']}">
                        {*media_img['extension'] to get file extension*}
                        <div class="media__item-content">
                        {if $media_img['type'] == 'custom'}
                            <div class="media__item-icon">
                                <img src="{$imagesPath}/page-manager/{$media_img['filename']}" alt="{$media_img['filename']}">
                            </div>
                            <input class="media__item-input media-icon" type="radio" name="item[media]" value="{$media_img['filename']}">
                        {elseif $media_img['type'] == 'default'}
                            <div class="media__item-icon">
                                <img src="{$imagesPath}/page-manager/default/{$media_img['filename']}" alt="{$media_img['filename']}">
                            </div>
                            <input class="media__item-input media-icon" type="radio" name="item[media]" value="default/{$media_img['filename']}">
                        {/if}
                            <span class="media__item-border"></span>
                            <span class="media__item-label"></span>
                            <div class="media__item-footer p-0x p-l-2x">
                                <span class="media__item-filename truncate">{$media_img['filename']}</span>
                                <div class="media__item-popover popover-container" data-popover-container>
                                    <a 
                                        class="btn btn--icon btn--link" 
                                        data-toggle="lu-tooltip"
                                        data-title="{$lang.general.remove}"
                                        data-popover-open
                                    >
                                        <i 
                                            class="btn__icon lm lm-trash"        
                                        ></i>
                                    </a>
                                      <div class="popover" data-popover>
                                        <span class="arrow"></span>
                                        <div class="popover__body">
                                            <p>Are you sure ?</p>
                                        </div>
                                        <div class="popover__footer">
                                            <button type="button" class="btn btn--xs btn--primary" data-media-remove="{$media_img['filename']}" data-ajax-url="{$helper->apiUrl("MediaApi@deleteMediaImage", ["templateName"=>$template->getMainName()])}">Yes</button>
                                            <button type="button" class="btn btn--xs btn--default" data-popover-close>Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </label>
                {/foreach}
                <div class="media__no-data msg p-3x is-hidden" data-media-no-data>
                    <div class="msg__icon i-c-6x">
                        {include file="$iconLocation/no-data.tpl"}
                    </div>
                    <div class="msg__body">
                        <span class="msg__title">No images found</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {* TODO sprawdzić dodawanie nowej grafiki - trzeba podwójnie dodać grafike żeby obrazek sie podmienił, *}
    {* TODO dodatkowo jak dodaje dużą grafike to pasowałoby ją przeskalować *}
    {if $type !== 'button-add' && $type !== 'button-edit'}
        <div class="tab-pane {if empty($media)}is-active{/if}" id="{if $type == 'graphic-add' || $type == 'graphic-edit'}{$type}-custom-graphic{else}{$type}-custom-icon{/if}">
            <div class="media media--custom" data-media-custom>
            {* {if $type == 'graphic-add' || $type == 'graphic-edit'} *}
                <div class="media__wrapper" data-media-custom-btn>
                    <i class="media__icon ls ls-upload"></i>
                    <strong class="media__title p-md">Click to Upload</strong>
                    <span class="media__desc p-xs">Allowed extensions .PNG, .JPG, .SVG, .GIF. Max size 128MB.</span>
                </div>
            {* {else}
                <button class="btn btn--primary" type="button" data-media-custom-btn>
                    Upload Custom Icon
                </button>
            {/if} *}
                <input type="file" multiple name="customIcon" data-media-custom-input accept="image/*" />
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
    {/if}
</div>

