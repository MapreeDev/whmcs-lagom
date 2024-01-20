{include file="{$template}/header.tpl"}

{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $invalidQuoteIdRequested}
        {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.invoiceserror}
    {else}        
        <div class="invoice">
            {if $agreetosrequired}
                {include file="$template/includes/alert.tpl" type="danger"  msg=$LANG.ordererroraccepttos}
            {/if}
            <div class="section">
                <div class="section-body">
                    <div class="row">
                        <div class="col-md-7">
                            <span class="invoice-title"> {$LANG.quotenumber}{$id}
                                {if $stage eq "Delivered"}
                                    <span class="invoice-status label label-lg label-success">{$LANG.quotestagedelivered}</span>
                                {elseif $stage eq "Accepted"}
                                    <span class="invoice-status label label-lg label-success">{$LANG.quotestageaccepted}</span>
                                {elseif $stage eq "On Hold"}
                                    <span class="invoice-status label label-lg label-warning">{$LANG.quotestageonhold}</span>                           
                                {elseif $stage eq "Lost"}
                                    <span class="invoice-status label label-lg label-danger">{$LANG.quotestagelost}</span>
                                {elseif $stage eq "Dead"}
                                    <span class="invoice-status label label-lg label-danger">{$LANG.quotestagedead}</span>
                                {/if}
                            </span>
                        </div>
                        <div class="col-md-5">
                            <ul class="list-info list-info-50">
                                <li>
                                    <span class="list-info-text">{$LANG.quotedatecreated}</span>
                                    <span class="list-info-title">{$datecreated}</span>
                                </li>
                                <li>
                                    <span class="list-info-text">{$LANG.quotevaliduntil}</span>
                                    <span class="list-info-title">{$validuntil}</span>
                                </li>
                            </ul>
                        </div>
                    </div>    
                </div>
            </div>
            <div class="section">
                <div class="section-body">
                    <div class="row">
                        <div class="col-md-7">
                            <h5>{$LANG.quoterecipient}</h5>
                            <address>
                                {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                                {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                                {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                                {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                                {$clientsdetails.country}
                                {if $customfields}
                                <br /><br />
                                {foreach from=$customfields item=customfield}
                                {$customfield.fieldname}: {$customfield.value}<br />
                                {/foreach}
                                {/if}
                            </address>
                        </div>
                        <div class="col-md-5">
                            <h5>{$LANG.invoicespayto}</h5>
                            <address> 
                                {$payto}
                            </address>
                        </div>
                    </div>
                </div>
            </div>
            {if $proposal}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.quoteproposal}</h2>
                    </div>
                    <div class="section-body">
                        <div class="well">
                            {$proposal}
                        </div>
                    </div>
                </div> 
            {/if}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.quotelineitems}</h2> 
                </div>
                <div class="section-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td>{$LANG.invoicesdescription}</td>
                                    <td >{$LANG.quotediscountheading}</td>
                                    <td width="20%" >{$LANG.invoicesamount}</td>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$quoteitems item=item}
                                    <tr>
                                        <td>{$item.description}{if $item.taxed} *{/if}</td>
                                        <td>{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</td>
                                        <td>{$item.amount}</td>
                                    </tr>
                                {/foreach}
                                <tr class="sub-total-row first">
                                    <td></td>
                                    <td>{$LANG.invoicessubtotal}</td>
                                    <td>{$subtotal}</td>
                                </tr>
                                {if $taxrate}
                                    <tr class="sub-total-row">
                                        <td></td>
                                        <td>{$taxrate}% {$taxname}</td>
                                        <td>{$tax}</td>
                                    </tr>
                                {/if}
                                {if $taxrate2}
                                    <tr class="sub-total-row">
                                        <td></td>
                                        <td>{$taxrate2}% {$taxname2}</td>
                                        <td>{$tax2}</td>
                                    </tr>
                                {/if}
                                <tr class="sub-total-row">
                                    <td></td>
                                    <td>{$LANG.quotelinetotal}</td>
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
            {if $notes}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.invoicesnotes}</h2>
                    </div>
                    <div class="section-body">
                        <div class="well">
                            {$notes}
                        </div>
                    </div>
                </div>
            {/if}     
        </div>
        </div>  
        <div class="main-sidebar{if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
            <div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
                <div class="panel panel-summary panel-summary-{$summaryStyle} ">
                    <div class="panel-body">
                        <div class="price price-sm price-left-h">
                            <span class="price-title">{$LANG.invoicestotaldue}</span> 
                            <span class="price-amount">{$total}</span>
                        </div> 
                    </div>
                    <div class="panel-footer">
                        <button type="button" class="btn btn-primary-faded btn-block"  {if $stage neq "Delivered" && $stage neq "On Hold"}disabled{/if}  data-toggle="modal" data-target="#acceptQuoteModal">
                            <i class="ls ls-share"></i> 
                            {$LANG.quoteacceptbtn}
                        </button>
                    </div>
                </div>
                <div menuitemname="Client Shortcuts" class="panel panel-sidebar panel-sidebar">
                    <div class="panel-heading">
                        <h5 class="panel-title">
                            <i class="fa fa-bookmark"></i> {$LANG.actions}
                            <i class="fa fa-chevron-up panel-minimise pull-right"></i>
                        </h5>
                    </div>
                    <div class="list-group">
                        {* <a href="javascript:window.print()" class="list-group-item">
                            <i class="ls ls-printer"></i>{$LANG.print}
                        </a> *}
                        <a href="dl.php?type=q&amp;id={$quoteid}" class="list-group-item">
                            <i class="ls ls-download"></i>{$LANG.invoicesdownload}
                        </a>
                    </div>
                </div>
            </div>
        </div>    
    {/if}
    <form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
        <div class="modal fade" id="acceptQuoteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h5 class="modal-title">{$LANG.quoteacceptbtn}</h5>
                    </div>
                    <div class="modal-body">
                        <p>{$LANG.quoteacceptagreetos}</p>
                        
                        <label class="checkbox">
                            <input class="icheck-control" type="checkbox" name="agreetos" />
                            <span>{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></span>
                        </label>
                        
                        <small>{$LANG.quoteacceptcontractwarning}</small>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">{$LANG.quoteacceptbtn}</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.cancel}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
{/if}

{include file="{$template}/footer.tpl"}