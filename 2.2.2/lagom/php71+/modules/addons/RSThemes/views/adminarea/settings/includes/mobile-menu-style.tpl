<div class="panel panel--collapse is-hidden">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.mobile_menu_style.title}
        </h6>
    </div>
    <div class="collapse show">
        <div class="form-group p-t-3x" >
            <label class="form-label">
                {$lang.settings.section.general.mobile_menu_style.label}
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.mobile_menu_style}
            </label>
            <select class="form-control selectized opacity-1" name="settings[mobile_menu_style]" tabindex="-1">
                <option value="slide" {if isset($settings['mobile_menu_style']) && $settings['mobile_menu_style'] == 'slide'} selected {/if}>{$lang.settings.section.general.mobile_menu_style.style.slide}</option>
                <option value="dropdown" {if isset($settings['mobile_menu_style']) && $settings['mobile_menu_style'] == 'dropdown'} selected {/if}>{$lang.settings.section.general.mobile_menu_style.style.dropdown}</option>
            </select>
        </div>
    </div>
</div>