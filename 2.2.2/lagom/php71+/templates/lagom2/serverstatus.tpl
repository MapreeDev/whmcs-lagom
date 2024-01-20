{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section network-status">
        <div class="network-status-top"> 
            <div class="d-flex">
                <label>{$LANG.clientareahostingaddonsview}</label>
                <div class="dropdown view-filter-btns {if $RSThemes.addonSettings.show_status_icon == 'displayed'}iconsEnabled{/if}">
                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                        <span class="status {if $smarty.get.view == "open"}status-active{elseif $smarty.get.view == "scheduled"}status-pending{elseif $smarty.get.view == "resolved"}status-closed{else}hidden{/if}"></span>
                        <span class="filter-name">
                            {if $smarty.get.view == "open"}
                                {$LANG.networkissuesstatusopen}
                            {elseif $smarty.get.view == "scheduled"}
                                {$LANG.networkissuesstatusscheduled}
                            {elseif $smarty.get.view == "resolved"}
                                {$LANG.networkissuesstatusresolved}
                            {else}
                                {$rslang->trans('generals.all_entries')}
                            {/if}
                        </span>
                        <i class="ls ls-caret"></i>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="{$WEB_ROOT}/serverstatus.php"><span data-value="all">{$rslang->trans('generals.all_entries')}</span></a></li>             
                        {if $opencount > 0}
                            <li><a href="{$WEB_ROOT}/serverstatus.php?view=open"><span class="status status-active">{$LANG.networkissuesstatusopen}</span></a></li>                    
                        {/if}
                        {if $scheduledcount > 0}
                            <li><a href="{$WEB_ROOT}/serverstatus.php?view=scheduled"><span class="status status-pending">{$LANG.networkissuesstatusscheduled}</span></a></li>
                        {/if}
                        {if $resolvedcount > 0}
                            <li><a href="{$WEB_ROOT}/serverstatus.php?view=resolved"><span class="status status-closed">{$LANG.networkissuesstatusresolved}</span></a></li>
                        {/if}
                    </ul> 
                </div>
            </div>  
        </div>
        <div class="network-status-body">
            {foreach from=$issues item=issue}
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            {$issue.title} <span>{$issue.status}</span>
                        </div>
                        {if $issue.clientaffected}{else}{/if}
                    </div>
                    <div class="panel-body"> 
                        <div class="priority priority-{$issue.rawPriority|lower}">
                            <span class="priority-text">{$LANG.networkissuespriority} - {$issue.priority}</span>
                            {* <li class="list-group-item {if $issue.rawPriority == 'Critical'}list-group-item-danger{elseif $issue.rawPriority == 'High'}list-group-item-warning{elseif $issue.rawPriority == 'Low'}list-group-item-success{else}list-group-item-info{/if}"><strong>{$LANG.networkissuespriority}</strong> - {$issue.priority}</li> *}
                            {if $issue.server or $issue.affecting}<span class="priority-affectiong">{$LANG.networkissuesaffecting} {$issue.type} - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if}</span>{/if}
                        </div>
                        <p>{$issue.description}</p>
                    </div>
                    <div class="panel-footer text-small text-light">
                        <div>{$LANG.networkissuesdate} - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</div>
                        <div>{$LANG.networkissueslastupdated}- {$issue.lastupdate}</div>
                    </div>
                </div>
            {foreachelse}
                {include file="$template/includes/common/message.tpl" type="success" msg=$noissuesmsg textcenter=true customClass="message-no-data"}
            {/foreach}
        </div>
        {if $issues}
            <div class="network-status-pagination pagination">
                <li class="paginate_button previous {if !$prevpage}disabled{/if}"><a href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}#{/if}">{$LANG.previouspage}</a></li>
                <li class="paginate_button next {if !$nextpage}disabled{/if}"><a href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}#{/if}">{$LANG.nextpage}</a></li>
            </div>
        {/if}
    </div>
    {if $servers}
        <div class="section" data-template="{$template}">
            <div class="section-header">
                <h2 class="section-title">{$LANG.serverstatustitle}</h2>
                <p class="section-desc">{$LANG.serverstatusheadingtext}</p>
            </div>
            <div class="section-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>{$LANG.servername}</th>
                                <th class="text-center">HTTP</th>
                                <th class="text-center">FTP</th>
                                <th class="text-center">POP3</th>
                                <th class="text-center">{$LANG.serverstatusphpinfo}</th>
                                <th class="text-center">{$LANG.serverstatusserverload}</th>
                                <th class="text-center">{$LANG.serverstatusuptime}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$servers key=num item=server}
                                <tr>
                                    <td>{$server.name}</td>
                                    <td class="text-center" id="port80_{$num}">
                                        <div class="loader" >
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                        </div>
                                    </td>
                                    <td class="text-center" id="port21_{$num}">
                                        <div class="loader" >
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                        </div>
                                    </td>
                                    <td class="text-center" id="port110_{$num}">
                                        <div class="loader" >
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                        </div>
                                    </td>
                                    <td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
                                    <td class="text-center" id="load{$num}">
                                        <div class="loader" >
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                        </div>
                                    </td>
                                    <td class="text-center" id="uptime{$num}">
                                        <div class="loader" >
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                        </div>
                                        <script>
                                        var templateName = $('[data-template]').data('template');
                                        function checkLsPort(num, port) {
                                            WHMCS.http.jqClient.post('serverstatus.php', 'ping=1&num=' + num + '&port=' + port, function(data) {
                                                var str = data;
                                                var res = str.replace("assets/img", "templates/"+templateName+"/assets/img/serverstatus");
                                                res = res.replace("gif", "svg");
                                                jQuery("#port" + port + "_" + num).html(res);
                                            });
                                        }
                                        jQuery(document).ready(function() {
                                            checkLsPort({$num}, 80);
                                            checkLsPort({$num}, 21);
                                            checkLsPort({$num}, 110);
                                            getStats({$num});
                                        });
                                        </script>
                                    </td>
                                </tr>
                            {foreachelse}
                                <tr>
                                    <td colspan="7">{$LANG.serverstatusnoservers}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div> 
        </div>
    {/if}
{/if}