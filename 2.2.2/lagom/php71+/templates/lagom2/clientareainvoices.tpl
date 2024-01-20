{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    {assign var=iconsPages value=['clientareadomains', 'supportticketslist', 'clientareainvoices', 'clientareaproducts']}
    {if $invoices}
        {include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableInvoicesList').removeClass('hidden').DataTable();
                {if $orderby == 'default'}
                    table.order([4, 'desc'], [2, 'asc']);
                {elseif $orderby == 'invoicenum'}
                    table.order(0, '{$sort}');
                {elseif $orderby == 'date'}
                    table.order(1, '{$sort}');
                {elseif $orderby == 'duedate'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'total'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(4, '{$sort}');
                {/if}
                table.draw();
                jQuery('.table-container').removeClass('loading');
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>
        <div class="table-container loading clearfix">
            <div class="table-top">
                <div class="d-flex">
                    <label>{$LANG.clientareahostingaddonsview}</label>
                    <div class="dropdown view-filter-btns {if $RSThemes.addonSettings.show_status_icon == 'displayed'}iconsEnabled{/if}">
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
                            {foreach key=num item=status from=$RSInvoicesStatuses}
                                {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
                                    <li>
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
                                    <li><a href="#"><span class="status status-{$status.statusClass}" data-value="{$status.statustext}" data-status-class="{$status.statusClass}">{$status.statustext}</span></a></li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>
                </div>       
            </div>
            <table id="tableInvoicesList" class="table table-list">
                <thead>
                    <tr>
                        <th data-priority="1"><button type="button" class="btn-table-collapse"></button>{$LANG.invoicestitle}<span class="sorting-arrows"></span></th>
                        <th data-priority="3">{$LANG.invoicesdatecreated}<span class="sorting-arrows"></span></th>
                        <th data-priority="4">{$LANG.invoicesdatedue}<span class="sorting-arrows"></span></th>
                        <th data-priority="5">{$LANG.invoicestotal}<span class="sorting-arrows"></span></th>
                        <th data-priority="2">{$LANG.invoicesstatus}<span class="sorting-arrows"></span></th>          
                        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showPdfButton'] == "1"}   
                            <th></th> 
                        {/if}
                        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
                            <th></th> 
                        {/if}     
                    </tr>
                </thead>
                <tbody>
                    {foreach key=num item=invoice from=$invoices}
                        <tr data-url="viewinvoice.php?id={$invoice.id}">
                            <td><button type="button" class="btn-table-collapse"></button>{$invoice.invoicenum}</td>
                            <td><span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                            <td><span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                            <td data-order="{$invoice.totalnum}">{$invoice.total}</td>
                            {if $RSThemes.addonSettings.show_status_icon == 'displayed' && in_array($templatefile, $iconsPages)}
                                <td>
                                    <span class="status status-{$invoice.statusClass} {if $RSThemes.addonSettings.show_status_icon == 'displayed'}dot-hidden{/if}">
                                        {if $RSThemes.addonSettings.show_status_icon == 'displayed'}
                                            {if file_exists("templates/$template/assets/img/status-icons/{$invoice.statusClass}.tpl")}
                                                <span class="status-icon">
                                                    {include file="$template/assets/img/status-icons/{$invoice.statusClass}.tpl"}      
                                                </span>
                                            {else}
                                                <span class="status-icon">
                                                    {include file="$template/assets/img/status-icons/default.tpl"}      
                                                </span>
                                            {/if}                     
                                        {/if}
                                        {$invoice.status}
                                    </span>
                                </td>
                            {else}
                                <td><span class="status status-{$invoice.statusClass}">{$invoice.status}</span></td>                                
                            {/if}
                            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showPdfButton'] == "1"}
                                    <td class="cell-action">
                                            <a href="dl.php?type=i&amp;id={$invoice.id}" class="btn btn-default btn-sm btn-manage">{$LANG.invoicesdownload}</a>
                                    </td>
                            {/if}
                            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
                                <td class="cell-action cell-action--last">
                                    <a href="viewinvoice.php?id={$invoice.id}" class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>
                                </td>
                            {/if}   
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
                {include file="$template/includes/common/svg-icon.tpl" icon="invoice"}       
            </div>
            <h6 class="message-title">{$LANG.invoicesnoinvoices}</h6>
        </div>
    {/if}
{/if}    
