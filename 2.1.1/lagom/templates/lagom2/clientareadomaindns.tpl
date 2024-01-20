{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.domaindnsmanagement}</h2>
            <p class="section-desc">{$LANG.domaindnsmanagementdesc}</p>
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
                <form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?action=domaindns">
                    <input type="hidden" name="sub" value="save" />
                    <input type="hidden" name="domainid" value="{$domainid}" />
                    <div class="table-container">
                        <table class="table m-b-0">
                            <thead>
                                <tr>
                                    <th>{$LANG.domaindnshostname}</th>
                                    <th>{$LANG.domaindnsrecordtype}</th>
                                    <th>{$LANG.domaindnsaddress}</th>
                                    <th>{$LANG.domaindnspriority}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$dnsrecords item=dnsrecord}
                                <tr>
                                    <td><input type="hidden" name="dnsrecid[]" value="{$dnsrecord.recid}" /><input type="text" name="dnsrecordhost[]" value="{$dnsrecord.hostname}" size="10" class="form-control" /></td>
                                    <td>
                                        <select name="dnsrecordtype[]" class="form-control">
                                            <option value="A"{if $dnsrecord.type eq "A"} selected="selected"{/if}>{lang key="domainDns.a"}</option>
                                            <option value="AAAA"{if $dnsrecord.type eq "AAAA"} selected="selected"{/if}>{lang key="domainDns.aaaa"}</option>
                                            <option value="MXE"{if $dnsrecord.type eq "MXE"} selected="selected"{/if}>{lang key="domainDns.mxe"}</option>
                                            <option value="MX"{if $dnsrecord.type eq "MX"} selected="selected"{/if}>{lang key="domainDns.mx"}</option>
                                            <option value="CNAME"{if $dnsrecord.type eq "CNAME"} selected="selected"{/if}>{lang key="domainDns.cname"}</option>
                                            <option value="TXT"{if $dnsrecord.type eq "TXT"} selected="selected"{/if}>{lang key="domainDns.txt"}</option>
                                            <option value="URL"{if $dnsrecord.type eq "URL"} selected="selected"{/if}>{lang key="domainDns.url"}</option>
                                            <option value="FRAME"{if $dnsrecord.type eq "FRAME"} selected="selected"{/if}>{lang key="domainDns.frame"}</option>
                                        </select>
                                    </td>
                                    <td><input type="text" name="dnsrecordaddress[]" value="{$dnsrecord.address}" size="40" class="form-control" /></td>
                                    <td>
                                        {if $dnsrecord.type eq "MX"}<input type="text" name="dnsrecordpriority[]" value="{$dnsrecord.priority}" size="2" class="form-control" />{else}<input type="hidden" name="dnsrecordpriority[]" value="N/A" />{$LANG.domainregnotavailable}{/if}
                                    </td>
                                </tr>
                                {/foreach}
                                <tr>
                                    <td><input type="text" name="dnsrecordhost[]" size="10" class="form-control" /></td>
                                    <td>
                                        <select name="dnsrecordtype[]" class="form-control">
                                            <option value="A">{lang key="domainDns.a"}</option>
                                            <option value="AAAA">{lang key="domainDns.aaaa"}</option>
                                            <option value="MXE">{lang key="domainDns.mxe"}</option>
                                            <option value="MX">{lang key="domainDns.mx"}</option>
                                            <option value="CNAME">{lang key="domainDns.cname"}</option>
                                            <option value="TXT">{lang key="domainDns.txt"}</option>
                                            <option value="URL">{lang key="domainDns.url"}</option>
                                            <option value="FRAME">{lang key="domainDns.frame"}</option>
                                        </select>
                                    </td>
                                    <td><input type="text" name="dnsrecordaddress[]" size="40" class="form-control" /></td>
                                    <td><input type="text" name="dnsrecordpriority[]" size="2" class="form-control" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="text-light small m-t-1x m-b-0">
                        * {$LANG.domaindnsmxonly}
                    </p>
                    <div class="form-actions">
                        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" /> <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
                    </div>
                </form>
            {/if}
        </div>
    </div>
{/if}