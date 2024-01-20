{**************************** 

RSThemes - Info
1. Alerts
    1.1. Addon Messages
    1.2. New Menu Version
    1.3. Integration Available
2. Information
    2.1. Theme Version
        2.1.1 Check If Stable Version
        2.1.2 New Version
        2.1.3 Compability
    2.2. Registration Date
    2.3. Next Due Date
    2.4. First Payment Amount
    2.5. Recurring Ammount
    2.6. Payment Method
    2.7. Support Access
        2.7.1 Access Expiring
        2.7.2 Access Expired
3. License Key
    3.1 License Form
    3.2 License Status
4. Sidebar

*****************************}


{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"} 
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"} 
{/block}

{block name="template-content"}
    <div class="block">

        {* 1. Alerts *}

        {* 1.1. Addon Messages *}
        {if $template->license()->getAddonMessages()}
            {$template->license()->getAddonMessages()}
        {/if}

        {if $isLagom2}
            {* 1.2. New Menu Version *}
            {if $newChangedAnyMenuVersion}
                {include file="adminarea/includes/alert/newMenuImport.tpl"}
            {/if}

            {* 1.3. Integration Available *}
            {if isset($integrationAllowed) && $integrationAllowed}
                {include file="adminarea/includes/alert/integrationAvailable.tpl"}
            {/if}
        {/if}    

        <div class="block__body m-r-3x max-w-lg">

            {* 2. Information *}
            <div class="section">
                <h3 class="section__title">{$lang.info.theme_information.title}</h3>
                <div class="section__body panel">
                    <ul class="list list--info list--p-1x">

                        {* 2.1. Theme Version *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.theme_version}:</span>
                            <span class="list__value">
                                <b>{$template->getVersion()}</b>  

                                {* 2.1.1 Check If Stable Version *}
                                {assign var="isStable" value=true}
                                {assign var="checkVersion" value="-"|explode:$template->getVersion()}
                                
                                {assign var="isNewVersionStable" value=true}
                                {assign var="checkNewVersion" value=$template->newVersion()|replace:"Lagom ":""}
                                {assign var="checkNewVersion" value="-"|explode:$checkNewVersion}

                                {if isset($checkNewVersion[1]) && $checkNewVersion[1] != ""}
                                    {assign var="isNewVersionStable" value=false}
                                {/if}

                                {if isset($checkVersion[1]) && $checkVersion[1] != ""}
                                    {assign var="isStable" value=false}
                                {/if}
                               
                                {* 2.1.2. New Version *}
                                {if $template->newVersionAvailable() && $isNewVersionStable && $isLagom2 && $compability === true}
                                    <span class="notification m-l-1x">
                                        <i class="notification__icon text-danger ls ls-exclamation-circle"></i> 
                                        <span class="notification__text text-danger">
                                            {$lang.info.theme_information.new_version} {*$template->newVersion()*}
                                        </span>
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover"
                                            popoverBody="{$lang.info.theme_information.new_version_desc}"
                                            popoverFooter="<a class='btn btn--secondary btn--xs' href='https://rsstudio.net/my-account/' target='_blank'>{$lang.general.download_now}</a>"
                                        }
                                    </span>
                                {/if}

                                {* 2.1.3. Compability *}
                                {if $compability === false && $isStable}
                                    <span class="notification m-l-1x">
                                        <i class="notification__icon text-danger ls ls-exclamation-circle"></i> 
                                        <span class="notification__text text-danger">
                                            {$lang.info.theme_information.incompatible_version}
                                        </span>
                                        {include 
                                            file="adminarea/includes/helpers/popover.tpl" 
                                            popoverClasses="notification__popover"
                                            popoverBody="<b>Lagom {$template->getVersion()}</b> {$lang.info.theme_information.incompatible_version_desc_1} <b>WHMCS {$whmcsVersion}</b> {$lang.info.theme_information.incompatible_version_desc_2}"
                                            popoverFooter="<a class='btn btn--secondary btn--xs' href='https://lagom.rsstudio.net/docs/common-problems.html#i-m-using-incompatible-product-version' target='_blank'>{$lang.general.learn_more}</a>"
                                        }
                                    </span>
                                {/if}
                            </span>
                        </li>

                        {* 2.2. Registration Date *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.registration_date}:</span>
                            <span class="list__value">{$template->license()->details('regdate')|date_format:"%A, %B %e, %Y"}</span>
                        </li>

                        {* 2.3. Next Due Date *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.next_due_date}:</span>
                            <span class="list__value">
                                {if $template->license()->details('nextduedate')!='0000-00-00'}
                                    {$template->license()->details('nextduedate')|date_format:"%A, %B %e, %Y"}
                                {else}
                                    {$lang.info.theme_information.lifetime_license}
                                {/if}
                            </span>
                        </li>

                        {* 2.4. First Payment Amount *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.first_payment}:</span>
                            <span class="list__value">
                                {$template->license()->details('first_payment_amount')}
                            </span>
                        </li>

                        {* 2.5. Recurring Amount *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.recurring}:</span>
                            <span class="list__value">
                                {$template->license()->details('recuring_amount')}
                            </span>
                        </li>

                        {* 2.6. Payment Method *}
                        <li class="list__item">
                            <span class="list__label">{$lang.info.theme_information.payment_method}:</span>
                            <span class="list__value">
                                {$template->license()->details('payment_method')}
                            </span>
                        </li>

                        {* 2.7. Support Access *}
                        {if $template->license()->getLicenseKey() && $template->license()->details('service_status') == "Active"}
                            <li class="list__item">
                                <span class="list__label">{$lang.info.theme_information.support_access}:</span>
                                <span class="list__value d-flex">    
                                    {if $template->license()->details('nextduedate')!='0000-00-00' && $template->license()->details('nextduedate')!=""}
                                        {assign var="diff" value=strtotime($template->license()->details('nextduedate')|date_format) - $smarty.now}
                                        {assign var="diff" value=($diff/(60*60*24))+1}
                                    {else}
                                        {assign var="diff" value=false}    
                                    {/if}
                                    {if $diff|string_format:"%d" >= 0 || !$diff}
                                        <span class="label label--success label--outline">                                        
                                            {$lang.general.active}
                                        </span>
                                    {else}
                                        <span class="label label--danger label--outline">                                        
                                            {$lang.general.expired}
                                        </span>

                                    {/if}
                                    
                                    {* 2.7.1 Access Expiring*}
                                    
                                    {if $diff && $diff|string_format:"%d" < 31 && $diff|string_format:"%d" >= 0}
                                        <span class="notification m-l-1x">
                                            <i class="notification__icon text-danger ls ls-exclamation-circle"></i> 
                                            <span class="notification__text text-danger">
                                                {if $diff|string_format:"%d" == 0}
                                                    {$lang.general.expire_today}
                                                {else}
                                                    {$lang.general.expire_in} {$diff|string_format:"%d"} {if $diff|string_format:"%d" == 1}{$lang.general.day}{else}{$lang.general.days}{/if}
                                                {/if}
                                            </span>
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover"
                                                popoverBody="<p>{$lang.info.theme_information.support_access_expire_desc}</p><p>{$lang.info.theme_information.support_access_pay_invoice}</p>"
                                                popoverFooter="<a class='btn btn--secondary btn--xs' href='https://lagom.rsstudio.net/docs/common-problems.html#access-into-theme-updates-and-support-has-exired-or-expiring-soon'' target='_blank'>{$lang.general.learn_more}</a>"
                                            }
                                        </span>
                                           
                                    {* 2.7.2 Access Expired *}
                                    {elseif $diff && $diff|string_format:"%d" < 0}
                                        <span class="notification">
                                            {include 
                                                file="adminarea/includes/helpers/popover.tpl" 
                                                popoverClasses="notification__popover"
                                                popoverBody="<p>{$lang.info.theme_information.support_access_expired_desc}</p><p>{$lang.info.theme_information.support_access_pay_invoice}</p>"
                                                popoverFooter="<a class='btn btn--secondary btn--xs' href='https://lagom.rsstudio.net/docs/common-problems.html#access-into-theme-updates-and-support-has-exired-or-expiring-soon' target='_blank'>{$lang.general.learn_more}</a>"
                                            }
                                        </span>
                                    {/if}
                                </span>
                            </li> 
                        {/if}
                    <ul>
                </div>
            </div>

            {* 3. License Key *}
            <div class="section">
                <h3 class="section__title">{$lang.info.license_key.title}</h3>
                <div class="section__body panel" data-license-container>   
                    
                    {* 3.1 License Form *}
                    <form class="max-w-md" data-license-form action="{$helper->url('Template@info',['templateName'=>$template->getMainName()])}" method="POST">
                        <div class="form-group" data-license-form-group>
                            <div class="input-group input-group--lg">
                                <i class="lm lm-tag m-l-2x"></i>
                                <input 
                                    name="licenseKey" 
                                    class="form-control form-control--lg p-l-2x" 
                                    value="{if $template->license()->details('license_status') != ""}{$template->license()->getLicenseKey()}{/if}" 
                                    placeholder="" 
                                    data-license-input="{if $template->license()->details('license_status') != ""}{$template->license()->getLicenseKey()}{/if}" 
                                    data-license-template="{if $template->isActive()}active{else}inactive{/if}"
                                    data-license-valid="{if $template->license()->getAddonMessages()}false{else}true{/if}"
                                >
                                <button type="button" class="input-group__btn btn btn--lg btn--secondary" data-license-btn>
                                    <span class="btn__text">
                                        {if $template->license()->getLicenseKey() && $template->license()->details('license_status') != ""}
                                            {$lang.general.refresh}
                                        {else}
                                            {$lang.general.activate}
                                        {/if}    
                                    </span>
                                    <span class="btn__preloader preloader"></span>
                                </button>
                            </div>
                            <div class="form-feedback form-feedback--icon form-feedback-danger is-hidden" data-license-feedback>License cannot be empty!</div>
                        </div>
                        {if $template->license()->hasInputError()}
                            <div class="form-feedback form-feedback-lg form-feedback--icon {if $template->license()->details('status')|lower == "suspended"}form-feedback-danger{else}form-feedback-info{/if}">
                                <span>{$template->license()->getInputError()}</span>
                            </div>
                        {/if}
                    </form>    

                    {* 3.2 License Status *}        
                    {if $template->license()->getLicenseKey() && $template->license()->details('license_status') != ""}
                        <ul class="list list--info list--p-1x ">
                            <li class="list__item">
                                <span class="list__label">{$lang.info.license_key.license_status}:</span>
                                <span class="list__value">    
                                    <span class="label {if $template->license()->details('license_status') == "Active"}label--success{else}label--danger{/if} label--outline">{if $template->license()->details('license_status') == ""}Invalid{else}{$template->license()->details('license_status')}{/if}</span>
                                </span>
                            </li>                           
                        </ul>
                    {/if}
                </div>
            </div>
        </div>

        {* 4. Sidebar *}
        <div class="block__sidebar info-sidebar-block">
            <div class="widget widget--lg">
                <a class="widget__media has-overlay info-sidebar-widget">
                    {if $template->getVersion()|intval >= 2}
                        {include file="adminarea/info/includes/sidebar-logo-lagom-2.tpl"}
                    {else}
                        {include file="adminarea/info/includes/sidebar-logo-lagom.tpl"}
                    {/if}
                    {include file="adminarea/info/includes/sidebar-lines.tpl"}
                </a>
            </div>	
        </div>
    </div>    
{/block}

{block name="template-modals"}
    {include file="adminarea/includes/modals/license-refresh.tpl"}
{/block}
