<div class="app-main__top">
    <div class="container">
        <div class="top">
            {* Styles *}
            {if isset($type) && $type === "style_manage"}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@styles',['templateName'=>$template->getMainName()])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@styles',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.styles}
                                    </a>
                                </li>
                                <li class="breadcrumb__item">
                                    <span class="breadcrumb__item-text">
                                        {if isset($style) && method_exists($style,"getName")}{$style->getName()}{else}{$smarty.get.styleName}{/if}
                                    </span>
                                    {if isset($style) && method_exists($style,"isActiveFromConfig") && $style->isActiveFromConfig()}
                                        <span class="label label--success label--outline m-l-2x">{$lang.general.active}</span>
                                    {/if}
                                </li>
                            </ul>
                        </h1>
                    </div>
                </div>

                <div class="top__toolbar">
                    {if isset($style) && method_exists($style,"isActiveFromConfig")}
                        {if !$style->isActiveFromConfig()}
                            <a class="btn btn--primary" href="{$helper->url('Template@setStyle',['templateName'=>$template->getMainName(), 'styleName' => $style->getMainName(), 'manage' => true])}">
                                <span class="btn__text">Activate</span>
                            </a>
                        {/if}
                    {/if}
                </div>

            {* Pages *}
            {elseif isset($type) && $type === "page"}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@pages',['templateName'=>$template->getMainName()])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.pages}
                                    </a>
                                </li>
                                <li class="breadcrumb__item">
                                    <span class="breadcrumb__item-text">
                                        {$page->getName()}
                                    </span>
                                </li>
                            </ul>
                        </h1>
                    </div>
                </div>

            {* Page Manage *}
            {elseif isset($type) && $type === "page_manage"}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@pages',['templateName'=>$template->getMainName()])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.pages}
                                    </a>
                                </li>
                                {if isset($settings['group'])}
                                    <li class="breadcrumb__item">
                                        <a class="breadcrumb__item-text" href="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'tab' => $settings['group']])}">
                                            {$settings['group']}
                                        </a>
                                    </li>
                                {/if}
                                {if isset($settings['displayName'])}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$settings['displayName']}
                                        </span>
                                    </li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>
            {* Menu - Menus *}
            {elseif isset($type) && $type === 'menu'}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => $smarty.get.menuTab])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@menu',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.menu}
                                    </a>
                                </li>
                                {if isset($menu)}
                                    <li class="breadcrumb__item">
                                        <a class="breadcrumb__item-text" href="{$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => $smarty.get.menuTab])}">
                                            {$menu->location}
                                        </a>
                                    </li>
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$menu->name}
                                        </span>
                                    </li>
                                {else}
                                    <li class="breadcrumb__item">
                                        <a class="breadcrumb__item-text" href="{$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => $smarty.get.menuTab])}">
                                            {$smarty.get.menuLocation}
                                        </a>
                                    </li>
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$lang.breadcrumb.new_menu}
                                        </span>
                                    </li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>

            {* Settings - Display *}
            {elseif isset($type) && $type === 'display'}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@settings',['templateName'=>$template->getMainName()])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@settings',['templateName'=>$template->getMainName()])}">
                                        {$lang.breadcrumb.display_rules}
                                    </a>
                                </li>
                                {if isset($display)}
                                    <li class="breadcrumb__item"><span class="breadcrumb__item-text">{$display->name}</span></li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>

            {* Menu - Sidebars *}
            {elseif isset($type) && $type === 'sidebar'}
                <div class="top__toolbar">
                    {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => 'sidebar'])}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            <ul class="top__title-text breadcrumb breadcrumb--angle-separator ">
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => 'main'])}">
                                        {$lang.breadcrumb.menu}
                                    </a>
                                </li>
                                <li class="breadcrumb__item">
                                    <a class="breadcrumb__item-text" href="{$helper->url('Template@menu',['templateName'=>$template->getMainName(), 'menuTab' => 'sidebar'])}">
                                        {$lang.breadcrumb.sidebar}
                                    </a>
                                </li>
                                {if isset($sidebar)}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$sidebar->name}
                                        </span>
                                    </li>
                                {else}
                                    <li class="breadcrumb__item">
                                        <span class="breadcrumb__item-text">
                                            {$lang.breadcrumb.new_sidebar}
                                        </span>
                                    </li>
                                {/if}
                            </ul>
                        </h1>
                    </div>
                </div>
            {* Others *}
            {else}
                <div class="top__toolbar">
                    {if $smarty.get.controller == 'Template' && $smarty.get.action == 'info'}
                        {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Templates@index',['templateName' => $template->getMainName()])}
                    {else}
                        {include file="adminarea/includes/breadcrumb/button-back.tpl" link=$helper->url('Template@info',['templateName' => $template->getMainName()])}
                    {/if}
                </div>
                <div class="top__content">
                    <div class="top__title">
                        <h1 class="top__title-text">
                            {$template->getName()}
                        </h1>
                        {if $template->isActive()}
                            <span class="label label--success label--outline m-l-2x">{$lang.general.active}</span>
                            {*{if $template->getMainName() == 'lagom2' && \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                                {include file="adminarea/cms/cms_breadcrumb.tpl"}
                            {/if}*}
                            {if \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                            <div class="has-dropdown dropdown-style-display">
                                <a class="" href="" data-toggle="lu-dropdown" data-placement="bottom right" data-change-display-button>
                                    <span class="label label--info label--outline m-l-1x"><span class="text-faded">Display: </span> &nbsp;{$template->getActiveDisplay()->name}&nbsp;<i class="text-primary ls ls-caret"></i></span>
                                </a>
                                <div class="dropdown dropdown-styles" style="display: none" data-dropdown-menu data-url="">
                                    <div class="dropdown__arrow" data-arrow></div>

                                    <div class="dropdown__menu">
                                        <ul class="nav">
                                            {foreach $template->getDisplays() as $display}
                                                {if $template->getMainName() != 'lagom2' || !\RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                                                    {if $display->name == "CMS"}
                                                        {continue}
                                                    {/if}
                                                {/if}
                                                <li class="nav__item {if $display->active}is-active{/if}">
                                                    <a class="nav__link" {if !$display->active}data-change-display-rule{/if} data-ajax-url="{$helper->url('Display@setActiveDisplay',['templateName' => $template->getMainName(), 'displayId' => $display->id, 'breadcrumb' => true, 'tab' => $smarty.get.action])}">
                                                        <span class="nav__link-text">{$display->name}</span>
                                                        {if $display->active}<span class="nav__link-icon ls ls-check"></span>{/if}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            {/if}
                        {/if}
                    </div>
                </div>

                <div class="top__toolbar">
                    <div class="has-dropdown">
                        <a class="btn btn--default btn--outline" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                            <span class="btn__text">{$lang.general.actions}</span>
                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                            <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                        </a>
                        <div class="dropdown" data-dropdown-menu>
                            <div class="dropdown__arrow" data-arrow></div>
                            <div class="dropdown__menu">
                                <ul class="nav">
                                    {if $template->license()->isActive()}
                                        <li class="nav__item">
                                            <a class="nav__link" href="{$template->getSysTplLink()}" target="_blank">
                                                <span class="nav__link-icon lm lm-search"></span>
                                                <span class="nav__link-text">{$lang.general.live_preview}</span>
                                            </a>
                                        </li>
                                    {/if}
                                    <li class="nav__item">
                                        <a class="nav__link" href="https://rsstudio.net/my-account/submitticket.php?step=2&deptid=2" target="_blank">
                                            <span class="nav__link-icon lm lm-denied"></span>
                                            <span class="nav__link-text">{$lang.breadcrumb.report_bug}</span>
                                        </a>
                                    </li>
                                    <li class="nav__divider"></li>
                                    <li class="nav__item">
                                        <a class="nav__link" href="https://lagom.rsstudio.net/docs" target="_blank">
                                            <span class="nav__link-icon lm lm-book"></span>
                                            <span class="nav__link-text">{$lang.breadcrumb.docs}</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    {if $template->license()->isActive()}
                        {if !$template->isActive()}
                            <a class="btn btn--primary" href="{$helper->url('Template@setActive',['templateName'=>$template->getMainName()])}">
                                <span class="btn__text">{$lang.breadcrumb.activate_theme}</span>
                            </a>
                        {/if}
                    {/if}
                </div>
            {/if}
        </div>
    </div>
</div>