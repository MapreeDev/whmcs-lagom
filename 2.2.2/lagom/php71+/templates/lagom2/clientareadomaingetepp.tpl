{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.domaingeteppcode}</h2>
            <p class="section-desc">{$LANG.domaingeteppcodeexplanation}</p>
        </div>
        <div class="section-body">
            {if $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$LANG.domaingeteppcodefailure|cat:" $error"}
            {elseif $eppcode}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.domaingeteppcodeis|cat:" $eppcode"}
            {else}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.domaingeteppcodeemailconfirmation}
            {/if}
        </div>
    </div>
{/if}    