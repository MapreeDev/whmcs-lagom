{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <form 
        id="settingsForm" 
        action="{$helper->url('Template@saveSettings',['templateName'=>$template->getMainName()])}" 
        method="POST" 
        data-check-unsaved-changes
    >
        <input type="hidden" name="settings_tab" value="{if $smarty.get.settingsTab}{$smarty.get.settingsTab}{else}settings-general{/if}"> 
       
        <div class="section">
            <div class="d-flex">
                <div class="app-main__sidebar">
                    <div class="tabs tabs--block m-w-200 is-sticky">
                        <div 
                            class="tabs__nav"
                            data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;"
                        >
                            {include file="adminarea/settings/includes/tabs.tpl"}   
                        </div>
                    </div>
                </div>
                <div class="app-main__content">
                    <div class="tabs__body">
                        <div class="tab-content">
                            {* Tab DisplayRules *}
                            {if \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                                {include file="adminarea/settings/includes/display-rule.tpl"}
                            {/if}
                           
                            {* Tab General Settings *}
                            <div class="tab-pane {if $smarty.get.settingsTab == 'settings-general' || (!\RSThemes\Helpers\ContentChecker::checkCmsInstalled() && !isset($smarty.get.settingsTab))} is-active {/if}" id="settings-general">
                                <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{$lang.settings.section.general.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.settings.general_settings}</h3>
                                        
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="app-main__content">
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    {* Custom Logo URL *}
                                                    {include file="adminarea/settings/includes/custom-logo-url.tpl"}   
                                                    
                                                    {* Display Mode Switcher *}
                                                    {include file="adminarea/settings/includes/display-mode-switcher.tpl"}   

                                                    {* Homepage Price Display *}
                                                    {*{include file="adminarea/settings/includes/homepage-price-display.tpl"}*}
                                                    
                                                    {* Sticky Sidebars *}
                                                    {include file="adminarea/settings/includes/sticky-sidebars.tpl"}  
                                                    
                                                    {* Gravatar *}
                                                    {include file="adminarea/settings/includes/gravatar.tpl"}

                                                    {* Affixed Navigation *}
                                                    {include file="adminarea/settings/includes/affixed_navigation.tpl"}

                                                    {* Mobile Menu Style *}
                                                    {include file="adminarea/settings/includes/mobile-menu-style.tpl"}

                                                    {* Cookie box *}
                                                    {include file="adminarea/settings/includes/cookie-box.tpl"}

                                                    {* Display Free Oroduct Price *}
                                                    {include file="adminarea/settings/includes/free-product-price.tpl"}

                                                    {* Display Status Icons *}
                                                    {include file="adminarea/settings/includes/show-status-icon.tpl"}

                                                    {* Table Filter Cache Duration *}
                                                    {include file="adminarea/settings/includes/table-filter-cache-duration.tpl"}

                                                    {* Show Client ID *}
                                                    {include file="adminarea/settings/includes/show-client-id.tpl"}
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>

                            {* Tab Order Process Settings *}
                            <div class="tab-pane {if $smarty.get.settingsTab == 'settings-order'} is-active {/if}" id="settings-order">
                                <div class="t-c__top top" data-top-search
                                     data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{$lang.settings.section.order_process.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.settings.order_process_settings}</h3>
                                        
                                    </div>
                                </div>
                                <div class="d-flex">
                                    <div class="app-main__content">
                                        <div class="section">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    {* Product Package Settings *}
                                                    {include file="adminarea/settings/includes/product-package-settings.tpl"}

                                                    {* Product Price Settings *}
                                                    {include file="adminarea/settings/includes/product-price-settings.tpl"}
                                                    
                                                    {* Product Nameservers *}
                                                    <div class="panel panel--collapse">
                                                        {include file="adminarea/settings/includes/group-inputs.tpl"
                                                        switchId= 'name-field'
                                                        title=$lang.settings.section.order_process.hide_product_nameservers.title
                                                        name='hide_nameserver_fields'
                                                        label=$lang.settings.section.order_process.hide_product_nameservers.title
                                                        tooltip=$tooltips.settings.order_process.hide_product_nameservers
                                                        value=$settings['hide_nameserver_fields']  
                                                    }
                                                    </div>

                                                    {* Product Hostname*}
                                                    <div class="panel panel--collapse">
                                                        {include file="adminarea/settings/includes/group-inputs.tpl"
                                                        switchId= 'password-field'
                                                        title=$lang.settings.section.order_process.hide_product_hostname.title
                                                        name='hide_password_fields'
                                                        label=$lang.settings.section.order_process.hide_product_hostname.title
                                                        tooltip=$tooltips.settings.order_process.hide_product_hostname.hide_product_hostname
                                                        value=$settings['hide_password_fields']
                                                        customHostname=true
                                                        }
                                                    </div>

                                                    {* Password Strenght *}
                                                    {include file="adminarea/settings/includes/enable-pw-strength.tpl"}
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
        </div>
    </form>
{/block}

{block name="template-modals"}
    {* Unsaved Changes *}
    {include file="adminarea/includes/modals/unsaved-changes.tpl"}

    {* Cookie Box Translation *}
    {include file="adminarea/includes/modals/cookie-box-translation.tpl"}

    {* Save Confirmation *}
    {include file="adminarea/includes/modals/save-confirmation.tpl"}
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <a class="btn btn--primary" data-changes-save="#settingsForm" data-form-validate="#settingsForm" data-check-unsaved-changes>
                <span class="btn__text">{$lang.general.save_changes}</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@settings',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">{$lang.general.cancel}</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}
