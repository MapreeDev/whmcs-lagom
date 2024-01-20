{if file_exists("templates/$template/payment/overwrites/invoice-summary.tpl")}
    {include file="{$template}/payment/overwrites/invoice-summary.tpl"}  
{else}
    <div class="main-sidebar main-sidebar-lg">                    
        <div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
            <div class="sidebar-sticky-inner">
                <div class="panel panel-summary panel-summary-{$summaryStyle} order-summary" id="orderSummary">
                    <div class="loader" id="orderSummaryLoader" style="display: none;">                                    
                        <div class="spinner spinner-sm {if $summaryStyle != "default"} spinner-light{/if}">
                            <div class="rect1"></div>
                            <div class="rect2"></div>
                            <div class="rect3"></div>
                            <div class="rect4"></div>
                            <div class="rect5"></div>
                        </div>    
                    </div>
                    <div class="panel-heading">
                        <h2 class="panel-title">{$LANG.invoicenumber}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}</h2>
                    </div>
                    <div class="panel-body" id="producttotal">
                        <div class="summary-content content">
                            <ul class="summary-list">
                            {foreach $invoiceitems as $item}
                                <li class="list-item">
                                    <span class="item-name">{$item.description}</span>
                                    <span class="item-value">{$item.amount}</span>
                                </li>
                            {/foreach}
                            </ul>
                            <ul class="summary-list">
                                <li class="list-item">
                                    <span class="item-name">{$LANG.invoicessubtotal}</span>
                                    <span class="item-value">{$invoice.subtotal}</span>
                                </li>
                                {if $invoice.taxrate}
                                    <li class="list-item">
                                        <span class="item-name">{$invoice.taxrate}% {$invoice.taxname}</span>
                                        <span class="item-value">{$invoice.tax}</span>
                                    </li>
                                {/if}
                                {if $invoice.taxrate2}
                                    <li class="list-item">
                                        <span class="item-name">{$invoice.taxrate2}% {$invoice.taxname2}</span>
                                        <span class="item-value">{$invoice.tax2}</span>
                                    </li>                                          
                                {/if}
                                <li class="list-item">
                                    <span class="item-name">{$LANG.invoicescredit}</span>
                                    <span class="item-value">{$invoice.credit}</span>
                                </li>
                                <li class="list-item">
                                    <span class="item-name">{$LANG.paymentstodate}</span>
                                    <span class="item-value">{$invoice.amountpaid}</span>
                                </li>
                                <li class="list-item">
                                    <span class="item-name">{$LANG.balancedue}</span>
                                    <span class="item-value">{$balance}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="price price-left-h">
                            <span class="price-total">{$LANG.invoicestotaldue}</span> 
                            <div class="price-amount amt">{$invoice.total}</div>
                        </div>
                        <div class="summary-actions">
                            <button type="submit" class="btn btn-lg btn-primary-faded btn-checkout" id="btnSubmit" value="{$LANG.submitpayment}" data-btn-loader>                            
                                <span><i class="ls ls-share"></i>{$LANG.masspaymakepayment}</span>
                                <span class="loader loader-button" style="display: none; position: relative">
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
    </div>
    <div class="order-summary order-summary-mob" id="orderSummary" data-fixed-actions href="#orderSummary">
        <div class="summary-footer">
            <div class="summary-actions">
                <button type="submit" class="btn btn-lg btn-primary-faded btn-block btn-checkout" id="btnSubmitMob" value="{$LANG.submitpayment}" data-btn-loader>
                    <span><i class="ls ls-share"></i>{$LANG.masspaymakepayment}</span>
                    <div class="loader loader-button hidden" >
                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                    </div>
                </button>
            </div>
        </div>
    </div>
{/if}    