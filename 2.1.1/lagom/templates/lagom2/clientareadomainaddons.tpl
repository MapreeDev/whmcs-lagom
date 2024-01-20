{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else} 
    <form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons" class="form-horizontal">
        <input type="hidden" name="{$action}" value="{$addon}">
        <input type="hidden" name="id" value="{$domainid}">
        <input type="hidden" name="confirm" value="1">
        <input type="hidden" name="token" value="{$token}">
        <div class="section">
        {if $action eq "buy"}
            <input type="hidden" name="buy" value="{$addon}">
            {if $addon eq "dnsmanagement"}
                {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}
                <div class="package">
                    <h5 class="package-title">{$LANG.domainaddonsdnsmanagement}</h5>
                    <div class="package-content">
                        <div class="package-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="domain"} 
                        </div>
                        <p>{$LANG.domainaddonsdnsmanagementinfo}</p>
                    </div>
                    <div class="package-footer">
                        <div class="package-actions">
                            <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.dnsmanagement}{$LANG.domainaddonsperyear}" class="btn btn-primary btn-lg" /><br/>
                            <a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-lg btn-link">{$LANG.clientareabacklink}</a>
                        </div>
                    </div>
                </div>
            {elseif $addon eq "emailfwd"}
                {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}
                <div class="package">
                    <h5 class="package-title">{$LANG.domainemailforwarding}</h5>
                    <div class="package-content">
                        <div class="package-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="addon-email-forwarding"} 
                        </div>
                        <p>{$LANG.domainaddonsemailforwardinginfo}</p>
                    </div>
                    <div class="package-footer">
                        <div class="package-actions">
                            <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.emailforwarding}{$LANG.domainaddonsperyear}" class="btn btn-primary btn-lg" /><br/>
                            <a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-lg btn-link">{$LANG.clientareabacklink}</a>
                        </div>
                    </div>
                </div>
            {elseif $addon eq "idprotect"}
                {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}
                <div class="package">
                    <h5 class="package-title">{$LANG.domainidprotection}</h5>
                    <div class="package-content">
                        <div class="package-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="addon-id-protection"} 
                        </div>
                        <p>{$LANG.domainaddonsidprotectioninfo}</p>
                    </div>
                    <div class="package-footer">
                        <div class="package-actions">
                            <input type="submit" name="enable" value="{$LANG.domainaddonsbuynow} {$addonspricing.idprotection}{$LANG.domainaddonsperyear}" class="btn btn-primary btn-lg" /><br/>
                            <a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-lg btn-link">{$LANG.clientareabacklink}</a>
                        </div>
                    </div>
                </div>
            {/if}
        {elseif $action eq "disable"}
            <input type="hidden" name="disable" value="{$addon}">
            {if $addon eq "dnsmanagement"}
                <div class="section-header">
                    <h2 class="section-title">{$LANG.domainaddonsdnsmanagement}</h2>
                </div>
            {elseif $addon eq "emailfwd"}
                <div class="section-header">
                    <h2 class="section-title">{$LANG.domainemailforwarding}</h2>
                </div>
            {elseif $addon eq "idprotect"}
                <div class="section-header">
                    <h2 class="section-title">{$LANG.domainidprotection}</h2>
                </div>
            {/if}
            {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}
            {if $success}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.domainaddonscancelsuccess textcenter=true}
            {elseif $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$LANG.domainaddonscancelfailed textcenter=true}
            {else}
                <p class="text-center">
                    {$LANG.domainaddonscancelareyousure}
                </p>
                <p class="text-center">
                    <input type="submit" name="enable" value="{$LANG.domainaddonsconfirm}" class="btn btn-danger btn-lg" />
                </p>
            {/if}
        {/if}
        </div>
    </form>
{/if}