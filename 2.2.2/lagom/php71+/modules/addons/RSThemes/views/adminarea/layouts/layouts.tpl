{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="section">
        <div class="d-flex">
            <div class="app-main__sidebar">
                <div class="tabs tabs--block m-w-200 is-sticky">
                    <div class="tabs__nav"
                         data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;">
                        <ul class="nav nav--tabs custom-nav-styles">
                            <div class="nav__header p-0x">
                                {$lang.general.menu}
                            </div>
                            <li class="nav__item {if $smarty.get.layoutTab == 'main-menu' || !isset($smarty.get.layoutTab)} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#layout-main-menu">
                                    <span class="nav__link-text">{$lang.layouts.sidebar.main_menu}</span>
                                </a>
                            </li>
                            <li class="nav__item {if $smarty.get.layoutTab == 'footer'} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#layout-footer">
                                    <span class="nav__link-text">{$lang.layouts.sidebar.footer}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="app-main__content">
                <div class="tabs__body">
                    <div class="tab-content">
                        <div class="tab-pane {if $smarty.get.layoutTab == 'main-menu' || !isset($smarty.get.layoutTab)} is-active {/if}" id="layout-main-menu">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.layouts.main_menu.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.layouts.main_menu_layout}</h3>
                                    
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table 
                                    class="t-c__table table mob-table--block" 
                                    id="settings-table" 
                                    data-services-table 
                                    data-search-input="#table-elements" 
                                    data-order='[0, "asc"]' 
                                    data-clickable-rows="true" 
                                    data-responsive="false"
                                >
                                    <colgroup>
                                        <col class="table__col-8">
                                        {foreach $rules as $rule}
                                            <col class="table__col-5">
                                        {/foreach}
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="cell-title">
                                                <span>{$lang.general.name}</span>
                                                <span class="sorting-icons-box">
                                                    {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                </span>
                                            </th>
                                            {foreach $rules as $rule}
                                                <th class="cell-rule">
                                                    <span>{$rule['name']}</span>
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                            {/foreach}
                                            <th class="cell-actions no-sort"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $template->getMainMenuLayouts() as $k => $mainMenuLayout}
                                            <tr>
                                                <td class="cell-name">
                                                    <div class="rail">
                                                        <div class="content-extension">
                                                            <strong>{$mainMenuLayout->getName()}</strong>
                                                        </div>
                                                    </div>
                                                </td>
                                                {foreach $rules as $rule}
                                                    <td class="cell-rule">
                                                        {if {$rule['main-menus'][$mainMenuLayout->getMainName()]['active']}}
                                                            <span class="label label--outline label--success">{$lang.general.active}</span>
                                                        {else}
                                                            <span class="label label--outline label--default is-disabled">{$lang.general.disabled}</span>
                                                        {/if}
                                                    </td>
                                                {/foreach}
                                                <td class="cell-actions">
                                                    <div class="has-dropdown">
                                                        <a class="btn btn--default btn--outline btn--xs" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                                                            <span class="btn__text is-hidden-mob-down">{$lang.general.actions}</span>
                                                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                                                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                                                        </a>
                                                        <div class="dropdown" data-dropdown-menu>
                                                            <div class="dropdown__arrow" data-arrow></div>
                                                            <div class="dropdown__menu">
                                                                <ul class="nav">
                                                                    {foreach $rules as $rule}
                                                                        <li class="nav__item">
                                                                            <a class="nav__link {if {$rule['main-menus'][$mainMenuLayout->getMainName()]['active']}} is-disabled{/if}"
                                                                            href="{$helper->url('Display@setActiveMainMenuLayout',['templateName'=>$template->getMainName(), 'layoutName' => $mainMenuLayout->getMainName(), 'ruleName' => $rule['name']])}">
                                                                                <span class="nav__link-icon ls ls-{$rule['icon']}"></span>
                                                                                <span class="nav__link-text">{$lang.layouts.table.activate_for} {$rule['name']}</span>
                                                                            </a>
                                                                        </li>
                                                                    {/foreach}
                                                                    <li class="nav__divider"></li>
                                                                    <li class="nav__item">
                                                                        <a class="nav__link" href="{$mainMenuLayout->getLivePreviewLink()}" target="__blank">
                                                                            <span class="nav__link-icon ls ls-image"></span>
                                                                            <span class="nav__link-text">{$lang.general.live_preview}</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane {if $smarty.get.layoutTab == 'footer'} is-active {/if}" id="layout-footer">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.layouts.footer.title}</h3>
                                    {include file="adminarea/includes/helpers/docs.tpl" link=$docs.layouts.footer_layout}
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table class="t-c__table table mob-table--block" id="settings-table" data-services-table data-search-input="#table-elements" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                                    <colgroup>
                                        <col class="table__col-8">
                                        <col class="table__col-5">
                                        <col class="table__col-5">
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="cell-title">
                                                <span>{$lang.general.name}</span>
                                                <span class="sorting-icons-box">
                                                    {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                </span>
                                            </th>
                                            {foreach $rules as $rule}
                                                <th class="cell-rule">
                                                    <span>{$rule['name']}</span>
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                            {/foreach}                                            
                                            <th class="cell-actions no-sort"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $template->getFooterLayouts() as $k => $footerLayout}
                                            <tr>
                                                <td class="cell-name">
                                                    <div class="rail">
                                                        <div class="content-extension">
                                                            <strong>{$footerLayout->getName()}</strong>
                                                        </div>
                                                    </div>
                                                </td>
                                                {foreach $rules as $rule}
                                                    <td class="cell-rule">
                                                        {if {$rule['footers'][$footerLayout->getMainName()]['active']}}
                                                            <span class="label label--outline label--success">{$lang.general.active}</span>
                                                        {else}
                                                            <span class="label label--outline label--default">{$lang.general.disabled}</span>
                                                        {/if}
                                                    </td>
                                                {/foreach}
                                                <td class="cell-actions">
                                                    <div class="has-dropdown">
                                                        <a class="btn btn--default btn--outline btn--xs" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                                                            <span class="btn__text is-hidden-mob-down">{$lang.general.actions}</span>
                                                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                                                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                                                        </a>
                                                        <div class="dropdown" data-dropdown-menu>
                                                            <div class="dropdown__arrow" data-arrow></div>
                                                            <div class="dropdown__menu">
                                                                <ul class="nav">
                                                                    {foreach $rules as $rule}
                                                                        <li class="nav__item">
                                                                            <a class="nav__link {if {$rule['footers'][$footerLayout->getMainName()]['active']}} is-disabled{/if}"
                                                                            href="{$helper->url('Display@setActiveFooterLayout',['templateName'=>$template->getMainName(), 'layoutName' => $footerLayout->getMainName(), 'ruleName' => $rule['name']])}">
                                                                                <span class="nav__link-icon ls ls-{$rule['icon']}"></span>
                                                                                <span class="nav__link-text">{$lang.layouts.table.activate_for} {$rule['name']}</span>
                                                                            </a>
                                                                        </li>
                                                                    {/foreach}
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}