{assign var="iconsPath" value="./../../../../../../../../templates/{$themeName}/assets"}
<div class="col-md-12">
    <div class="form-group">
        <label class="form-label">
            {if $type=="dropdown_graphic"}
                Sub-menu graphic
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.dropdown_graphic}
            {else}
                Icon
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.icon}
            {/if}
        </label>
        <div 
            class="media media--field media--xs" 
            data-menu-item-icon-container 
            data-index="{$index}" 
            data-parent="{$parent}" 
            data-assets-url="{$whmcsURL}/templates/{$themeName}/assets"
            {if $type=="dropdown_graphic"}
                data-menu-item-icon-type="dropdown"
            {/if}
        >
            {$hasIcon = false}

            {if $type=="dropdown_graphic"}
                {if 
                    (isset($display['dropdown_graphic']['icon']) && !empty($display['dropdown_graphic']['icon'])) ||
                    (isset($display['dropdown_graphic']['predefined_icon']) && !empty($display['dropdown_graphic']['predefined_icon'])) ||
                    (isset($display['dropdown_graphic']['predefined_illustration']) && !empty($display['dropdown_graphic']['predefined_illustration'])) || 
                    (isset($display['dropdown_graphic']['media']) && !empty($display['dropdown_graphic']['media']))
                }
                    {$hasIcon = true}
                {/if}
            {else}
                {if (
                        (isset($settings.icon) && !empty($settings.icon)) || 
                        (isset($icon) && !empty($icon))
                    ) || (
                        (isset($settings.predefined_icon) && !empty($settings.predefined_icon)) || 
                        (isset($predefinedIcon) && !empty($predefinedIcon))
                    ) || (
                        (isset($settings.predefined_illustration) && !empty($settings.predefined_illustration)) || 
                        (isset($predefinedIllustration) && !empty($predefinedIllustration))
                    ) || (
                        (isset($settings.media) && !empty($settings.media)) || 
                        (isset($settingsMedia) && !empty($settingsMedia))
                    )
                }
                    {$hasIcon = true}
                {/if}
            {/if}
            <a 
                class="media__upload {if $hasIcon}is-hidden{/if}"
                data-toggle="lu-modal"
                data-target="#menuIconModal"
                data-menu-item-icon-button
                data-menu-item-icon-new
                href="#"
            >
                <div class="media__upload-content">
                    <span class="media__title">No icon assigned</span>
                    <span class="btn btn--sm btn--link">
                        <span class="btn__icon">
                            <svg width="13" height="12" viewBox="0 0 13 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_6693_2419)">
                                    <path d="M12.35 7.64999L9.85004 5.14999C9.80515 5.10216 9.75093 5.06404 9.69073 5.03798C9.63053 5.01192 9.56563 4.99847 9.50004 4.99847C9.43444 4.99847 9.36954 5.01192 9.30934 5.03798C9.24914 5.06404 9.19493 5.10216 9.15003 5.14999L5.50003 8.78999L3.85003 7.14999C3.80514 7.10216 3.75093 7.06404 3.69073 7.03798C3.63053 7.01192 3.56563 6.99847 3.50003 6.99847C3.43444 6.99847 3.36954 7.01192 3.30934 7.03798C3.24914 7.06404 3.19493 7.10216 3.15003 7.14999L0.650035 9.64999C0.601998 9.69464 0.563835 9.74884 0.538002 9.80912C0.512168 9.8694 0.499236 9.93442 0.500035 9.99999V11.5C0.500035 11.6326 0.552713 11.7598 0.646482 11.8535C0.74025 11.9473 0.867427 12 1.00003 12H12C12.1326 12 12.2598 11.9473 12.3536 11.8535C12.4474 11.7598 12.5 11.6326 12.5 11.5V7.99999C12.5008 7.93442 12.4879 7.8694 12.4621 7.80912C12.4362 7.74884 12.3981 7.69464 12.35 7.64999Z" fill="#1062FE"/>
                                    <path d="M4.5 4C5.60457 4 6.5 3.10457 6.5 2C6.5 0.89543 5.60457 0 4.5 0C3.39543 0 2.5 0.89543 2.5 2C2.5 3.10457 3.39543 4 4.5 4Z" fill="#1062FE"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_6693_2419">
                                    <rect width="12" height="12" fill="white" transform="translate(0.5)"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </span>
                        <span class="btn__text">Assign icon</span>
                    </span>
                </div>
            </a>
            <div 
                class="media__content {if !$hasIcon}is-hidden{/if}"
                data-menu-item-icon-content
            >
                <div class="media__body">
                    {if $type=="dropdown_graphic"}
                        <i class="{if !$display['dropdown_graphic']['icon']}is-hidden{/if} {if $display['dropdown_graphic']['icon']}{$display['dropdown_graphic']['icon']}{/if}" data-menu-item-icon></i>   
                        <div class="media__predefined-icon {if !$display['dropdown_graphic']['predefined_icon'] && !$display['dropdown_graphic']['predefined_illustration'] && !$display['dropdown_graphic']['media']}is-hidden{/if}" data-menu-item-predefined-icon>
                            {if $display['dropdown_graphic']['predefined_icon'] && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$display['dropdown_graphic']['predefined_icon']}")}
                                {include file="{$iconsPath}/svg-icon/{$display['dropdown_graphic']['predefined_icon']}"}
                            {/if}
                            {if $display['dropdown_graphic']['predefined_illustration'] && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$display['dropdown_graphic']['predefined_illustration']}")}
                                {include file="{$iconsPath}/svg-illustrations/{$display['dropdown_graphic']['predefined_illustration']}"}
                            {/if}
                            {if $display['dropdown_graphic']['media']}
                                <img src="{$whmcsURL}/templates/{$themeName}/assets/img/page-manager/{$display['dropdown_graphic']['media']}" alt={$display['dropdown_graphic']['media']}/> 
                            {/if}
                        </div>
                        <input type="hidden" name="items[{$parent}][{$index}][display][dropdown_graphic][icon]" value="{$display['dropdown_graphic']['icon']}" data-menu-item-icon-value>
                        <input type="hidden" name="items[{$parent}][{$index}][display][dropdown_graphic][predefined_icon]" value="{$display['dropdown_graphic']['predefined_icon']}" data-menu-item-predefined-icon-value>
                        <input type="hidden" name="items[{$parent}][{$index}][display][dropdown_graphic][predefined_illustration]" value="{$display['dropdown_graphic']['predefined_illustration']}" data-menu-item-predefined-illustration-value>
                        <input type="hidden" name="items[{$parent}][{$index}][display][dropdown_graphic][media]" value="{$display['dropdown_graphic']['media']}" data-menu-item-media-value>
                    {else}
                        <i class="{if !$settings.icon && !$icon}is-hidden{/if} {if $settings.icon}{$settings.icon}{elseif $icon}{$icon}{/if}" data-menu-item-icon></i>
                        <div class="media__predefined-icon {if !$settings.predefined_icon && !$predefinedIcon && !$settings.predefined_illustration && !$predefinedIllustration && !$settings.media && !$settingsMedia}is-hidden{/if}" data-menu-item-predefined-icon>
                            {if $settings.predefined_icon && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$settings.predefined_icon}")}
                                {include file="{$iconsPath}/svg-icon/{$settings.predefined_icon}"}
                            {elseif $predefinedIcon && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-icon/{$predefinedIcon}")}
                                {include file="{$iconsPath}/svg-icon/{$predefinedIcon}"}    
                            {/if}
                            {if $settings.predefined_illustration && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$settings.predefined_illustration}")}
                                {include file="{$iconsPath}/svg-illustrations/{$settings.predefined_illustration}"}
                            {elseif $predefinedIllustration && file_exists("{$whmcsDir}/templates/{$themeName}/assets/svg-illustrations/{$predefinedIllustration}")}
                                {include file="{$iconsPath}/svg-illustrations/{$predefinedIllustration}"}    
                            {/if}
                            {if $settings.media}
                                <img src="{$whmcsURL}/templates/{$themeName}/assets/img/page-manager/{$settings.media}" alt={$settings.media}/> 
                            {elseif $settingsMedia}
                                <img src="{$whmcsURL}/templates/{$themeName}/assets/img/page-manager/{$settingsMedia}" alt={$settingsMedia}/> 
                            {/if}
                        </div>
                        <input type="hidden" name="items[{$parent}][{$index}][settings][icon]" value="{if $settings.icon}{$settings.icon}{elseif $icon}{$icon}{/if}" data-menu-item-icon-value>
                        <input type="hidden" name="items[{$parent}][{$index}][settings][predefined_icon]" value="{if $settings.predefined_icon}{$settings.predefined_icon}{elseif $predefinedIcon}{$predefinedIcon}{/if}" data-menu-item-predefined-icon-value>
                        <input type="hidden" name="items[{$parent}][{$index}][settings][predefined_illustration]" value="{if $settings.predefined_illustration}{$settings.predefined_illustration}{elseif $predefinedIllustration}{$predefinedIllustration}{/if}" data-menu-item-predefined-illustration-value>
                        <input type="hidden" name="items[{$parent}][{$index}][settings][media]" value="{if $settings.media}{$settings.media}{elseif $settingsMedia}{$settingsMedia}{/if}" data-menu-item-media-value>
                    {/if}
                </div>
                <div class="media__footer">
                    {if $type=="dropdown_graphic"}
                        {if $display['dropdown_graphic']['icon']}
                            {assign var="iconName" value="/"|explode:$display['dropdown_graphic']['icon']}
                        {elseif $display['dropdown_graphic']['predefined_icon']}
                            {assign var="iconName" value="/"|explode:$display['dropdown_graphic']['predefined_icon']}
                        {elseif $display['dropdown_graphic']['predefined_illustration']}    
                            {assign var="iconName" value="/"|explode:$display['dropdown_graphic']['predefined_illustration']}
                        {elseif $display['dropdown_graphic']['media']}    
                            {assign var="iconName" value="/"|explode:$display['dropdown_graphic']['media']}      
                        {/if}   
                    {else}
                        {if $settings.icon}
                            {assign var="iconName" value="/"|explode:$settings.icon}
                        {elseif $icon}
                            {assign var="iconName" value="/"|explode:$icon}    
                        {elseif $settings.predefined_icon}
                            {assign var="iconName" value="/"|explode:$settings.predefined_icon}
                        {elseif $predefinedIcon}
                            {assign var="iconName" value="/"|explode:$predefinedIcon}    
                        {elseif $settings.predefined_illustration}    
                            {assign var="iconName" value="/"|explode:$settings.predefined_illustration}
                        {elseif $settings.media}    
                            {assign var="iconName" value="/"|explode:$settings.media}    
                        {elseif $settingsMedia}    
                            {assign var="iconName" value="/"|explode:$settingsMedia}        
                        {/if}    
                    {/if}
                    
                    <span class="media__name" 
                        data-menu-item-icon-name 
                        data-toggle="lu-modal"
                        data-target="#menuIconModal"
                        data-menu-item-icon-button
                    >
                        {if $iconName && is_array($iconName)}{$iconName|@end}{/if}
                    </span>
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