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

{include file="adminarea/menu/includes/components/icon.tpl"}