<div class="inputs-container">
    <div class="inputs-container__section">
        <div class="section">
            <div class="section__header top">
                <h6 class="top__title">
                    {if $level == 1}Sub-{/if}Menu Item
                </h6>
            </div>
            <div class="section__content">
                <div class="well">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">
                                    Type
                                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.type}
                                </label>
                                <select
                                    class="form-control type-{$parent}-{$index} opacity-1"
                                    name="items[{$parent}][{$index}][type]"
                                    data-translation-method="{if !empty($settings['translation-method'])}{$settings['translation-method']}{else}custom{/if}"
                                    data-menu-item-type
                                    data-parent="{$parent}"
                                    data-index="{$index}"
                                    data-level="{$level}"
                                    data-location="{$location}"
                                    data-ajax-url="{$helper->url('Menu@changeType',['templateName'=>$template->getMainName(), 'location' => $location])}"
                                    data-whmcs-var="{$translations['whmcs']}"
                                    data-prev-value="{foreach $types as $type}{if $type->view === $typeView}{$type->name}{/if}{/foreach}"
                                    data-selectize-disable-search
                                    data-icon="{$settings.icon}"
                                    data-predefined-icon="{$settings.predefined_icon}"
                                    data-media="{$settings.media}"
                                    data-predefined-illustration="{$settings.predefined_illustration}"
                                >
                                    
                                    {assign 'sortedTypes' ["WHMCS Page","Custom Link","Homepage","Predefined List","Divider","WHMCS Notifications","Client Account", "Language", "Currency Switcher", "Header"]}
                                    {foreach $sortedTypes as $sType}
                                        {foreach $types as $type}
                                            {if $sType == $type->name}
                                            {if $level == 0 && $type->name !== 'Divider' && $type->name !== 'Predefined List' && $type->name !== "Header"}
                                                {if $location === 'Footer'}
                                                    {if $type->name !== 'WHMCS Notifications' && $type->name !== 'Client Account'}
                                                        <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                                    {/if}
                                                {else}
                                                    <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                                {/if}
                                            {elseif $level == 1 && $type->name !== 'Client Account' && $type->name !== 'Language' && $type->name !== 'WHMCS Notifications' && $type->name !== 'Currency Switcher'}
                                                {if $location === 'Footer'}
                                                    {if $type->name !== 'Divider' && $type->name !== "Header"}
                                                        <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                                    {/if}
                                                {else}
                                                    <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                                {/if}
                                            {/if}
                                            {/if}
                                        {/foreach}
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="item-{$parent}-{$index}-inputs-loader preloader-container is-hidden" data-menu-item-inputs-loader data-index="{$index}" data-parent="{$parent}">
                        <div class="preloader preloader--lg"></div>
                    </div>
                    <div class="item-{$parent}-{$index}-inputs row" data-menu-item-inputs data-index="{$index}" data-parent="{$parent}">
                        {include file="adminarea/menu/includes/types/{$typeView}.tpl" type=$parent translationMethod=$settings['translation-method']}
                    </div>
                </div>    
            </div>    
        </div>    
    </div>
    <div class="inputs-container__section {if $typeView == "divider"}is-hidden{/if}" data-menu-display-settings>
        <div class="section">
            <div class="section__header top collapsed" data-toggle="lu-collapse" data-target="#label-{$parent}-{$index}">
                <h6 class="top__title">Menu Item Label</h6>
                <button type="button" class="top__toolbar btn btn--link">
                    <span class="btn__text">Expand</span>
                    <span class="btn__text">Hide</span>
                    <i class="btn__icon ls ls-down"></i>
                </button>
            </div>    
            <div class="section__content collapse" id="label-{$parent}-{$index}">
                <div class="well">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    Label type
                                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.label_type}
                                </label>
                                <select class="form-control" name="items[{$parent}][{$index}][display][label_type]">
                                    <option value="default" {if $display['label_type'] == 'default'}selected{/if}>Default</option>
                                    <option value="primary" {if $display['label_type'] == 'primary'}selected{/if}>Primary</option>
                                    <option value="primary-faded" {if $display['label_type'] == 'primary-faded'}selected{/if}>Primary Faded</option>
                                    <option value="secondary" {if $display['label_type'] == 'secondary'}selected{/if}>Secondary</option>
                                    <option value="success" {if $display['label_type'] == 'success'}selected{/if}>Success</option>
                                    <option value="info" {if $display['label_type'] == 'info'}selected{/if}>Info</option>
                                    <option value="warning" {if $display['label_type'] == 'warning'}selected{/if}>Warning</option>
                                    <option value="danger" {if $display['label_type'] == 'danger'}selected{/if}>Danger</option>
                                    <option value="savings" {if $display['label_type'] == 'savings'}selected{/if}>Savings</option> 
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="d-flex">
                                    <label class="form-label">
                                        Label text
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.label_text}
                                    </label>
                                    <a class="label-link m-l-a" href="#translationCommonModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false" data-index="{$index}" data-parent="{$parent}" data-title="Label" data-type="items[{$parent}][{$index}][display][label_text]" data-menu-common-translation>
                                        Translate
                                    </a>
                                </div>
                                {assign var="tempLabelText" value=","|explode:$display['label_text']|replace:'}':''|replace:'{':''|replace:'&quot;':''}
                                {if is_array($tempLabelText)}
                                    {foreach $tempLabelText as $text}
                                        {assign var="labelText" value=":"|explode:$text}
                                        {if $labelText[0] == $whmcsLang->value}
                                            {$labelLang = $labelText[1]}
                                        {/if} 
                                    {/foreach}
                                {/if}
                                <input 
                                    type="text" 
                                    class="form-control" 
                                    data-menu-item-common-description
                                    data-type="items[{$parent}][{$index}][display][label_text]" 
                                    data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
                                    value="{$labelLang}"
                                >
                                <input type="hidden" name="items[{$parent}][{$index}][display][label_text]" value="{$display['label_text']}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {if $level == 0 && $location !== 'Footer'}  {* dla poziomu 0 main menu*}
           <div class="section">
                <div class="section__header top collapsed" data-toggle="lu-collapse" data-target="#sub-menu-settings-{$parent}-{$index}">
                    <h6 class="top__title">Sub-Menu Settings</h6>
                    <button type="button" class="top__toolbar btn btn--link">
                        <span class="btn__text">Expand</span>
                        <span class="btn__text">Hide</span>
                        <i class="btn__icon ls ls-down"></i>
                    </button>
                </div>    
                <div class="section__content collapse" id="sub-menu-settings-{$parent}-{$index}" data-submenu-style-container>
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">
                                        Sub-menu style
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.dropdown_style}
                                    </label>
                                    <select data-submenu-style class="form-control opacity-1" name="items[{$parent}][{$index}][display][dropdown]">
                                        <option value="default" {if $display['dropdown'] == 'default'} selected {/if}>Default</option>
                                        <option value="extended" {if $display['dropdown'] == 'extended'} selected {/if}>Extended</option>
                                        <option value="mega" {if $display['dropdown'] == 'mega'} selected {/if}>Mega menu</option>
                                        {* <option value="horizontal" {if $display['dropdown'] == 'horizontal'} selected {/if}>Horizontal</option> *}
                                    </select>
                                </div>
                            </div>
                            <div data-submenu-style-content class="flex-1 {if $display['dropdown'] != 'mega'}is-hidden{/if}">
                                {include file="adminarea/menu/includes/components/icon.tpl" type="dropdown_graphic"}
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="d-flex">
                                            <label class="form-label">
                                                Sub-menu description
                                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.dropdown_description}
                                            </label>
                                            <a class="label-link m-l-a" href="#translationCommonModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false" data-index="{$index}" data-parent="{$parent}" data-title="Label" data-type="items[{$parent}][{$index}][display][dropdown_description]" data-menu-common-translation>
                                                Translate
                                            </a>
                                        </div>
                                        {assign var="tempDropdownDescription" value=","|explode:$display['dropdown_description']|replace:'}':''|replace:'{':''|replace:'&quot;':''}
                                        {if is_array($tempDropdownDescription)}
                                            {foreach $tempDropdownDescription as $text}
                                                {assign var="dropdownDescription" value=":"|explode:$text}
                                                {if $dropdownDescription[0] == $whmcsLang->value}
                                                    {$dropdownDescriptionLang = $dropdownDescription[1]}
                                                {/if} 
                                            {/foreach}
                                        {/if}
                                        <textarea 
                                            type="text" 
                                            class="form-control" 
                                            data-menu-item-common-description
                                            data-type="items[{$parent}][{$index}][display][dropdown_description]" 
                                            data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
                                            value="{$dropdownDescriptionLang}"
                                        >{$dropdownDescriptionLang}</textarea>
                                        <input type="hidden" name="items[{$parent}][{$index}][display][dropdown_description]" value="{$display['dropdown_description']}">
                                    </div>
                                </div>
                            </div>    
                        </div>    
                    </div>
                </div>        
            </div>           
        {/if} 
        
        <div class="section">
             <div class="section__header top collapsed" data-toggle="lu-collapse" data-target="#item-display-settings-{$parent}-{$index}">
                <h6 class="top__title">{if $level == 1}Sub-{/if}Menu Item Display Settings</h6>
                 <button type="button" class="top__toolbar btn btn--link">
                    <span class="btn__text">Expand</span>
                    <span class="btn__text">Hide</span>
                    <i class="btn__icon ls ls-down"></i>
                </button>
            </div>
            <div class="section__content collapse" id="item-display-settings-{$parent}-{$index}">
                <div class="well">
                    <div class="item-{$parent}-{$index}-settings row">
                        {if $level == 0 && $location !== 'Footer'} {*dla poziomu 0 i dla main menu i dla secondary menu*}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        Theme Layout
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.theme_layout}
                                    </label>
                                    <select class="form-control multiselect form-control--basic opacity-1" data-menu-layout name="items[{$parent}][{$index}][display][theme-layout][]" multiple>
                                        <option value="All" {if (isset($display['theme-layout']) && !is_array($display['theme-layout']) && is_array($display['theme-layout']) && in_array('All', explode(',', $display['theme-layout']))) || (is_array($display['theme-layout']) && in_array('All', $display['theme-layout'])) || !isset($display['theme-layout'])} selected {/if}>All</option>
                                        <option value="Default"{if (isset($display['theme-layout']) && !is_array($display['theme-layout']) && is_array($display['theme-layout']) && in_array('Default', explode(',', $display['theme-layout']))) || (is_array($display['theme-layout']) && in_array('Default', $display['theme-layout']))} selected {/if}>Default</option>
                                        <option value="Condensed" {if (isset($display['theme-layout']) && !is_array($display['theme-layout']) && is_array($display['theme-layout']) && in_array('Condensed', explode(',', $display['theme-layout']))) || (is_array($display['theme-layout']) && in_array('Condensed', $display['theme-layout']))} selected {/if}>Condensed</option>
                                        <option value="Left" {if (isset($display['theme-layout']) && !is_array($display['theme-layout']) && is_array($display['theme-layout']) && in_array('Left', explode(',', $display['theme-layout']))) || (is_array($display['theme-layout']) && in_array('Left', $display['theme-layout']))} selected {/if}>Left</option>
                                    </select>
                                </div>
                            </div>
                        {/if}
                        <div class="col-md-6"> {*zawsze*}
                            <div class="form-group">
                                <label class="form-label">
                                    Client Status
                                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.client_status}
                                </label>
                                <select class="form-control menu-item-type type-{$parent}-{$index} opacity-1" name="items[{$parent}][{$index}][display][client-status]">
                                    <option value="All" {if $display['client-status'] == 'All'} selected {/if}>All</option>
                                    <option value="Logged-In" {if $display['client-status'] == 'Logged-In'} selected {/if}>Logged in Client</option>
                                    <option value="Logged-Out" {if $display['client-status'] == 'Logged-Out'} selected {/if}>Logged out Client</option>
                                </select>
                            </div>
                        </div>
                        {if $level == 0 && $location !== 'Footer'} {*dla poziomu 0 i dla main menu i dla secondary menu*}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        Style for Top Menu Layout
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.style_for_top_menu_layout}
                                    </label>
                                    <select class="form-control opacity-1" data-menu-style name="items[{$parent}][{$index}][display][style][top][layout]" data-parent="{$parent}" data-index="{$index}" data-style="top">
                                        <option value="text" {if $display['style']['top']['layout'] == 'text'} selected {/if}>Text only</option>
                                        <option value="icon-text" {if $display['style']['top']['layout'] == 'icon-text'} selected {/if}>Text with icon</option>
                                        <option value="icon" {if $display['style']['top']['layout'] == 'icon'} selected {/if}>Icon only</option>
                                        {if $typeView != "whmcs-notifications" && $typeView != "language"}
                                            <option value="button" {if $display['style']['top']['layout'] == 'button'} selected {/if}>Button</option>
                                        {/if}
                                    </select>
                                </div>
                                <div
                                    class="form-group {if $display['style']['top']['layout'] !== 'button' }is-hidden{/if}"
                                    data-menu-button-style="top"
                                    data-parent="{$parent}"
                                    data-index="{$index}"
                                >
                                    <label class="form-label">
                                        Button Style for Top Menu Layout
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.button_style_for_top_menu_layout}
                                    </label>
                                    <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][style][top][button-style]">
                                        <option value="primary" {if $display['style']['top']['button-style'] == 'primary'} selected {/if}>Primary</option>
                                        <option value="secondary" {if $display['style']['top']['button-style'] == 'secondary'} selected {/if}>Secondary</option>
                                        <option value="primary-faded" {if $display['style']['top']['button-style'] == 'primary-faded'} selected {/if}>Primary Faded</option>
                                        <option value="outline" {if $display['style']['top']['button-style'] == 'outline'} selected {/if}>Outline</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        Style for Left Menu Layout
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.style_for_left_menu_layout}
                                    </label>
                                    <select class="form-control opacity-1" data-menu-style name="items[{$parent}][{$index}][display][style][left][layout]" data-parent="{$parent}" data-index="{$index}" data-style="left">
                                        <option value="text" {if $display['style']['left']['layout'] == 'text'} selected {/if}>Text only</option>
                                        <option value="icon-text" {if $display['style']['left']['layout'] == 'icon-text' || !$display['style']['left']['layout']} selected {/if}>Text with icon</option>
                                        <option value="icon" {if $display['style']['left']['layout'] == 'icon'} selected {/if}>Icon only</option>
                                        {if $typeView != "whmcs-notifications" && $typeView != "language"}
                                            <option value="button" {if $display['style']['left']['layout'] == 'button'} selected {/if}>Button</option>
                                        {/if}
                                    </select>
                                </div>
                                <div
                                    class="form-group {if $display['style']['left']['layout'] !== 'button' }is-hidden{/if}"
                                    data-menu-button-style="left"
                                    data-parent="{$parent}"
                                    data-index="{$index}"
                                >
                                    <label class="form-label">
                                        Button Style for Left Menu Layout
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.button_style_for_left_menu_layout}
                                    </label>
                                    <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][style][left][button-style]">
                                        <option value="primary" {if $display['style']['left']['button-style'] == 'primary'} selected {/if}>Primary</option>
                                        <option value="secondary" {if $display['style']['left']['button-style'] == 'secondary'} selected {/if}>Secondary</option>
                                        <option value="primary-faded" {if $display['style']['left']['button-style'] == 'primary-faded'} selected {/if}>Primary Faded</option>
                                        <option value="outline" {if $display['style']['left']['button-style'] == 'outline'} selected {/if}>Outline</option>
                                    </select>
                                </div>
                            </div>
                        {/if}
                        {if $level == 0 && $location == 'Main Menu'} {*dla poziomu 0 i dla main menu*}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        Position
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.position}
                                    </label>
                                    <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][position]" data-menu-change-position>
                                        <option value="left" {if $display['position'] == 'left'} selected {/if}>Left</option>
                                        <option value="right" {if $display['position'] == 'right'} selected {/if}>Right</option>
                                    </select>
                                </div>
                            </div>
                        {/if}
                        
                        {if $level == 1 || ($level == 0 && $location == 'Footer')} {* dla poziomu 1*}
                            <div class="col-md-6 {if $typeView == "header"}is-hidden{/if}" data-menu-item-style>
                                <div class="form-group">
                                    <label class="form-label">
                                        Style
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.style}
                                    </label>
                                    
                                    <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][style][layout]">
                                        <option value="icon-text" {if $display['style']['layout'] == 'icon-text'} selected {/if}>Text with icon</option>
                                        <option value="text" {if $display['style']['layout'] == 'text' || (!$display['style']['layout'] && $location == 'Footer' && $level == 0)} selected{/if}>Text</option>
                                        <option value="icon" {if $display['style']['layout'] == 'icon'} selected {/if}>Icon only</option>
                                    </select>
                                </div>
                            </div>
                        {/if}
                        {if $level == 0 && $location === 'Footer'} {* tylko dla footera dla poziomu 0*}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">
                                        Footer Position
                                        {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.footer_position}
                                    </label>
                                    <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][footer-position]" data-menu-change-position data-menu-footer-position>
                                        <option value="Primary" {if $display['footer-position'] === 'Primary'}selected{/if}>Primary</option>
                                        <option value="Secondary" {if $display['footer-position'] === 'Secondary'}selected{/if}>Secondary</option>
                                        <option value="Social" {if $display['footer-position'] === 'Social'}selected{/if}>Social</option>
                                    </select>
                                </div>
                            </div>
                        {/if}
                        <div class="col-md-6 {if $typeView == "predefined-list"}is-hidden{/if}" data-menu-custom-classes>
                            <div class="form-group">
                                <label class="form-label">
                                    Custom Classes
                                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.custom_classes}
                                </label>
                                <input type="text" class="form-control" name="items[{$parent}][{$index}][display][custom-data-classes]" value="{$display['custom-data-classes']}">
                            </div>
                        </div>
                        <div class="col-md-12 {if $typeView == "predefined-list" || $typeView == "header"}is-hidden{/if}" data-menu-target-blank>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group d-flex">
                                        <label class="form-label text-default form-text flex-grow-1"">
                                            Target Blank
                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.target_blank}
                                        </label>
                                        <label class="switch switch--primary">
                                            <input type="hidden" name="items[{$parent}][{$index}][display][target]" value="0">
                                            <input class="switch__checkbox mode-display" name="items[{$parent}][{$index}][display][target]" value="1" type="checkbox" {if $display['target']}checked="checked"{/if}>
                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </div>        
    </div>
</div>
<div class="item-{$parent}-{$index}-hidden-inputs">
    <input type="hidden" class="{if $level == 0}parent-order{elseif $level == 1}child-order{/if}" name="items[{$parent}][{$index}][order]" value="{$order}" data-item-order>
    <input type="hidden" class="item-level" name="items[{$parent}][{$index}][level]" value="{$level}">
    <input type="hidden" class="item-parent" name="items[{$parent}][{$index}][parent]" value={$parent}>
</div>