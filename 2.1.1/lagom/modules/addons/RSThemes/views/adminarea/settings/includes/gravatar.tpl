<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.gravatar.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.gravatar}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_gravatar_image]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_gravatar_image]" value="displayed"
                        type="checkbox" {if $settings['show_gravatar_image'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>