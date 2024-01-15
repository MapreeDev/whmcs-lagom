<div class="col-md-6">
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