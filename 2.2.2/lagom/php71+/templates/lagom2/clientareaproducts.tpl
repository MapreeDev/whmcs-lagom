{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {assign var=iconsPages value=['clientareadomains', 'supportticketslist', 'clientareainvoices', 'clientareaproducts']}
    {if $services}
        {include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="3"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
                {if $orderby == 'product'}
                    table.order([0, '{$sort}'], [3, 'asc']);
                {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
                    table.order(1, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'domainstatus'}
                    table.order(3, '{$sort}');
                {/if}
                table.draw();
                jQuery('.table-container').removeClass('loading');
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>
        <div class="table-container loading">
            <div class="table-top">
                <div class="d-flex">
                    <label>{$LANG.clientareahostingaddonsview}</label>
                    <div class="dropdown view-filter-btns {if $RSThemes.addonSettings.show_status_icon == 'displayed'}iconsEnabled{/if}" data-table-filters>
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                {if file_exists("templates/$template/assets/img/status-icons/status-all.tpl")}
                                    <span class="status-icon status-status-all" style="font-size: 0;">
                                        {include file="$template/assets/img/status-icons/status-all.tpl"}      
                                    </span>
                                {/if}
                            {else}
                                <span class="status hidden"></span>
                            {/if}
                            <span class="filter-name">{$rslang->trans('generals.all_entries')}</span>
                            <i class="ls ls-caret"></i>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="#">
                                    <span data-value="all">
                                        {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                            {if file_exists("templates/$template/assets/img/status-icons/status-all.tpl")}
                                                <span class="status-icon status-status-all">
                                                    {include file="$template/assets/img/status-icons/status-all.tpl"}      
                                                </span>
                                            {/if}
                                            <span class="filter-name">{$rslang->trans('generals.all_entries')}</span>
                                        {else}
                                            {$rslang->trans('generals.all_entries')}
                                        {/if}
                                    </span>
                                </a>
                            </li>
                            {foreach key=num item=status from=$RSHookServicesStatuses}
                                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                                    {include file="$template/includes/services/hide-inactive-services.tpl" type="status-dropdown"}                           
                                {/if}
                                {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
                                    <li {if $hiddeStatus}{if !$hideInactiveServices['inactiveServices']}class="hidden"{/if} data-table-filters-hidden{/if} data-status="{$status.status}">
                                    <a href="#">
                                            <span class="status status-{$status.statusClass} {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}" data-value="{$status.statustext}" data-status-class="{$status.statusClass}">
                                                {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                                    {if file_exists("templates/$template/assets/img/status-icons/{$status.statusClass}.tpl")}
                                                        <span class="status-icon status-{$status.statusClass}">
                                                            {include file="$template/assets/img/status-icons/{$status.statusClass}.tpl"}      
                                                        </span>
                                                    {else}
                                                        <span class="status-icon status-{$status.statusClass}">
                                                            {include file="$template/assets/img/status-icons/default.tpl"}      
                                                        </span>
                                                    {/if}                     
                                                {/if}
                                                <span class="filter-name">{$status.statustext}</span>
                                            </span>
                                        </a>
                                    </li>
                                {else}
                                    <li {if $hiddeStatus}{if !$hideInactiveServices['inactiveServices']}class="hidden"{/if} data-table-filters-hidden{/if} data-status="{$status.status}"><a href="#"><span class="status status-{$status.statusClass}" data-value="{$status.statustext}" data-status-class="{$status.statusClass}">{$status.statustext}</span></a></li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>         
                </div>
                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                    {include file="$template/includes/services/hide-inactive-services.tpl" type="switcher"}
                {/if}  
            </div>
            <table id="tableServicesList" class="table table-list">
                <thead>
                    <tr>
                        <th data-priority="1"><button type="button" class="btn-table-collapse"></button>{$LANG.orderproduct}<span class="sorting-arrows"></span></th>
                        <th data-priority="5">{$LANG.clientareaaddonpricing}<span class="sorting-arrows"></span></th>
                        <th data-priority="4">{$LANG.clientareahostingnextduedate}<span class="sorting-arrows"></span></th>
                        <th data-priority="3">{$LANG.clientareastatus}<span class="sorting-arrows"></span></th>     
                        <th data-priority="2">&nbsp;</th>        
                    </tr>
                </thead>
                <tbody>
                    {foreach key=num item=service from=$services}
                        <tr data-url="clientarea.php?action=productdetails&amp;id={$service.id}">
                            <td>
                                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideInactiveServices'] == "1" && !empty($RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus'])}
                                    {include file="$template/includes/services/hide-inactive-services.tpl" type="table-cell"}
                                {/if}
                                <button type="button" class="btn-table-collapse"></button>
                                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showIdProduct'] == "1"}#{$service.id} - {/if}{if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideTabServiceGroup'] != "1"}<b>{$service.group}</b> - {$service.product}{else}<b>{$service.product}</b>{/if}
                                {if $service.domain}
                                <br />
                                    {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['hideSslIcon'] == "0"}
                                    <div class="ssl-info" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
                                        {if $service.sslStatus}
                                            {assign var="awords" value="/"|explode:$service.sslStatus->getImagePath()} 
                                            {assign var="imageSSL" value=$awords|@end}
                                            <img id="sslStatus{$service.id}" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/{$imageSSL|replace:".png":".svg"}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" width="12px" class="ssl-status{$service.sslStatus->getClass()}"/>
                                        {elseif !$service.isActive}
                                            <img id="sslStatus{$service.id}" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/ssl-inactive-domain.svg" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" width="12px" class="ssl-status"/>
                                        {/if}
                                    </div>
                                    {/if}
                                    {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['removeUrlFromDomainName'] == "0"}<a class="text-small" href="http://{$service.domain}" target="_blank">{$service.domain}</a>{else}<span class="text-small">{$service.domain}</span>{/if}                               
                                {/if}
                            </td>
                            <td class="text-nowrap" data-order="{$service.amountnum}">
                                {if (
                                        $service.amount|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                        $service.amount|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                    ) && (
                                        isset($RSThemes.addonSettings.free_product_price) && 
                                        $RSThemes.addonSettings.free_product_price == "enabled" &&
                                        isset($RSThemes.addonSettings.free_product_price_value) &&
                                        $RSThemes.addonSettings.free_product_price_value == "all"
                                    )
                                }
                                    {$LANG.orderfree}
                                {else}
                                    {$service.amount}<br /> <span class="small">{$service.billingcycle}</span>
                                {/if} 
                            </td>
                            <td class="text-nowrap"><span class="hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                            {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}

                                <td class="text-nowrap">
                                    <span class="status status-{$service.status|strtolower} {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}">
                                        {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                            {if file_exists("templates/$template/assets/img/status-icons/{$service.status|strtolower}.tpl")}
                                                <span class="status-icon">
                                                    {include file="$template/assets/img/status-icons/{$service.status|strtolower}.tpl"}      
                                                </span>
                                            {else}
                                                <span class="status-icon">
                                                    {include file="$template/assets/img/status-icons/default.tpl"}      
                                                </span>
                                            {/if}                     
                                        {/if}
                                        {$service.statustext}
                                    </span>
                                </td>
                                {else}
                                    <td class="text-nowrap"><span class="status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                                {/if}
                            <td class="cell-action">
                                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
                                    <a href="clientarea.php?action=productdetails&id={$service.id}"
                                        class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>
                                {else}
                                    <div class="dropdown">
                                        <a href="#" class="btn btn-icon dropdown-toggle" data-toggle="dropdown">
                                            <i class="lm lm-more"></i>
                                        </a>
                                        <ul class="dropdown-menu  pull-right" role="menu">
                                            <li><a
                                                    href="clientarea.php?action=productdetails&id={$service.id}">{$LANG.clientareaviewdetails}</a>
                                            </li>
                                            {if $service.rawstatus == "active" && ($service.downloads || $service.addons || $service.packagesupgrade)}
                                                <li class="divider"></li>
                                                {if $service.downloads} <li><a
                                                            href="clientarea.php?action=productdetails&id={$service.id}#tabDownloads">{$LANG.downloadstitle}</a>
                                                </li>{/if}
                                                {if $service.addons} <li><a
                                                            href="clientarea.php?action=productdetails&id={$service.id}#tabAddons">{$LANG.clientareahostingaddons}</a>
                                                </li>{/if}
                                                {if $service.packagesupgrade} <li><a
                                                            href="upgrade.php?type=package&id={$service.id}">{$LANG.upgradedowngradepackage}</a>
                                                </li>{/if}
                                                {*{if $service.showcancelbutton} <li><a href="clientarea.php?action=cancel&id={$service.id}">{$LANG.clientareacancelrequestbutton}</a></li>{/if}*}
                                            {/if}
                                        </ul>
                                    </div>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>    
            </table>
            <div class="loader loader-table" id="tableLoading">
                {include file="$template/includes/common/loader.tpl"}  
            </div>
        </div>
    {else}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="service"}     
            </div>
            <h6 class="message-title">{$LANG.clientHomePanels.activeProductsServicesNone}</h6>
            <div class="message-action">
                <a class="btn btn-primary" href="{$WEB_ROOT}/cart.php">
                    {$LANG.navservicesorder}
                </a>
            </div>
        </div>
    {/if}
{/if}