<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">
            Position
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.position}
        </label>
        <select class="form-control opacity-1" name="items[{$parent}][{$index}][position]">
            <option value="left" {if strtolower($content['position']) == 'left'} selected {/if}>Left</option>
            <option value="right" {if strtolower($content['position']) == 'right'} selected {/if}>Right</option>
        </select>
    </div>
</div>
