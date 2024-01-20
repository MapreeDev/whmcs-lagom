<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.homepage_price_display.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.homepage_price_display}
        </h6>
        <label>
            <div class="switch">
                <input type="hidden" name="settings[display_longest_billing_cycle_monthly_price]" value="0"/>
                <input class="switch__checkbox"
                        name="settings[display_longest_billing_cycle_monthly_price]"
                        value="1"
                        type="checkbox" {if $settings['display_longest_billing_cycle_monthly_price']} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
</div>