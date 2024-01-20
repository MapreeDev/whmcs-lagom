{*
{if $openNetworkIssueCounts.open > 0 && !$hideServerAlert}
    <div class="alert alert-lagom alert-warning alert-faded network-issue-alert">
        <div class="container">
            <span class="alert-icon ls ls-exclamation-circle"></span>
            <div class="alert-body">{lang key='networkIssuesAware'}</div>
            <div class="alert-actions">
                 <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link">
                    {lang key='learnmore'}
                    <i class="far fa-arrow-right"></i>
                </a>
                <button id="btnCloseAlert" data-system-template="{$template}" class="btn btn-sm btn-icon btn-close" type="button" data-toggle="tooltip" data-title="Close" data-placement="top" aria-label="Close" data-container="body" data-original-title="" title=""><span class="ls ls-close"></span></button>
            </div>
        </div>
    </div>
{elseif $openNetworkIssueCounts.scheduled > 0 && !$hideServerAlert}
    <div class="alert alert-lagom alert-info alert-faded network-issue-alert">
        <div class="container">
            <span class="alert-icon ls ls-exclamation-circle"></span>
            <div class="alert-body">{lang key='networkIssuesScheduled'}</div>
            <div class="alert-actions">
                <a href="{$WEB_ROOT}/serverstatus.php" class="alert-link">
                    {lang key='learnmore'}
                    <i class="far fa-arrow-right"></i>
                </a>
                <button id="btnCloseAlert" data-system-template="{$template}" class="btn btn-sm btn-icon btn-close" type="button" data-toggle="tooltip" data-title="Close" data-placement="top" aria-label="Close" data-container="body" data-original-title="" title=""><span class="ls ls-close"></span></button>
            </div>
        </div>
    </div>
{/if}
*}