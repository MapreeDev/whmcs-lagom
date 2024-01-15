<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">
            Style
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.style}
        </label>
        <select class="form-control item-style opacity-1" name="items[{$parent}][{$index}][style]" data-index="{$index}" data-parent="{$parent}">
            <option value="link" {if strtolower($content['style']) == 'link'} selected {/if}>Link</option>
            {if $level == 0}
                <option value="button" {if strtolower($content['style']) == 'button'} selected {/if}>Button</option>
            {/if}
        </select>
    </div>
</div>
<div class="w-100-p">
    <div class="row-item-{$parent}-{$index}-style">
        {if strtolower($content['style']) == 'link'}
            {include file="adminarea/menu/includes/components/style/link.tpl"}
        {elseif strtolower($content['style']) == 'button'}
            {include file="adminarea/menu/includes/components/style/button.tpl"}
        {elseif !isset($content['style'])} {*default input*}
            {include file="adminarea/menu/includes/components/style/link.tpl"}
        {/if}
    </div>
</div>
