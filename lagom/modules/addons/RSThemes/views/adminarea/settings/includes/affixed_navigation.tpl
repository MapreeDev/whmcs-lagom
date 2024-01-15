<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.affixed_navigation.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.affixed_navigation}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[show_affixed_navigation]" value="disabled"/>
                <input class="switch__checkbox"
                        name="settings[show_affixed_navigation]" value="enabled"
                        type="checkbox" {if $settings['show_affixed_navigation'] == "enabled"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>