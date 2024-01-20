{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-danger message-lg message-no-data ">
        <div class="message-icon">
            <i class="lm lm-close"></i>
        </div>
        <h2 class="message-title">{$LANG.bannedyourip} {$ip} {$LANG.bannedhasbeenbanned}</h2>
        <h4>{$LANG.bannedbanreason}: <strong>{$reason}</strong></h4>
        <h5>{$LANG.bannedbanexpires}: {$expires}</h5>
    </div>
{/if}