{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type='display'}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl" type='display'}
{/block}

{block name="template-content"}
    <form id="displayForm" action="{$helper->url('Display@save',['templateName'=>$template->getMainName(), 'displayName' => $display->name, 'ruleId' => $displayRule->id])}" method="POST">
        <div class="tab-content">
            {foreach $display->rules as $rule}
                <div class="tab-pane display-rules {if $displayRule->id === $rule->id} is-active {/if}" id="display-rule-{$rule->id}">
                    <h3 class="section__title m-b-3x">Theme Settings for {$rule->name}</h3>
                    <div class="row panel m-h-0x p-r-1x p-b-1x">
                        <div class="col-md-6 p-l-0x p-r-2x">
                            <div class="form-group">
                                <label class="form-label">Navigation Layout</label>
                                <select class="form-control " name="rules[{$rule->id}][navigationLayout]">
                                    {foreach $template->getMainMenuLayouts() as $layout}
                                        <option value="{$layout->getMainName()}" {if $rule->navigation_layout == $layout->getMainName()} selected {/if}>{$layout->getName()}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 p-l-0x p-r-2x">
                            <div class="form-group">
                                <label class="form-label">Footer Layout</label>
                                <select class="form-control" name="rules[{$rule->id}][footerLayout]">
                                    {foreach $template->getFooterLayouts() as $layout}
                                        <option value="{$layout->getMainName()}" {if $rule->footer_layout == $layout->getMainName()} selected {/if}>{$layout->getName()}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                    <h3 class="section__title m-b-3x">Menu Settings for {$rule->name}</h3>
                    <div class="row panel m-h-0x p-r-1x p-b-1x">
                        <div class="col-md-6 p-l-0x p-r-2x">
                            <div class="form-group">
                                <label class="form-label">Main Menu</label>
                                <select class="form-control menu-seletize" name="rules[{$rule->id}][mainMenu]">
                                    {if !isset($rule->main_menu_id)}
                                        <option value="" selected>Choose menu from list bellow</option>
                                    {/if}
                                    {foreach $display->main_menus as $mainMenu}
                                        <option value="{$mainMenu->id}" {if $rule->main_menu_id == $mainMenu->id} selected {/if}>{$mainMenu->name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 p-l-0x p-r-2x">
                            <div class="form-group">
                                <label class="form-label">Secondary Menu</label>
                                <select class="form-control menu-seletize" name="rules[{$rule->id}][secondaryMenu]" data-placeholder="Choose from selected list">
                                    {if !isset($rule->secondary_menu_id)}
                                        <option value="" selected>Choose menu from list bellow</option>
                                    {/if}
                                    {foreach $display->secondary_menus as $secondaryMenu}
                                        <option value="{$secondaryMenu->id}" {if $rule->secondary_menu_id == $secondaryMenu->id} selected {/if}>{$secondaryMenu->name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 p-l-0x p-r-2x">
                            <div class="form-group">
                                <label class="form-label">Footer Menu</label>
                                <select class="form-control menu-seletize" name="rules[{$rule->id}][footerMenu]">
                                    {if !isset($rule->footer_menu_id)}
                                        <option value="" selected>Choose menu from list bellow</option>
                                    {/if}
                                    {foreach $display->footer_menus as $footerMenu}
                                        <option value="{$footerMenu->id}" {if $rule->footer_menu_id == $footerMenu->id} selected {/if}>{$footerMenu->name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container d-flex">
            <div class="flex-grow-1">
                <button class="btn btn--primary" type="submit" form="displayForm">
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <a class="btn btn--default btn--outline " href="">
                    <span class="btn__text">Cancel</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            </div>
        </div>
    </div>
{/block}

{block name="template-scripts"}
    {literal}
        <script>
            $('.menu-seletize').selectize({
                allowEmptyOption: true,
            });
        </script>
        <style>
            .selectize-dropdown{
                height: auto!important;
            }
        </style>
    {/literal}
{/block}
