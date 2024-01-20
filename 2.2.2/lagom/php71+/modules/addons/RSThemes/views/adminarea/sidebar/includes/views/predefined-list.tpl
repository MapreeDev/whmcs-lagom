<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">List
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.list}
        </label>
        <select class="form-control menu-list opacity-1" data-menu-predefined-list name="items[{$parent}][{$index}][list]" data-parent="{$parent}" data-index="{$index}">
            <option value="Product Groups" {if $content['list'] == 'Product Groups'} selected {/if} >Product Groups</option>
            <option value="Client Details" {if $content['list'] == 'Client Details'} selected {/if}>Client Details</option>
            <option value="Contacts" {if $content['list'] == 'Contacts'} selected {/if}>Contacts</option>
        </select>
    </div>
</div>
<input class="translation-{$parent}-{$index}" type="hidden" name="items[{$parent}][{$index}][translation]" value="{$customTranslation}">
