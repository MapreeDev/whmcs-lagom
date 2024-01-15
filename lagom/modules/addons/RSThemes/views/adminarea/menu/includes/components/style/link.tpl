<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">Icons</label>
        <select class="form-control opacity-1" name="items[{$parent}][{$index}][icon]">
            {foreach $template->getIcons() as $key => $icon}
                <option value="{$icon->class}" {if $content['icon'] == $icon->class} selected {elseif !isset($content['icon']) && $key == 1} selected {/if}>{$icon->class}</option>
            {/foreach}
        </select>
    </div>
</div>
<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">Top Layout</label>
        <select class="form-control opacity-1" name="items[{$parent}][{$index}][layout-settings]">
            <option value="icon-text" {if $content['layout-settings'] == 'icon-text' || !isset($content['layout-settings'])} selected {/if}>Icon and text</option>
            {if $level == 0}
                <option value="icon" {if $content['layout-settings'] == 'icon'} selected {/if}>Icon only</option>
            {/if}
            <option value="text" {if $content['layout-settings'] == 'text'} selected {/if}>Text only</option>
        </select>
    </div>
</div>
