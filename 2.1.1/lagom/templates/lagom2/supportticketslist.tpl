{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    {if $tickets}
        {include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableTicketsList').removeClass('hidden').DataTable();
                {if $orderby == 'did' || $orderby == 'dept'}
                    table.order(0, '{$sort}');
                {elseif $orderby == 'subject' || $orderby == 'title'}
                    table.order(1, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'lastreply'}
                    table.order(3, '{$sort}');
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
                    <div class="dropdown view-filter-btns">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <span class="status hidden"></span>
                            <span>{$rslang->trans('generals.all_entries')}</span>
                            <i class="ls ls-caret"></i>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span data-value="all">{$rslang->trans('generals.all_entries')}</span></a></li>
                            {foreach key=num item=status from=$RSTicketsStatuses}
                                {assign var="statusColor" value='style="color:'|explode:$status.status} 
                                {assign var="statusColor" value='">'|explode:$statusColor[1]} 
                                <li><a href="#" data-status-color="{$statusColor[0]}">{$status.status|replace:'style="color':'class="status" style="--status-color'}</a></li>
                            {/foreach}
                        </ul>
                        
                    </div>
                </div> 
            </div>
            <table id="tableTicketsList" class="table table-list">
                <thead>
                    <tr>
                        <th><button type="button" class="btn-table-collapse"></button>{$LANG.supportticketsdepartment}<span class="sorting-arrows"></span></th>
                        <th>{$LANG.supportticketssubject}<span class="sorting-arrows"></span></th>
                        <th>{$LANG.supportticketsstatus}<span class="sorting-arrows"></span></th>
                        <th>{$LANG.supportticketsticketlastupdated}<span class="sorting-arrows"></span></th>
                        {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
                            <th></th>
                        {/if}
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$tickets item=ticket}
                        <tr data-url="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">
                            <td><button type="button" class="btn-table-collapse"></button>
                                {$ticket.department}
                            </td>
                            <td>
                                <div class="text-primary">#{$ticket.tid}</div>
                                <span class="small">{$ticket.subject}</span>
                            </td>
                            <td>
                                {$ticket.status|replace:'style="color':'class="status" style="--status-color'}
                            </td>
                            <td class="text-center sorting_1 text-nowrap">
                                <span class="hidden">{$ticket.normalisedLastReply}</span>
                                {$ticket.lastreply}
                            </td>
                            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showManageButton'] == "1"}
                                <td class="cell-action">
                                    <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}"
                                        class="btn btn-default btn-sm btn-manage">{$_LANG['manage']}</a>
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
                {include file="$template/includes/common/svg-icon.tpl" icon="ticket"}      
            </div>
            <h6 class="message-title">{$rslang->trans('nodata.no_recent_tickets')}</h6>
            <div class="message-action">
                <a class="btn btn-primary" href="{$WEB_ROOT}/submitticket.php">
                    {$LANG.supportticketssubmitticket}
                </a>
            </div>
        </div>
    {/if}
{/if}