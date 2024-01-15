{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-no-data">
        <div class="message-image">
            {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"} 
        </div>
        <h2 class="message-title">{$LANG.oops}! {$LANG.subaccountpermissiondenied}</h2>
        {if !empty($allowedpermissions)}
            <div class="well m-t-2x m-b-0 w-100 text-left">
                <p>{$LANG.subaccountallowedperms}</p>
                <ul class="m-b-0">
                    {foreach $allowedpermissions as $permission}
                        <li>{$permission}</li>
                    {/foreach}
                </ul>
            </div>
        {/if}
        <p class="message-desc">{$LANG.subaccountcontactmaster}</p>
        <div class="message-actions">
            <a href="javascript:history.go(-1)" class="btn btn-primary">{$LANG.goback}</a><a href="index.php" class="btn btn-default">{$LANG.returnhome}</a>
        </div>
    </div>
{/if}