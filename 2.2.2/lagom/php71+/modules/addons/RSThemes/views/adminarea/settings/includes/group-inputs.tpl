<div class=" collapse-toggle d-flex">
    <h6 class="top__title">
        {$label}
        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltip}
    </h6>
    <label class="m-b-0x">
        <div class="switch" data-toggle="lu-collapse" data-target="#{$switchId}" aria-expanded="true">
            <input type="hidden" name="group_inputs[{$name}][visibility]" value="0"/>
            <input class="switch__checkbox group-input-visibility" name="group_inputs[{$name}][visibility]" value="1" type="checkbox"
                    {if isset($value) && $value !== 'displayed'} checked="checked" {/if} data-name="{$name}">
            <span class="switch__container"><span class="switch__handle"></span></span>
        </div>
    </label>
</div>
<div class="collapse {if isset($value) && $value !== 'displayed'} show {/if}" id="{$switchId}">
    <div class="form-group m-b-0x">
        <div class="group_inputs_{$name}" style="display: {if isset($value) && $value !== 'displayed'} block {else} none {/if};">
            <div class="d-flex flex-column">
                <div class="form-check  m-b-3x">
                    <label class="m-b-0x">
                        <input class="group-radio form-radio" type="radio" name="group_inputs[{$name}][group_selection]" value="all"
                            data-name="{$name}" {if is_null($value) || $value === 'displayed' || $value === $allGroups} checked {/if}>
                        <span class="form-indicator"></span>
                        <span class="form-text">{$lang.settings.section.order_process.hide_product_common.hide_all}</span>
                    </label>
                </div>
                <div class="form-check m-b-0x">
                    <label class="m-b-0x">
                        <input class="group-radio form-radio" type="radio" name="group_inputs[{$name}][group_selection]" value="groups"
                            data-name="{$name}" {if isset($value) && $value !== 'displayed' && $value !== $allGroups && !empty($value)} checked {/if}>
                        <span class="form-indicator"></span>
                        <span class="form-text">{$lang.settings.section.order_process.hide_product_common.hide_selected}</span>
                    </label>
                </div>
            </div>
            <div class="form-group m-l-4x p-0x m-t-3x m-b-0x group_select_{$name}" style="display: {if isset($value) && $value !== $allGroups && !empty($value)} block {else} none {/if};">
                <label class="form-text" for="group_select_{$name}">{$lang.settings.section.order_process.hide_product_common.choose_product_groups}</label>  
                <select id="group_select_{$name}" class="form-control multiselect form-control--basic group-multi-select" name="group_inputs[{$name}][groups][]" multiple required>
                    {foreach $productGroups as $productGroup}
                        <option value="{$productGroup->id}" {if isset($value) && $value !== 'displayed' && in_array($productGroup->id, explode(',', $value))} selected {/if}>{if $productGroup->isHidden}[Hidden] {/if}{$productGroup->name}</option>
                    {/foreach}
                </select>
            </div>
            {if isset($customHostname) && $customHostname}
                <div class="form-group d-flex m-t-3x p-0x">
                    <span class="form-label text-default form-text m-b-0x m-r-6x">
                        {$lang.settings.section.order_process.hide_product_hostname.custom_hostname}
                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.hide_product_hostname.use_custom_hostname}
                    </span>
                    <label>
                        <div class="switch switch--primary">
                            <input type="hidden" name="settings[enable_custom_hostname]" value="0">
                            <input class="switch__checkbox custom-hostname" name="settings[enable_custom_hostname]" value="1" type="checkbox" {if $settings['enable_custom_hostname']} checked="checked" {/if}>
                            <span class="switch__container"><span class="switch__handle"></span></span>
                        </div>
                    </label>
                </div>
                <div class="custom-hostname-group" style="display: {if $settings['enable_custom_hostname']} block {else} none {/if}">                    
                    <div class="form-group">
                        <label class="form-text">
                            {$lang.settings.section.order_process.hide_product_hostname.interfix}
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.hide_product_hostname.interfix}
                        </label>
                        <input class="form-control" name="hostname_settings[custom_hostname_interfix_length]" type="number" min="8" max="50"
                            value="{$settings['custom_hostname_interfix_length']}" data-hostname-input lu-required {if !$settings['enable_custom_hostname']}disabled{/if}>
                        <span class="form-feedback is-hidden">{$lang.general.field_required}</span>   
                    </div>
                    <div class="form-group">
                        <label class="form-text">
                            {$lang.settings.section.order_process.hide_product_hostname.prefix}
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.hide_product_hostname.prefix}
                        </label>
                        <input class="form-control" name="hostname_settings[custom_hostname_prefix]" type="text"
                            value="{$settings['custom_hostname_prefix']}" data-hostname-input lu-required {if !$settings['enable_custom_hostname']}disabled{/if}>
                        <span class="form-feedback is-hidden">{$lang.general.field_required}</span>    
                    </div>
                    <div class="form-group">
                        <label class="form-text">
                            {$lang.settings.section.order_process.hide_product_hostname.suffix}
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.order_process.hide_product_hostname.suffix}
                        </label>
                        <input class="form-control" name="hostname_settings[custom_hostname_suffix]" type="text" pattern="^\.[a-zA-z.]+"
                            value="{$settings['custom_hostname_suffix']}" data-hostname-input lu-required {if !$settings['enable_custom_hostname']}disabled{/if}>
                        <span class="form-feedback is-hidden">{$lang.general.field_required}</span>   
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>