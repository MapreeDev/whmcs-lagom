{if file_exists("templates/$template/includes/sidebar/overwrites/sidebar-custom.tpl")}
    {include file="{$template}/includes/sidebar/overwrites/sidebar-custom.tpl"}  
{else}    
    {if $templatefile == "clientareaaddfunds" && !$addfundsdisabled}
        <div class="panel panel-summary panel-summary-{$sidebarBoxStyle}">
            <div class="panel-body">
                <div class="summary-total">
                    <div class="price price-left-h price-sm">
                        <span class="price-total">
                            {$LANG.invoiceaddcreditdesc1}
                        </span> 
                        <span class="price-amount">
                            {$clientsstats.creditbalance}
                        </span>
                    </div>
                </div>
                <div class="summary-content">
                    <ul class="summary-list">
                        <li class="list-item faded">
                            <span class="item-name">{$LANG.addfundsminimum}</span>
                            <span class="item-value">{$minimumamount}</span>
                        </li>
                        <li class="list-item faded">
                            <span class="item-name">{$LANG.addfundsmaximum}</span>
                            <span class="item-value">{$maximumamount}</span>
                        </li>
                        <li class="list-item faded">
                            <span class="item-name">{$LANG.addfundsmaximumbalance}</span>
                            <span class="item-value">{$maximumbalance}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="alert alert-lagom alert-info alert-sm alert-panel">
            <div class="alert-icon ls ls-info-circle"></div>
            <div class="alert-body">
                {$LANG.addfundsnonrefundable|replace:"*":""|replace:".":""}
            </div>
        </div>
    {/if}
    {if $templatefile == "affiliates" && !$inactive}
        <div class="panel panel-summary panel-summary-{$sidebarBoxStyle} panel-add-funds">
            <div class="panel-body">
                <div class="summary-total">
                    <div class="price price-sm price-left-h">
                        <span class="price-total">{$LANG.affiliatescommissionsavailable}</span>
                        <span class="price-amount">{$balance}</span>
                    </div>
                </div>
                <div class="summary-content">
                    <ul class="summary-list">
                        <li class="list-item faded">
                            <span class="item-name">{$LANG.affiliatescommissionspending}</span>
                            <span class="item-value">{$pendingcommissions}</span>
                        </li>
                        <li class="list-item faded">
                            <span class="item-name">{$LANG.affiliateswithdrawn}</span>
                            <span class="item-value">{$withdrawn}</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="panel-footer">            
                {if !$withdrawlevel || $withdrawrequestsent}
                <button href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-primary-faded btn-block"{if !$withdrawlevel || $withdrawrequestsent} disabled{/if}>
                    <i class="ls ls-bank-note"></i> {$LANG.affiliatesrequestwithdrawal}
                </button>            
                {else}
                <a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-primary-faded btn-block {if !$withdrawlevel || $withdrawrequestsent}disabled" disabled="disabled"{/if}>
                    <i class="ls ls-bank-note"></i> {$LANG.affiliatesrequestwithdrawal}
                </a>
                {/if}
            </div>
        </div>
        {if $withdrawrequestsent}
            <div class="alert alert-success alert-sm alert-panel">
                <i class="alert-icon ls ls-info-circle"></i>
                <p>{$LANG.affiliateswithdrawalrequestsuccessful}</p>
            </div>
        {else}
            {if !$withdrawlevel}
                <div class="alert alert-lagom alert-info alert-sm alert-panel"><i class="alert-icon ls ls-info-circle"></i>{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</div>
            {/if}
        {/if}
    {/if}
    {if $templatefile == "clientareainvoices" && $clientsstats.numdueinvoices !=0}
        <div class="panel panel-summary panel-summary-{$sidebarBoxStyle}">
            <div class="panel-body">
                <div class="price price-sm price-left">
                    <span class="price-title">{$LANG.invoicesduemsg|sprintf2:$clientsstats.numdueinvoices}</span>
                    <span class="price-amount">{$clientsstats.dueinvoicesbalance}</span>
                </div>
            </div>
            {if $condlinks.masspay && $clientsstats.numdueinvoices !=0}
            <div class="panel-footer">
                <a href="clientarea.php?action=masspay&all=true" class="btn btn-primary-faded btn-block" data-btn-loader>
                    <span><i class="ls ls-share"></i>{$LANG.invoicespaynow}</span>
                    <div class="loader loader-button hidden" >
                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                    </div>
                </a>
            </div>
            {/if}
        </div>
    {/if}
  {if $templatefile == "serverstatus"}
        <div class="panel panel-sidebar panel-default panel-actions view-filter-btns">
            <div class="list-group">
                <a menuitemname="View RSS Feed" href="{$WEB_ROOT}/networkissuesrss.php" class="list-group-item" id="Primary_Sidebar-Network_Status-View_RSS_Feed">
                    <i class="ls ls-rss"></i>&nbsp; {$LANG.announcementsrss} 
                </a>
            </div>
        </div>
    {/if}
{/if}    