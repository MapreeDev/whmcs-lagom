<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">Link
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.link}
        </label>
        <input class="form-control" type="text" name="items[{$parent}][{$index}][link]" value="{if isset($content['link'])}{$content['link']}{else}#{/if}">
    </div>
</div>
{include file="adminarea/sidebar/includes/components/name.tpl" type=$parent translationMethod=$content['translation-method']}

{*TODO obsłużenie predefiniowanej ikony*}
<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">Icon
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.icon}
        </label>
        <div class="menu-icon-display" data-toggle="lu-modal" data-target="#menuIconModal" data-menu-item-icon-container data-parent="{$parent}" data-index="{$index}">
            <i class="{if !$content['icon']}is-hidden{/if} {$content['icon']}" data-menu-item-icon></i>
            <span {if $content['icon']}class="is-hidden"{/if} data-menu-item-icon-label>Choose icon</span>
            <input type="hidden" name="items[{$parent}][{$index}][icon]" value="{$content['icon']}" data-menu-item-icon-value>
            <input type="hidden" name="items[{$parent}][{$index}][predefined_icon]" value="{$content['predefined_icon']}" data-menu-item-predefined-icon-value>
        </div>
    </div>
</div>
