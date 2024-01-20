<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.order_process.product_package_settings.title}
        </h6>
    </div>
    <div class="collapse show">
        {* <div class="form-group d-flex p-3x">
            <span class="form-label text-default form-text m-r-6x m-b-0x">
                {$lang.settings.section.order_process.product_package_settings.label_auto_width}
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.product_package_settings.auto_adjust_package_width}
            </span>    
            <label>
                <div class="switch switch--primary">
                    <input type="hidden" name="settings[auto_recalculate_package_width]" value="0"/>
                    <input class="switch__checkbox" name="settings[auto_recalculate_package_width]"
                            value="1" type="checkbox" {if $settings['auto_recalculate_package_width']} checked="checked" {/if}>
                    <span class="switch__container">
                        <span class="switch__handle"></span>
                    </span>
                </div>
            </label>
        </div> *}
        <div class="form-group p-t-3x" >
            <label class="form-label">
                {$lang.settings.section.order_process.product_package_settings.label_price}
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.product_package_settings.package_price}
            </label>
            <select class="form-control selectized opacity-1" name="settings[package_price_wrap]" tabindex="-1">
                <option value="default" {if $settings['package_price_wrap'] == 'default'} selected {/if}>{$lang.settings.section.order_process.product_package_settings.price_wrap.default}</option>
                <option value="break-all" {if $settings['package_price_wrap'] == 'break-all'} selected {/if}>{$lang.settings.section.order_process.product_package_settings.price_wrap.break_all}</option>
            </select>
        </div>
    </div>
</div>