{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-lg message-success">
        <div class="message-icon">
            <i class="lm lm-check"></i>
        </div>
        <h2 class="message-title"> {$LANG.supportticketsticketcreated} #{$tid}</h2>
        <p class="message-desc">{$LANG.supportticketsticketcreateddesc}</p>
        <div class="message-actions">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-primary">
                {$LANG.continue} 
            </a>
        </div>
    </div>
{/if}    
