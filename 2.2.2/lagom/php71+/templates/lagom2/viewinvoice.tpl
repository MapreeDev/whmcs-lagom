{include file="{$template}/header.tpl"}

{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $invalidInvoiceIdRequested}
        {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.invoiceserror}
        {include file="{$template}/footer.tpl"}
    {else}
        {if $paymentmethod|strstr:"Bank Transfer"}
            {assign var="bankTransfer" value=true}
        {/if}
        <div class="invoice">
            {if $paymentSuccessAwaitingNotification}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.invoicePaymentSuccessAwaitingNotify}
            {elseif $paymentSuccess}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.invoicepaymentsuccessconfirmation}
            {elseif $paymentInititated}
                {include file="$template/includes/alert.tpl" type="info" msg=$LANG.invoicePaymentInitiated}
            {elseif $pendingReview}
                {include file="$template/includes/alert.tpl" type="info" msg=$LANG.invoicepaymentpendingreview}
            {elseif $paymentFailed}
                {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.invoicepaymentfailedconfirmation}
            {elseif $offlineReview}
                {include file="$template/includes/alert.tpl" type="info" msg=$LANG.invoiceofflinepaid}
            {/if}
            <div class="section">
                <div class="section-body">
                    <div class="row">
                        <div class="col-md-7">
                            <span class="invoice-title"> {$pagetitle}
                                {if $status eq "Draft"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-info">{$LANG.invoicesdraft}</span>                                    
                                {elseif $status eq "Unpaid"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-danger">{$LANG.invoicesunpaid}</span>
                                {elseif $status eq "Paid"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-success">{$LANG.invoicespaid}</span>                                   
                                {elseif $status eq "Refunded"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-info">{$LANG.invoicesrefunded}</span>                                          
                                {elseif $status eq "Cancelled"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-info">{$LANG.invoicescancelled}</span>         
                                {elseif $status eq "Collections"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-info">{$LANG.invoicescollections}</span>         
                                {elseif $status eq "Payment Pending"}
                                    <span class="invoice-status label {if $RSThemes.styles.name != "modern"}label-lg{/if} label-warning">{$LANG.invoicesPaymentPending}</span>          
                                {/if}
                            </span>
                        </div>
                        <div class="col-md-5">
                            <ul class="list-info list-info-50">
                                <li>
                                    <span class="list-info-text">{$LANG.invoicesdatecreated}</span>
                                    <span class="list-info-title">{$date}</span>
                                </li>
                                {if $status eq "Unpaid" || $status eq "Draft"}
                                    <li>
                                        <span class="list-info-text">{$LANG.invoicesdatedue}</span>
                                        <span class="list-info-title">{$datedue}</span>
                                    </li>
                                {/if}
                                {if $status neq "Unpaid"}
                                    {if $RSThemes.pages.viewinvoice.config.displayDueWhenPaid}
                                        <li>
                                            <span class="list-info-text">{$LANG.invoicesdatedue}</span>
                                            <span class="list-info-title">{$datedue}</span>
                                        </li>
                                    {/if}
                                    <li>
                                        <span class="list-info-text">{$LANG.orderpaymentmethod}</span>
                                        <span class="list-info-title">{$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}</span>
                                    </li>
                                {/if}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-body">
                    <div class="row">
                        <div class="col-md-7">
                            <h3>{$LANG.invoicespayto}:</h3>
                            <address>
                                {$payto}
                                {if $taxCode}<br />{$taxIdLabel}: {$taxCode}{/if}
                            </address>
                        </div>
                        <div class="col-md-5">
                            <h3>{$LANG.invoicesinvoicedto}:</h3>
                            <address> 
                                {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                                {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                                {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                                {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                                {$clientsdetails.country}
                                {if $clientsdetails.tax_id}<br />{$taxIdLabel}: {$clientsdetails.tax_id}{/if}
                                {if $customfields}
                                <br /><br />
                                {foreach from=$customfields item=customfield}
                                {$customfield.fieldname}: {$customfield.value}<br />
                                {/foreach}
                                {/if}
                            </address>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <h3>{$LANG.invoicelineitems}</h3>
                <div class="section-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <th width="61%">{$LANG.invoicesdescription}</th>
                                    <th width="20%"></th>
                                    <th width="19%" class="">{$LANG.invoicesamount}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$invoiceitems item=item}
                                    <tr>
                                        <td colspan="2">{$item.description}{if $item.taxed eq "true"} *{/if}</td>
                                        <td class="">{$item.amount}</td>
                                    </tr>
                                {/foreach}
                                <tr class="sub-total-row first">
                                    <td></td>
                                    <td>{$LANG.invoicessubtotal}</td>
                                    <td>{$subtotal}</td>
                                </tr>
                                {if $taxname}
                                    <tr class="sub-total-row">
                                        <td></td>
                                        <td>{$taxrate}% {$taxname}</td>
                                        <td>{$tax}</td>
                                    </tr>
                                {/if}
                                {if $taxname2}
                                    <tr class="sub-total-row">
                                        <td></td>
                                        <td>{$taxrate2}% {$taxname2}</td>
                                        <td>{$tax2}</td>
                                    </tr>
                                {/if}
                                <tr class="sub-total-row last">
                                    <td></td>
                                    <td>{$LANG.invoicescredit}</td>
                                    <td>{$credit}</td>
                                </tr>
                                <tr class="total-row">
                                    <td></td>
                                    <td>{$LANG.invoicestotal}</td>
                                    <td>{$total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    {if $taxrate}
                        <p>* {$LANG.invoicestaxindicator}</p>
                    {/if}
                </div>
            </div>

            <div class="section">
                <h3>{$LANG.invoicestransactions}</h3>
                <div class="section-body">
                    <div class="table-responsive">    
                        <table class="table table-condensed m-b-0">
                            <thead>
                                <tr>
                                    <th width="41%" class=""><span>{$LANG.networkissuesdate}</span></th>
                                    <th width="20%" class=""><span>{$LANG.invoicestransgateway}</span></th>
                                    <th width="20%" class=""><span>{$LANG.invoicestransid}</span></th>
                                    <th width="19%" class=""><span>{$LANG.invoicestransamount}</span></th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$transactions item=transaction}
                                    <tr>
                                        <td class="">{$transaction.date}</td>
                                        <td class="">{$transaction.gateway}</td>
                                        <td class="">{$transaction.transid}</td>
                                        <td class="">{$transaction.amount}</td>
                                    </tr>
                                {foreachelse}
                                    <tr>
                                        <td class="" colspan="4">{$LANG.invoicestransnonefound}</td>
                                    </tr>
                                {/foreach}
                                <tr class="total-row">
                                    <td></td>
                                    <td></td>
                                    <td>{$LANG.invoicesbalance}</td>
                                    <td>{$balance}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            {if $notes}
                <div class="notes">
                    <div class="notes-heading">
                        <h3 class="notes-title"><strong>{$LANG.invoicesnotes}</strong></h3>
                    </div>
                    <div class="well notes-body">
                        {$notes}
                    </div>
                </div>      
            {/if}
            {if $RSThemes.pages.viewinvoice.config.displayBankDetailsOnInvoice && $bankTransfer && $paymentbutton != ""}
                <div class="section section--bank-details">
                    <div class="section-header"><h3 clas="section-title">{$rslang->trans('billing.invoice.bank_transfer_details')}</h3></div>
                    <div class="section-body">
                        {$paymentbutton}   
                    </div>
                </div>
            {/if}
        </div>   
        </div>
        <div class="main-sidebar {if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
            <div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
                {if $status == "Unpaid"}
                    <div class="panel panel-summary panel-summary-{$sidebarBoxStyle} view-invoice panel-view-invoice">
                        <div class="panel-body">
                            <div class="price price-sm price-left-h">
                                <span class="price-title">{$LANG.invoicestotaldue}</span> 
                                <span class="price-amount">{$balance}</span>
                            </div>
                        </div>
                        <div class="panel-footer">
                            {if $status eq "Unpaid" && $allowchangegateway}
                                <label>{$LANG.orderpaymentmethod}:</label>
                                <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                                    <div class="form-group">
                                        {$gatewaydropdown}
                                    </div>
                                </form>
                            {else}
                                {$paymentmethod}{if $paymethoddisplayname} ({$paymethoddisplayname}){/if}
                            {/if}
                            {if $status eq "Unpaid" || $status eq "Draft"}
                                <span class="small-text"></span>
                                <div class="payment-form payment-btn-container {if $RSThemes.pages.viewinvoice.config.displayGatewayImages && !$bankTransfer}text-center{/if}  {if $bankTransfer}bank-transfer{/if}" data-display-button="{if $RSThemes.pages.viewinvoice.config.displayGatewayImages}false{else}true{/if}" data-btntext="{$LANG.makepayment}" data-btnsubscribetext="{$rslang->trans('billing.subscribe')}">
                                    {$paymentbutton|replace:'<script src="/templates/six/js/scripts.min.js"></script>':""}
                                </div>
                            {/if}
                        </div>
                    </div>
                    {if $manualapplycredit}
                        <div class="panel panel-sidebar panel-add-funds panel-view-invoice">
                            <div class="panel-heading">
                                <h3 class="panel-title">{$LANG.invoiceaddcreditapply}</h3>
                            </div>
                            <div class="panel-body">
                                <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                                    <input type="hidden" name="applycredit" value="true">                              
                                    <div class="m-b-1x">{$LANG.invoiceaddcreditdesc1}: <b>{$totalcredit}</b></div>
                                    <div class="form-group">
                                        <label class="control-label">{$LANG.invoiceaddcreditamount}</label>
                                        <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
                                    </div>
                                    <input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-primary-faded btn-block" />
                                </form>    
                            </div>
                        </div>
                    {/if}
                {/if}    
                <div class="panel panel-sidebar">
                    <div class="panel-heading">
                        <h6 class="panel-title">
                            <i class="fa fa-bookmark"></i>&nbsp; {$LANG.actions}
                            <i class="fa fa-chevron-up panel-minimise pull-right"></i>
                        </h6>
                    </div>
                    <div class="list-group">
                        <a href="dl.php?type=i&amp;id={$invoiceid}" class="list-group-item">
                            <i class="ls ls-download"></i>{$LANG.invoicesdownload}
                        </a>
                    </div>
                </div>
            </div>
            {include file="{$template}/footer.tpl"}
        </div>
    {/if}
{/if}


