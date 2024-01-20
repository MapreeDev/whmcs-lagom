{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-no-data">
        <div class="message-image">
            {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"}      
        </div>
        <h6 class="message-text">{lang key="switchAccount.forcedSwitchRequest"}</h6>
        {if !empty($allowedpermissions)}
            <div class="well m-t-2x w-100 text-center">
                <b>{$requiredClient->fullName} </b>
                {if $requiredClient->companyName}
                    ({$requiredClient->companyName})
                {/if}
                <br />
                {$requiredClient->email}
            </div>
        {/if}
        <form method="post" action="{routePath('user-accounts')}">
            <input type="hidden" name="id" value="{$requiredClient->id}" >
            <button type="submit" class="btn btn-primary bnt-">
                {lang key="continue"}
            </button>
            <a class="btn btn-default" href="{routePath('clientarea-home')}">{lang key="switchAccount.cancelAndReturn"}</a>
        </form>
    </div>
{/if}    