<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">
            List Items
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.list_items}
        </label>
        <select class="form-control menu-list opacity-1" data-menu-predefined-list name="items[{$parent}][{$index}][settings][list]" data-parent="{$parent}" data-index="{$index}">
            {if $location != 'Footer'}
                <option value="Client Details" {if $settings['list'] == 'Client Details'} selected {/if}>Client Details</option>
            {/if}
            <option value="Download Categories" {if $settings['list'] == 'Download Categories'} selected {/if}>Download Categories</option>
            <option value="Knowledgebase Categories" {if $settings['list'] == 'Knowledgebase Categories'} selected {/if}>Knowledgebase Categories</option>
            <option value="MarketConnect Products" {if $settings['list'] == 'MarketConnect Products'} selected {/if}>MarketConnect Products</option>
            <option value="Product Groups" {if $settings['list'] == 'Product Groups'} selected {/if} >Product Groups</option>
            <option value="Ticket Departments" {if $settings['list'] == 'Ticket Departments'} selected {/if}>Ticket Departments</option>
        </select>
    </div>
</div>
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