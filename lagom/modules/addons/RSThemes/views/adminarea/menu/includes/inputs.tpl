<div class="inputs-container">
    <div>
        <h5 class="inside-item-heading">Menu Item Settings</h5>
        <div class="row">
            <div class="col-md-6">
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
                    >
                        {foreach $types as $type}
                            {if $level == 0 && $type->name !== 'Divider' && $type->name !== 'Predefined List'}
                                {if $location === 'Footer'}
                                    {if $type->name !== 'WHMCS Notifications' && $type->name !== 'Client Account'}
                                        <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                    {/if}
                                {else}
                                    <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                {/if}
                            {elseif $level == 1 && $type->name !== 'Client Account' && $type->name !== 'Language' && $type->name !== 'WHMCS Notifications' && $type->name !== 'Currency Switcher'}
                                {if $location === 'Footer'}
                                    {if $type->name !== 'Divider'}
                                        <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                    {/if}
                                {else}
                                    <option value="{$type->name}" {if $type->view === $typeView} selected {/if}>{$type->name}</option>
                                {/if}
                            {/if}
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
    <div data-menu-display-settings {if $typeView == "divider"}class="is-hidden"{/if}>
        {*TODO schować fieldy w zależności od typu: np dla poziomu pierwszego dla typu notyfikacji nie potrzebujemy pol style for top/left menu*}
        {*TODO dla drugiego poziomu np przytypach: predefined list, notyfications oraz divider nie potrzebujemy pola style, wydaje mi sie ze najlepiej to js jakos ogarnac *}
        <h5 class="inside-item-heading">Display Settings</h5>
        <div class="item-{$parent}-{$index}-settings row">
            {if $level == 0 && $location !== 'Footer'} {*dla poziomu 0 i dla main menu i dla secondary menu*}
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">
                            Theme Layout
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.theme_layout}
                        </label>
                        <select class="form-control multiselect form-control--basic opacity-1" data-menu-layout name="items[{$parent}][{$index}][display][theme-layout][]" multiple>
                            <option value="All" {if (isset(explode(',', $display['theme-layout'])) && in_array('All', explode(',', $display['theme-layout']))) || in_array('All', $display['theme-layout']) || !isset($display['theme-layout'])} selected {/if}>All</option>
                            <option value="Default"{if (isset(explode(',', $display['theme-layout'])) && in_array('Default', explode(',', $display['theme-layout']))) || in_array('Default', $display['theme-layout'])} selected {/if}>Default</option>
                            <option value="Condensed" {if (isset(explode(',', $display['theme-layout'])) && in_array('Condensed', explode(',', $display['theme-layout']))) || in_array('Condensed', $display['theme-layout'])} selected {/if}>Condensed</option>
                            <option value="Left" {if (isset(explode(',', $display['theme-layout'])) && in_array('Left', explode(',', $display['theme-layout']))) || in_array('Left', $display['theme-layout'])} selected {/if}>Left</option>
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
                            {if $location != "Secondary Menu"}
                                <option value="text" {if $display['style']['top']['layout'] == 'text'} selected {/if}>Text</option>
                            {/if}
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
                            <option value="text" {if $display['style']['left']['layout'] == 'text'} selected {/if}>Text</option>
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
            {if $level == 0 && $location !== 'Footer'} {* dla poziomu 0 *}
                {*<div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">
                            Dropdown Style
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_items.dropdown_style}
                        </label>
                        <select class="form-control opacity-1" name="items[{$parent}][{$index}][display][dropdown]">
                            <option value="default" {if $display['dropdown'] == 'left'} selected {/if}>Default</option>
                            <option value="mega-menu" {if $display['dropdown'] == 'mega-menu'} selected {/if}>Mega-Menu</option>
                        </select>
                    </div>
                </div>*}
            {/if}
            {if $level == 1 || ($level == 0 && $location == 'Footer')} {* dla poziomu 1*}
                <div class="col-md-6" data-menu-item-style>
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
            <div class="col-md-12 {if $typeView == "predefined-list"}is-hidden{/if}" data-menu-target-blank>
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
<div class="item-{$parent}-{$index}-hidden-inputs">
    <input type="hidden" class="{if $level == 0}parent-order{elseif $level == 1}child-order{/if}" name="items[{$parent}][{$index}][order]" value="{$order}" data-item-order>
    <input type="hidden" class="item-level" name="items[{$parent}][{$index}][level]" value="{$level}">
    <input type="hidden" class="item-parent" name="items[{$parent}][{$index}][parent]" value={$parent}>
</div>
