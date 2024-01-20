<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.order_process.enable_pw_strength.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.enable_pw_strength}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[enable_pw_strength]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[enable_pw_strength]" value="enabled"
                        type="checkbox" {if isset($settings['enable_pw_strength']) && $settings['enable_pw_strength'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div> 
</div>