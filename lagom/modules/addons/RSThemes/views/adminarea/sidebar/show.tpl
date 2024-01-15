{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type='sidebar'}
{/block}

{block name="template-content"}
    <form id="updateSidebarForm" class="list__form" action="{$helper->url('Sidebar@save',['templateName'=>$template->getMainName(), 'sidebarId' => $sidebar->id])}" method="POST">
        <div class="block">
            <div class="block__body" data-sidebar-items>
                <div class="section">
                    <div class="section__header top">
                        <h3 class="section__title">{$lang.menu.menu_items.title}</h3>
                        <div class="top__toolbar m-l-a">
                            <button 
                                class="btn btn--primary" 
                                type="button" 
                                data-add-new-item 
                                data-ajax-url="{$helper->url('Sidebar@addNewSidebarItem',['templateName'=>$template->getMainName()])}" 
                                data-index="{count($sidebar->items)}" 
                                data-position="{count($sidebar->parents) + 1}" 
                                data-lang-edit="{$lang.general.edit}" 
                                data-lang-cancel="{$lang.general.cancel}"
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
                        <div class="sortable-list list-group list-group--simple list-group--p-h-0x list-group--collapse m-b-0x" data-menu-items-list>
                            {foreach $sidebar->items as $index => $item}
                                <div class="list-group__sortable" data-menu-item="{$index}" data-menu-item-position="{$index}" style="order:{$index}">
                                    <div id="list-item-parent-{$index}" class="list-group__item flex-column panel p-0x">
                                        <div class="list-group__top top" id="parent-collapse-{$index}" aria-expanded="false">
                                            <div class="move-actions">
                                                <a  
                                                    class="move-actions__btn" 
                                                    type="button" 
                                                    data-move-up="{$index}"
                                                    data-index="{$index}"
                                                >
                                                    <i class="btn__icon ls ls-arrow-up" data-toggle="lu-tooltip" data-title="{$lang.menu.menu_items.move_up}"></i>
                                                </a>
                                                <a  
                                                    class="move-actions__btn" 
                                                    type="button" 
                                                    data-move-down="{$index}"
                                                    data-index="{$index}"
                                                >
                                                    <i class="btn__icon ls ls-arrow-down" data-toggle="lu-tooltip" data-title="{$lang.menu.menu_items.move_down}"></i>
                                                </a>
                                            </div>
                                            <div class="top__title" data-menu-item-title data-parent="parent" data-index="{$index}">
                                                {$item->name}
                                            </div>
                                            <div class="top__toolbar">                                           
                                                <button 
                                                    type="button"
                                                    class="btn btn--icon btn--link btn--sm collapsed" 
                                                    data-toggle="lu-collapse" 
                                                    data-target="#collapse-p{$index}" 
                                                    aria-expanded="false" 
                                                    aria-controls="collapse-p{$index}" 
                                                    data-edit-item
                                                    data-index="{$index}"
                                                >
                                                    <i class="btn__icon lm lm-edit" data-toggle="lu-tooltip" data-title="{$lang.general.edit}" data-lang-edit="{$lang.general.edit}" data-lang-cancel="{$lang.general.cancel}"></i>
                                                </button>                                                
                                                <button 
                                                    type="button" 
                                                    class="btn btn--icon btn--link btn--sm delete-menu-item" 
                                                    href="#deleteMenuItemModal" 
                                                    data-toggle="lu-modal" 
                                                    data-backdrop="static" 
                                                    data-keyboard="false" 
                                                    data-parent="parent" 
                                                    data-remove-item 
                                                    data-index="{$index}">
                                                        <i class="btn__icon lm lm-trash" data-toggle="lu-tooltip" data-title="{$lang.general.remove}"></i>
                                                </button>
                                                <label class="switch switch--primary" data-toggle="lu-tooltip" data-title="{$lang.menu.menu_items.show_hide}">
                                                    <input type="hidden" name="items[parent][{$index}][active]" value="0"/>
                                                    <input class="switch__checkbox mode-display" name="items[parent][{$index}][active]" value="1" type="checkbox" {if $parent->active} checked="checked" {/if}>
                                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="list-group__bottom collapse" id="collapse-p{$index}">
                                            <div class="list-group__content">
                                                {include file="adminarea/sidebar/includes/inputs.tpl"
                                                    parent='parent'
                                                    index=$index
                                                    view=$item->view
                                                    order=$item->order
                                                    content=$item->content
                                                    translations=$item->translations
                                                    customTranslation=$item->custom_translation

                                                } {*build table of parents with 'parent' key*}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        <a class="btn btn--block btn-add-parent m-t-1x btn-add-bottom {if count($sidebar->items) === 0}is-hidden{/if}"
                            data-add-new-item 
                            data-ajax-url="{$helper->url('Sidebar@addNewSidebarItem',['templateName'=>$template->getMainName()])}" 
                            data-index="{count($sidebar->items)}" 
                            data-position="{count($sidebar->parents) + 1}" 
                            data-lang-edit="{$lang.general.edit}" 
                            data-lang-cancel="{$lang.general.cancel}"
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
                        <div class="section__builder panel w-100 p-0x {if count($sidebar->items) > 0}is-hidden{/if}" data-menu-items-no-data>
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
                                    data-ajax-url="{$helper->url('Sidebar@addNewSidebarItem',['templateName'=>$template->getMainName()])}" 
                                    data-index="0" 
                                    data-position="1"
                                    data-lang-edit="{$lang.general.edit}" 
                                    data-lang-cancel="{$lang.general.cancel}"
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
            <div class="block__sidebar" data-sidebar-settings>
                <div class="section menu-sidebar-section">
                    <h3 class="section__title">{$lang.menu.menu_settings.title}</h3>
                    <div class="section__body panel">
                        <div class="form-group">
                            <label class="form-label">{$lang.menu.general.name}
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.name}
                            </label>
                            <input class="form-control form-control--sm" type="text" name="sidebar[name]" value="{$sidebar->name}" required>
                        </div>
                        <label class="form-label">Title</label>
                        <div class="form-group">
                            <div class="d-flex">
                                <label class="radio d-flex m-t-0x">
                                    <input 
                                        class="form-radio" 
                                        type="radio" 
                                        name="sidebar[translation-method]" 
                                        {if $sidebar->translation == 'custom'} checked {/if} 
                                        value="custom" 
                                        data-parent="menu" 
                                        data-index="title"
                                        data-sidebar-name-type
                                    >
                                    <span class="form-indicator"></span>
                                    <span class="form-text">Custom String</span>
                                    {include file="adminarea/includes/helpers/tooltip.tpl" classes="self-center" tooltip=$tooltips.menu.menu_items.custom_string}
                                </label>
                                <a class="label-link m-l-a" href="#translationModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false" data-parent="menu" data-index="title"  data-sidebar-translation>Translate</a>
                            </div> 
                            <input 
                                class="form-control form-control--sm custom-name-menu-title item-name item-name-menu-title {if $sidebar->translation == 'whmcs'}is-hidden{/if}" 
                                type="text" name="sidebar[title][custom]" 
                                maxlength="80" 
                                value="{$sidebar->translations['custom']}" 
                                data-parent="menu" 
                                data-index="title"
                                data-sidebar-name="custom"
                                data-sidebar-custom-name
                                data-ajax-url="{$helper->url('Menu@getCustomTranslation',['templateName'=>$template->getMainName()])}"
                            >
                            <input 
                                class="translation-menu-title" 
                                type="hidden" 
                                name="sidebar[translation]" 
                                value="{$sidebar->custom_translation}"
                                data-sidebar-custom-translation
                                data-parent="menu" 
                                data-index="title"
                                data-ajax-url="{$helper->url('Menu@getSystemLanguage',['templateName'=>$template->getMainName()])}"
                            >
                        </div>
                        <div class="form-group">
                            <div class="d-flex">
                                <label class="radio d-flex m-t-0x">
                                    <input 
                                        class="form-radio" 
                                        type="radio" 
                                        name="sidebar[translation-method]" 
                                        value="whmcs" 
                                        {if $sidebar->translation == 'whmcs'} checked {/if}  
                                        data-parent="menu" 
                                        data-index="title"
                                        data-sidebar-name-type
                                        data-ajax-url="{$helper->url('Menu@checkWhmcsLangVariable',['templateName'=>$template->getMainName()])}"
                                    >
                                    <span class="form-indicator"></span>
                                    <span class="form-text">Language Variable</span>
                                    {include file="adminarea/includes/helpers/tooltip.tpl" classes="self-center" tooltip=$tooltips.menu.menu_items.language_variable}
                                </label>
                                <span class="m-l-a" data-sidebar-name-alert>
                                    {$sidebar->translations['whmcs']}
                                </span>   
                            </div>
                            <div class="{if $sidebar->translation == 'custom'}is-hidden{/if}" data-sidebar-name="whmcs">
                                <input 
                                    class="form-control form-control--sm whmcs-name whmcs-name-menu-title" 
                                    type="text" 
                                    name="sidebar[title][whmcs]" 
                                    maxlength="80" 
                                    value="{$sidebar->translations['whmcs']}" 
                                    data-parent="menu" 
                                    data-index="title"
                                    data-sidebar-whmcs-name
                                    data-ajax-url="{$helper->url('Menu@checkWhmcsLangVariable',['templateName'=>$template->getMainName()])}"
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="sidebar-location">Location
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.location}
                            </label>
                            <select class="form-control form-control--sm" name="sidebar[location]" id="sidebar-location">
                                <option value="primary" {if $sidebar->location == 'primary'} selected {/if}>Primary</option>
                                <option value="secondary" {if $sidebar->location == 'secondary'} selected {/if}>Secondary</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="menu-location">Display
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.display}
                            </label>
                            <select class="form-control form-control--sm sidebar-display" data-sidebar-display name="sidebar[display]" id="sidebar-display">
                                <option value="Sidebar Pages" {if $sidebar->display == 'sidebar-pages'} selected {/if}>Sidebar Pages</option>
                                <option value="Custom Selected Pages" {if $sidebar->display == 'Custom Selected Pages'} selected {/if}>Custom Selected Pages</option>
                            </select>
                        </div>
                        <div class="form-group form-display-pages {if $sidebar->display !== 'Custom Selected Pages'}is-hidden{/if}" data-sidebar-pages>
                            <label class="form-label" for="sidebar-pages">Pages 
                            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.pages}
                            </label>
                            <select class="form-control form-control--sm multiselect form-control--basic display-pages" name="sidebar[pages][]" id="sidebar-pages" multiple data-sidebar-pages-select>
                                {foreach $pages as $page}
                                    <option value="{$page['name']}" {if isset($sidebar->display_pages[$page['name']])} selected {/if}>{$page['label']}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Order
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.order}
                            </label>
                            <input class="form-control form-control--sm" type="number" min="1" name="sidebar[order]" value="{$sidebar->order}" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label" for="menu-active">{$lang.menu.general.status}
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.menu.menu_settings.status}
                            </label>
                            <select class="form-control form-control--sm" name="sidebar[active]" id="menu-active">
                                <option {if $sidebar->active} selected {/if} value="1">{$lang.menu.general.active}</option>
                                <option {if !$sidebar->active} selected {/if} value="0">{$lang.menu.general.disabled}</option>
                            </select>
                        </div>
                    </div>
                </div>    
            </div>
        </div>           
    </form>
    {include file="adminarea/sidebar/includes/modals.tpl"}
{/block}
{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container d-flex">
            <div class="flex-grow-1">
                <button id="menuSaveConfirm" class="btn btn btn--primary" type="submit" form="updateSidebarForm">
                    <span class="btn__text">{$lang.general.save_changes}</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <a class="btn btn--default btn--outline " href="{$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => 'sidebar'])}">
                    <span class="btn__text">{$lang.general.cancel}</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
            <div class="m-r-2x">
                <a class="btn btn--default btn--outline" href="#deleteSidebarModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                    <span class="btn__text">{$lang.general.delete}</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
            {if isset($sidebar)}
                <div>
                    <a class="btn btn--secondary" href="{$helper->url('Data@exportSidebar',['templateName'=>$template->getMainName(), 'sidebarId' => $sidebar->id])}" data-menu-export-item>
                        <i class="btn__icon lm lm-upload"></i>
                        <span class="btn__text">
                            {$lang.general.export}
                        </span>
                    </a>
                </div>
            {/if}
        </div>
    </div>
{/block}
{block name="template-scripts"}
    <script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{$helper->script('plugins/summernote.js')}"></script>
    <script type="text/javascript" src="{$helper->script('menu-manager.js')}"></script>
{/block}