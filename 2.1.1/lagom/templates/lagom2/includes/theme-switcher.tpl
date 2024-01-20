{if $RSThemes.toolBar.pageoptions}
    {if $smarty.get.rspage}
        {assign var="checkCurrentPageOption" value=$smarty.get.rspage}
    {else}
        {foreach key=num item=option from=$RSThemes.toolBar.pageoptions}
            {if $option->isActive()}
                {assign var="checkCurrentPageOption" value=$option->getMainName()}
            {/if}
            {if !$checkCurrentPageOption}
                {assign var="checkCurrentPageOption" value="default"}
            {/if}
        {/foreach}
    {/if}
{else}
    {assign var="checkCurrentPageOption" value="default"}
{/if}

<div class="theme-switcher" data-active-layout="{$RSThemes.toolBar.activeLayout}" data-active-style="{$RSThemes.toolBar.activeStyle}" data-active-page="{$checkCurrentPageOption}" data-choosen-style="" data-choosen-layout="" data-choosen-page="">
    <div class="theme-switcher-button">
        <button class="btn btn-icon btn-primary">
            <i class="ls ls-configure"></i>
            <span>Settings</span>
        </button>
    </div>
    <div class="theme-switcher-content">
        <div class="theme-switcher-body"> 
            <div class="theme-switcher-header">
                <h1>Theme Settings</h1>
                <i class="lm lm-info" data-toggle="tooltip" title="Theme Settings sidebar shows only for admin users."></i>
            </div>
          
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">Choose Layout</h2>
                </div>
                <div class="section-body">
                    <div class="row row-lg row-eq-height row-eq-height-sm m-b-neg-2x">
                        {foreach key=num item=layout from=$RSThemes.toolBar.layouts}
                            <div class="col-20 col-md-6 flex-column">
                                <a href="#" data-layout="{$layout->getMainName()}" class="theme-switcher-box theme-switcher-box-sm {if $layout->getMainName() == $RSThemes.toolBar.activeLayout}active{/if}">
                                    {* {if file_exists("/templates/$template/core/layouts/{$layout->getMainName()}/thumb-sm.svg")} *}
                                        <img src="{$WEB_ROOT}/templates/{$template}/core/layouts/{$layout->getMainName()}/thumb-sm.svg" alt="{$layout->getName()}"/>
                                    {* {else}
                                        <img src="{$WEB_ROOT}/templates/{$template}/core/layouts/{$layout->getMainName()}/thumb-sm.png" alt="{$layout->getName()}"/>
                                    {/if} *}
                                </a>
                                <h4>{$layout->getName()}{if $layout->getMainName()=="left-nav-wide"}<span class="label label-primary label-sm">NEW</span>{/if}</h4>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">Choose Style</h2>
                </div>
                <div class="section-body">
                    <div class="row row-lg row-eq-height row-eq-height-sm m-b-neg-2x">
                        {foreach key=num item=style from=$RSThemes.toolBar.styles}
                            <div class="col-md-4 flex-column">
                                <a href="#" data-style="{$style->getMainName()}" class="theme-switcher-box  {if $style->getMainName() == $RSThemes.toolBar.activeStyle}active{/if}">
                                    <img src="{$WEB_ROOT}/templates/{$template}/core/styles/{$style->getMainName()}/thumb-sm.png" alt="{$style->getName()}"/>
                                </a>
                                <h4>{$style->getName()}</h4>
                            </div>
                        {/foreach}            
                    </div>
                </div>
            </div>
            {if $RSThemes.toolBar.pageoptions}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">Choose Page Template</h2>
                    </div>
                    <div class="section-body">
                        <div class="row row-lg row-eq-height row-eq-height-sm m-b-neg-2x">
                            <div class="col-md-4 flex-column">                            
                                <a href="#" data-page="default" class="theme-switcher-box">
                                    {if file_exists("templates/$template/core/pages/$templatefile/thumb.png")}
                                    <img src="{$WEB_ROOT}/templates/{$template}/core/pages/{$templatefile}/thumb.png" alt="default"/>
                                    {else}
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/default_preview.png" alt="default"/>
                                    {/if}
                                </a>
                                <h4>Default</h4>
                            </div>
                            {foreach key=num item=option from=$RSThemes.toolBar.pageoptions}
                                <div class="col-md-4 flex-column">                            
                                    <a href="#" data-page="{$option->getMainName()}" class="theme-switcher-box {if $option->isActive()}active{/if}">
                                        {if file_exists("templates/$template/core/pages/$templatefile/{$option->getMainName()}/thumb.png")}
                                        <img src="{$WEB_ROOT}/templates/{$template}/core/pages/{$templatefile}/{$option->getMainName()}/thumb.png" alt="{$option->getName()}"/>
                                        {else}
                                        <img src="{$WEB_ROOT}/templates/{$template}/assets/img/default_preview.png" alt="default"/>
                                        {/if}
                                    </a>
                                    <h4>{$option->getName()}</h4>
                                </div>
                            {/foreach}    
                            <div class="col-md-4 flex-column">
                                <div class="theme-switcher-soon">
                                    <span>More templates coming soon</span>                            
                                    {if file_exists("templates/$template/core/pages/$templatefile/thumb.png")}
                                    <img src="{$WEB_ROOT}/templates/{$template}/core/pages/{$templatefile}/thumb.png" alt="default"/>
                                    {else}
                                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/default_preview.png" alt="default"/>
                                    {/if}
                                </div>
                            </div>        
                        </div>
                    </div>
                </div>
            {/if}
        </div>
        {assign var="currentUrl" value="`$smarty.server.REQUEST_URI`"}
        <div class="theme-switcher-footer">
            <a href="{$currentUrl|replace:$RSThemes.toolBar.activeStyle:''|replace:$RSThemes.toolBar.activeLayout:''|replace:$checkCurrentPageOption:''|replace:'?rsstyle=':''|replace:'&amp;rsstyle=':''|replace:'&amp;rslayout=':''|replace:'&amp;rspage=':''}" data-set-theme data-original-url="{$currentUrl|replace:$RSThemes.toolBar.activeStyle:''|replace:$RSThemes.toolBar.activeLayout:''|replace:$checkCurrentPageOption:''|replace:'?rsstyle=':''|replace:'&amp;rsstyle=':''|replace:'&amp;rslayout=':''|replace:'&amp;rspage=':''}" class="btn btn-lg btn-primary">Preview Template</a>
            <button data-style-reset class="btn btn-lg btn-default">Cancel</button>
        </div>
    </div>
</div>
