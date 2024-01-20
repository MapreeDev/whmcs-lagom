<div class="col-md-6">
    <div class="form-group">
        <label class="form-label">Button Style</label>
        <select class="form-control opacity-1" name="items[{$parent}][{$index}][button-style]">
            <option value="primary" {if $content['button-style'] == 'primary'} selected {/if}>Primary</option>
            <option value="secondary" {if $content['button-style'] == 'secondary'} selected {/if}>Secondary</option>
            <option value="info" {if $content['button-style'] == 'info'} selected {/if}>Info</option>
            <option value="default-outline" {if $content['button-style'] == 'default-outline'} selected {/if}>Default Outline</option>
        </select>
    </div>
</div>
