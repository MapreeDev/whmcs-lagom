<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">
            Page
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.page}
        </label>
        <select class="form-control opacity-1" name="items[{$parent}][{$index}][settings][page]">
            {foreach $pages as $key => $page}
                <option value="{$page['id']}" {if $settings['page'] == $page['id']} selected {/if}>{$page['label']}</option>
            {/foreach}
        </select>
    </div>
</div>
{include file="adminarea/menu/includes/components/name.tpl" type=$type}
{include file="adminarea/menu/includes/components/icon.tpl" type=false}