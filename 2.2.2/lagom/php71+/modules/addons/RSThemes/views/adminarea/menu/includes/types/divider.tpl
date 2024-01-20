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
<input 
    type="hidden" 
    data-index="{$index}" 
    data-parent="{$parent}" 
    data-menu-item-whmcs-name 
    data-ajax-url="{$helper->url('Menu@checkWhmcsLangVariable',['templateName'=>$template->getMainName()])}"
>

{if $level == 1 && $location !== 'Footer' && $type !== "Header"}
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