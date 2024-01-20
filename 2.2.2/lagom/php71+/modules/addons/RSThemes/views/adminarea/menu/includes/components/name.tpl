<div class="menu-name-group col-md-12">
    <label class="form-label">
        Name
        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.name}
    </label>
    <div class="row">
        <div class="col-md-12 form-group">
            <div class="d-flex">
                <label  class="radio d-flex m-t-0x" >
                    <input class="form-radio"
                           type="radio"
                           name="items[{$parent}][{$index}][settings][translation-method]"
                            {if $translationMethod == 'custom' || empty($translationMethod)} checked {/if}
                           value="custom"
                           data-parent="{$parent}"
                           data-index="{$index}"
                           data-menu-item-name-type
                    >
                    <span class="form-indicator"></span>
                    <span class="form-text">Custom String</span>
                    {include file="adminarea/includes/helpers/tooltip.tpl" classes="self-center" tooltip=$tooltips.menu.menu_items.custom_string}
                </label>
                <a
                        class="label-link m-l-a"
                        href="#translationModal"
                        data-toggle="lu-modal"
                        data-backdrop="static"
                        data-keyboard="false"
                        data-index="{$index}"
                        data-parent="{$parent}"
                        data-menu-translation
                >
                    Translate
                </a>
            </div>
            <div 
                class="d-flex custom-string collapse {if $translationMethod == 'custom' || empty($translationMethod)}show{/if}" 
                id="customCollapse{$parent}{$index}"
            >
                <div class="frame-component"></div>
                <input
                        class="form-control custom-name-{$parent}-{$index} item-name item-name-{$parent}-{$index}"
                        type="text"
                        name="items[{$parent}][{$index}][name][custom]"
                        maxlength="80"
                        value="{$translations['custom']}"
                        data-parent="{$parent}"
                        data-index="{$index}"
                        data-menu-item-custom-name
                        data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
                        {if $translationMethod == 'whmcs'}disabled{/if}
                >
                <input
                        class="translation-{$parent}-{$index}"
                        type="hidden"
                        name="items[{$parent}][{$index}][translation]"
                        value="{$customTranslation}"
                        data-menu-item-custom-translation
                        data-ajax-url="{$helper->url('Menu@getSystemLanguage',['templateName'=>$template->getMainName()])}"
                        data-parent="{$parent}"
                        data-index="{$index}"
                >
            </div>
            <div class="d-flex">
                <label  class="radio d-flex m-t-0x" >
                    <input class="form-radio"
                        type="radio"
                        name="items[{$parent}][{$index}][settings][translation-method]"
                            {if $translationMethod == 'whmcs'} checked {/if}
                        value="whmcs"
                        data-parent="{$parent}"
                        data-index="{$index}"
                        data-ajax-url="{$helper->url('Menu@checkWhmcsLangVariable',['templateName'=>$template->getMainName()])}"
                        data-menu-item-name-type
                    >
                    <span class="form-indicator"></span>
                    <span class="form-text">Language Variable</span>
                    {include file="adminarea/includes/helpers/tooltip.tpl" classes="self-center" tooltip=$tooltips.menu.menu_items.language_variable}
                </label>
            </div>
            <div 
                class="d-flex whmcs-page collapse {if $translationMethod == 'whmcs'}show{/if}" 
                id="langCollapse{$parent}{$index}"
            >
                <div class="frame-component"></div>
                <input
                        class="form-control whmcs-name whmcs-name-{$parent}-{$index}"
                        type="text"
                        name="items[{$parent}][{$index}][name][whmcs]"
                        maxlength="80"
                        value="{$translations['whmcs']}"
                        data-index="{$index}"
                        data-parent="{$parent}"
                        data-menu-item-whmcs-name
                        data-ajax-url="{$helper->url('Menu@checkWhmcsLangVariable',['templateName'=>$template->getMainName()])}"
                        {if $translationMethod == 'custom' || empty($translationMethod)}disabled{/if}
                >
            </div>
        </div>
    </div>
</div>
{if $level == 1 && $location !== 'Footer' && $type !== "Header"}
    <div class="menu-name-group form-group col-md-12">
        <div class="d-flex">
            <label class="form-label">
                Description
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.description}
            </label>
            <a
                    class="label-link m-l-a"
                    href="#translationDescModal"
                    data-toggle="lu-modal"
                    data-backdrop="static"
                    data-keyboard="false"
                    data-index="{$index}"
                    data-parent="{$parent}"
                    data-menu-description-translation
            >
                Translate
            </a>
        </div>
        <textarea
            class="form-control custom-name-{$parent}-{$index} item-name item-name-{$parent}-{$index}"
            type="text"
            name="items[{$parent}][{$index}][description]"
            value="{$translationDesc}"
            data-parent="{$parent}"
            data-index="{$index}"
            data-menu-item-description
            data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
        >{$translationDesc}</textarea>
        <input
            class="description-{$parent}-{$index}"
            type="hidden"
            name="items[{$parent}][{$index}][descriptionTranslation]"
            value="{$customTranslationDesc}"
            data-menu-item-description-translation
            data-ajax-url="{$helper->url('Menu@getSystemLanguage',['templateName'=>$template->getMainName()])}"
            data-parent="{$parent}"
            data-index="{$index}"
        >
    </div>
{/if}

{if $type == "Header"}
    <input
        type="hidden"
        name="items[{$parent}][{$index}][description]"
        value="{$translationDesc}"
        data-parent="{$parent}"
        data-index="{$index}"
        data-menu-item-description
        data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
    >
    <input
        type="hidden"
        name="items[{$parent}][{$index}][descriptionTranslation]"
        value="{$customTranslationDesc}"
        data-menu-item-description-translation
        data-ajax-url="{$helper->url('Menu@getSystemLanguage',['templateName'=>$template->getMainName()])}"
        data-parent="{$parent}"
        data-index="{$index}"
    >
{/if}