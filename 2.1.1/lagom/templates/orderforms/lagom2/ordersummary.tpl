{if $producttotals}
    <div class="panel-body">
        <div class="summary-content content">
            <ul class="summary-list">
                <li class="list-item list-item-main">
                    <span class="item-name main-item">{if $producttotals.allowqty && $producttotals.qty > 1}{$producttotals.qty} x {/if} {$producttotals.productinfo.groupname} - {$producttotals.productinfo.name}</span>
                    <span class="item-value">{if $dc_product_price}<span class="text-faded line-through">{$dc_product_price}</span> {$dc_product_discount_price} {else}{$producttotals.pricing.baseprice|replace:$currency.suffix:""} {$currency.suffix}{/if}</span>
                </li>
                {foreach $producttotals.configoptions as $configoption}
                    {if $configoption}
                        <li class="list-item faded">
                            <span class="item-name">{$configoption.name}: {$configoption.optionname}</span>
                            <span class="item-value">{if $configoption.recurring|replace:$currency.prefix:""|replace:$currency.suffix:"" != ""}{$configoption.recurring|replace:$currency.suffix:""} {$currency.suffix}{else}-{/if}{if $configoption.setup} + {$configoption.setup|replace:$currency.suffix:""} {$currency.suffix} {$LANG.ordersetupfee}{/if}</span>
                        </li>
                    {/if}
                {/foreach}
            </ul>  
            {if $producttotals.addons}
            <ul class="summary-list">
                    <li class="list-item list-item-title">{$LANG.cartaddons}</li>
                {foreach $producttotals.addons as $addon}
                    <li class="list-item">
                        <span class="item-name">{$addon.name}</span>
                        <span class="item-value">{if $dc_addon_prices[$addon.name] && $dc_addon_prices[$addon.name] != $addon.recurring}<span class="text-faded line-through">{$dc_addon_prices[$addon.name]}</span>{/if} {$addon.recurring|replace:$currency.suffix:""} {$currency.suffix}</span>
                    </li>
                {/foreach}
            </ul>    
            {/if}
            {if $producttotals.pricing.recurring || $producttotals.pricing.addons}
                <ul class="summary-list summary-list-recurring">
                    <li class="list-item list-item-title">{$LANG.ordertotalrecurring}</li>
                    {foreach from=$producttotals.pricing.recurringexcltax key=cycle item=recurring}
                        <li class="list-item">
                            <span class="item-name">{$cycle}</span>
                            <span class="item-value">{if $dc_recurring_price}{$dc_recurring_price|replace:$currency.suffix:""} {$currency.suffix}{else}{$recurring|replace:$currency.suffix:""} {$currency.suffix}{/if}</span>
                        </li>
                    {/foreach}
                </ul>    
            {/if}
            {if $producttotals.pricing.tax1 || $producttotals.pricing.tax2 || ($producttotals.pricing.setup && $producttotals.pricing.setup|replace:$currency.suffix:""|replace:$currency.prefix:"" != "0,00")}
                    <ul class="summary-list summary-list-taxes">
                    {if $producttotals.pricing.tax1}
                        <li class="list-item">
                            <span class="item-name">{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
                            <span class="item-value">{$producttotals.pricing.tax1|replace:$currency.suffix:""} {$currency.suffix}</span>
                        </li>
                    {/if}
                    {if $producttotals.pricing.tax2}
                        <li class="list-item">
                            <span class="item-name">{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
                            <span class="item-value">{$producttotals.pricing.tax2|replace:$currency.suffix:""} {$currency.suffix}</span>
                        </li>
                    {/if}
                    {if $producttotals.pricing.setup && $producttotals.pricing.setup|replace:$currency.suffix:""|replace:$currency.prefix:"" != "0,00"}
                        <li class="list-item">
                            <span class="item-name">{$LANG.cartsetupfees}</span>
                            <span class="item-value">{if $dc_product_setup_price}<span class="text-faded line-through">{$dc_product_setup_price}</span> {$dc_product_setup_discount_price} {else}{$producttotals.pricing.setup|replace:$currency.suffix:""} {$currency.suffix}{/if}</span>
                        </li>
                    {/if}
                </ul>
            {/if}
        </div>
    </div>
    <div class="panel-footer">
        <div class="price price-left-h">
            <span class="price-total">{$LANG.ordertotalduetoday}</span> 
            <div class="price-amount amt">{$producttotals.pricing.totaltoday|replace:$currency.suffix:""} {$currency.suffix}</div>
        </div>
        <div class="summary-actions">
            <button class="btn btn-lg btn-primary{if $summaryStyle == "primary"}-faded{/if} btn-checkout" type="submit" id="btnCompleteProductConfig">
                <span><i class="ls ls-share"></i>{$LANG.continue}</span>
                <div class="loader loader-button hidden">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </div>
            </button>
        </div>
    </div>
{elseif $renewals}
    <div class="panel-body">
        <div class="summary-content">
            {if $carttotals.renewals}
                {foreach $carttotals.renewals as $domainId => $renewal}
                    <ul class="summary-list">
                        <li class="list-item list-item-main" id="cartDomainRenewal{$domainId}">
                            <span class="item-name">
                                {$renewal.domain} - {$renewal.regperiod} {if $renewal.regperiod == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}
                            </span>
                            <span class="item-value">
                                {$renewal.priceBeforeTax}
                            </span>
                            <span class="item-actions">
                                <a onclick="removeItem('r','{$domainId}'); return false;" href="#" id="linkCartRemoveDomainRenewal{$domainId}">
                                    <i class="ls ls-trash"></i>
                                </a>
                            </span>
                        </li>
                        {if $renewal.dnsmanagement}
                            <li class="list-item faded">
                                <span class="item-name">{lang key='domaindnsmanagement'}</span>
                            </li>
                        {/if}
                        {if $renewal.emailforwarding}
                            <li class="list-item faded">
                                <span class="item-name">{lang key='domainemailforwarding'}</span>
                            </li>
                        {/if}
                        {if $renewal.idprotection}
                            <li class="list-item faded">
                                <span class="item-name">{lang key='domainidprotection'}</span>
                            </li>
                        {/if}
                        {if $renewal.hasGracePeriodFee}
                            <li class="list-item faded">
                                <span class="item-name">{lang key='domainRenewal.graceFee'}</span>
                            </li>
                        {/if}
                        {if $renewal.hasRedemptionGracePeriodFee}
                            <li class="list-item faded">
                                <span class="item-name">{lang key='domainRenewal.redemptionFee'}</span>
                            </li>
                        {/if}
                    </ul>
                {/foreach}
            {/if}
            <ul class="summary-list">
                    <li class="list-item">
                    <span class="item-name">{lang key='ordersubtotal'}</span>
                    <span class="item-value">{$carttotals.subtotal}</span>
                </li>
            </ul>
            {if ($carttotals.taxrate && $carttotals.taxtotal) || ($carttotals.taxrate2 && $carttotals.taxtotal2)}
            <ul class="summary-list faded">
                {if $carttotals.taxrate}
                    <li class="list-item">
                        <span class="item-name">{$carttotals.taxname} @ {$carttotals.taxrate}%</span>
                        <span class="item-value">{$carttotals.taxtotal}</span>
                    </li>
                {/if}
                {if $carttotals.taxrate2}
                    <li class="list-item">
                        <span class="item-name">{$carttotals.taxname2} @ {$carttotals.taxrate2}%</span>
                        <span class="item-value">{$carttotals.taxtotal2}</span>
                    </li>
                {/if}
            </ul>
            {/if}
        </div>
    </div>
    <div class="panel-footer">
        <div class="price price-left-h">
            <span class="price-total">{$LANG.ordertotalduetoday}</span> 
            <div class="price-amount amt">{$carttotals.total|replace:$currency.suffix:""} {$currency.suffix}</div>
        </div>
        <div class="summary-actions">
            <a href="{$WEB_ROOT}/cart.php?a=view" class="btn btn-lg btn-primary{if $summaryStyle == "primary"}-faded{/if} btn-checkout" id="checkout">  
                <span><i class="ls ls-share"></i> {$LANG.orderForm.checkout}</span>
                <div class="loader loader-button hidden">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </div>
            </a>
        </div>
    </div>
{/if}