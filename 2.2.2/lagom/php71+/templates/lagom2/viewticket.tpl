{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    {if $invalidTicketId}
        {include file="$template/includes/alert.tpl" type="danger" title=$LANG.thereisaproblem msg=$LANG.supportticketinvalid}
    {else}
        {if $closedticket}
            {include file="$template/includes/alert.tpl" type="info" msg=$LANG.supportticketclosedmsg}
        {/if}
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
    {/if}
    {if !$invalidTicketId}
        <div class="panel panel-default panel-ticket-reply panel-collapsable hidden-print">
            <div class="panel-heading" id="ticketReply" data-toggle="collapse" data-target="#ticketReplyBox" aria-expanded="true" aria-controls="ticketReplyBox">
                <div class="collapse-icon pull-right">
                    <i class="ls ls-caret {if !$postingReply}plus{else}minus{/if}"></i>
                </div>
                <h4 class="panel-title">
                    <i class="lm lm-pen"></i> &nbsp; {$LANG.supportticketsreply}
                </h4>
            </div>
            <div class="{if !$postingReply} collapse{/if}" id="ticketReplyBox"  aria-labelledby="ticketReply">
                <div class="panel-body">
                    <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="inputName">{$LANG.supportticketsclientname}</label>
                                <input class="form-control" type="text" name="replyname" id="inputName" value="{$replyname}"{if $loggedin} disabled="disabled"{/if}>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="inputEmail">{$LANG.supportticketsclientemail}</label>
                                <input class="form-control" type="text" name="replyemail" id="inputEmail" value="{$replyemail}"{if $loggedin} disabled="disabled"{/if}>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputMessage">{$LANG.contactmessage}</label>
                            <textarea name="replymessage" id="inputMessage" rows="12" class="form-control markdown-editor" data-auto-save-name="client_ticket_reply_{$tid}">{$replymessage}</textarea>
                        </div>
                        <div class="row form-group">
                            <div class="col-12">
                                <label for="inputAttachments">{$LANG.supportticketsticketattachments}</label>
                            </div>
                            <div class="col-sm-9">
                                <div class="file-input form-control">
                                    <input type="file" name="attachments[]" id="inputAttachments" class="form-control" />
                                    <span class="file-input-button btn btn-default">
                                        {$rslang->trans('support.select_file')}
                                    </span>
                                    <span class="file-input-text text-light">{$rslang->trans('support.no_file_selected')}</span>
                                </div>
                                <div id="fileUploadsContainer"></div>
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary-faded btn-block add-extra-attachement" data-nofiletext="{$rslang->trans('support.no_file_selected')}" data-selectfiletext="{$rslang->trans('support.select_file')}" data-removetext="{$LANG.orderForm.remove}">
                                    <i class="ls ls-plus"></i>{$LANG.addmore}
                                </button>
                            </div>
                            <div class="col-12">
                                <div class="ticket-attachments-message">{$LANG.supportticketsallowedextensions}: {$allowedfiletypes} ({lang key="maxFileSize" fileSize="$uploadMaxFileSize"})</div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <input class="btn btn-primary" type="submit" name="save" value="{$LANG.supportticketsticketsubmit}" />
                            <input class="btn btn-default" type="reset" value="{$LANG.cancel}" onclick="jQuery('#ticketReply').click()" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="panel panel-info visible-print-block">
            <div class="panel-heading">
                <h3 class="panel-title">
                    {$LANG.ticketinfo}
                </h3>
            </div>
            <div class="panel-body container-fluid">
                <div class="row">
                    <div class="col-md-2 col-xs-6">
                        <b>{$LANG.supportticketsticketid}</b><br />{$tid}
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <b>{$LANG.supportticketsticketsubject}</b><br />{$subject}
                    </div>
                    <div class="col-md-2 col-xs-6">
                        <b>{$LANG.supportticketspriority}</b><br />{$urgency}
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <b>{$LANG.supportticketsdepartment}</b><br />{$department}
                    </div>
                </div>
            </div>
        </div>
        {foreach from=$descreplies key=num item=reply}
            <div class="ticket-reply{if $reply.admin} staff{/if}">
                <div class="ticket-reply-top">
                    {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                        <div class="client-avatar client-avatar-sm">
                            <img src="https://www.gravatar.com/avatar/{$reply.email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                             
                            {* TODO: Sprawdzać które logo ma być wyświetlane na jakim tle? *}
                            {if $reply.admin && $RSThemes.logoSquareInverse}
                                <div class="staff-reply">
                                    <a href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}" class="logo"><img src="{$WEB_ROOT}{$RSThemes.logoSquareInverse}" alt="{$companyname}"/></a>
                                </div>
                            {/if}
                        </div>
                    {/if}
                    <div class="user">
                        <div class="user-info">
                            <span class="name">
                                {if $RSThemes.addonSettings.show_gravatar_image == 'hidden'}
                                    <i class="ls ls-user"></i>
                                {/if}
                                {$reply.name}
                            </span>
                            <span class="type"> 
                                <span class="label requestor-badge requestor-type-{$reply.requestor.type_normalised} float-md-right">{lang key='support.requestor.'|cat:$reply.requestor.type_normalised}</span>
                            </span>
                        </div>
                        <div class="date">{$reply.date}</div>
                    </div>
                </div>            
                <div class="ticket-reply-message markdown-content">
                    {$reply.message}
                    {if $reply.ipaddress}
                        <hr>
                        {lang key='support.ipAddress'}: {$reply.ipaddress}
                    {/if}
                    {if $reply.id && $reply.admin && $ratingenabled}
                        <div class="clearfix">
                            {if $reply.rating}
                                <div class="rating-done">
                                    {for $rating=1 to 5}
                                        <span class="star{if (5 - $reply.rating) < $rating} active{/if}"></span>
                                    {/for}
                                    <div class="rated">{$LANG.ticketreatinggiven}</div>
                                </div>
                            {else}
                                <div class="rating" ticketid="{$tid}" ticketkey="{$c}" ticketreplyid="{$reply.id}">
                                    <span class="star" rate="5"></span>
                                    <span class="star" rate="4"></span>
                                    <span class="star" rate="3"></span>
                                    <span class="star" rate="2"></span>
                                    <span class="star" rate="1"></span>
                                </div>
                            {/if}
                        </div>
                    {/if}
                </div>
                {if $reply.attachments}
                    <div class="ticket-reply-attachments">
                        <strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
                        {if $reply.attachments_removed}({lang key='support.attachmentsRemoved'}){/if}
                        <ul>
                            {foreach from=$reply.attachments key=num item=attachment}
                                {if $reply.attachments_removed}
                                    <li>
                                        <i class="ls ls-minus"></i>
                                        {$attachment}
                                    </li>
                                {else}
                                    <li><a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}"><i class="ls ls-download"></i> {$attachment}</a></li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            </div>
        {/foreach}
    {/if}
{/if}
