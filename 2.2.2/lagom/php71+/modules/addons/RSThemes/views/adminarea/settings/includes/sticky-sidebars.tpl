<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title"> 
            {$lang.settings.section.general.sticky_sidebars.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.sticky_sidebars}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[sticky_sidebars]" value="hidden" />
                <input 
                    class="switch__checkbox" 
                    name="settings[sticky_sidebars]" 
                    value="true" type="checkbox" 
                    {if $settings['sticky_sidebars']=="true" } checked="checked" {/if}
                > 
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>