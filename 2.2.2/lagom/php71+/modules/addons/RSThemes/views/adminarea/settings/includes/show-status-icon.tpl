<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.show_status_icon.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.display_status_icon}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_status_icon]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_status_icon]" value="displayed"
                        type="checkbox" {if isset($settings['show_status_icon']) && $settings['show_status_icon'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>