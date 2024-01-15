{assign var="iconsPath" value="./../../../../../../../../templates/{$themeName}/assets/svg-icon"}
<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">
            Icon
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.icon}
        </label>
        <div 
            class="media media--field media--sm" 
            data-menu-item-icon-container 
            data-index="{$index}" 
            data-parent="{$parent}" 
            data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
        >
            <a 
                class="media__upload {if ((isset($settings.icon) && !empty($settings.icon)) || (isset($icon) && !empty($icon))) || ((isset($settings.predefined_icon) && !empty($settings.predefined_icon)) || (isset($predefinedIcon) && !empty($predefinedIcon)))}is-hidden{/if}"
                data-toggle="lu-modal"
                data-target="#menuIconModal"
                data-menu-item-icon-button
                data-menu-item-icon-new
                href="#"
            >
                <div class="media__upload-content">
                    <i class="media__icon ls ls-upload"></i>
                    <strong class="media__title p-md">Click to choose icon</strong>
                </div>
            </a>
            <div 
                class="media__content {if (!isset($settings.icon) || empty($settings.icon)) && (!isset($icon) || empty($icon)) && (!isset($settings.predefined_icon) || empty($settings.predefined_icon)) && (!isset($predefinedIcon) || empty($predefinedIcon))}is-hidden{/if}"
                data-menu-item-icon-content
            >
                <div class="media__body">
                    <i class="{if !$settings.icon && !$icon}is-hidden{/if} {if $settings.icon}{$settings.icon}{elseif $icon}{$icon}{/if}" data-menu-item-icon></i>
                    <div class="media__predefined-icon {if !$settings.predefined_icon && !$predefinedIcon}is-hidden{/if}" data-menu-item-predefined-icon>
                        {if $settings.predefined_icon && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$settings.predefined_icon}")}
                            {include file="{$iconsPath}/{$settings.predefined_icon}"}
                        {elseif $predefinedIcon && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$predefinedIcon}")}
                            {include file="{$iconsPath}/{$predefinedIcon}"}    
                        {/if}
                    </div>
                    <input type="hidden" name="items[{$parent}][{$index}][settings][icon]" value="{if $settings.icon}{$settings.icon}{elseif $icon}{$icon}{/if}" data-menu-item-icon-value>
                    <input type="hidden" name="items[{$parent}][{$index}][settings][predefined_icon]" value="{if $settings.predefined_icon}{$settings.predefined_icon}{elseif $predefinedIcon}{$predefinedIcon}{/if}" data-menu-item-predefined-icon-value>
                </div>
                <div class="media__footer">
                    {if $settings.icon}
                        {assign var="iconName" value="/"|explode:$settings.icon}
                    {elseif $icon}
                        {assign var="iconName" value="/"|explode:$icon}    
                    {elseif $settings.predefined_icon}
                        {assign var="iconName" value="/"|explode:$settings.predefined_icon}
                    {elseif $predefinedIcon}
                        {assign var="iconName" value="/"|explode:$predefinedIcon}    
                    {/if}    
                    <span class="media__name" data-menu-item-icon-name >{$iconName|@end}</span>
                    <span 
                        class="btn btn--icon btn--link btn--xs"
                        data-toggle="lu-modal"
                        data-target="#menuIconModal"
                        data-menu-item-icon-button
                    >
                        <i 
                            class="btn__icon lm lm-pen"
                            data-toggle="lu-tooltip"
                            data-title="{$lang.general.edit}"
                        ></i>
                    </span>
                    <a 
                        class="btn btn--icon btn--link btn--xs" 
                        data-toggle="lu-modal"
                        data-target="#deleteMenuIconModal"
                        data-menu-item-icon-remove
                    >
                        <i 
                            class="btn__icon lm lm-trash"
                            data-toggle="lu-tooltip"
                            data-title="{$lang.general.remove}"
                        ></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>