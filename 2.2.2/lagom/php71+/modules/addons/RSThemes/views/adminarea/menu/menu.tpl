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
                            <li class="nav__item {if !isset($smarty.get.menuTab) || $smarty.get.menuTab == 'main'} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#menu-main">
                                    <span class="nav__link-text">Main</span>
                                </a>
                            </li>
                            <li class="nav__item {if $smarty.get.menuTab == 'secondary'} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#menu-secondary">
                                    <span class="nav__link-text">Secondary</span>
                                </a>
                            </li>
                            {*
                            <li class="nav__item {if $smarty.get.menuTab == 'sidebar'} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#menu-sidebar">
                                    <span class="nav__link-text">Sidebar</span>
                                </a>
                            </li>
                            *}
                            <li class="nav__item {if $smarty.get.menuTab == 'footer'} is-active {/if}">
                                <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#menu-footer">
                                    <span class="nav__link-text">Footer</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <form data-menu-import-form action="{$helper->url('Data@import',['templateName' => $template->getMainName()])}" enctype="multipart/form-data" method="post">
                    <input type="file" data-menu-import-input name="file" class="d-none" accept="application/json"/>
                </form>
            </div>
            <div class="app-main__content">
                {if $newChangedAnyMenuVersion}
                    {include file="adminarea/includes/alert/newMenuImport.tpl"}
                {/if}
                <div class="tabs__body">
                    <div class="tab-content">
                        <div class="tab-pane {if !isset($smarty.get.menuTab) || $smarty.get.menuTab == 'main'} is-active {/if}" id="menu-main">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.menu.main_menu.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.menu.main_menu}</h3>
                                    
                                </div>
                                <div class="top__toolbar is-right">
                                    <div class="top__search input-group">
                                        <span class="input-group__icon lm lm-search"></span>
                                        <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="{$lang.general.search}..." id="main-search">
                                    </div>
                                    <button data-menu-import-btn class="btn btn--secondary">
                                        <span class="btn__text">{$lang.general.import}</span>
                                        <i class="btn__icon lm lm-download"></i>
                                    </button>
                                    <a class="btn btn--primary" href="{$helper->url('Menu@new',['templateName' => $template->getMainName(), 'menuLocation' => 'Main Menu', 'currentDisplay' => $template->getActiveDisplay()->id, 'menuTab' => 'main'])}">
                                        <i class="btn__icon lm lm-plus"></i>
                                        <span class="btn__text">
                                            {$lang.general.add_new}
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table class="t-c__table table mob-table--block" id="main-table" data-services-table data-search-input="#main-search" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                                    <colgroup>
                                        <col class="table__col-10">
                                        <col class="table__col-6">
                                        <col class="table__col-6">
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="cell-name">
                                            <span>{$lang.general.name}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-rule">
                                            <span>{$lang.general.rule}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-status">
                                            <span>{$lang.general.status}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-actions no-sort"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $mainMenus as $mainMenu}
                                        <tr>
                                            <td class="cell-name">
                                                <a href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $mainMenu->id, 'menuTab' => 'main'])}"><strong >{$mainMenu->name}</strong></a>
                                            </td>
                                            <td class="cell-rule">
                                                {if is_array($mainMenu->rule)}
                                                    {if isset($mainMenu->rule[$template->getActiveDisplay()->name])}
                                                        <span>{implode(', ', $mainMenu->rule[$template->getActiveDisplay()->name])}</span>
                                                    {else}
                                                        <span>-</span>
                                                    {/if}
                                                {else}
                                                    <span>{$mainMenu->rule}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-status">
                                                {if ($mainMenu->active)}
                                                    <span class="label label--success label--outline">{$lang.general.active}</span>
                                                {else}
                                                    <span class="label label--default label--outline is-disabled">{$lang.general.disabled}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-actions">
                                                <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $mainMenu->id, 'menuTab' => 'main'])}">
                                                    <span class="btn__text">{$lang.general.manage}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="preloader-container is-hidden" data-table-preloader>
                                    <div class="preloader"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane {if $smarty.get.menuTab == 'secondary'} is-active {/if}" id="menu-secondary">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.menu.secondary_menu.title}</h3>
                                    {include file="adminarea/includes/helpers/docs.tpl" link=$docs.menu.secondary_menu}
                                </div>
                                <div class="top__toolbar is-right">
                                    <div class="top__search input-group">
                                        <span class="input-group__icon lm lm-search"></span>
                                        <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="secondary-search">
                                    </div>
                                    <button data-menu-import-btn class="btn btn--secondary">
                                        <span class="btn__text">{$lang.general.import}</span>
                                        <i class="btn__icon lm lm-download"></i>
                                    </button>
                                    <a class="btn btn--primary" href="{$helper->url('Menu@new',['templateName' => $template->getMainName(), 'menuLocation' => 'Secondary Menu', 'currentDisplay' => $template->getActiveDisplay()->id, 'menuTab' => 'secondary'])}">
                                        <i class="btn__icon lm lm-plus"></i>
                                        <span class="btn__text">
                                            {$lang.general.add_new}
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table class="t-c__table table mob-table--block" id="sidebar-table" data-services-table data-search-input="#secondary-search" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                                    <colgroup>
                                        <col class="table__col-10">
                                        <col class="table__col-6">
                                        <col class="table__col-6">
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="cell-name">
                                            <span>{$lang.general.name}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-rule">
                                            <span>{$lang.general.rule}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-status">
                                            <span>{$lang.general.status}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-actions no-sort"></th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    {foreach $secondaryMenus as $secondaryMenu}
                                        <tr>
                                            <td class="cell-name">
                                                <a href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $secondaryMenu->id, 'menuTab' => 'secondary'])}"><strong>{$secondaryMenu->name}</strong></a>
                                            </td>
                                            <td class="cell-rule">
                                                {if is_array($secondaryMenu->rule)}
                                                    {if isset($secondaryMenu->rule[$template->getActiveDisplay()->name])}
                                                        <span>{implode(', ', $secondaryMenu->rule[$template->getActiveDisplay()->name])}</span>
                                                    {else}
                                                        <span>-</span>
                                                    {/if}
                                                {else}
                                                    <span>{$mainMenu->rule}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-status">
                                                {if ($secondaryMenu->active)}
                                                    <span class="label label--success label--outline">{$lang.general.active}</span>
                                                {else}
                                                    <span class="label label--default label--outline is-disabled">{$lang.general.disabled}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-actions">
                                                <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $secondaryMenu->id, 'menuTab' => 'secondary'])}">
                                                    <span class="btn__text">{$lang.general.manage}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="preloader-container is-hidden" data-table-preloader>
                                    <div class="preloader"></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane {if $smarty.get.menuTab == 'footer'} is-active {/if}" id="menu-footer">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.menu.footer_menu.title}</h3>
                                    {include file="adminarea/includes/helpers/docs.tpl" link=$docs.menu.footer_menu}                         
                                </div>
                                <div class="top__toolbar is-right">
                                    <div class="top__search input-group">
                                        <span class="input-group__icon lm lm-search"></span>
                                        <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="nav-search">
                                    </div>
                                    <button data-menu-import-btn class="btn btn--secondary">
                                        <span class="btn__text">{$lang.general.import}</span>
                                        <i class="btn__icon lm lm-download"></i>
                                    </button>
                                    <a class="btn btn--primary" href="{$helper->url('Menu@new',['templateName' => $template->getMainName(), 'menuLocation' => 'Footer', 'currentDisplay' => $template->getActiveDisplay()->id, 'menuTab' => 'footer'])}">
                                        <i class="btn__icon lm lm-plus"></i>
                                        <span class="btn__text">
                                            {$lang.general.add_new}
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table class="t-c__table table mob-table--block" id="footer-table" data-services-table data-search-input="#footer-search" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                                    <colgroup>
                                        <col class="table__col-10">
                                        <col class="table__col-6">
                                        <col class="table__col-6">
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="cell-name">
                                            <span>{$lang.general.name}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-rule">
                                            <span>{$lang.general.rule}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-status">
                                            <span>{$lang.general.status}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-actions no-sort"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $footerMenus as $footer}
                                        <tr>
                                            <td class="cell-name">
                                                <a href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $footer->id, 'menuTab' => 'footer'])}"><strong>{$footer->name}</strong></a>
                                            </td>
                                            <td class="cell-rule">
                                                {if is_array($footer->rule)}
                                                    {if isset($footer->rule[$template->getActiveDisplay()->name])}
                                                        <span>{implode(', ', $footer->rule[$template->getActiveDisplay()->name])}</span>
                                                    {else}
                                                        <span>-</span>
                                                    {/if}
                                                {else}
                                                    <span>{$footer->rule}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-status">
                                                {if ($footer->active)}
                                                    <span class="label label--success label--outline">{$lang.general.active}</span>
                                                {else}
                                                    <span class="label label--default label--outline is-disabled">{$lang.general.disabled}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-actions">
                                                <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Menu@show',['templateName'=>$template->getMainName(), 'menuId' => $footer->id, 'menuTab' => 'footer'])}">
                                                    <span class="btn__text">{$lang.general.manage}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="preloader-container is-hidden" data-table-preloader>
                                    <div class="preloader"></div>
                                </div>
                            </div>
                        </div>
                        {*
                        <div class="tab-pane {if $smarty.get.menuTab == 'sidebar'} is-active {/if}" id="menu-sidebar">
                            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                                <div class="top__toolbar">
                                    <h3 class="section__title">{$lang.menu.sidebar_menu.title}</h3>
                                    {include file="adminarea/includes/helpers/docs.tpl" link=$docs.menu.sidebar_menu}
                                </div>
                                <div class="top__toolbar is-right">
                                    <div class="top__search input-group">
                                        <span class="input-group__icon lm lm-search"></span>
                                        <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="nav-search">
                                    </div>
                                    <button data-menu-import-btn class="btn btn--secondary">
                                        <span class="btn__text">{$lang.general.import}</span>
                                        <i class="btn__icon lm lm-download"></i>
                                    </button>
                                    <a class="btn btn--primary" href="{$helper->url('Sidebar@new',['templateName'=>$template->getMainName(), 'menuTab' => 'sidebar'])}">
                                        <i class="btn__icon lm lm-plus"></i>
                                        <span class="btn__text">
                                            {$lang.general.add_new}
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="t-c__body t-c__body--boxed">
                                <table class="t-c__table table mob-table--block" id="sidebar-table" data-services-table data-search-input="#sidebar-search" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                                    <colgroup>
                                        <col class="table__col-10">
                                        <col class="table__col-6">
                                        <col class="table__col-6">
                                        <col class="table__col-2">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th class="cell-name">
                                            <span>{$lang.general.name}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-location">
                                            <span>{$lang.general.location}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-status">
                                            <span>{$lang.general.status}</span>
                                            <span class="sorting-icons-box">
                                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                            </span>
                                        </th>
                                        <th class="cell-actions no-sort"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach $sidebars as $sidebar}
                                        <tr>
                                            <td class="cell-name">
                                                <a href="{$helper->url('Sidebar@show',['templateName'=>$template->getMainName(), 'sidebarId' => $sidebar->id, 'menuTab' => 'sidebar'])}"><strong>{$sidebar->name}</strong></a>
                                            </td>
                                            <td class="cell-location">
                                                <span>{ucfirst($sidebar->location)}</span>
                                            </td>
                                            <td class="cell-status">
                                                {if ($sidebar->active)}
                                                    <span class="label label--success label--outline">{$lang.general.active}</span>
                                                {else}
                                                    <span class="label label--default label--outline is-disabled">{$lang.general.disabled}</span>
                                                {/if}
                                            </td>
                                            <td class="cell-actions">
                                                <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Sidebar@show',['templateName'=>$template->getMainName(), 'sidebarId' => $sidebar->id, 'menuTab' => 'sidebar'])}">
                                                    <span class="btn__text">{$lang.general.manage}</span>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                                <div class="preloader-container is-hidden" data-table-preloader>
                                    <div class="preloader"></div>
                                </div>
                            </div>
                        </div>
                        *}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}