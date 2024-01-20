{**************************** 

RSThemes - Extensions
1. Toolbar
    1.1. Search
    1.2. Explore Marketplace   
    1.3. Status Filter
2. Extensions Table
    2.1. Name
    2.2. Version
        2.2.1 Check If Stable Version
        2.2.2. New Version
        2.2.3. Compability
    2.3. Status
    2.3. Actions

*****************************}

{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"} 
{/block}
{block name="template-content"}
    <div class="section">
        <div class="t-c mob-t-c--full" data-table-container data-table-check-container>
            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                <div class="top__toolbar">
                    <h3 class="section__title">{$lang.extensions.title}{include file="adminarea/includes/helpers/docs.tpl" link=$docs.extensions.extensions}</h3>
                    
                </div>

                {* 1. Toolbar *}
                <div class="top__toolbar is-right">

                    {* 1.1. Search *}
                    <div class="top__search input-group">
                        <span class="input-group__icon lm lm-search"></span>
                        <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="{$lang.general.search}..." id="table-search" placeholder="Search">
                    </div>

                    {* 1.2. Explore Marketplace *}
                    <a class="btn btn--secondary" href="https://lagom.rsstudio.net/extensions" target="_blank">
                        <span class="btn__text">{$lang.general.explore_marketplace}</span>
                        <span class="btn__icon ls ls-share"></span>
                    </a>

                    {* 1.3. Status Filter *}
                    <div class="top__filter has-dropdown is-hidden" data-filter-table="#extensions-table">
                        <button class="btn btn--default btn--outline btn--mob-link" type="button" data-toggle="filter-dropdown" data-placement="bottom right">
                            <span class="btn__label">{$lang.general.status}: </span>
                            <span class="btn__text">
                                <span class="status" data-filter-icon><span class="status__text" data-filter>{$lang.general.all}</span></span>
                            </span>
                            <span class="btn__icon btn__icon-arrow ls ls-caret" data-arrow-target></span>
                        </button>
                        <div class="dropdown" data-dropdown-menu>
                            <div class="dropdown__arrow" data-arrow></div>
                            <div class="dropdown__menu" data-filter-table="#extensions-table">
                                <ul class="nav nav--sm">
                                    <li class="nav__header">
                                        <span class="nav__title">{$lang.general.filter_by_status}</span>
                                    </li>
                                    <li class="nav__item is-active" data-value="All">
                                        <a class="nav__link" href="#">
                                            <span class="nav__link-icon status status--"></span>
                                            <span class="nav__link-text">{$lang.general.all}</span>
                                            <span class="badge badge--outline"></span>
                                        </a>
                                    </li>
                                    <li class="nav__item" data-value="Disabled"  data-status-class="error">
                                        <a class="nav__link" href="#">
                                            <span class="nav__link-icon status status--closed"></span>
                                            <span class="nav__link-text">{$lang.general.disabled}</span>
                                            <span class="badge badge--outline"></span>
                                        </a>
                                    </li>
                                    <li class="nav__item" data-value="Active"  data-status-class="active">
                                        <a class="nav__link" href="#">
                                            <span class="nav__link-icon status status--active"></span>
                                            <span class="nav__link-text">{$lang.general.active}</span>
                                            <span class="badge badge--outline"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {* 2. Extensions Table *}    
            <div class="t-c__body t-c__body--boxed">
                <table class="t-c__table table mob-table--block" id="extensions-table" data-services-table data-search-input="#table-search" data-order='[3, "asc"]' data-clickable-rows="true" data-responsive="false">
                    <colgroup>
                        <col class="table__col-15">
                        <col class="table__col-5">
                        <col class="table__col-4">
                        <col class="table__col-0">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="cell-name">
                                <span>{$lang.general.name}</span>
                                <span class="sorting-icons-box">
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0)"><path class="sort-asc" d="M3.50021 4.00159L8.50021 4.00159C8.63282 4.00159 8.75999 3.94891 8.85376 3.85514C8.94753 3.76137 9.00021 3.6342 9.00021 3.50159L9.00021 3.00159C9.00101 2.93601 8.98808 2.87099 8.96224 2.81072C8.93641 2.75044 8.89825 2.69623 8.85021 2.65159L6.35021 0.151587C6.30532 0.103756 6.2511 0.0656343 6.1909 0.0395739C6.13071 0.0135136 6.06581 6.89211e-05 6.00021 6.89268e-05C5.93461 6.89326e-05 5.86971 0.0135136 5.80951 0.0395739C5.74932 0.0656343 5.6951 0.103756 5.65021 0.151587L3.15021 2.65159C3.10217 2.69623 3.06401 2.75044 3.03818 2.81072C3.01234 2.87099 2.99941 2.93601 3.00021 3.00159L3.00021 3.50159C3.00021 3.6342 3.05289 3.76137 3.14666 3.85514C3.24042 3.94891 3.3676 4.00159 3.50021 4.00159Z" fill="#B9BDC5"/><path class="sort-desc" d="M8.50003 8H3.50003C3.36743 8 3.24025 8.05268 3.14648 8.14645C3.05271 8.24021 3.00003 8.36739 3.00003 8.5V9C2.99924 9.06558 3.01217 9.13059 3.038 9.19087C3.06384 9.25115 3.102 9.30535 3.15004 9.35L5.65003 11.85C5.69493 11.8978 5.74914 11.936 5.80934 11.962C5.86954 11.9881 5.93444 12.0015 6.00003 12.0015C6.06563 12.0015 6.13053 11.9881 6.19073 11.962C6.25093 11.936 6.30514 11.8978 6.35003 11.85L8.85004 9.35C8.89807 9.30535 8.93623 9.25115 8.96207 9.19087C8.9879 9.13059 9.00083 9.06558 9.00003 9V8.5C9.00003 8.36739 8.94736 8.24021 8.85359 8.14645C8.75982 8.05268 8.63264 8 8.50003 8Z" fill="#B9BDC5"/></g><defs><clipPath id="clip0"><rect width="12" height="12" fill="white"/></clipPath></defs></svg>
                                </span>
                            </th>
                            <th class="cell-version">
                                <span>{$lang.general.version}</span>
                               <span class="sorting-icons-box">
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0)"><path class="sort-asc" d="M3.50021 4.00159L8.50021 4.00159C8.63282 4.00159 8.75999 3.94891 8.85376 3.85514C8.94753 3.76137 9.00021 3.6342 9.00021 3.50159L9.00021 3.00159C9.00101 2.93601 8.98808 2.87099 8.96224 2.81072C8.93641 2.75044 8.89825 2.69623 8.85021 2.65159L6.35021 0.151587C6.30532 0.103756 6.2511 0.0656343 6.1909 0.0395739C6.13071 0.0135136 6.06581 6.89211e-05 6.00021 6.89268e-05C5.93461 6.89326e-05 5.86971 0.0135136 5.80951 0.0395739C5.74932 0.0656343 5.6951 0.103756 5.65021 0.151587L3.15021 2.65159C3.10217 2.69623 3.06401 2.75044 3.03818 2.81072C3.01234 2.87099 2.99941 2.93601 3.00021 3.00159L3.00021 3.50159C3.00021 3.6342 3.05289 3.76137 3.14666 3.85514C3.24042 3.94891 3.3676 4.00159 3.50021 4.00159Z" fill="#B9BDC5"/><path class="sort-desc" d="M8.50003 8H3.50003C3.36743 8 3.24025 8.05268 3.14648 8.14645C3.05271 8.24021 3.00003 8.36739 3.00003 8.5V9C2.99924 9.06558 3.01217 9.13059 3.038 9.19087C3.06384 9.25115 3.102 9.30535 3.15004 9.35L5.65003 11.85C5.69493 11.8978 5.74914 11.936 5.80934 11.962C5.86954 11.9881 5.93444 12.0015 6.00003 12.0015C6.06563 12.0015 6.13053 11.9881 6.19073 11.962C6.25093 11.936 6.30514 11.8978 6.35003 11.85L8.85004 9.35C8.89807 9.30535 8.93623 9.25115 8.96207 9.19087C8.9879 9.13059 9.00083 9.06558 9.00003 9V8.5C9.00003 8.36739 8.94736 8.24021 8.85359 8.14645C8.75982 8.05268 8.63264 8 8.50003 8Z" fill="#B9BDC5"/></g><defs><clipPath id="clip0"><rect width="12" height="12" fill="white"/></clipPath></defs></svg>
                                </span>
                            </th>
                            <th class="cell-status filter">
                                <span>{$lang.general.status}</span>
                                <span class="sorting-icons-box">
                                    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0)"><path class="sort-asc" d="M3.50021 4.00159L8.50021 4.00159C8.63282 4.00159 8.75999 3.94891 8.85376 3.85514C8.94753 3.76137 9.00021 3.6342 9.00021 3.50159L9.00021 3.00159C9.00101 2.93601 8.98808 2.87099 8.96224 2.81072C8.93641 2.75044 8.89825 2.69623 8.85021 2.65159L6.35021 0.151587C6.30532 0.103756 6.2511 0.0656343 6.1909 0.0395739C6.13071 0.0135136 6.06581 6.89211e-05 6.00021 6.89268e-05C5.93461 6.89326e-05 5.86971 0.0135136 5.80951 0.0395739C5.74932 0.0656343 5.6951 0.103756 5.65021 0.151587L3.15021 2.65159C3.10217 2.69623 3.06401 2.75044 3.03818 2.81072C3.01234 2.87099 2.99941 2.93601 3.00021 3.00159L3.00021 3.50159C3.00021 3.6342 3.05289 3.76137 3.14666 3.85514C3.24042 3.94891 3.3676 4.00159 3.50021 4.00159Z" fill="#B9BDC5"/><path class="sort-desc" d="M8.50003 8H3.50003C3.36743 8 3.24025 8.05268 3.14648 8.14645C3.05271 8.24021 3.00003 8.36739 3.00003 8.5V9C2.99924 9.06558 3.01217 9.13059 3.038 9.19087C3.06384 9.25115 3.102 9.30535 3.15004 9.35L5.65003 11.85C5.69493 11.8978 5.74914 11.936 5.80934 11.962C5.86954 11.9881 5.93444 12.0015 6.00003 12.0015C6.06563 12.0015 6.13053 11.9881 6.19073 11.962C6.25093 11.936 6.30514 11.8978 6.35003 11.85L8.85004 9.35C8.89807 9.30535 8.93623 9.25115 8.96207 9.19087C8.9879 9.13059 9.00083 9.06558 9.00003 9V8.5C9.00003 8.36739 8.94736 8.24021 8.85359 8.14645C8.75982 8.05268 8.63264 8 8.50003 8Z" fill="#B9BDC5"/></g><defs><clipPath id="clip0"><rect width="12" height="12" fill="white"/></clipPath></defs></svg>
                                </span>
                            </th>
                            <th class="cell-actions no-sort"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $template->getExtensions()|@count == 0}
                            {* Brak *}
                        {else}                            
                            {foreach from=$template->getExtensions() item=extension key=k}
                                {* <tr data-url="{if $extension->isActive()} {$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])} {else} {$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'info'])} {/if}"> *}
                                <tr>

                                    {* 2.1. Name *}    
                                    <td class="cell-name">
                                        <div class="rail">
                                            <div class="content-extension">
                                                <a {if $extension->isActive()}href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}"{else}href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'info'])}"{/if}><strong>{$extension->getName()}</strong></a>
                                                <p class="extensions-description">{$extension->getDescription()}</p>
                                            </div>
                                        </div>
                                    </td>

                                    {* 2.2. Version *}    
                                    <td class="cell-version">
                                        <strong>v{$extension->getVersion()}</strong>
                                      
                                        {* 2.2.1 Check If Stable Version *}
                                        {assign var="isStable" value=true}
                                        {assign var="checkVersion" value="-"|explode:$template->getVersion()}
                                       
                                        {if $checkVersion[1] != ""}
                                            {assign var="isStable" value=false}
                                        {/if}
                                        
                                        {* 2.2.2. New Version *}  
                                        {if $extensions->extensions[$k]->newVersionAvailable && $extensions->extensions[$k]->newVersionAvailable != $extension->getVersion() && $isStable}
                                            <span class="notification">
                                                <i class="notification__icon text-danger ls ls-exclamation-circle"></i> 
                                                <span class="notification__text text-danger">
                                                    {$lang.info.theme_information.new_version} {*$extensions->extensions[$k]->newVersionAvailable*}
                                                </span>
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover"
                                                    popoverBody="{$lang.extensions.new_version_desc_1} <b>“{$extension->getName()}”</b> {$lang.extensions.new_version_desc_2}"
                                                    popoverFooter="<a class='btn btn--secondary btn--xs' href='https://rsstudio.net/my-account/' target='_blank'>{$lang.general.download_now}</a>"
                                                }
                                            </span>
                                        {/if}
                                        
                                        {* 2.2.3. Compability *}    
                                        {if $extensions->extensions[$k]->compability === false && $isStable && $template->getVersion()|replace:".":"" > '169'}
                                            <span class="notification">
                                                <i class="notification__icon text-danger ls ls-exclamation-circle"></i> 
                                                <span class="notification__text text-danger">
                                                    {$lang.info.theme_information.incompatible_version}
                                                </span>
                                                {include 
                                                    file="adminarea/includes/helpers/popover.tpl" 
                                                    popoverClasses="notification__popover"
                                                    popoverBody="<b>{$extension->getName()} {$extension->getVersion()}</b> {$lang.info.theme_information.incompatible_version_desc_1} <b>Lagom WHMCS Client Theme {$template->getVersion()}</b> {$lang.info.theme_information.incompatible_version_desc_2} "
                                                    popoverFooter="<a class='btn btn--secondary btn--xs' href='https://lagom.rsstudio.net/docs/extensions/common-problems.html#i-m-using-incompatible-extension-version' target='_blank'>{$lang.general.learn_more}</a>"
                                                }
                                            </span>
                                        {/if}

                                    {* 2.3. Status *}   
                                    <td class="cell-status">
                                        <div class="status">
                                            {if $extension->isActive()}
                                                <label class="label label--success label--outline">{$lang.general.active}</label>
                                            {else}
                                                <label class="label label--default label--outline is-disabled">{$lang.general.disabled}</label>
                                            {/if}
                                        </div>
                                    </td>

                                    {* 2.3. Actions *}   
                                    <td class="cell-actions">
                                        {if $extension->isActive()}
                                            <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}" class="btn btn--xs btn--default btn--outline"><span class="btn__text">{$lang.general.manage}</span></a>
                                        {else}
                                            <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'info'])}" class="btn btn--xs btn--default btn--outline"><span class="btn__text">{$lang.general.manage}</span></a>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                        {/if}
                    </tbody>
                </table>
                <div class="preloader-container is-hidden" data-table-preloader>
                    <div class="preloader"></div>
                </div>
            </div>
        </div>
    </div>
    {*<div class="row row--eq-height">
    {foreach from=$template->getExtensions() item=extension key=k}
    <div class="col-4">
    <div class="widget">
    {if $extension->getPreview()}
    <img src="{$extension->getPreview()}" alt=""/>
    {else}
    <img src="{$helper->img('placeholders/placeholder-xs.svg')}" alt=""/>
    {/if}
    <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
    <div><span class="type-7">{$extension->getName()}</span></div>
    {$extension->getDescription()}
    <div class="p-0x">
    <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}">
    <span class="btn__text">Manage</span>
    </a>
    </div>
    </div>
    </div>
    </div>
    {/foreach}
    </div>*}
{/block}
