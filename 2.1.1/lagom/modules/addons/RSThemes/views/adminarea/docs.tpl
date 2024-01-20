{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="d-flex">
        <div class="app-main__sidebar">
            <div class="tabs tabs--block">
                <div class="tabs__nav"
                    data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;">
                    <ul class="nav nav--tabs custom-nav-styles">
                        <li class="nav__item">
                            <a class="nav__link" href="#colors">
                                <span class="nav__link-text">Colors</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#buttons">
                                <span class="nav__link-text">Buttons</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#navigation">
                                <span class="nav__link-text">Navigation</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#alerts">
                                <span class="nav__link-text">Alerts</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#dropdowns">
                                <span class="nav__link-text">Dropdowns</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#modals">
                                <span class="nav__link-text">Modals</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#inputs">
                                <span class="nav__link-text">Inputs</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#checkbox-radio-switch">
                                <span class="nav__link-text">Checkbox Radio Switch</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#widgets">
                                <span class="nav__link-text">Widgets</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#labels">
                                <span class="nav__link-text">Labels</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#pagination">
                                <span class="nav__link-text">Pagination</span>
                            </a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="#typography">
                                <span class="nav__link-text">Typography</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="app-main__content">
            <div class="colors">
                <div class="color-box primary">
                    <div class="color-variant primary--base">Primary</div>
                    <div class="color-variant primary--lighter">Lighter</div>
                    <div class="color-variant primary--darker">Darker</div>
                    <div class="color-variant primary--faded">Faded</div>
                </div>
                <div class="color-box secondary">
                    <div class="color-variant secondary--base">Secondary</div>
                    <div class="color-variant secondary--lighter">Lighter</div>
                    <div class="color-variant secondary--darker">Darker</div>
                    <div class="color-variant secondary--faded">Faded</div>
                </div>
                <div class="color-box success">
                    <div class="color-variant success--base">Success</div>
                    <div class="color-variant success--lighter">Lighter</div>
                    <div class="color-variant success--darker">Darker</div>
                    <div class="color-variant success--faded">Faded</div>
                </div>
                <div class="color-box info">
                    <div class="color-variant info--base">Info</div>
                    <div class="color-variant info--lighter">Lighter</div>
                    <div class="color-variant info--darker">Darker</div>
                    <div class="color-variant info--faded">Faded</div>
                </div>
                <div class="color-box warning">
                    <div class="color-variant warning--base">Warning</div>
                    <div class="color-variant warning--lighter">Lighter</div>
                    <div class="color-variant warning--darker">Darker</div>
                    <div class="color-variant warning--faded">Faded</div>
                </div>
                <div class="color-box danger">
                    <div class="color-variant danger--base">Danger</div>
                    <div class="color-variant danger--lighter">Lighter</div>
                    <div class="color-variant danger--darker">Darker</div>
                    <div class="color-variant danger--faded">Faded</div>
                </div>
                <div class="color-box gray">
                    <div class="color-variant gray--base">Gray Base</div>
                    <div class="color-variant gray--lighter">Lighter</div>
                    <div class="color-variant gray--lighter-2">Lighter 2</div>
                    <div class="color-variant gray--lighter-3">Lighter 3</div>
                    <div class="color-variant gray--lighter-4">Lighter 4</div>
                    <div class="color-variant gray--faded">Faded</div>
                    <div class="color-variant gray--darker">Darker</div>
                    <div class="color-variant gray--icons">Icons</div>
                </div>
            </div>
            <hr>
            <div class="buttons-container" id="buttons">
                <div class="btns--box">
                    <a class="btn btn--primary btn--xs">Primary xs</a>
                    <a class="btn btn--primary btn--sm">Primary sm</a>
                    <a class="btn btn--primary">Primary d</a>
                    <a class="btn btn--primary btn--lg">Primary lg</a>
                </div>
                <div class="btns--box">
                    <a class="btn btn--secondary btn--xs">Primary xs</a>
                    <a class="btn btn--secondary btn--sm">Primary sm</a>
                    <a class="btn btn--secondary">Primary d</a>
                    <a class="btn btn--secondary btn--lg">Primary lg</a>
                </div>
                <div class="btns--box">
                    <a class="btn btn--danger btn--xs">Update details</a>
                    <a class="btn btn--danger btn--sm">Open ticket</a>
                    <a class="btn btn--danger">Add New</a>
                    <a class="btn btn--danger btn--lg">Check</a>
                </div>
                <div class="btns--box">
                    <a class="btn btn--secondary btn--outline btn--xs">Outline xs</a>
                    <a class="btn btn--secondary btn--outline btn--sm">Outline sm</a>
                    <a class="btn btn--secondary btn--outline">Outline d</a>
                    <a class="btn btn--secondary btn--outline btn--lg">Outline lg</a>
                </div>
                <div class="btns--box">
                    <a class="btn btn--default btn--xs">Default xs</a>
                    <a class="btn btn--default btn--sm">Default sm</a>
                    <a class="btn btn--default">Default d</a>
                    <a class="btn btn--default btn--lg">Default lg</a>
                </div>
                <div class="btns--box">
                    <a class="btn btn--link btn--xs">Link xs</a>
                    <a class="btn btn--link btn--sm">Link sm</a>
                    <a class="btn btn--link">Link d</a>
                </div>
            </div>
            <hr>
            <div id="navigation" class="sample-nav nav-items">
                <ul class="nav custom-nav-styles">
                    <li class="nav__item is-active">
                        <a class="nav__link has-icon" href="#">
                        <span class="nav__link-icon ls ls-padlock"></span>
                            <span class="nav__link-text">Manage Guest Client</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link has-icon" href="#">
                        <span class="nav__link-icon ls ls-padlock"></span>
                            <span class="nav__link-text">Manage Guest Client</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link has-icon" href="#">
                        <span class="nav__link-icon ls ls-padlock"></span>
                            <span class="nav__link-text">Manage Guest Client</span>
                        </a>
                    </li>
                    <li class="nav__item disabled">
                        <a class="nav__link has-icon" href="#">
                        <span class="nav__link-icon ls ls-padlock"></span>
                            <span class="nav__link-text">Manage Guest Client</span>
                        </a>
                    </li>
                </ul>
                <ul class="nav custom-nav-styles">
                    <li class="nav__item is-active">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">Display</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">Display</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">Display</span>
                        </a>
                    </li>
                </ul>
                <ul class="nav custom-nav-styles">
                    <li class="nav__item nav__item--page is-active">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">1</span>
                        </a>
                    </li>
                    <li class="nav__item nav__item--page">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">1</span>
                        </a>
                    </li>
                    <li class="nav__item nav__item--page">
                        <a class="nav__link" href="#">
                            <span class="nav__link-text">1</span>
                        </a>
                    </li>
                </ul>
            </div>
            <hr>
            <div id="alerts" class="sample-alerts">
                <div class="alert alert--success alert--outline alert--float alert--border-left has-icon">
                    <div class="alert__body">
                        <div class="alert__title">Success</div>
                        <p>Vitae arcu nibh amet nec velit donec. Pellentesque orci ante scelerisque et habitant aliquam dolor. </p>
                    </div>
                </div>
                <div class="alert alert--info alert--outline alert--float alert--border-left has-icon">
                    <div class="alert__body">
                        <div class="alert__title">Info</div>
                        <p>Vitae arcu nibh amet nec velit donec. Pellentesque orci ante scelerisque et habitant aliquam dolor. </p>
                    </div>
                </div>
                <div class="alert alert--warning alert--outline alert--float alert--border-left has-icon">
                    <div class="alert__body">
                        <div class="alert__title">Warning!</div>
                        <p>Vitae arcu nibh amet nec velit donec. Pellentesque orci ante scelerisque et habitant aliquam dolor. </p>
                    </div>
                </div>
                <div class="alert alert--danger alert--outline alert--float alert--border-left has-icon">
                    <div class="alert__body">
                        <div class="alert__title">Danger!</div>
                        <p>Vitae arcu nibh amet nec velit donec. Pellentesque orci ante scelerisque et habitant aliquam dolor. </p>
                    </div>
                </div>
            </div>
            <hr><br>
            <div id="dropdowns" class="sample-dropdowns">
                <div class="has-dropdown">
                        <a class="btn btn--default btn--outline" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                            <span class="btn__text">Actions</span>
                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                        </a>
                        <div class="dropdown" data-dropdown-menu>
                            <div class="dropdown__arrow" data-arrow></div>
                            <div class="dropdown__menu">
                                <ul class="nav">
                                    
                                        <li class="nav__item">
                                            <a class="nav__link" href="#" target="_blank">
                                                <span class="nav__link-icon lm lm-search"></span>
                                                <span class="nav__link-text">Live Preview</span>
                                            </a>
                                        </li>
                                    
                                    <li class="nav__item">
                                        <a class="nav__link" href="#" target="_blank">
                                            <span class="nav__link-icon lm lm-denied"></span>
                                            <span class="nav__link-text">Report Bug</span>
                                        </a>
                                    </li>
                                    <li class="nav__divider"></li>
                                    <li class="nav__item">
                                        <a class="nav__link" href="#" target="_blank">
                                            <span class="nav__link-icon lm lm-book"></span>
                                            <span class="nav__link-text">Docs</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
            </div>
            <hr>
            <div id="modals" class="sample-modals">
                {* <div class="modal show" id="deleteMenuItemModal" aria-modal="true" style="padding-right: 17px; display: block;"> *}
                    <div class="modal__dialog">
                        <div class="modal__content">
                            <div class="modal__top top">
                                <div class="top__title text-danger">Delete menu item</div>
                                <div class="top__toolbar">
                                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                                        <i class="btn__icon lm lm-close"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="modal__body">
                                <p>Are you sure to this menu item?</p>
                            </div>
                            <div class="modal__actions">
                                <a id="deleteMenuItemConfirmation" class="btn btn--danger" data-parent="" data-index="">
                                    <span class="btn__text">Yes, delete.</span>
                                </a>
                                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No.</span></button>
                            </div>
                        </div>
                    </div>
                {* </div> *}
                <br>
                <div class="modal__dialog">
                        <div class="modal__content">
                            <div class="modal__top top">
                                <div class="top__title">Add item</div>
                                <div class="top__toolbar">
                                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                                        <i class="btn__icon lm lm-close"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="modal__body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>
                            </div>
                            <div class="modal__actions">
                                <a id="" class="btn btn--primary" data-parent="" data-index="">
                                    <span class="btn__text">Add New Item</span>
                                </a>
                                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No.</span></button>
                            </div>
                        </div>
                    </div>
            </div>
            <hr>
                <div id="inputs" class="sample-inputs" style="max-width: 400px;">
                    <div class="form-group">
                        <label class="form-label">input-xs</label>
                        <input class="form-control form-control--xs" type="text" placeholder="Sample text...">
                    </div>
                    <div class="form-group">
                    <label class="form-label">input-sm</label>
                        <input class="form-control form-control--s" type="text" placeholder="Sample text...">
                    </div>
                    <div class="form-group">
                        <label class="form-label">input-lg</label>
                        <input class="form-control form-control--lg" type="text" placeholder="Sample text...">
                    </div>
                    <div class="form-group">
                        <label class="form-label">input-disabled</label>
                        <input class="form-control is-disabled" type="text" placeholder="Sample text...">
                    </div>
                    <div class="form-group">
                        <label class="form-label">input-readonly</label>
                        <input class="form-control" type="text" placeholder="Sample text..." readonly>
                    </div>
                    <div class="form-group">
                        <label class="form-label">input-label - placeholder dissapears on focus and appears after leving element</label>
                        <input class="form-control" type="text" placeholder="Sample text..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Sample text...'">
                    </div>
                    <div class="form-group is-error">
                        <label class="form-label">input-label - is-error</label>
                        <input class="form-control" type="text" placeholder="Sample text..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Sample text...'">
                        <span class="form-feedback">This and that is wrong, please correct.</span>
                    </div>
                    <div class="form-group is-error">
                        <label class="form-label">input-label - is-error</label>
                        <input class="form-control" type="text" placeholder="Sample text..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Sample text...'">
                        <span class="form-feedback form-feedback-lg">This and that is wrong, please correct.</span>
                    </div>

                    <div> 
                        <div class="top__search input-group is-error">
                            <span class="input-group__icon lm lm-search"></span>
                            <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="table-search" placeholder="Search">
                        </div>
                        <span class="form-feedback">This and that is wrong, please correct.</span>
                    </div>

                    <div class="form-group" data-form-counter="">
                        <label class="form-label">Description<span class="form-label__counter"><a class="btn--doc btn btn--link btn--xs">Help ?</a></label>
                        <textarea class="form-control" type="text" name="seo[seoDescription]" maxlength="160" data-form-counter-input=""></textarea>
                    </div>
                    <select class="form-control selectized" name="configuration[type]" style="opacity: 1; display: none;" tabindex="-1"><option value="client-portal" selected="selected">Client Portal</option><option value="portal" selected="selected">Portal</option><option value="client" selected="selected">Client</option></select>
                    <br>
                    <div class="form-group menu-status m-b-0x">
                        <label class="form-label">Select with dial - color depends from data-value</label>
                        <select class="form-control" name="settings[active]">
                            <option value="1">{$lang.menu.general.active}</option>
                            <option value="0">{$lang.menu.general.disabled}</option>
                        </select>
                    </div>
                </div>
                <br>
                <hr>
                <div class="checkbox" id="checkbox-radio-switch">
                    <div class="form-group">
                        <label class="checkbox m-t-0x">
                            <input class="form-checkbox" type="checkbox" name="" value=""> 
                            <span class="form-indicator"></span>
                            <span class="form-text">{$lang.page.page_sections.modal.add_section.choose_predefined}</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="checkbox is-disabled m-t-0x">
                            <input class="form-checkbox" type="checkbox" name="" value=""> 
                            <span class="form-indicator"></span>
                            <span class="form-text">{$lang.page.page_sections.modal.add_section.choose_predefined}</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="radio m-t-0x">
                            <input class="form-radio" type="radio" name="" value=""> 
                            <span class="form-indicator"></span>
                            <span class="form-text">{$lang.page.page_sections.modal.add_section.choose_predefined}</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="radio is-disabled m-t-0x">
                            <input class="form-radio" type="radio" name="" value=""> 
                            <span class="form-indicator"></span>
                            <span class="form-text">{$lang.page.page_sections.modal.add_section.choose_predefined}</span>
                        </label>
                    </div>
                    <br><br>
                    <label>
                        <div class="switch">
                            <input type="hidden"
                                    name="settings[display_mode_switcher]"
                                    value="0"/>
                            <input class="switch__checkbox mode-display"
                                    name="settings[display_mode_switcher]" value="1"
                                    type="checkbox" {if $settings['display_mode_switcher']} checked="checked" {/if}>
                            <span class="switch__container"><span
                                        class="switch__handle"></span></span>
                        </div>
                    </label>
                    <label>
                        <div class="switch ">
                            <input type="hidden"
                                    name="settings[display_mode_switcher]"
                                    value="0"/>
                            <input class="switch__checkbox mode-display"
                                    name="settings[display_mode_switcher]" value="1"
                                    type="checkbox" {if $settings['display_mode_switcher']} checked="checked" {/if}>
                            <span class="switch__container"><span
                                        class="switch__handle"></span></span>
                        </div>
                    </label>
                    <br>
                    <label>
                        <div class="switch switch--sm">
                            <input type="hidden"
                                    name="settings[display_mode_switcher]"
                                    value="0"/>
                            <input class="switch__checkbox mode-display"
                                    name="settings[display_mode_switcher]" value="1"
                                    type="checkbox" {if $settings['display_mode_switcher']} checked="checked" {/if}>
                            <span class="switch__container"><span
                                        class="switch__handle"></span></span>
                        </div>
                    </label>
                    <br>
                    <label>
                        <div class="switch switch--sm">
                            <input type="hidden"
                                    name="settings[display_mode_switcher]"
                                    value="0"/>
                            <input class="switch__checkbox mode-display"
                                    name="settings[display_mode_switcher]" value="1"
                                    type="checkbox" {if $settings['display_mode_switcher']} checked="checked" {/if}>
                            <span class="switch__container"><span
                                        class="switch__handle"></span></span>
                        </div>
                    </label>
                    

                </div>
            
            
            <hr>
            <div id="widgets" class="sample-components">
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                            <div class="widget widget--checkbox" data-toggle="radio">
                                <input class="hidden" type="radio" name="layout" value=""/>
                                <div class="widget__header" style="height: 170px"> {*temporary height instead of photo*}
                                    <div class="widget__media widget__media--lg">
                                        <img src="{$layout['preview']}" alt=""/>
                                    </div>
                                    <div class="widget__checkbox">
                                        <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                                    </div>
                                </div>
                                <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                    <div>
                                        <strong>Label</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <div class="widget widget--checkbox is-active" data-toggle="radio">
                                <input class="hidden" type="radio" name="layout" value="" checked="checked"/>
                                <div class="widget__header" style="height: 170px"> {*temporary height instead of photo*}
                                    <div class="widget__media widget__media--lg">
                                        <img src="{$layout['preview']}" alt=""/>
                                    </div>
                                    <div class="widget__checkbox">
                                        <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                                    </div>
                                </div>
                                <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                    <div>
                                        <strong>Label</strong>
                                    </div>
                                        <label class="label label--success label--outline">Active</label>
                                </div>
                            </div>
                        </div> 
            </div>
            <hr><br>
            <div id="labels">
                <span class="label label--success label--outline m-l-2x">Active</span>
                <span class="label label--danger label--outline m-l-2x">Inactive</span>
                <span class="label label--default is-disabled label--outline m-l-2x">Disabled</span>
            </div>
            <hr><br>
            
            <div id="pagination" class="pagination">
                <div class="dataTables_wrapper no-footer">
                    <div class="t-c__footer">
                        <div class="simple_numbers" id="settings-table_paginate">
                            <div class="pagination">
                                <a href="#" data-dt-idx="0" aria-controls="settings-table" class="pagination__item is-previous is-disabled" id="settings-table_previous">
                                    <span class="btn__icon ls ls-arrow-left"></span>
                                </a>
                                <a href="#" data-dt-idx="1" aria-controls="settings-table" class="pagination__item is-active">1</a>
                                <a href="#" data-dt-idx="2" aria-controls="settings-table" class="pagination__item is-next is-disabled" id="settings-table_next">
                                    <span class="btn__icon ls ls-arrow-right"></span>
                                </a>
                            </div>
                        </div>
                        <div class="pagination">   
                            <button class="pagination__item is-active" tabindex="0" aria-controls="settings-table" type="button">
                                <span>10</span>
                            </button> 
                            <button class="pagination__item" tabindex="0" aria-controls="settings-table" type="button">
                                <span>25</span>
                            </button> 
                            <button class="pagination__item" tabindex="0" aria-controls="settings-table" type="button">
                            <span>∞</span>
                            </button> 
                        </div>
                    </div>
                </div>
            </div>
            
            </div>
            <hr><br>
            <div id="collapse">
                <div class="panel panel--collapse">
                    <div class="collapse-toggle">
                        <div class="top__title">
                            Custom Logo URL
                            <i class="ls ls-info-circle m-l-1x"
                            data-toggle="lu-tooltip"
                            data-title="By default Lagom logo in main navigation links to main page of WHMCS Client Area. Placing different URL to this input, will change default behavior, and logo will link to this specific URL."></i>
                        </div>
                        <label>
                            <div class="switch" data-toggle="lu-collapse" data-target="#logo-url" aria-expanded="true">
                                <input type="hidden"
                                        name="settings[display_mode_switcher]"
                                        value="0"/>
                                <input class="switch__checkbox mode-display"
                                        name="" value="1"
                                        type="checkbox">
                                <span class="switch__container"><span
                                            class="switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    <div class="collapse" id="logo-url">
                        <div class="form-group p-3x">
                            <label class="form-label text-default">Logo URL</label>
                            <input value="{$settings['logo_url']}" class="form-control " type="text" name="settings[logo_url]">
                        </div>
                    </div> 
                </div>
                <br><br>
                <div class="widget__body panel">
                    <div class="widget__content p-0x">
                        <div class="form-group d-flex p-b-1x m-b-0x">
                            <span class="form-label text-default form-text m-r-2x m-b-0x mi-w-320">Hide header and footer<i class="ls ls-info-circle m-l-1x" data-toggle="lu-tooltip" data-title="Example tooltip text"></i></span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="" value="0"/>
                                    <input class="switch__checkbox" name="" value="1" type="checkbox" >
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div>
                        <div class="form-group d-flex p-v-1x m-b-0x">
                            <span class="form-label text-default form-text m-r-2x m-b-0x mi-w-320">Show logo<i class="ls ls-info-circle m-l-1x" data-toggle="lu-tooltip" data-title="Example tooltip text"></i></span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="" value="0"/>
                                    <input class="switch__checkbox" name="" value="1" type="checkbox" >
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div>                                          
                        <div class="form-group d-flex p-t-1x m-b-0x">
                            <span class="form-label text-default form-text m-r-2x m-b-0x mi-w-320">Show social login buttons as "full buttons"<i class="ls ls-info-circle m-l-1x" data-toggle="lu-tooltip" data-title="Example tooltip text"></i></span>
                            <label>
                                <div class="switch switch--primary">
                                    <input type="hidden" name="" value="0"/>
                                    <input class="switch__checkbox" name="" value="1" type="checkbox" >
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="panel panel--collapse">
                    <div class="collapse-toggle">
                        <div class="top__title">
                            Display mode switcher
                            <i class="ls ls-info-circle m-l-1x"
                            data-toggle="lu-tooltip"
                            data-title="Displays switcher which is used to change website to dark or light theme."></i>
                        </div>
                        <label>
                            <div class="switch" data-toggle="lu-collapse" data-target="#mode-switcher" aria-expanded="true">
                                <input type="hidden"
                                        name="settings[display_mode_switcher]"
                                        value="0"/>
                                <input class="switch__checkbox mode-display"
                                        name="settings[display_mode_switcher]" value="1"
                                        type="checkbox" {if $settings['display_mode_switcher']} checked="checked" {/if}>
                                <span class="switch__container"><span
                                            class="switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    <div class="collapse" id="mode-switcher">
                        <div class="theme-selectors">
                            <div class="form-group col-sm-6 p-3x">
                                <label class="form-text ">Light Mode</label>
                                <select class="form-control"
                                        name="settings[light_mode_theme]"
                                        data-mode-switcher>
                                        <option value="option1" selected >option1</option><option value="option2" selected >option2</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-6 p-3x">
                                <label class="form-text">Dark Mode</label>
                                <select class="form-control"
                                        name="settings[dark_mode_theme]" data-mode-switcher>
                                        <option value="option1" selected>option1</option><option value="option2" selected >option2</option>
                                </select>
                            </div>
                        </div>
                    </div> 
                </div>
                <br><br>

            </div>
            <hr><br>
            <div class="typography" id="typography">
                <div>
                    <div class="sample-heading"><span>H1</span><h1>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h1></div>
                    <div class="sample-heading"><span>H2</span><h2>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h2></div>
                    <div class="sample-heading"><span>H3</span><h3>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h3></div>
                    <div class="sample-heading"><span>H4</span><h4>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h4></div>
                    <div class="sample-heading"><span>H5</span><h5>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h5></div>
                    <div class="sample-heading"><span>H6</span><h6>Justo, non aliquam ullamcorper porttitor. In id in pulvinar pretium, nisi nibh egestas a.</h6></div>
                </div>
                <div>
                    <div class="sample-paragraph"><span>p-xlg</span><p class="p-xlg">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                    <div class="sample-paragraph"><span>p-lg</span><p class="p-lg">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                    <div class="sample-paragraph"><span>p-md</span><p class="p-md">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                    <div class="sample-paragraph"><span>p-d</span><p class="p-d">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                    <div class="sample-paragraph"><span>p-sm</span><p class="p-sm">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                    <div class="sample-paragraph"><span>p-xs</span><p class="p-xs">Amet eget est urna amet. Arcu habitant convallis gravida rhoncus risus sed morbi. Nec elementum eu velit sapien volutpat sit. Enim curabitur ullamcorper pharetra ultrices. Sodales enim sit adipiscing facilisis accumsan eu eget arcu ac. Dictum mi vestibulum tortor pharetra, augue suspendisse nunc ornare.</p></div>
                </div>
                
            </div>
        </div>
    </div>
{/block}

{block name="template-actions"}

{/block}

{block name="template-scripts"}
    {literal}
        <script type="text/javascript">

        </script>
    {/literal}
{/block}
