{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type='menu'}
{/block}

{block name="template-content"}
    {assign var="iconLocation" value="./../../../assets/svg-icons"}
    <form id="updateMenuForm" action="{$helper->url('Menu@save',['templateName'=>$template->getMainName()])}" method="POST">
        <div class="block is-loading">
            <div class="block__body" data-menu-items data-check-unsaved-changes>
                <div class="section">
                    <div class="section__header top">
                        <h3 class="section__title">{$lang.menu.menu_items.title}</h3>
                        <div class="top__toolbar m-l-a">
                            <button 
                                class="btn btn--primary" 
                                type="button" 
                                data-add-new-item 
                                data-ajax-url="{$helper->url('Menu@addNewMenuItem',['templateName'=>$template->getMainName()])}" 
                                data-index="0" 
                                data-position="1"
                                data-lang-edit="{$lang.menu.menu_items.show_customization_options}" 
                                data-lang-cancel="{$lang.menu.menu_items.hide_customization_options}"
                                data-lang-remove="{$lang.general.remove}"
                                data-lang-add-child="{$lang.menu.menu_items.add_child}"
                                data-lang-show-hide="{$lang.menu.menu_items.show_hide}"
                                data-lang-move-up="{$lang.menu.menu_items.move_up}"
                                data-lang-move-down="{$lang.menu.menu_items.move_down}"
                            >                                                           
                                <i class="btn__icon lm lm-plus"></i>
                                <span class="btn__text">
                                    {$lang.general.add_new}
                                </span>
                            </button>
                        </div>
                    </div>

                    <div id="menuManagerItem" class="section__body">
                        <div class="sortable-list list-group list-group--simple list-group--p-h-0x list-group--collapse m-b-0x w-100" data-menu-items-list></div>
                        <a class="btn btn--block btn-add-parent m-t-1x is-hidden"
                            data-add-new-item 
                            data-ajax-url="{$helper->url('Menu@addNewMenuItem',['templateName'=>$template->getMainName()])}" 
                            data-index="0" 
                            data-position="1"
                            data-lang-edit="{$lang.menu.menu_items.show_customization_options}" 
                            data-lang-cancel="{$lang.menu.menu_items.hide_customization_options}"
                            data-lang-remove="{$lang.general.remove}"
                            data-lang-add-child="{$lang.menu.menu_items.add_child}"
                            data-lang-show-hide="{$lang.menu.menu_items.show_hide}"
                            data-lang-move-up="{$lang.menu.menu_items.move_up}"
                            data-lang-move-down="{$lang.menu.menu_items.move_down}"
                        >
                            <div class="text-bg">
                                <i class="btn__icon ls ls-plus"></i>
                                <span class="btn__text m-l-0x">{$lang.general.add_new}</span>
                            </div>
                        </a>
                        <div class="section__builder panel w-100 p-0x" data-menu-items-no-data>
                            <div class="builder__icon text-center">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3856 16.4751L27.0847 1.80041C29.4918 -0.600136 33.393 -0.600136 35.8001 1.80041L38.1943 4.19069C40.6017 6.59403 40.6017 10.492 38.1943 12.8928L23.425 27.6375C22.3476 28.7132 20.8866 29.3177 19.3628 29.3177H11.9949C11.1658 29.3177 10.4995 28.6359 10.5202 27.8084L10.7051 20.3855C10.7421 18.9155 11.3436 17.5154 12.3856 16.4751ZM36.1082 6.27339L33.7151 3.88424C32.4599 2.63246 30.425 2.63246 29.1704 3.88368L27.9611 5.09096L34.899 12.0173L36.1088 10.8095C37.3632 9.55845 37.3632 7.5263 36.1082 6.27339ZM32.8128 14.1L25.8749 7.17369L14.4719 18.5578C13.9651 19.0638 13.6726 19.7447 13.6545 20.4592L13.5059 26.3705L19.3629 26.3723C20.0113 26.3723 20.6365 26.1472 21.1339 25.7402L21.339 25.5548L32.8128 14.1ZM18.6696 0.0759835C19.4843 0.0759835 20.1448 0.735339 20.1448 1.54869C20.1448 2.29427 19.5898 2.91044 18.8698 3.00796L18.6696 3.0214H11.3155C6.35587 3.0214 3.14341 6.30596 2.95873 11.4067L2.95032 11.8753V28.2008C2.95032 33.4173 6.00656 36.8485 10.8685 37.0458L11.3155 37.0548H28.6712C33.6431 37.0548 36.8458 33.7773 37.0299 28.6701L37.0383 28.2008V20.2914C37.0383 19.478 37.6988 18.8187 38.5135 18.8187C39.2603 18.8187 39.8775 19.3727 39.9752 20.0916L39.9886 20.2914V28.2008C39.9886 34.9991 35.6752 39.779 29.1313 39.9927L28.6712 40.0002H11.3155C4.67062 40.0002 0.206456 35.3745 0.00697185 28.6718L0 28.2008V11.8753C0 5.08376 4.32451 0.297515 10.8562 0.0834665L11.3155 0.0759835H18.6696Z" fill="#1062FE"/>
                                </svg>
                            </div>
                            <h5 class="builder__title">{$lang.menu.menu_items.no_data.title}</h5>
                            <p class="p-md builder__desc text-center m-b-4x">{$lang.menu.menu_items.no_data.desc}</p>
                            <div class="builder__actions">
                                <button 
                                    class="btn btn--secondary" 
                                    type="button" 
                                    data-add-new-item 
                                    data-ajax-url="{$helper->url('Menu@addNewMenuItem',['templateName'=>$template->getMainName()])}" 
                                    data-index="0" 
                                    data-position="1"
                                    data-lang-edit="{$lang.menu.menu_items.show_customization_options}" 
                                    data-lang-cancel="{$lang.menu.menu_items.hide_customization_options}"
                                    data-lang-remove="{$lang.general.remove}"
                                    data-lang-add-child="{$lang.menu.menu_items.add_child}"
                                    data-lang-show-hide="{$lang.menu.menu_items.show_hide}"
                                    data-lang-move-up="{$lang.menu.menu_items.move_up}"
                                    data-lang-move-down="{$lang.menu.menu_items.move_down}"
                                >    
                                    <i class="btn__icon lm lm-plus"></i>
                                    <span class="btn__text">
                                        {$lang.general.add_new_item}
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block__sidebar" data-check-unsaved-changes data-menu-settings>
                <div class="section menu-sidebar-section">
                    <h3 class="section__title">
                        {$lang.menu.menu_settings.title}
                    </h3>
                    <div class="section__body">
                        <div class="widget panel of-visible">
                            <div class="widget__body">
                                <div class="widget__content">
                                    <div class="form-group">
                                        <label class="form-label">{$lang.menu.general.name}
                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.name}
                                        </label>
                                        <input class="form-control" type="text" name="settings[name]" value="" lu-required>
                                        <span class="form-feedback is-hidden">{$lang.general.field_required}</span> 
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">{$lang.menu.general.display_rule}
                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.display}
                                        </label>
                                        <select data-menu-settings-display-rules class="form-control multiselect form-control--basic" name="settings[rules][]" multiple>
                                            {foreach $displayRules as $rule}
                                                <option {if $rule['disabled']}{literal}data-data='{"selectable": false}'{/literal}{/if} value="{$rule['id']}">{$rule['name']}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group menu-status m-b-0x">
                                        <label class="form-label">{$lang.menu.general.status}
                                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.status}
                                        </label>
                                        <select class="form-control" name="settings[active]">
                                            <option value="1">{$lang.menu.general.active}</option>
                                            <option value="0">{$lang.menu.general.disabled}</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="settings[location]" data-menu-location value="{$smarty.get.menuLocation}">
                                    <input type="hidden" name="settings[display]" value="{$smarty.get.currentDisplay}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="block__loader preloader-container">
                <div class="preloader preloader--lg"></div>
            </div>
        </div>            
    </form>
    {include file="adminarea/menu/includes/modals.tpl"}
{/block}
{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <button 
                class="btn btn--primary is-disabled" 
                type="button" 
                data-menu-action-save 
                data-ajax-url="{$helper->url('Menu@checkRules',['templateName'=>$template->getMainName(), 'location' =>$smarty.get.menuLocation])}" 
                data-check-unsaved-changes
                data-form-validate="#updateMenuForm"
            >
                <span class="btn__text">{$lang.general.save_changes}</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@menu',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">{$lang.general.cancel}</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}

{block name="template-scripts"}
    <script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{$helper->script('menu-manager.js')}"></script>
{/block}