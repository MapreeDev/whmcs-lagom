<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">
            URL
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.url}
        </label>
        <input class="form-control" type="text" name="items[{$parent}][{$index}][settings][link]" value="{if isset($settings['link'])}{$settings['link']}{else}#{/if}">
    </div>
</div>
{include file="adminarea/menu/includes/components/name.tpl" type=$type}
{include file="adminarea/menu/includes/components/icon.tpl" type=false}