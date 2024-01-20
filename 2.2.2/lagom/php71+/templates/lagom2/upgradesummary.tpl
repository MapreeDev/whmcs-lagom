{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
        {if $promoerror}
            {include file="$template/includes/alert.tpl" type="error" msg=$promoerror textcenter=true}
        {/if}
        {if $promorecurring}
            {include file="$template/includes/alert.tpl" type="info"
            msg=$LANG.recurringpromodesc|sprintf2:$promorecurring textcenter=true}
        {/if}
        <div class="upgrade-summary">
            <div class="section">
                <div class="section-body">
                    <div class="panel panel-default">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th width="60%">{$LANG.orderdesc}</th>
                                    <th width="40%">{$LANG.orderprice}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach key=num item=upgrade from=$upgrades}
                                    {if $type eq "package"}
                                        <tr>
                                            <td><input type="hidden" name="pid" value="{$upgrade.newproductid}" /><input type="hidden" name="billingcycle" value="{$upgrade.newproductbillingcycle}" />{$upgrade.oldproductname} => {$upgrade.newproductname}</td>
                                            <td> 
                                                {if (
                                                        $upgrade.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                                        $upgrade.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                                    ) && (
                                                        isset($RSThemes.addonSettings.free_product_price) && 
                                                        $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                        isset($RSThemes.addonSettings.free_product_price_value) &&
                                                        $RSThemes.addonSettings.free_product_price_value == "all"
                                                    )
                                                }
                                                    {$LANG.orderfree}
                                                {else}
                                                    {$upgrade.price}
                                                {/if}   
                                            </td>
                                        </tr>
                                    {elseif $type eq "configoptions"}
                                        <tr>
                                            <td>{$upgrade.configname}: {$upgrade.originalvalue} => {$upgrade.newvalue}</td>
                                            <td>
                                                {if (
                                                        $upgrade.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                                        $upgrade.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                                    ) && (
                                                        isset($RSThemes.addonSettings.free_product_price) && 
                                                        $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                        isset($RSThemes.addonSettings.free_product_price_value) &&
                                                        $RSThemes.addonSettings.free_product_price_value == "all"
                                                    )
                                                }
                                                    {$LANG.orderfree}
                                                {else}
                                                    {$upgrade.price}
                                                {/if}   
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {if $type eq "package"}
                        <div class="alert alert-lagom alert-sm alert-panel alert-warning">
                            <div class="alert-icon ls ls-info-circle"></div>
                            <div class="alert-body">{$LANG.upgradeproductlogic|cat:' ('|cat:$upgrade.daysuntilrenewal|cat:' '|cat:$LANG.days|cat:')'}</div>
                        </div>
                    {/if} 
                </div>
            </div>
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.orderpromotioncode}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-form">
                        <div class="panel-body">
                            <form method="post" action="{$smarty.server.PHP_SELF}" role="form">
                                <input type="hidden" name="step" value="2" />
                                <input type="hidden" name="type" value="{$type}" />
                                <input type="hidden" name="id" value="{$id}" />
                                {if $type eq "package"}
                                    <input type="hidden" name="pid" value="{$upgrades.0.newproductid}" />
                                    <input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}" />
                                {/if}
                                {foreach from=$configoptions key=cid item=value}
                                    <input type="hidden" name="configoption[{$cid}]" value="{$value}" />
                                {/foreach}
                                <div class="input-group">
                                    <input class="form-control" type="text" name="promocode" placeholder="{$LANG.orderpromotioncode}" {if $promocode}value="{$promocode} - {$promodesc}" disabled="disabled"{/if}>
                                    <div class="input-group-btn">
                                    {if $promocode}
                                        <input type="submit" name="removepromo" value="{$LANG.orderdontusepromo}" class="btn btn-danger" />
                                    {else}
                                        <input type="submit" value="{$LANG.orderpromovalidatebutton}" class="btn btn-primary" />
                                    {/if}
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>   
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.orderpaymentmethod}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-form">
                        <div class="panel-body">                                      
                            <form method="post" action="{$smarty.server.PHP_SELF}">
                                <input type="submit" value="{$LANG.ordercontinuebutton}" class="hidden" id="submit-upgrade" />
                                <input type="hidden" name="step" value="3" />
                                <input type="hidden" name="type" value="{$type}" />
                                <input type="hidden" name="id" value="{$id}" />
                                {if $type eq "package"}
                                    <input type="hidden" name="pid" value="{$upgrades.0.newproductid}" />
                                    <input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}" />
                                {/if}
                                {foreach from=$configoptions key=cid item=value}
                                    <input type="hidden" name="configoption[{$cid}]" value="{$value}" />
                                {/foreach}
                                {if $promocode}<input type="hidden" name="promocode" value="{$promocode}">{/if}
                                <select name="paymentmethod" id="inputPaymentMethod" class="form-control">
                                    {if $allowgatewayselection}
                                        <option value="none">{$LANG.paymentmethoddefault}</option>
                                    {/if}
                                    {foreach key=num item=gateway from=$gateways}
                                        <option value="{$gateway.sysname}"{if $gateway.sysname eq $selectedgateway} selected="selected"{/if}>{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-sidebar main-sidebar-lg{if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right{/if}">
        <div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
            <div class="panel panel-summary panel-summary-{$summaryStyle} " id="orderSummary">
                <div class="loader" id="orderSummaryLoader" style="display: none;">
                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                </div>
                <div class="panel-heading">
                    <h2 class="panel-title">{$LANG.ordersummary}</h2>
                </div>
                <div class="panel-body">
                    <ul class="summary-list">
                        <li class="list-item">
                            <span class="item-name">{$LANG.ordersubtotal}</span>
                            <span class="item-value">{$subtotal}</span>
                        </li>
                    </ul>
                    {if $promocode || $taxrate || $taxrate2}
                    <ul class="summary-list faded">
                        {if $taxrate}
                        <li class="list-item">
                            <span class="item-name">{$taxname} @ {$taxrate}%</span>
                            <span class="item-value" id="taxTotal1">{$taxtotal}</span>
                        </li>
                        {/if}
                        {if $taxrate2}
                        <li class="list-item">
                            <span class="item-name">{$taxname2} @ {$taxrate2}%</span>
                            <span class="item-value" id="taxTotal2">{$taxtotal2}</span>
                        </li>
                        {/if}
                        {if $promocode}
                        <li class="list-item light">
                            <span class="item-name">{$promodesc}</span>
                            <span class="item-value">{$discount}</span>
                        </li>
                        {/if}
                    </ul>
                    {/if}
                </div>
                <div class="panel-footer">
                    <div class="price price-left-h price-sm">
                        <span class="price-title">{$LANG.ordertotalduetoday}</span>
                        <span class="price-amount amt" id="totalDueToday">{$total}</span>
                    </div>
                    <div class="summary-actions">
                        <button type="button" class="btn btn-lg btn-primary-faded btn-checkout" data-btn-loader data-trigger-click data-target="#submit-upgrade">
                            <span><i class="ls ls-share"></i>{$LANG.orderForm.checkout}</span>
                            <div class="loader loader-button hidden" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    {* </div> *}
    <div class="order-summary order-summary-mob" id="orderSummaryMob" data-fixed-actions href="#orderSummary">
        <button type="button" class="btn btn-lg btn-primary-faded btn-checkout" data-trigger-click data-target="#submit-upgrade">
            <i class="ls ls-share"></i>{$LANG.orderForm.checkout}
        </button>
    </div>
{* </div> *}
{/if}