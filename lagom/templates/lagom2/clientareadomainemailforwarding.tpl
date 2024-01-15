{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.domainemailforwarding}</h2>
            <p class="section-desc">{$LANG.domainemailforwardingdesc}</p>
        </div>
        <div class="section-body">
            {if $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$error}
            {/if}
            {if $external}
            <div class="text-center">
                {$code}
            </div>
            {else}
                <form method="post" action="{$smarty.server.PHP_SELF}?action=domainemailforwarding">
                    <input type="hidden" name="sub" value="save" />
                    <input type="hidden" name="domainid" value="{$domainid}" />
                    <div class="table-container">
                        <table class="table m-b-0">
                            <thead>
                                <tr>
                                    <th>{$LANG.domainemailforwardingprefix}</th>
                                    <th></th>
                                    <th>{$LANG.domainemailforwardingforwardto}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach key=num item=emailforwarder from=$emailforwarders}
                                <tr>
                                    <td><input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="form-control" /></td>
                                    <td class="va-middle">@{$domain} => </td>
                                    <td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="form-control" /></td>
                                </tr>
                                {/foreach}
                                <tr>
                                    <td><input type="text" name="emailforwarderprefixnew" class="form-control" /></td>
                                    <td class="va-middle">@{$domain} => </td>
                                    <td><input type="text" name="emailforwarderforwardtonew" class="form-control" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-actions">
                        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" /> <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
                    </div>
                </form>
            {/if}
        </div>
    </div>    
{/if}