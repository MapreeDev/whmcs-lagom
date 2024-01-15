{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}    
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
            <div class="main-sidebar">
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky">{/if}
                    {include file="orderforms/$carttpl/sidebar-categories.tpl"}
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
            </div>
        {/if}
        <div class="main-content{if $mainContentClasses} {$mainContentClasses}{/if}">
            {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
                {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            {/if}
            {if $renewalsData}
                <div class="domain-renewals" id="domainRenewals">
                    {foreach $renewalsData as $renewalData}
                        {assign var="renewal_added" value=false}
                        <div class="panel panel-default panel-form domain-renewal {if $renewal_added}domain-renewal-added border-primary{/if}" data-domain="{$renewalData.domain}">
                            <div class="panel-body">
                                <div class="domain-renewal-content">
                                    <h3 class="domain-renewal-title">{$renewalData.domain}</h5>
                                    <div class="domain-renewal-status">
                                        {if !$renewalData.eligibleForRenewal}
                                            <span class="label label-info">
                                                {if $renewalData.freeDomainRenewal}
                                                    {lang key='domainRenewal.freeWithService'}
                                                {else}
                                                    {lang key='domainRenewal.unavailable'}
                                                {/if}
                                            </span>
                                        {elseif ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                                            <span class="label label-info">
                                                {lang key='domainrenewalspastgraceperiod'}
                                            </span>
                                        {elseif !$renewalData.beforeRenewLimit && $renewalData.daysUntilExpiry > 0}
                                            <span class="label label-{if $renewalData.daysUntilExpiry > 30}success{else}warning{/if}">
                                                {lang key='domainRenewal.expiringIn' days=$renewalData.daysUntilExpiry}
                                            </span>
                                        {elseif $renewalData.daysUntilExpiry === 0}
                                            <span class="label label-warning">
                                                {lang key='expiresToday'}
                                            </span>
                                        {elseif $renewalData.beforeRenewLimit}
                                            <span class="label label-info">
                                                {lang key='domainRenewal.maximumAdvanceRenewal' days=$renewalData.beforeRenewLimitDays}
                                            </span>
                                        {else}
                                            <span class="label label-danger">
                                                {lang key='domainRenewal.expiredDaysAgo' days=$renewalData.daysUntilExpiry*-1}
                                            </span>
                                        {/if}
                                    </div>
                                    <p class="w-100">{lang key='clientareadomainexpirydate'}: {$renewalData.expiryDate->format('j M Y')} ({$renewalData.expiryDate->diffForHumans()})</p>
                                    {if $renewalData.freeDomainRenewal}
                                        <p class="domain-renewal-desc">{lang key='domainRenewal.freeWithServiceDesc'}</p>
                                    {/if}
                                </div>
                                <div class="domain-renewal-form">
                                    {if ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod) || !count($renewalData.renewalOptions)}
                                    {else}
                                        <div class="domain-renewal-period">
                                            <select class="form-control select-renewal-pricing" id="renewalPricing{$renewalData.id}" data-domain-id="{$renewalData.id}">
                                                {foreach $renewalData.renewalOptions as $renewalOption}
                                                    <option value="{$renewalOption.period}">
                                                        {$renewalOption.period} {lang key='orderyears'} @ {$renewalOption.rawRenewalPrice}
                                                        {if $renewalOption.gracePeriodFee && $renewalOption.gracePeriodFee->toNumeric() != 0.00}
                                                            + {$renewalOption.gracePeriodFee} {lang key='domainRenewal.graceFee'}
                                                        {/if}
                                                        {if $renewalOption.redemptionGracePeriodFee && $renewalOption.redemptionGracePeriodFee->toNumeric() != 0.00}
                                                            + {$renewalOption.redemptionGracePeriodFee} {lang key='domainRenewal.redemptionFee'}
                                                        {/if}
                                                        {if $renewalData.inGracePeriod || $renewalData.inRedemptionGracePeriod}
                                                            *
                                                        {/if}
                                                    </option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    {/if}
                                    {if !$renewalData.eligibleForRenewal || $renewalData.beforeRenewLimit || ($renewalData.pastGracePeriod && $renewalData.pastRedemptionGracePeriod)}
                                    {else}
                                        <div class="domain-renewal-actions">
                                            <button id="renewDomain{$renewalData.id}" class="btn {if $renewal_added}btn-primary{else}btn-primary-faded{/if} btn-add-renewal-to-cart" data-domain-id="{$renewalData.id}">
                                                <div class="loader loader-button">
                                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                                </div>
                                                <span class="to-add" {if $renewal_added}style="display: none"{/if}>{lang key='addtocart'}</span>
                                                <span class="added" {if $renewal_added}style="display: block"{/if}>{lang key='domaincheckeradded'}</span>
                                            </button>
                                        </div>
                                    {/if}
                                </div>     
                            </div>
                        </div>
                    {/foreach}
                    <div class="message message-danger message-lg message-no-data no-renew hidden">
                        <div class="message-icon">
                            <i class="lm lm-close"></i>
                        </div>
                        <h3 class="message-title">{$LANG.norecordsfound}</h3>
                    </div>
                </div>
            {else}
                <div class="message message-no-data">
                    <div class="message-image">
                        {include file="$template/includes/common/svg-icon.tpl" icon="domain"}              
                    </div>
                    <h6 class="message-title">{lang key='domainRenewal.noDomains'}</h6>
                </div>        
            {/if} 
        </div>
        {if $renewalsData}
            <div class="main-sidebar{if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] == '1'} main-sidebar-lg{/if}">
                <div class="sidebar-sticky sidebar-sticky-summary">
                    <div class="panel panel-summary panel-summary-{$summaryStyle} m-b-0x" id="orderSummary">
                        <div class="loader" id="orderSummaryLoader">
                            {if $summaryStyle == 'default'}
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            {else}
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                            {/if} 
                        </div>
                        <div class="panel-heading">
                            <h2 class="panel-title">{$LANG.ordersummary}</h2>
                        </div>
                        <div id="producttotal" data-summary-style="{$summaryStyle}"></div>
                    </div>
                    {if $hasDomainsInGracePeriod}
                        <small class="text-light m-t-20" style="display: block;">* {lang key='domainRenewal.graceRenewalPeriodDescription'}</small>
                    {/if}
                </div>
            </div>
            <div class="order-summary order-summary-mob" id="orderSummaryMob" data-fixed-actions href="#orderSummary">                        
                <a href="{$WEB_ROOT}/cart.php?a=view" class="btn btn-lg btn-primary-faded btn-checkout" id="checkout">  
                    <span><i class="ls ls-share"></i> {$LANG.orderForm.checkout}</span>
                    <div class="loader loader-button hidden">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </div>
                </a>
            </div>
        {/if}        
        <form id="removeRenewalForm" method="post" action="{$WEB_ROOT}/cart.php">
            <input type="hidden" name="a" value="remove" />
            <input type="hidden" name="r" value="" id="inputRemoveItemType" />
            <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
            <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='orderForm.close'}">
                                <i class="lm lm-close"></i>
                            </button>
                            <h3 class="modal-title">
                                <span>{lang key='orderForm.removeItem'}</span>
                            </h5>
                        </div>
                        <div class="modal-body">
                            {lang key='cartremoveitemconfirm'}
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">{lang key='yes'}</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='no'}</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script>recalculateRenewalTotals();</script>
    </div>
{/if}