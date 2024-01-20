{if file_exists("templates/$template/includes/sidebar/overwrites/sidebar-secondary-custom.tpl")}
    {include file="{$template}/includes/sidebar/overwrites/sidebar-secondary-custom.tpl"}  
{else}
    {if $templatefile == "masspay"}
        <div class="panel panel-summary panel-summary-{$sidebarBoxStyle}">
            <div class="panel-body">
                <div class="price price-sm price-left-h">
                    <span class="price-title">{$LANG.invoicestotaldue}</span> 
                    <span class="price-amount">{$total}</span>
                </div>
            </div>
            <div class="panel-footer">
                <form method="post" action="clientarea.php?action=masspay">
                    <input type="hidden" name="geninvoice" value="true" />
                    {foreach from=$invoiceitems key=invid item=invoiceitem}
                        <input type="hidden" name="invoiceids[]" value="{$invid}" />
                    {/foreach}
                    <fieldset>
                        <div class="form-group">
                            <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label>
                            <select name="paymentmethod" id="paymentmethod" class="form-control">
                                {foreach from=$gateways item=gateway}
                                    <option value="{$gateway.sysname}">{$gateway.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <button type="submit" value="{$LANG.masspaymakepayment}" class="btn btn-primary-faded btn-block" id="btnMassPayMakePayment" data-btn-loader>                            
                            <span><i class="ls ls-share"></i>{$LANG.masspaymakepayment}</span>
                            <div class="loader loader-button hidden" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                            </div>
                        </button> 
                    </fieldset>
                </form>    
            </div>
        </div>
    {/if}
{/if}    