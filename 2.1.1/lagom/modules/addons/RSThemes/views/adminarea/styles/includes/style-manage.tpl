<form id="{$dataSectionList['args']['filename']}Form" name="colorScheme"
      action="{$helper->url('Template@styleSave',['templateName'=>$template->getMainName()])}" method="POST">
    <input type="hidden" name="type" value="{$dataSectionList['args']['filename']}">
    {foreach $dataSectionList as $sectionName => $cssData}
        {if $sectionName != "args"}
            <h5 class="color-section__title">
                {if isset($cssData['args']['url'])}
                    <a href="{$cssData['args']['url']}">{$sectionName}</a>
                {else}
                    {$sectionName}
                {/if}
            </h5>
            <div class="row">
                {foreach $cssData as $k=>$val}
                    {if $k != "args" && !empty($val->name)}
                        <div class="col-md-3">
                            <div class="color-chose__container">
                                <label>{$val->name}</label>
                                {if $val->variable}
                                    {if $val->args['var_group']}
                                        <div class="form-group">
                                            <select name="config[{$k}]">
                                                {if isset($val->args['var_default']) && isset($val->args['var_default_name'])}
                                                    <option value="{$val->args['var_default']}">{$val->args['var_default_name']}</option>
                                                {/if}
                                                {if isset($groups[$val->args['var_group']])}
                                                    {foreach $groups[$val->args['var_group']] as $index => $item}
                                                        <option value="{$index}" {if $val->variable == $index} selected {/if}>{if isset($item->args['group_name'])}{$item->args['group_name']}{else}{$item->name}{/if}</option>
                                                    {/foreach}
                                                {/if}
                                            </select>
                                        </div>
                                    {else}
                                        <div class="form-group form-group__custom">
                                            <div class="dropdown-container" data-rs-dropdown="color-picker"
                                                 {if $val->varColor}data-color-hex="{$val->varColor}"{/if}>
                                                <div class="color-preview-container">
                                                    <div class="opacity-pattern"></div>
                                                    <div class="color-preview activeColor"
                                                         style="{if count($val->varColor)==3}background:linear-gradient( {$val->varColor[0]}, {$val->varColor[1]} 0%, {$val->varColor[2]} 100%);{elseif $val->varColor}background:{$val->varColor}{else}background:{$val->color}{/if}">
                                                        <span></span>
                                                    </div>
                                                </div>
                                                <div class="drop-content">
                                                    <div class="rs-dropdown">
                                                        <div class="rs-search">
                                                            <div class="item item__search">
                                                                <div class="item__addon">
                                                                    <i class="lm lm-search"></i>
                                                                </div>
                                                                <div class="item__content">
                                                                    <input type="text" placeholder="Search">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="rs-items">
                                                            {if isset($val->args['var_default']) && isset($val->args['var_default_name'])}
                                                                {foreach $colorVars[$activeScheme] as $section => $activeSchemeSections}
                                                                    {if $section!="args"}
                                                                        {foreach $activeSchemeSections as $colorIndex => $colorScheme}
                                                                            {if $colorIndex!="args"}
                                                                                {if $colorIndex == $val->args['var_default']}
                                                                                    <div data-color="{$colorScheme->color}"
                                                                                         data-value="{$colorIndex}"
                                                                                         class="item">
                                                                                        <div class="item__addon">
                                                                                            <span class="color-preview"
                                                                                                  style="background-color:{$colorScheme->color}"></span>
                                                                                        </div>
                                                                                        <div class="item__content">
                                                                                            <span class="value__text">{$val->args['var_default_name']}</span>
                                                                                        </div>
                                                                                    </div>
                                                                                    {break}
                                                                                {/if}
                                                                            {/if}
                                                                        {/foreach}
                                                                    {/if}
                                                                {/foreach}
                                                            {/if}
                                                            {foreach $colorVars[$activeScheme] as $section => $activeSchemeSections}
                                                                {if $section!="args"}
                                                                    {foreach $activeSchemeSections as $colorIndex => $colorScheme}
                                                                        {if $colorIndex!="args"}
                                                                            {if (!isset($colorScheme->args['hidden']) || $colorScheme->args['hidden']!="droplist") && !empty($colorScheme->name)}
                                                                                <div data-color="{$colorScheme->color}"
                                                                                     data-value="{$colorIndex}"
                                                                                     class="item">
                                                                                    <div class="item__addon">
                                                                                        {if $colorScheme->gradient}
                                                                                            <span class="color-preview"
                                                                                                  style="background:linear-gradient( {$colorScheme->gradient[0]}, {$colorVarsArray[substr($colorScheme->gradient[1], 4, -1)]->varColor} 0%, {$colorVarsArray[substr($colorScheme->gradient[2], 4, -1)]->varColor})"></span>
                                                                                        {else}
                                                                                            <span class="color-preview"
                                                                                                  style="background-color:{$colorScheme->color}"></span>
                                                                                        {/if}
                                                                                    </div>
                                                                                    <div class="item__content">
                                                                                        <span class="value__text">{$section} - {$colorScheme->name}</span>
                                                                                    </div>
                                                                                </div>
                                                                            {/if}
                                                                        {/if}
                                                                    {/foreach}
                                                                {/if}
                                                            {/foreach}
                                                        </div>
                                                    </div>
                                                    <div class="drop-input">
                                                        <input type="hidden"
                                                               value="{if $val->color}{$val->color}{else}{$val->variable}{/if}"
                                                               class="rs-input form-control form-control--xs"
                                                               name="config[{$k}]">
                                                        <input readonly="readonly" type="text"
                                                               value="{if $val->color}{$val->color}{else}{$colorVarsArray[$val->variable]->section} - {$colorVarsArray[$val->variable]->name}{/if}"
                                                               class="rs-input_display form-control form-control--xs"
                                                               name="config_display_name[{$k}]">
                                                    </div>
                                                </div>
                                                <div class="drop-actions">
                                                    <i class="ls ls-chevron-down"></i>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                {elseif $val->font}
                                    <div class="form-group form-group__custom">
                                        <div class="dropdown-container" data-rs-dropdown>
                                            <div class="drop-content">
                                                <div class="drop-input">
                                                    <input value="{$val->font}"
                                                           class="rs-input form-control form-control--xs"
                                                           name="config[{$k}]">
                                                </div>
                                                <div class="rs-dropdown">
                                                    <div class="rs-search">
                                                        <div class="item item__search">
                                                            <div class="item__addon">
                                                                <i class="lm lm-search"></i>
                                                            </div>
                                                            <div class="item__content">
                                                                <input type="text" placeholder="Search">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="rs-items">
                                                        {foreach $googleFonts as $font}
                                                            <div data-value="{$font->family}" class="item">
                                                                <div class="item__content">
                                                                    <span class="value__text">{$font->family} - {$font->family} </span>
                                                                </div>
                                                            </div>
                                                        {/foreach}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="drop-actions">
                                                <i class="ls ls-caret"></i>
                                            </div>
                                        </div>
                                    </div>
                                {elseif $val->text}
                                    <div class="form-group">
                                        <input autocomplete="off" class="form-control form-control--xs" type="text"
                                               name="config[{$k}]" value="{$val->text}">
                                    </div>
                                {else}
                                    {if $val->gradient}
                                        <div class="form-group">
                                            <div class="color-preview"
                                                 style="background-image: linear-gradient( 90deg, {$val->gradient[0]} 0%, {$val->gradient[1]})"></div>
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}][]" value="{$val->gradient[0]}">
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}][]" value="{$val->gradient[1]}">
                                        </div>
                                    {else}
                                        <div class="color-chose__container">
                                            <div class="form-group form-group__custom">
                                                <div class="dropdown-container" data-rs-dropdown="color-picker"
                                                     data-color-hex="{$val->color}">
                                                    <div class="color-preview-container">
                                                        <div class="opacity-pattern"></div>
                                                        <div class="color-preview activeColor"
                                                             style="background-color:{$val->color}">
                                                        </div>
                                                    </div>
                                                    <div class="drop-content">
                                                        <div class="drop-input">
                                                            <input value="{$val->color}"
                                                                   class="rs-input form-control form-control--xs"
                                                                   name="config[{$k}]">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        {*<div class="form-group">
                                            <div class="color-preview" style="background-color: {$val->color}"></div>
                                            <input autocomplete="off" class="form-control color-picker form-control--xs"
                                                   type="text" name="config[{$k}]" value="{$val->color}">
                                        </div>*}
                                    {/if}
                                {/if}

                            </div>
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
    {/foreach}
    <div class="app-main__actions">
        <div class="container">
            <button onclick="$(this).addClass('is-loading is-disabled');$('#{$dataSectionList['args']['filename']}Form').submit();"
                    type="button" class="btn btn--success">
                <span class="btn__text">Save Changes!</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a class="btn btn--default btn--outline "
               href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
</form>
