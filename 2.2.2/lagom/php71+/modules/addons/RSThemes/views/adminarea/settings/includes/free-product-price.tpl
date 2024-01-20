<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.free_product_price.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.free_product_price}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#free-prices" aria-expanded="true">
                <input type="hidden" name="settings[free_product_price]" value="disabled" />
                <input 
                    class="switch__checkbox" 
                    name="settings[free_product_price]" 
                    value="enabled" type="checkbox" 
                    {if isset($settings['free_product_price']) && $settings['free_product_price'] == "enabled"} checked="checked" {/if}
                >
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if isset($settings['free_product_price']) && $settings['free_product_price'] == "enabled"} show {/if}" id="free-prices">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">{$lang.settings.section.general.free_product_price.label}</label>
            <select class="form-control selectized opacity-1" name="settings[free_product_price_value]" tabindex="-1">
                <option value="boxes" {if $settings['free_product_price_value'] == 'boxes'} selected {/if}>{$lang.settings.section.general.free_product_price.options.boxes}</option>
                <option value="all" {if $settings['free_product_price_value'] == 'all'} selected {/if}>{$lang.settings.section.general.free_product_price.options.all}</option>
            </select>
        </div>
    </div>
</div>