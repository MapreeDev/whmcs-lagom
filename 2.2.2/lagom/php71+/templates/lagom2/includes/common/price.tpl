{if file_exists("templates/$template/includes/common/overwrites/price.tpl")}
     {include file="{$template}/includes/common/overwrites/price.tpl"}  
{else}
    <div class="price-amount{if $RSThemes['addonSettings']['package_price_wrap'] eq 'break-all'} word-break-all{/if}{if $priceInlineAmount} price-inline-amount{/if}">
        {if ($price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || $price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00") && isset($RSThemes.addonSettings.free_product_price) && $RSThemes.addonSettings.free_product_price == "enabled"}
            {$LANG.orderfree}
        {else}
            {if isset($priceCurrency) && $priceCurrency}<span class="price-prefix">{$priceCurrency}</span>{/if}
            {$price|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
            {if isset($priceCurrencySuffix) && $priceCurrencySuffix}{$priceCurrencySuffix}{/if}
        {/if}
    </div>
    {if isset($priceType) && $priceType !=="free" && $priceType !=="onetime"}
        <div class="price-cycle {if $priceCycleShort}price-cycle-inline{/if}">
        {if $priceCycle eq "monthly"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.monthly}{else}{$LANG.orderpaymenttermmonthly}{/if}
        {elseif $priceCycle eq "quarterly"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.quarterly}{else}{$LANG.orderpaymenttermquarterly}{/if}
        {elseif $priceCycle eq "semiannually"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.semiannually}{else}{$LANG.orderpaymenttermsemiannually}{/if}
        {elseif $priceCycle eq "annually"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.annually}{else}{$LANG.orderpaymenttermannually}{/if}
        {elseif $priceCycle eq "biennially"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.biennially}{else}{$LANG.orderpaymenttermbiennially}{/if}
        {elseif $priceCycle eq "triennially"}
            {if $priceCycleShort}/{$LANG.pricingCycleShort.triennially}{else}{$LANG.orderpaymenttermtriennially}{/if}
        {/if}
        {if isset($priceSetupFee) && $priceSetupFee} + {$priceSetupFee->toPrefixed()} {$LANG.ordersetupfee}{/if}
        {if isset($priceSetupFeeLowest) && $priceSetupFeeLowest} + {$priceSetupFeeLowest|replace:$activeCurrency.suffix:""} {$LANG.ordersetupfee}{/if}
        </div>
    {else if isset($priceSetupFee) && $priceSetupFee}
        <div class="price-cycle">+ {$priceSetupFee->toPrefixed()} {$LANG.ordersetupfee}</div>
    {else if isset($priceSetupFeeLowest) && $priceSetupFeeLowest}
        <div class="price-cycle">+ {$priceSetupFeeLowest} {$LANG.ordersetupfee}</div>
    {/if}
{/if}    