{extends file="adminarea/includes/layout.tpl"}

{assign var="iconLocation" value="./../../../assets/svg-icons"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="page_manage"}
{/block}
}
{block name="template-content"}
    <form
            id="pageForm"
            action="{$helper->url('Page@save',['templateName' => $template->getMainName(), 'pageName' => $settings['name']])}"
            method="POST"
            enctype="multipart/form-data"
            data-ajax-url="{$helper->url('Page@getPageSettings',['templateName' => $template->getMainName(), 'pageName' => $settings['name']])}"
            data-page-template-settings
            data-check-unsaved-changes
    >
        <div class="block">
            <div class="block__body">
                <div class="section">
                    <h3 class="section__title">
                        {$lang.page.page_template.header}
                        {include file="adminarea/includes/helpers/docs.tpl" link=$docs.pages.page_template}
                    </h3>
                    <div class="section__body">
                        {foreach $pageLayouts as $layoutName => $layout}
                            <div class="d-inline-block m-r-2x">
                                <div class="widget widget--checkbox widget--page-template {if $layout['active']}is-active{/if}" data-toggle="radio">
                                    <input class="hidden" type="radio" name="layout" value="{$layoutName}" {if $layout['active']} checked {/if}/>
                                    <div class="widget__header">
                                        <div class="widget__media widget__media--lg">

                                            <img src="{$layout['preview']}" alt=""/>

                                        </div>
                                        <div class="widget__checkbox">
                                            <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                                        </div>
                                    </div>
                                    <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                        <div>
                                            <strong>{$layout['label']}</strong>
                                        </div>
                                        {if $layout['active']}
                                            <label class="label label--success label--outline">Active</label>
                                        {else}
                                            <label class="label label--default label--outline">Activate</label>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>

                <div class="section section--template-settings" data-template-settings-container>
                    <h3 class="section__title">
                        {$lang.page.template_settings.header}
                        {include file="adminarea/includes/helpers/docs.tpl" link=$docs.pages.template_settings}
                    </h3>

                    <div class="widget__body panel">
                        <div class="p-v-8x d-flex flex-items-xs-center" data-template-settings-loader>
                            <div class="preloader preloader--lg"></div>
                        </div>
                        <div class="widget__content p-0x is-hidden" data-template-settings>
                        </div>
                        <div class="widget__content msg p-v-6x is-hidden" data-template-settings-no-data>
                            <div class="msg__icon i-c-6x">
                                {include file="$iconLocation/no-data.tpl"}
                            </div>
                            <div class="msg__body">
                                <span class="msg__title">{$lang.page.template_settings.no_data}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {if !$settings['hidePageSettings']}
            <div class="block__sidebar block__sidebar--md is-sticky" data-page-settings>
                <div class="section">
                    <h3 class="section__title">
                        Page Settings
                        {include file="adminarea/includes/helpers/docs.tpl" link=$docs.pages.page_settings}
                    </h3>
                    <div class="section__body">
                        {if $template->getActiveDisplay()->name != 'Default'}
                            <div class="widget panel of-visible">
                                <label class="widget__top top">
                                    <div class="top__title">
                                        General
                                    </div>
                                </label>
                                <div class="widget__body">
                                    <div class="widget__content">
                                        <div class="form-group">
                                            <label class="form-label">
                                                Display Rule Assignment
                                                {if $tooltips['page']['settings']['general']['display_rule_assignment']['content']}
                                                    {if isset($tooltips['page']['settings']['general']['display_rule_assignment']['url']) && $tooltips['page']['settings']['general']['display_rule_assignment']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['general']['display_rule_assignment']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover popover__top"
                                                        popoverBody="{$tooltips['page']['settings']['general']['display_rule_assignment']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                            </label>
                                            <select class="form-control selectized m-w-250 opacity-1" name="display_type" tabindex="-1">
                                                {foreach $template->getActiveDisplay()->rules as $rule}
                                                    <option value="{$rule->slug}" {if $page->display_type == $rule->slug} selected {/if}>{$rule->name}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}
                        {if !$settings['hideSeoSettings']}
                            <div class="widget panel of-visible">
                                <label class="widget__top top">
                                    <div class="top__title">
                                        SEO
                                    </div>
                                    <div class="top__actions">
                                        <div class="switch">
                                            <input type="hidden" name="seoEnabled" value="0">
                                            <input class="switch__checkbox" name="seoEnabled" value="1" type="checkbox" {if isset($page) && $page->seo_enabled} checked {/if} data-seo-enable>
                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                        </div>
                                    </div>
                                </label>
                                <div class="widget__body widget__body--seo {if !isset($page) || !$page->seo_enabled}is-hidden{/if}" data-seo-section>
                                    <div class="widget__content">
                                        {if $template->getActiveDisplay()->name == 'CMS'}
                                            <div class="form-group" data-form-counter>
                                                <label class="form-label">
                                                    Robots
                                                    {if $tooltips['page']['settings']['seo']['robots']['content']}
                                                        {if isset($tooltips['page']['settings']['seo']['robots']['url']) && $tooltips['page']['settings']['seo']['robots']['url'] != ""}
                                                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['seo']['robots']['url']}' target='_blank'>Learn More</a>"}
                                                        {else}
                                                            {assign var="popoverFooter" value=false}
                                                        {/if}
                                                        {include 
                                                            file="adminarea/includes/helpers/popover.tpl" 
                                                            popoverClasses="notification__popover popover__top"
                                                            popoverBody="{$tooltips['page']['settings']['seo']['robots']['content']}"
                                                            popoverFooter="{$popoverFooter}"
                                                        }
                                                    {/if}
                                                </label>
                                                <select class="form-control selectized m-w-250" name="seoRobots" tabindex="-1">
                                                    <option value="1" {if $page->seo_robots} selected{/if}>Allow</option>
                                                    <option value="0" {if !$page->seo_robots} selected {/if}>Disallow</option>
                                                </select>
                                            </div>
                                        {/if}
                                        <div class="form-group" data-form-counter>
                                            <label class="form-label">
                                                Seo Title 
                                                <span class="form-label__counter">(<span data-form-counter-value>{if isset($page)}{$page->seo_title[$whmcsLang->value]|count_characters:true}{else}0{/if}</span>/64)</span>
                                                {if $tooltips['page']['settings']['seo']['title']['content']}
                                                    {if isset($tooltips['page']['settings']['seo']['title']['url']) && $tooltips['page']['settings']['seo']['title']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['seo']['title']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover popover__top"
                                                        popoverBody="{$tooltips['page']['settings']['seo']['title']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                                <a class="form-label__translate seo-translation" data-seo-translation="title" href="#titleSeoTranslationModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                                                    Translate
                                                </a>
                                            </label>
                                            <input class="form-control" type="text" data-max="64" data-seo-input-title data-form-counter-input value="{$page->seo_title[$whmcsLang->value]}" data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">
                                            <input type="hidden" name="seoTitle" value='{literal}{{/literal}{foreach $page->seo_title as $key=>$title}"{$key}":"{$title}"{if !$title@last},{/if}{/foreach}{literal}}{/literal}' data-seo-translation-title>
                                        </div>
                                        <div class="form-group" data-form-counter>
                                            <label class="form-label">
                                                Seo Description 
                                                <span class="form-label__counter">(<span data-form-counter-value>{if isset($page)}{$page->seo_description[$whmcsLang->value]|count_characters:true}{else}0{/if}</span>/160)</span>
                                                {if $tooltips['page']['settings']['seo']['description']['content']}
                                                    {if isset($tooltips['page']['settings']['seo']['description']['url']) && $tooltips['page']['settings']['seo']['description']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['seo']['description']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover popover__top"
                                                        popoverBody="{$tooltips['page']['settings']['seo']['description']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                                <a class="form-label__translate seo-translation" data-seo-translation="description" href="#descriptionSeoTranslationModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false">
                                                    Translate
                                                </a>
                                            </label>
                                            <textarea class="form-control" type="text" data-max="160" data-seo-input-description data-form-counter-input data-ajax-url="{$helper->url('Page@updateSeoTranslations',['templateName'=>$template->getMainName()])}">{$page->seo_description[$whmcsLang->value]}</textarea>
                                            <input type="hidden" name="seoDescription" value='{literal}{{/literal}{foreach $page->seo_description as $key=>$desc}"{$key}":"{$desc}"{if !$desc@last},{/if}{/foreach}{literal}}{/literal}' data-seo-translation-description>
                                        </div>
                                        <div class="form-group m-b-0x" data-seo-container>
                                            <label class="form-label">
                                                Social Image
                                                {if $tooltips['page']['settings']['seo']['image']['content']}
                                                    {if isset($tooltips['page']['settings']['seo']['image']['url']) && $tooltips['page']['settings']['seo']['image']['url'] != ""}
                                                        {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['seo']['image']['url']}' target='_blank'>Learn More</a>"}
                                                    {else}
                                                        {assign var="popoverFooter" value=false}
                                                    {/if}
                                                    {include 
                                                        file="adminarea/includes/helpers/popover.tpl" 
                                                        popoverClasses="notification__popover popover__top"
                                                        popoverBody="{$tooltips['page']['settings']['seo']['image']['content']}"
                                                        popoverFooter="{$popoverFooter}"
                                                    }
                                                {/if}
                                            </label>
                                            <a class="btn btn--secondary btn--block {if $page->seo_image}is-hidden{/if}" href="#seoImageModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false"  data-seo-btn>
                                                Choose Image
                                            </a>
                                            <input type="hidden" name="seoImage" data-seo-input value="{if $page->seo_image}{$page->seo_image}{/if}">
                                            <div class="media media--seo d-block {if isset($page) && $page->seo_image}{else}is-hidden{/if}" data-seo-image-container>
                                                <div class="media__content">
                                                    <div class="media__body">
                                                        <a href="#seoImageModal" data-toggle="lu-modal" data-backdrop="static" data-keyboard="false" data-seo-image-container class="img-container img-container--boxed d-flex">
                                                            <img data-seo-image src="{if $page->seo_image} /templates/{$themeName}/assets/img/page-manager/{$page->seo_image} {/if}" alt="{if $page->seo_image} {$page->seo_image} {/if}"/>
                                                        </a>
                                                    </div>
                                                    <div class="media__footer">
                                                        <div class="seo-image-name truncate" data-seo-image-name>
                                                            {if $page->seo_image} {$page->seo_image} {/if}
                                                        </div>
                                                        <a
                                                                class="btn btn--icon btn--link"
                                                                data-toggle="lu-modal"
                                                                href="#deleteSeoImageModal"
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
                                </div>
                            </div>
                        {/if}

                        <div class="widget panel of-visible {if $template->getActiveDisplay()->name == 'CMS'}is-hidden{/if}" data-toggle-visibility>
                            <label class="widget__top top">
                                <div class="top__title">
                                    Custom Layout
                                </div>
                                <div class="top__actions">
                                    <div class="switch">
                                        <input type="hidden" name="settings[layoutEnabled]" value="0">
                                        <input class="switch__checkbox" name="settings[layoutEnabled]" value="1" type="checkbox" {if isset($page) && $page->settings['layoutEnabled']} checked {/if} data-toggle-visibility-switch>
                                        <span class="switch__container"><span class="switch__handle"></span></span>
                                    </div>
                                </div>
                            </label>
                            <div class="widget__body widget__body--layout {if !isset($page) || !$page->settings['layoutEnabled']}is-hidden{/if}" data-toggle-visibility-target>
                            <div class="widget__content">
                                <div class="form-group" data-form-counter>
                                    <label class="form-label">
                                        Main Menu Layout
                                        {if $tooltips['page']['settings']['custom_layout']['main_menu']['content']}
                                            {if isset($tooltips['page']['settings']['custom_layout']['main_menu']['url']) && $tooltips['page']['settings']['custom_layout']['main_menu']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['custom_layout']['main_menu']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__top"
                                                popoverBody="{$tooltips['page']['settings']['custom_layout']['main_menu']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <select class="form-control " name="settings[layout_mainmenu]" tabindex="-1">
                                        {foreach $pageCustomLayouts['mainMenu'] as $index => $menuItem}
                                            <option value="{$menuItem->getMainName()}" {if isset($page) && $page->settings['layout_mainmenu'] == $menuItem->getMainName()} selected {/if}>{$menuItem->getName()}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="form-group" data-form-counter>
                                    <label class="form-label">
                                        Footer Layout
                                        {if $tooltips['page']['settings']['custom_layout']['footer']['content']}
                                            {if isset($tooltips['page']['settings']['custom_layout']['footer']['url']) && $tooltips['page']['settings']['custom_layout']['footer']['url'] != ""}
                                                {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$tooltips['page']['settings']['custom_layout']['footer']['url']}' target='_blank'>Learn More</a>"}
                                            {else}
                                                {assign var="popoverFooter" value=false}
                                            {/if}
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover popover__top"
                                                popoverBody="{$tooltips['page']['settings']['custom_layout']['footer']['content']}"
                                                popoverFooter="{$popoverFooter}"
                                            }
                                        {/if}
                                    </label>
                                    <select class="form-control" name="settings[layout_footer]" tabindex="-1">
                                        {foreach $pageCustomLayouts['footer'] as $index => $menuItem}
                                            <option value="{$menuItem->getMainName()}" {if isset($page) && $page->settings['layout_footer'] == $menuItem->getMainName()} selected {/if}>{$menuItem->getName()}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {/if}
        </div>
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <button
                    type="button"
                    class="btn btn btn--primary"
                    data-check-unsaved-changes
                    data-changes-save="#pageForm"
            >
                <span class="btn__text">Save Changes</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a
                    class="btn btn--default btn--outline "
                    href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}"
            >
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}

{block name="template-modals"}
    {include file="adminarea/pages/includes/modal/seo-translation.tpl"
    type='title'
    label='SEO Title Translation Modal'
    }
    {include file="adminarea/pages/includes/modal/seo-translation.tpl"
    type='description'
    label='SEO Description Translation Modal'
    }
    {include file="adminarea/pages/includes/modal/seo-image.tpl"}
    {include file="adminarea/pages/includes/modal/seo-image-remove.tpl"}
    {include file="adminarea/includes/modals/save-confirmation.tpl"}
    {include file="adminarea/includes/modals/unsaved-changes.tpl"}
{/block}


{block name="template-scripts"}
    <script type="text/javascript" src="{$helper->script('page-manager.js')}"></script>
{/block}



















