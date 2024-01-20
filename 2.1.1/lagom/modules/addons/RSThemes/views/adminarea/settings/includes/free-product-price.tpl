<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.free_product_price.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.free_product_price}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[free_product_price]" value="disabled" />
                <input 
                    class="switch__checkbox" 
                    name="settings[free_product_price]" 
                    value="enabled" type="checkbox" 
                    {if $settings['free_product_price'] == "enabled"} checked="checked" {/if}
                >
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>