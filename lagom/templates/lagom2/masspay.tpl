{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $invoiceitems}
        <div class="invoice">
            <div class="section">
                <span class="invoice-title invoice-title-sm">{$clientsstats.numunpaidinvoices} {$LANG.clientHomePanels.unpaidInvoices} </span>
            </div>
            <div class="section">        
                <div class="section-body">
                    <table class="table table-condensed table-masspay">
                        <colgroup>
                            <col style="width: 40%">
                            <col style="width: 32%">
                            <col style="width: 28%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan="2">{$LANG.invoicesdescription}</th>
                                <th>{$LANG.invoicesamount}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$invoiceitems key=invid item=invoiceitem}
                                <tr>
                                    <td colspan="3">
                                        <a href="viewinvoice.php?id={$invid}" class="masspay-title">
                                            <i class="ls ls-new-window"></i>{$LANG.invoicenumber} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}
                                        </a>                           
                                        <input type="hidden" name="invoiceids[]" value="{$invid}" />
                                        <table class="table">
                                            <colgroup>
                                                <col style="width: 40%">
                                                <col style="width: 32%">
                                                <col style="width: 28%">
                                            </colgroup>
                                            <tbody>
                                                {foreach from=$invoiceitem item=item}
                                                <tr>
                                                    <td colspan="2">{$item.description}</td>
                                                    <td>{$item.amount}</td>
                                                </tr>
                                                {/foreach}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr> 
                            {foreachelse}
                                <tr>
                                    <td colspan="6" align="center">{$LANG.norecordsfound}</td>
                                </tr>
                            {/foreach}
                            <tr class="sub-total-row first">
                                <td></td>
                                <td class="text-right">{$LANG.invoicessubtotal}:</td>
                                <td>{$subtotal}</td>
                            </tr>
                            {if $tax}
                                <tr class="sub-total-row {if !$partialpayments && !$credit && !$tax2}last{/if}">
                                    <td></td>
                                    <td class="text-right">{$taxrate1}% {$taxname1}:</td>
                                    <td>{$tax}</td>
                                </tr>
                            {/if}
                            {if $tax2}
                                <tr class="sub-total-row {if !$partialpayments && !$credit}last{/if}">
                                    <td></td>
                                    <td class="text-right">{$taxrate2}% {$taxname2}:</td>
                                    <td>{$tax2}</td>
                                </tr>
                            {/if}
                            {if $credit}
                                <tr class="sub-total-row {if !$partialpayments}last{/if}">
                                    <td></td>
                                    <td class="text-right">{$LANG.invoicescredit}:</td>
                                    <td>{$credit}</td>
                                </tr>
                            {/if}
                            {if $partialpayments}
                                <tr class="sub-total-row last">
                                    <td></td>
                                    <td class="text-right">{$LANG.invoicespartialpayments}:</td>
                                    <td>{$partialpayments}</td>
                                </tr>
                            {/if}
                            <tr class="total-row text-large">
                                <td></td>
                                <td class="text-right">{$LANG.invoicestotaldue}:</td>
                                <td>{$total}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>    
    {else}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="invoice"}                 
            </div>
            <h6 class="message-title">{$LANG.noinvoicesduemsg}</h6>
        </div>
    {/if}    
{/if}