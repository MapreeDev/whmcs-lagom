<div id="rs-module">
    <div class="app app--navbar-top app--navbar-h-simple">
        {include file="adminarea/includes/header.tpl"} 
        {include file="adminarea/includes/navbar.tpl"}
        <div class="app-main">
            <div class="app-main__header">
                <div class="app-main__top p-b-0x">
                    <div class="container">
                        <div class="top">
                            <div class="top__content">
                                <div class="top__title justify-content-between">
                                    <h1 class="top__title-text">RS Themes</h1>
                                </div>
                            </div>
                            <div class="top__toolbar">
                                <a class="btn btn--default btn--outline" href="https://lagom.rsstudio.net/">
                                    <span class="btn__text">Explore Themes <b class="m-l-1x ls ls-new-window"></b></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="app-main__nav">
                    <div class="container">
                        <ul class="nav nav--md nav--h nav--tabs">
                            <li class="nav__item   is-active">
                                <a class="nav__link" href="addonmodules.php?controller=Templates&amp;action=index&amp;module=RSThemes">
                                    <span class="nav__link-text">Client Area</span>
                                </a>
                            </li>
                            <li class="nav__item  is-disabled">
                                <a class="nav__link" href="#">
                                    <span class="nav__link-text">Admin Area</span><span class="label label--info-faded m-l-1x">Soon!</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="app-main__body">
                <div class="container">
                    <div class="row row--eq-height">
                        {foreach name=templatesLoop from=$templates key=k item=template}
                            <div class="col-sm-6 col-lg-4">
                                <div class="widget widget--theme-change {if $template->isActive()}widget--has-shadow{/if}">    
                                    {assign var="isNewVersionStable" value=true}
                                    {assign var="checkNewVersion" value=$template->newVersion()|replace:"Lagom ":""}
                                    {assign var="checkNewVersion" value="-"|explode:$checkNewVersion}

                                    {if isset($checkNewVersion[1]) && $checkNewVersion[1] != ""}
                                        {assign var="isNewVersionStable" value=false}
                                    {/if}                               
                                    {if $template->newVersionAvailable() && $template->model->version|replace:".":"" > 200 && $isNewVersionStable}
                                        <div class="widget__alert alert alert--info alert--sm has-icon alert--outline">
                                            <div class="alert__body">
                                                <span id="newVersion">New version <b>{$template->newVersion()}</b> is available! </span>
                                            </div>
                                        </div>
                                    {/if}
                                    {if $template->license()->hasProblem()}
                                        <div class="widget__alert alert alert--danger alert--sm has-icon alert--outline">
                                            <div class="alert__body">
                                               {$template->license()->getProblem()}
                                            </div>
                                        </div>
                                    {/if}
                                        <a class="widget__media" href="{$helper->url('Template@info',['templateName'=>$template->getMainName()])}">
                                            {if $template->getPreview()}
                                                    <img src="{$template->getPreview()}" alt=""/>
                                            {else}
                                                <img src="{$helper->img('/placeholders/placeholder-xs.svg')}" alt=""/>
                                            {/if}
                                        </a>
                                    <div class="widget__actions widget__actions--raised flex flex-items-xs-between">                                        
                                        <span class="rail">
                                            <span class="type-6  m-r-2x">{$template->getName()}</span>
                                            {if $template->isActive()}<span class="label label--outline label--success m-l-0x">Active</span>{/if}
                                        </span>
                                        <div class="widget__btns p-0x">
                                            <a class="btn btn--sm btn--default btn--outline" href="{$helper->url('Template@info',['templateName'=>$template->getMainName()])}">
                                                <span class="btn__text">Manage <span class="theme-text">Theme</span></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>      
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        {include file="adminarea/includes/footer.tpl"}
    </div>    
</div>