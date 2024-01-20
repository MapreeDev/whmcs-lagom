
{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <script>
    var _localLang = {
        'addToCart': '{$LANG.orderForm.addToCart|escape}',
        'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
    }
    </script>    
    <form id="frmConfigureProduct">
        <input type="hidden" name="configure" value="true" />
        <input type="hidden" name="i" value="{$i}" />
        <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
            <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
                <div class="section">
                        <div class="alert alert-lagom alert-primary alert-danger hidden" role="alert" id="containerProductValidationErrors">
                            <span class="alert-icon ls ls-exclamation-circle"></span>
                            <div class="alert-body">
                                <h6 class="alert-title">{$LANG.orderForm.correctErrors}:</h6>
                                <ul id="containerProductValidationErrorsList"></ul>
                            </div>
                        </div>
                        <div class="section-body">
                            <div class="panel panel-form product-config-info">
                                <div class="panel-body">
                                    <h2>{$productinfo.group_name} - {$productinfo.name}</h2>
                                    <div class="product-info">
                                        {$productinfo.description}
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                {if $pricing.type eq "recurring"}
                    {assign var='recurringCount' value=0} 
                    {foreach item=cl from=$pricing.cycles name=foo}
                        {assign var='recurringCount' value=$recurringCount + 1} 
                    {/foreach}
                    {if $pricing.monthly}
                        {assign var='mincycle' value="monthly"}
                        {assign var='minimalprice' value=$pricing.rawpricing.monthly}
                    {elseif $pricing.quarterly}
                        {assign var='mincycle' value="quarterly"}
                        {math assign="minimalprice" equation="y/3" y=$pricing.rawpricing.quarterly}
                    {elseif $pricing.semiannually}
                        {assign var='mincycle' value="semiannually"}
                        {math assign="minimalprice" equation="y/6" y=$pricing.rawpricing.semiannually} 
                    {elseif $pricing.annually}
                        {assign var='mincycle' value="annually"}
                        {math assign="minimalprice" equation="y/12" y=$pricing.rawpricing.annually} 
                    {elseif $pricing.biennially}
                        {assign var='mincycle' value="biennially"}
                        {math assign="minimalprice" equation="y/24" y=$pricing.rawpricing.biennially} 
                    {elseif $pricing.triennially}    
                        {assign var='mincycle' value="triennially"}
                        {math assign="minimalprice" equation="y/36" y=$pricing.rawpricing.triennially} 
                    {/if}
                    {if $minimalprice != "0.00" && $minimalprice != "0,00"}
                        {if $pricing.quarterly}
                            {math assign="check_discount_quarterly" equation="100-((y/(x*3))*100)" x=$minimalprice y=$pricing.rawpricing.quarterly format="%.0f"}
                        {else}
                            {assign var='check_discount_quarterly' value="0"}
                        {/if}
                        {if $pricing.semiannually}
                            {math assign="check_discount_semiannually" equation="100-((y/(x*6))*100)" x=$minimalprice y=$pricing.rawpricing.semiannually format="%.0f"}
                        {else}
                            {assign var='check_discount_semiannually' value="0"}
                        {/if}
                        {if $pricing.annually}
                            {math assign="check_discount_annually" equation="100-((y/(x*12))*100)" x=$minimalprice y=$pricing.rawpricing.annually format="%.0f"}
                        {else}
                            {assign var='check_discount_annually' value="0"}
                        {/if}
                        {if $pricing.biennially}
                            {math assign="check_discount_biennially" equation="100-((y/(x*24))*100)" x=$minimalprice y=$pricing.rawpricing.biennially format="%.0f"}
                        {else}
                            {assign var='check_discount_biennially' value="0"}    
                        {/if}
                        {if $pricing.triennially}
                            {math assign="check_discount_triennially" equation="100-((y/(x*36))*100)" x=$minimalprice y=$pricing.rawpricing.triennially format="%.0f"}
                        {else}
                            {assign var='check_discount_triennially' value="0"}      
                        {/if}
                        {if $check_discount_quarterly > 0 || $check_discount_semiannually > 0 || $check_discount_annually > 0 || $check_discount_biennially > 0 || $check_discount_triennially > 0}
                            {assign var="show_discount" value=true}
                        {/if}  
                    {/if}                          
                    <div class="section {if $recurringCount == 1}hidden{/if}" id="sectionCycles">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.cartchoosecycle}</h2>
                        </div>
                        <div class="panel-check-group row row-eq-height" data-inputs-container>
                            {if $pricing.monthly}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "monthly"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="monthly">
                                                <input class="icheck-control" type="radio" value="monthly" name="billingcycle" {if $billingcycle eq "monthly"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.monthly|strstr:$LANG.orderpaymentterm1month}                                                    
                                                        <h6 class="check-title">{$LANG.orderpaymenttermmonthly} 
                                                            <br> 
                                                            {if (
                                                                $pricing.monthly|replace:$LANG.orderpaymentterm1month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.monthly|replace:$LANG.orderpaymentterm1month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    {assign var="monthlyPrice" value=' ('|explode:$pricing.monthly|replace:$LANG.orderpaymentterm1month:""}
                                                                    {assign var="monthlyDiscount" value=', '|explode:$monthlyPrice[1]}
                                                                    {assign var="monthlyOldPrice" value=': '|explode:$monthlyDiscount[1]}

                                                                    {if $pricing.cycles.monthly|strstr:$LANG.orderfreedomainonly}{$freeDomainMonthly = true}{/if}
                                                                            {if $pricing.monthly|strstr:'(' && !$pricing.monthly|strstr:$LANG.orderfreedomainonly}
                                                                                {$monthlyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainMonthly} ({$LANG.orderfreedomainonly}){/if}
                                                                                <br>
                                                                                <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$monthlyDiscount[0]|replace:'(':""}</span> <span class="cycle-full-price line-through m-t-1x">{$monthlyOldPrice[1]|replace:')':""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                            {else}
                                                                                {$monthlyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                                <br>
                                                                                <div>-</div>
                                                                            {/if}
                                                                {else}
                                                                    {if $pricing.monthly|strstr:$LANG.orderfreedomainonly}{$freeDomainMonthly = true}{/if}
                                                                    {$pricing.monthly|replace:$LANG.orderpaymentterm1month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainMonthly} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if}
                                                        </h6>
                                                    {else}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermmonthly} 
                                                            <br> 
                                                            {if (
                                                                $pricing.monthly|replace:$LANG.orderpaymenttermmonthly:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.monthly|replace:$LANG.orderpaymenttermmonthly:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.monthly|replace:$LANG.orderpaymenttermmonthly:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if}
                                                        </h6>
                                                    {/if}
                                                    {if !isset($DiscountCenterAddonIsActive) && $show_discount}
                                                        <p class="check-subtitle">-</p>
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $pricing.quarterly}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "quarterly"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="quarterly">
                                                <input class="icheck-control" type="radio" value="quarterly" name="billingcycle" {if $billingcycle eq "quarterly"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.quarterly|strstr:$LANG.orderpaymentterm3month}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermquarterly} 
                                                            <br> 
                                                            {if (
                                                                $pricing.quarterly|replace:$LANG.orderpaymentterm3month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.quarterly|replace:$LANG.orderpaymentterm3month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    
                                                                    {assign var="quarterlyPrice" value=' ('|explode:$pricing.quarterly|replace:$LANG.orderpaymentterm3month:""}
                                                                    {assign var="quarterlyDiscount" value=', '|explode:$quarterlyPrice[1]}
                                                                    {assign var="quarterlyOldPrice" value=': '|explode:$quarterlyDiscount[1]}

                                                                    {if $pricing.cycles.quarterly|strstr:$LANG.orderfreedomainonly}{$freeDomainQuarterly = true}{/if}
                                                                        {if $pricing.quarterly|strstr:'(' && !$pricing.semiannually|strstr:$LANG.orderfreedomainonly}
                                                                        {$quarterlyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainQuarterly} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$quarterlyDiscount[0]|replace:'(':""}</span> <span class="cycle-full-price line-through m-t-1x">{$quarterlyOldPrice[1]|replace:')':""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                        {else}
                                                                            {$quarterlyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <div>-</div>
                                                                        {/if}
                                                                {else}
                                                                    {if $pricing.quarterly|strstr:$LANG.orderfreedomainonly}{$freeDomainQuarterly = true}{/if}
                                                                    {$pricing.quarterly|replace:$LANG.orderpaymentterm3month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainQuarterly} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if}
                                                        </h6>
                                                    {else}
                                                         <h6 class="check-title">
                                                            {$LANG.orderpaymenttermquarterly} 
                                                            <br> 
                                                            {if (
                                                                $pricing.quarterly|replace:$LANG.orderpaymenttermquarterly:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.quarterly|replace:$LANG.orderpaymenttermquarterly:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.quarterly|replace:$LANG.orderpaymenttermquarterly:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if}
                                                        </h6>
                                                    {/if}
                                                   
                                                    {if !isset($DiscountCenterAddonIsActive)}                                                       
                                                        {if $mincycle eq "quarterly" && $show_discount}
                                                            <p class="check-subtitle"> 
                                                                -
                                                            </p>
                                                        {else}    
                                                            {if $minimalprice != "0.00" && $minimalprice != "0,00"}                                                    
                                                                {math assign="price_save" equation="100-((y/(x*3))*100)" x=$minimalprice y=$pricing.rawpricing.quarterly format="%.0f"}
                                                            {/if}
                                                            {if $price_save > 0}
                                                                <p class="check-subtitle"> 
                                                                    <span class="label label-info label-save label-xs save">
                                                                        {$rslang->trans('order.price_save')} {$price_save}%
                                                                    </span>
                                                                    {math assign="cycle_full_price" equation="x*3" x=$minimalprice format="%.2f"}
                                                                    <span class="cycle-full-price line-through m-t-1x">
                                                                        {$WHMCSCurrency.prefix}{if $display_billing_monthly_price == "on"}{$minimalprice}{else}{$cycle_full_price}{/if}</span>
                                                                    </span>
                                                                </p>
                                                            {elseif $show_discount}
                                                                <p class="check-subtitle"> 
                                                                    -
                                                                </p>
                                                            {/if} 
                                                        {/if}    
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $pricing.semiannually}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "semiannually"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="semiannually">
                                                <input class="icheck-control" type="radio" name="billingcycle" value="semiannually"{if $billingcycle eq "semiannually"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.semiannually|strstr:$LANG.orderpaymentterm6month}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermsemiannually} 
                                                            <br> 
                                                            {if (
                                                                $pricing.semiannually|replace:$LANG.orderpaymentterm6month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.semiannually|replace:$LANG.orderpaymentterm6month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    {assign var="semiannuallyPrice" value=' ('|explode:$pricing.semiannually|replace:$LANG.orderpaymentterm6month:""}
                                                                    {assign var="semiannuallyDiscount" value=', '|explode:$semiannuallyPrice[1]}
                                                                    {assign var="semiannuallyOldPrice" value=': '|explode:$semiannuallyDiscount[1]}
                                                                    {if $pricing.cycles.semiannually|strstr:$LANG.orderfreedomainonly}{$freeDomainSemiAnnually = true}{/if}
                                                                     {if $pricing.semiannually|strstr:'(' && !$pricing.semiannually|strstr:$LANG.orderfreedomainonly}
                                                                            {$semiannuallyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainSemiAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$semiannuallyDiscount[0]|replace:'(':""}</span> <span class="cycle-full-price line-through m-t-1x">{$semiannuallyOldPrice[1]|replace:")":''|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                        {else}
                                                                            {$semiannuallyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <div>-</div>
                                                                        {/if}

                                                                {else}
                                                                    {if $pricing.semiannually|strstr:$LANG.orderfreedomainonly}{$freeDomainSemiannually = true}{/if}
                                                                    {$pricing.semiannually|replace:$LANG.orderpaymentterm6month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainSemiannually} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if} 
                                                        </h6>
                                                    {else}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermsemiannually} 
                                                            <br> 
                                                            {if (
                                                                $pricing.semiannually|replace:$LANG.orderpaymenttermsemiannually:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.semiannually|replace:$LANG.orderpaymenttermsemiannually:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.semiannually|replace:$LANG.orderpaymenttermsemiannually:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if}
                                                        </h6>
                                                    {/if}
                                                    {if !isset($DiscountCenterAddonIsActive)}                                                                                                             
                                                        {if $mincycle eq "semiannually" && $show_discount}
                                                            <p class="check-subtitle"> 
                                                                -
                                                            </p>
                                                        {else}
                                                            {if $minimalprice != "0.00" && $minimalprice != "0,00"}     
                                                                {math assign="price_save" equation="100-((y/(x*6))*100)" x=$minimalprice y=$pricing.rawpricing.semiannually format="%.0f"}
                                                            {/if}
                                                            {if $price_save > 0}
                                                                <p class="check-subtitle"> 
                                                                    <span class="label label-info label-save label-xs save">
                                                                        {$rslang->trans('order.price_save')} {$price_save}%
                                                                    </span>
                                                                    {math assign="cycle_full_price" equation="x*6" x=$minimalprice format="%.2f"}
                                                                    <span class="cycle-full-price line-through m-t-1x">
                                                                        {$WHMCSCurrency.prefix}{if $display_billing_monthly_price == "on"}{$minimalprice}{else}{$cycle_full_price}{/if}</span>
                                                                    </span>
                                                                </p>
                                                            {elseif $show_discount}
                                                                <p class="check-subtitle"> 
                                                                    -
                                                                </p>
                                                            {/if}
                                                        {/if}    
                                                        
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $pricing.annually}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "annually"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="annually">
                                                <input class="icheck-control" type="radio" name="billingcycle" value="annually"{if $billingcycle eq "annually"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.annually|strstr:$LANG.orderpaymentterm12month}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermannually} 
                                                            <br> 
                                                            {if (
                                                                $pricing.annually|replace:$LANG.orderpaymentterm12month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.annually|replace:$LANG.orderpaymentterm12month:""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    {assign var="annuallyPrice" value=' ('|explode:$pricing.annually|replace:$LANG.orderpaymentterm12month:""}
                                                                    {assign var="annuallyDiscount" value=', '|explode:$annuallyPrice[1]}
                                                                    {assign var="annuallyOldPrice" value=': '|explode:$annuallyDiscount[1]}
                                                                    {if $pricing.cycles.annually|strstr:$LANG.orderfreedomainonly}{$freeDomainAnnually = true}{/if}
                                                                        {if $pricing.annually|strstr:'(' && !$pricing.annually|strstr:$LANG.orderfreedomainonly}
                                                                            {$annuallyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if} {if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$annuallyDiscount[0]}</span> <span class="cycle-full-price line-through m-t-1x">{$annuallyOldPrice[1]|replace:')':""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                        {else}
                                                                            {$annuallyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly} {if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <div>-</div>
                                                                        {/if}
                                                                {else}
                                                                    {if $pricing.annually|strstr:$LANG.orderfreedomainonly}{$freeDomainAnnually = true}{/if}
                                                                    {$pricing.annually|replace:$LANG.orderpaymentterm12month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if}   
                                                        </h6>
                                                    {else}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermannually} 
                                                            <br> 
                                                            {if (
                                                                $pricing.annually|replace:$LANG.orderpaymenttermannually:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.annually|replace:$LANG.orderpaymenttermannually:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.annually|replace:$LANG.orderpaymenttermannually:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if}  
                                                        </h6>
                                                    {/if}
                                                    {if !isset($DiscountCenterAddonIsActive)}                                                                                                         
                                                        {if $mincycle eq "annually" && $show_discount}
                                                            <p class="check-subtitle">    
                                                                -
                                                            </p>
                                                        {else}
                                                            {if $minimalprice != "0.00" && $minimalprice != "0,00"}     
                                                                {math assign="price_save" equation="100-((y/(x*12))*100)" x=$minimalprice y=$pricing.rawpricing.annually format="%.0f"}
                                                            {/if}
                                                            {if $price_save > 0}
                                                                <p class="check-subtitle"> 
                                                                    <span class="label label-info label-save label-xs save">
                                                                        {$rslang->trans('order.price_save')} {$price_save}%
                                                                    </span>
                                                                    {math assign="cycle_full_price" equation="x*12" x=$minimalprice format="%.2f"}
                                                                    <span class="cycle-full-price line-through m-t-1x">
                                                                        {$WHMCSCurrency.prefix}{if $display_billing_monthly_price == "on"}{$minimalprice}{else}{$cycle_full_price}{/if}</span>
                                                                    </span>
                                                                </p>
                                                            {elseif $show_discount}
                                                                <p class="check-subtitle">    
                                                                    -
                                                                </p>
                                                            {/if}
                                                        {/if}     
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $pricing.biennially}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "biennially"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="biennially">
                                                <input class="icheck-control" type="radio" name="billingcycle" value="biennially"{if $billingcycle eq "biennially"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.biennially|strstr:$LANG.orderpaymentterm24month}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermbiennially} 
                                                            <br> 
                                                            {if (
                                                                $pricing.biennially|replace:$LANG.orderpaymentterm24month:""|replace:"-":""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.biennially|replace:$LANG.orderpaymentterm24month:""|replace:"-":""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    {assign var="bienniallyPrice" value=' ('|explode:$pricing.biennially|replace:$LANG.orderpaymentterm24month:""}
                                                                    {assign var="bienniallyDiscount" value=', '|explode:$bienniallyPrice[1]}
                                                                    {assign var="bienniallyOldPrice" value=': '|explode:$bienniallyDiscount[1]}
                                                                    {if $pricing.cycles.biennially|strstr:$LANG.orderfreedomainonly}{$freeDomainBiennially = true}{/if}

                                                                        {if $pricing.biennially|strstr:'(' && !$pricing.biennially|strstr:$LANG.orderfreedomainonly}
                                                                            {$bienniallyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainBiennially} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$bienniallyDiscount[0]|replace:'(':""}</span> <span class="cycle-full-price line-through m-t-1x">{$bienniallyOldPrice[1]|replace:')':""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                        {else}
                                                                            {$bienniallyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly} {if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                            <br>
                                                                            <div>-</div>
                                                                        {/if}
                                                                {else}
                                                                    {if $pricing.biennially|strstr:$LANG.orderfreedomainonly}{$freeDomainBiennially = true}{/if}
                                                                    {$pricing.biennially|replace:$LANG.orderpaymentterm24month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly}{if $freeDomainBiennially} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if} 
                                                        </h6>
                                                    {else}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermbiennially} 
                                                            <br> 
                                                            {if (
                                                                $pricing.biennially|replace:$LANG.orderpaymenttermbiennially:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.biennially|replace:$LANG.orderpaymenttermbiennially:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.biennially|replace:$LANG.orderpaymenttermbiennially:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if} 
                                                        </h6>
                                                    {/if}
                                                    
                                                    {if !isset($DiscountCenterAddonIsActive)}                                                
                                                        {if $mincycle eq "biennially" && $show_discount}
                                                            <p class="check-subtitle">   
                                                                -
                                                            </p>
                                                        {else}
                                                            {if $minimalprice != "0.00" && $minimalprice != "0,00"}     
                                                                {math assign="price_save" equation="100-((y/(x*24))*100)" x=$minimalprice y=$pricing.rawpricing.biennially format="%.0f"}
                                                            {/if}
                                                            {if $price_save > 0}
                                                                <p class="check-subtitle"> 
                                                                    <span class="label label-info label-save label-xs save">
                                                                        {$rslang->trans('order.price_save')} {$price_save}%
                                                                    </span>
                                                                    {math assign="cycle_full_price" equation="x*24" x=$minimalprice format="%.2f"}
                                                                    <span class="cycle-full-price line-through m-t-1x">
                                                                        {$WHMCSCurrency.prefix}{if $display_billing_monthly_price == "on"}{$minimalprice}{else}{$cycle_full_price}{/if}</span>
                                                                    </span>
                                                                </p>
                                                            {elseif $show_discount}
                                                                <p class="check-subtitle">   
                                                                    -
                                                                </p>
                                                            {/if}
                                                        {/if}      
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            {if $pricing.triennially}
                                <div class="col-sm-4">
                                    <div class="panel panel-check {if $billingcycle eq "triennially"} checked{/if}" data-virtual-input >
                                        <div class="check check-cycle">
                                            <label data-update-config data-config-i={$i} data-config-val="triennially">
                                                <input class="icheck-control" type="radio" name="billingcycle" value="triennially"{if $billingcycle eq "triennially"} checked{/if}>
                                                <div class="check-content">
                                                    {if $pricing.triennially|strstr:$LANG.orderpaymentterm36month}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermtriennially} 
                                                            <br> 
                                                            {if (
                                                                $pricing.triennially|replace:$LANG.orderpaymentterm36month:""|replace:"-":""|replace:"-":""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.triennially|replace:$LANG.orderpaymentterm36month:""|replace:"-":""|replace:"-":""|replace:"-":""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {if ($DiscountCenterAddonIsActive)}
                                                                    {assign var="trienniallyPrice" value=' ('|explode:$pricing.triennially|replace:$LANG.orderpaymentterm36month:""}                                                                  
                                                                    {assign var="trienniallyDiscount" value=', '|explode:$trienniallyPrice[1]}
                                                                    {assign var="trienniallyOldPrice" value=': '|explode:$trienniallyDiscount[1]}
                                                                    {if $pricing.cycles.triennially|strstr:$LANG.orderfreedomainonly}{$freeDomainTriennially = true}{/if}
                                                                    
                                                                    {if $pricing.triennially|strstr:'(' && !$pricing.triennially|strstr:$LANG.orderfreedomainonly} 
                                                                        {$trienniallyPrice[0]|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainTriennially} ({$LANG.orderfreedomainonly}){/if}
                                                                        <br>
                                                                        <p class="check-subtitle"><span class="label label-info label-save label-xs save">{$trienniallyDiscount[0]}</span> <span class="cycle-full-price line-through m-t-1x">{$trienniallyOldPrice[1]|replace:")":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}</span></p>
                                                                    {else}
                                                                        {$trienniallyPrice[0]|replace:"- ":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}/{$LANG.pricingCycleShort.monthly} {if $freeDomainAnnually} ({$LANG.orderfreedomainonly}){/if}
                                                                        <br>
                                                                        <div>-</div>
                                                                    {/if}
                                                                {else}
                                                                    {if $pricing.triennially|strstr:$LANG.orderfreedomainonly}{$freeDomainTriennially = true}{/if}
                                                                    {$pricing.triennially|replace:$LANG.orderpaymentterm36month:""|replace:"-":""|replace:" (`$LANG.orderfreedomainonly`)":""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}{if $display_billing_monthly_price == "on"}/{$LANG.pricingCycleShort.monthly}{/if}{if $freeDomainTriennially} ({$LANG.orderfreedomainonly}){/if}
                                                                {/if}
                                                            {/if}   
                                                        </h6>
                                                    {else}
                                                        <h6 class="check-title">
                                                            {$LANG.orderpaymenttermtriennially} 
                                                            <br>
                                                            {if (
                                                                $pricing.triennially|replace:$LANG.orderpaymenttermtriennially:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0.00" || 
                                                                $pricing.triennially|replace:$LANG.orderpaymenttermtriennially:""|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:" ":"" == "0,00"
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$pricing.triennially|replace:$LANG.orderpaymenttermtriennially:""|replace:$WHMCSCurrency.suffix:" `$WHMCSCurrency.suffix`"}
                                                            {/if} 
                                                        </h6>
                                                    {/if}
                                                    
                                                    {if !isset($DiscountCenterAddonIsActive)}                                                                                                               
                                                        {if $mincycle eq "triennially" && $show_discount}
                                                            <p class="check-subtitle">
                                                                -
                                                            </p>
                                                        {else}
                                                            {if $minimalprice != "0.00" && $minimalprice != "0,00"}     
                                                                {math assign="price_save" equation="100-((y/(x*36))*100)" x=$minimalprice y=$pricing.rawpricing.triennially format="%.0f"}                                                            
                                                            {/if}
                                                            {if $price_save > 0}
                                                                <p class="check-subtitle"> 
                                                                    <span class="label label-info label-save label-xs save">
                                                                        {$rslang->trans('order.price_save')} {$price_save}%
                                                                    </span>
                                                                    {math assign="cycle_full_price" equation="x*36" x=$minimalprice format="%.2f"}
                                                                    <span class="cycle-full-price line-through m-t-1x">
                                                                        {$WHMCSCurrency.prefix}{if $display_billing_monthly_price == "on"}{$minimalprice}{else}{$cycle_full_price}{/if}</span>
                                                                    </span>
                                                                </p>
                                                            {elseif $show_discount}
                                                                <p class="check-subtitle">
                                                                    -
                                                                </p>
                                                            {/if}
                                                        {/if}                                                          
                                                    {/if}
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        </div>
                    </div>
                {/if}

                {if count($metrics) > 0}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.metrics.title}</h2>
                            <p class="section-desc">{$LANG.orderForm.configureDesiredOptions}</p>
                        </div>
                        <div class="section-body">
                            <ul class="list-group list-group-bordered">
                                {foreach $metrics as $metric}
                                    <li class="list-group-item d-flex align-center space-between">
                                        {$metric.displayName}
                                        -
                                        {if count($metric.pricing) > 1}
                                            {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                                {$LANG.metrics.viewPricing}
                                            </button>
                                        {elseif count($metric.pricing) == 1}
                                            {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                                            {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                                        {/if}
                                        {include file="$template/usagebillingpricing.tpl"}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>    
                {/if}
                <div class="section message message-no-data hidden position-relative" id="lagomPageLoader">
                    <div class="loader">
                        {include file="$template/includes/common/loader.tpl"}
                    </div>
                </div>
                {if $configurableoptions}
                <div class="section">
                    <div class="product-configurable-options" id="productConfigurableOptions">
                        {foreach $configurableoptions as $num => $configoption}
                            {if $configoption.optiontype eq 1}
                                <div class="section">
                                    <div class="section-header">
                                        <h2 class="section-title">{$configoption.optionname}</h2>
                                        {if $optionsdescription[$configoption.id]}
                                            <p class="section-desc">{$optionsdescription[$configoption.id]}</p>
                                        {/if}
                                    </div>
                                    <div class="section-body">
                                        <div class="panel panel-form">
                                            <div class="panel-body d-flex flex-nowrap align-items-center">
                                                <select name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" class="form-control">
                                                    {foreach key=num2 item=options from=$configoption.options}
                                                        <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>
                                                            {$options.name}
                                                        </option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {elseif $configoption.optiontype eq 2}
                                <div class="section">
                                   <div class="section-header">
                                        <h2 class="section-title">{$configoption.optionname}</h2>
                                        {if $optionsdescription[$configoption.id]}
                                            <p class="section-desc">{$optionsdescription[$configoption.id]}</p>
                                        {/if}
                                    </div>
                                    <div class="section-body">
                                        <div class="panel-check-group row row-eq-height" data-inputs-container>
                                            {foreach key=num2 item=options from=$configoption.options}
                                                <div class="col-sm-4">
                                                    <div class="panel panel-check {if $configoption.selectedvalue eq $options.id}checked{/if}" data-virtual-input>
                                                        <div class="check">
                                                            <label>
                                                                <input type="radio" class="icheck-control" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if} />
                                                                <div class="check-content">
                                                                    <h6 class="check-title">
                                                                        {if $options.nameonly || $options.nameonly == "0"}
                                                                            {$options.nameonly}
                                                                        {else}
                                                                            {$rslang->trans('generals.enable')}
                                                                        {/if}
                                                                    </h6>            
                                                                    <p class="check-subtitle {if $options.fullprice == null && ($options.setup == '0.00' || $options.setup == null)}hidden{/if}">                                                        
                                                                        {if ($options.fullprice == '0.00' || $options.fullprice == null) && $options.setup != '0.00'}
                                                                        {else}
                                                                            {if (
                                                                                  $options.fullprice == "0.00" ||
                                                                                  $options.fullprice == "0,00"
                                                                                ) && (
                                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                                )
                                                                            }
                                                                                {$LANG.orderfree}
                                                                            {else}    
                                                                                {$currency.prefix}{$options.recurring|string_format:"%.2f"}{$currency.suffix|replace:$currency.suffix:" `$currency.suffix`"}{if $options.setup != '0.00' && $options.setup != null} + {/if}{if $options.recurring  != "0.00" && $options.recurring != "0,00" && $options.recurring != "0"}<span class="co-cycle">/{if $display_billing_monthly_price == "on"}{$LANG.pricingCycleShort.monthly}{else}{$LANG.pricingCycleShort.$billingcycle}{/if}</span>{/if}
                                                                            {/if}    
                                                                        {/if}
                                                                        {if $options.setup != '0.00' && $options.setup != null}
                                                                            {$currency.prefix}{$options.setup}{$currency.suffix|replace:$currency.suffix:" `$currency.suffix`"} {$LANG.ordersetupfee}
                                                                        {/if}
                                                                    </p>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>      
                                                </div>                               
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                            {elseif $configoption.optiontype eq 3}
                                <div class="section">
                                    <div class="section-header">
                                        <h2 class="section-title">{$configoption.optionname}</h2>
                                        {if $optionsdescription[$configoption.id]}
                                            <p class="section-desc">{$optionsdescription[$configoption.id]}</p>
                                        {/if}
                                    </div>
                                    <div class="section-body">
                                        <div class="panel-check-group row row-eq-height" data-inputs-container>
                                            {foreach key=num2 item=options from=$configoption.options}
                                                <div class="col-sm-4">
                                                    <div class="panel panel-check {if $configoption.selectedqty} checked{/if}" data-virtual-input>
                                                        <div class="check">
                                                            <label>
                                                                <input class="icheck-control" type="checkbox" name="configoption[{$configoption.id}]" id="inputConfigOption{$configoption.id}" value="1"{if $configoption.selectedqty} checked{/if} />
                                                                <div class="check-content">
                                                                    <h6 class="check-title">
                                                                        {if $configoption.options.0.nameonly || $configoption.options.0.nameonly == "0"}
                                                                            {$configoption.options.0.nameonly}
                                                                        {else}
                                                                            {$rslang->trans('generals.enable')}
                                                                        {/if}
                                                                    </h6>
                                                                    <p class="check-subtitle">
                                                                        {if (
                                                                                $configoption.options.0.recurring == "0.00" ||
                                                                                $configoption.options.0.recurring == "0,00"
                                                                            ) && (
                                                                                isset($RSThemes.addonSettings.free_product_price) && 
                                                                                $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                                isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                                $RSThemes.addonSettings.free_product_price_value == "all"
                                                                            )
                                                                        }
                                                                            {$LANG.orderfree}
                                                                        {else if $configoption.options.0.recurring != "0.00"}                                                                 
                                                                            {$currency.prefix}{$configoption.options.0.recurring|string_format:"%.2f"}{$currency.suffix|replace:$currency.suffix:" `$currency.suffix`"}{if $options.options.0.recurring  != "0.00" && $options.options.0.recurring != "0,00" && $options.options.0.recurring  != "0"}<span class="co-cycle">/{if $display_billing_monthly_price == "on"}{$LANG.pricingCycleShort.monthly}{else}{$LANG.pricingCycleShort.$billingcycle}{/if}</span>{/if}
                                                                        {else}
                                                                            -     
                                                                        {/if}
                                                                    </p>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>      
                                                </div>                               
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>                               
                            {elseif $configoption.optiontype eq 4}
                                <div class="section">
                                    <div class="section-header">
                                        <h2 class="section-title">{$configoption.optionname}</h2>
                                        {if $optionsdescription[$configoption.id]}
                                            <p class="section-desc">{$optionsdescription[$configoption.id]}</p>
                                        {/if}
                                    </div>
                                    <div class="section-body">
                                        {if $configoption.qtymaximum}
                                            <div class="panel panel-form panel-range-slider">
                                                <div class="panel-body">
                                                    <div>
                                                        {if !$rangesliderincluded}
                                                            <script type="text/javascript" src="{$BASE_PATH_JS}/ion.rangeSlider.min.js"></script>
                                                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.css" rel="stylesheet">
                                                            <link href="{$BASE_PATH_CSS}/ion.rangeSlider.skinModern.css" rel="stylesheet">
                                                            {assign var='rangesliderincluded' value=true}
                                                        {/if}
                                                        <input type="text" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" class="form-control" />
                                                        <script>
                                                            var sliderTimeoutId = null;
                                                            var sliderRangeDifference = {$configoption.qtymaximum} - {$configoption.qtyminimum};
                                                            // The largest size that looks nice on most screens.
                                                            var sliderStepThreshold = 25;
                                                            // Check if there are too many to display individually.
                                                            var setLargerMarkers = sliderRangeDifference > sliderStepThreshold;

                                                            jQuery("#inputConfigOption{$configoption.id}").ionRangeSlider({
                                                                min: {$configoption.qtyminimum},
                                                                max: {$configoption.qtymaximum},
                                                                grid: true,
                                                                grid_snap: setLargerMarkers ? false : true,
                                                                onChange: function() {
                                                                    if (sliderTimeoutId) {
                                                                        clearTimeout(sliderTimeoutId);
                                                                    }

                                                                    sliderTimeoutId = setTimeout(function() {
                                                                        sliderTimeoutId = null;
                                                                        recalctotals();
                                                                    }, 250);
                                                                }
                                                            });
                                                        </script>
                                                    </div>
                                                </div>    
                                            </div>    
                                        {else}
                                            <div class="panel panel-form">
                                                <div class="panel-body">
                                                    <div class="input-group">
                                                        <input type="number" name="configoption[{$configoption.id}]" value="{if $configoption.selectedqty}{$configoption.selectedqty}{else}{$configoption.qtyminimum}{/if}" id="inputConfigOption{$configoption.id}" min="{$configoption.qtyminimum}" onchange="recalctotals()" onkeyup="recalctotals()" class="form-control form-control-qty" />
                                                        <span class="input-group-addon">
                                                            x {$configoption.options.0.name}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                </div>    
                            {/if}
                        {/foreach}
                    </div>
                </div>
                {/if}
                {if $RSThemes['addonSettings']['hide_password_fields'] != "displayed"}
                    {assign var="ns_groups" value=","|explode:$RSThemes['addonSettings']['hide_password_fields']}
                    {if $productinfo.gid|in_array:$ns_groups}
                        {assign var="hideServerFields" value=true}
                    {/if}
                {/if}    
                {if $RSThemes['addonSettings']['hide_nameserver_fields'] != "displayed"}
                    {assign var="ns_groups" value=","|explode:$RSThemes['addonSettings']['hide_nameserver_fields']}
                    {if $productinfo['gid']|in_array:$ns_groups}
                        {assign var="hideNSFields" value=true}
                    {/if}
                {/if}

                {if $productinfo.type eq "server"}
                    <div class="section {if $hideNSFields && $hideServerFields}hidden{/if}">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.cartconfigserver}</h2>
                        </div>    
                        <div class="panel panel-form">
                            <div class="panel-body">
                                {if $hideServerFields}    
                                    <div class="row hidden">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputHostname">{$LANG.serverhostname}</label>
                                                <input type="text" name="hostname" class="form-control" id="inputHostname" value="{$server.hostname}" placeholder="servername.example.com">
                                            </div>
                                        </div>

                                        {assign var="hostname_prefix" value=".{$companyname|lower|replace:' ':''}"}
                                        {assign var="hostname_interfix" value=20}
                                        {assign var="hostname_suffix" value=".com"}

                                        {if $RSThemes['addonSettings']['custom_hostname_prefix']}
                                            {assign var="hostname_prefix" value=".{$RSThemes['addonSettings']['custom_hostname_prefix']}"}   
                                        {/if}

                                        {if $RSThemes['addonSettings']['custom_hostname_interfix_length']}
                                            {assign var="hostname_interfix" value=$RSThemes['addonSettings']['custom_hostname_interfix_length']}
                                        {/if}

                                        {if $RSThemes['addonSettings']['custom_hostname_suffix']}
                                            {assign var="hostname_suffix" value=$RSThemes['addonSettings']['custom_hostname_suffix']}
                                        {/if}

                                        {literal}
                                            <script>
                                                function makeid(length) {
                                                    var result = '';
                                                    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                                                    var charactersLength = characters.length;
                                                    for (var i = 0; i < length; i++) {
                                                        result += characters.charAt(Math.floor(Math.random() * charactersLength));
                                                    }
                                                    return result;
                                                }
                                                function generatePass(pLength){
                                                    var keyListAlpha="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
                                                            keyListInt="123456789",
                                                            keyListSpec="@#$%^&*-+=?",
                                                            password='';
                                                    var len = Math.ceil(pLength/2);
                                                    len = len - 1;
                                                    var lenSpec = pLength-2*len;
                                                    for (i=0;i<len;i++) {
                                                        password+=keyListAlpha.charAt(Math.floor(Math.random()*keyListAlpha.length));
                                                        password+=keyListInt.charAt(Math.floor(Math.random()*keyListInt.length));
                                                    }
                                                    for (i=0;i<lenSpec;i++)
                                                        password+=keyListSpec.charAt(Math.floor(Math.random()*keyListSpec.length));
                                                    password=password.split('').sort(function(){return 0.5-Math.random()}).join('');
                                                    return password;
                                                }           
                                                $(document).ready(function() {
                                                    $('#inputHostname').val('' + makeid({/literal}{$hostname_interfix}{literal}) + '{/literal}{$hostname_prefix}{$hostname_suffix}{literal}')
                                                });
                                                $(document).ready(function() {
                                                    $('#inputRootpw').val(generatePass(14));
                                                });
                                            </script>
                                        {/literal}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputRootpw">{$LANG.serverrootpw}</label>
                                                <input type="password" name="rootpw" class="form-control" id="inputRootpw" value="N/A">
                                            </div>
                                        </div>
                                    </div>
                                {else}
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputHostname">{$LANG.serverhostname}</label>
                                                <input type="text" name="hostname" class="form-control" id="inputHostname" value="{$server.hostname}" placeholder="servername.example.com">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            {if isset($RSThemes['addonSettings']['enable_pw_strength']) && $RSThemes['addonSettings']['enable_pw_strength'] == "enabled"}
                                                <div class="form-group has-feedback">
                                                    <div class="password-content password-content-top password-content-group">
                                                        <label for="inputNewPassword1">{$LANG.serverrootpw}</label>
                                                        <div class="progress m-t-0" id="passwordStrengthBar" style="display: none">
                                                            <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                                                <span class="sr-only">New Password Rating: 0%</span>
                                                            </div>
                                                        </div>
                                                        <span class="text-small text-lighter password-content-text"><span id="passwordStrengthTextLabel">{$rslang->trans('login.at_least_pass')}</span><i data-toggle="tooltip" title="{$LANG.passwordtips}" data-html="true" data-container="body" class="ls ls-info-circle m-l-1x"></i></span>
                                                    </div>
                                                    <div class="input-password-strenght">
                                                        <input type="password" name="rootpw" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="form-control" id="inputNewPassword1" value="{$server.rootpw}">
                                                        <input type="hidden" name="rootpwstrength" value="true">
                                                    </div>
                                                    {include file="$template/includes/pwstrength.tpl"}
                                                </div>
                                            {else}    
                                                <div class="form-group">
                                                    <label for="inputRootpw">{$LANG.serverrootpw}</label>
                                                    <input type="password" name="rootpw" class="form-control" id="inputRootpw" value="{$server.rootpw}">
                                                </div>
                                            {/if}    
                                        </div>
                                    </div>
                                {/if}
                               
                                {if $hideNSFields}
                                    <div class="row hidden">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
                                                <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="ns1" placeholder="ns1">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
                                                <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="ns2" placeholder="ns2">
                                            </div>
                                        </div>
                                    </div>
                                {else}
                                     <div class="row ">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputNs1prefix">{$LANG.serverns1prefix}</label>
                                                <input type="text" name="ns1prefix" class="form-control" id="inputNs1prefix" value="{$server.ns1prefix}" placeholder="ns1">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="inputNs2prefix">{$LANG.serverns2prefix}</label>
                                                <input type="text" name="ns2prefix" class="form-control" id="inputNs2prefix" value="{$server.ns2prefix}" placeholder="ns2">
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                {/if}
                {if $customfields}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.orderadditionalrequiredinfo}<br><i><small class="text-lighter">{lang key='orderForm.requiredField'}</small></i></h2>
                        </div>
                        <div class="section-body">
                            <div class="panel panel-form">
                                <div class="panel-body">
                                    <div class="row"> 
                                        {foreach $customfields as $customfield}
                                            <div class="col-sm-6">
                                                <div class="form-group"> 
                                                    {if $customfield.type eq 'tickbox'}            
                                                        <label class="checkbox" for="customfield{$customfield.id}">
                                                            {$customfield.input|replace:'type="checkbox"':'type="checkbox" class="icheck-control"'}
                                                            {$customfield.name} <span class="required"> {$customfield.required}</span>
                                                        </label>
                                                        {if $customfield.description}<span class="help-block"> {$customfield.description}</span>{/if}
                                                    {else}
                                                        <label class="control-label" for="customfield{$customfield.id}">{$customfield.name} <span class="required">{$customfield.required}</span></label>
                                                        {if $customfield.type == "link"}
                                                        <div class="input-group">
                                                            {$customfield.input|replace:"<a":"<a class='input-group-addon'"|replace:"www":"<i class='ls ls-chain'></i>"}
                                                        </div>
                                                        {else}
                                                            {$customfield.input} 
                                                        {/if}
                                                        {if $customfield.description}<span class="help-block">{$customfield.description}</span>{/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        {/foreach}  
                                    </div>
                                </div>
                            </div>     
                        </div>                            
                    </div>
                {/if}          
                <div id="productAddonsContainer" class="section">          
                    {if count($addonsPromoOutput) > 0}
                        {foreach $addonsPromoOutput as $output}
                            {if $output != ""}{assign var="hasVisiblePromoAddons" value=true}{/if}
                        {/foreach} 
                        {if $hasVisiblePromoAddons}
                            <div class="section">
                                <div class="section-header">
                                    <h2 class="section-title">{$LANG.cartavailableaddons}</h2>
                                </div>
                                <div class="section-body">    
                                    {foreach $addonsPromoOutput as $output}
                                        {$output|replace:"type='radio'":"class='icheck-control'"|replace:"bg-white":""|replace:'class="logo"':'class="logo hidden"'}
                                    {/foreach}
                                </div>
                            </div>    
                        {/if}
                    {/if}
                    {if $addons}
                        <div class="section">                            
                            <div class="section-header">
                                <h2 class="section-title">{$rslang->trans('order.additional_services')}</h2>
                            </div>
                            <div class="section-body">
                                <div class="panel-check-group row row-eq-height" data-inputs-container>
                                    {foreach $addons as $addon}
                                        <div class="col-sm-{if count($addons) > 1}6{else}12{/if}">
                                            <div class="panel panel-check {if $addon.status}checked{/if}" data-virtual-input>
                                                <div class="check">
                                                    <label>
                                                        <input class="icheck-control" type="checkbox" name="addons[{$addon.id}]"{if $addon.status} checked{/if} />
                                                        <div class="check-content">
                                                            <h6 class="check-title">{$addon.name}</h6>
                                                            <p class="check-subtitle">{$addon.pricing}</p>
                                                            <p class="check-desc">{$addon.description}</p>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>                   
                    {/if}
                </div>    
                {* Module Output - used for eg. Product Cross-Selling For WHMCS by Modules Garden *}
                <div class="section section-module-output col-md-8"></div>
            </div>
            <div class="main-sidebar main-sidebar-lg{if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right{/if}">
                <div class="sidebar-sticky sidebar-sticky-summary" id="orderSummary" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
                    <div class="panel panel-summary panel-summary-{$summaryStyle} order-summary m-b-0x">
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
                        <div 
                            id="producttotal" 
                            data-summary-style="{$summaryStyle}"
                            {if 
                                isset($RSThemes.addonSettings.free_product_price) && 
                                $RSThemes.addonSettings.free_product_price == "enabled" &&
                                isset($RSThemes.addonSettings.free_product_price_value) &&
                                $RSThemes.addonSettings.free_product_price_value == "all"
                            }
                                class="show-free-lang"
                            {/if}
                        >
                        </div>
                    </div>
                    {*
                    <div class="alert alert-lagom alert-info alert-sm alert-panel">
                        <div class="alert-icon ls ls-info-circle"></div>
                        <div class="alert-body">
                            {$LANG.orderForm.haveQuestionsContact} <a href="contact.php" target="_blank" class="alert-link">{$LANG.orderForm.haveQuestionsClickHere}</a>
                        </div>
                    </div>
                    *}
                </div>    
            </div>
        </div>       
        <div class="order-summary order-summary-mob is-fixed" id="orderSummaryMob" data-fixed-actions href="#orderSummary">
            <button class="btn btn-lg btn-primary-faded btn-checkout" type="submit" id="btnCompleteProductConfigMob">
                <span><i class="ls ls-share"></i>{$LANG.continue}</span>
                <div class="loader loader-button hidden">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </div>
            </button>
        </div>
    </form>
    {include file="orderforms/$carttpl/includes/recommendations-modal.tpl"}
    <script>recalctotals();</script>
    <script>
        let assetsUrl = '{$WEB_ROOT}/templates/{$template}/assets/svg-illustrations/products/',
            activeStyle = '{$RSThemes.styles.iconType}',
            styleUrl = "";

        {literal}
            var hashtable = {};
            hashtable['<img src="assets/img/marketconnect/codeguard/logo-sml.png" width="80">'] = 'codeguard';
            hashtable['<img src="assets/img/marketconnect/marketgoo/logo.png" width="80">'] = 'marketgoo';
            hashtable['<img src="assets/img/marketconnect/ox/logo.png" width="80">'] = 'ox';
            hashtable['<img src="assets/img/marketconnect/sitebuilder/logo-sml.png" width="80">'] = 'sitebuilder';
            hashtable['<img src="assets/img/marketconnect/sitelock/logo.png" width="80">'] = 'sitelock';
            hashtable['<img src="assets/img/marketconnect/sitelockvpn/logo.png" width="80">'] = 'sitelockvpn';
            hashtable['<img src="assets/img/marketconnect/spamexperts/logo.png" width="80">'] = 'spamexperts';
            hashtable['<img src="assets/img/marketconnect/symantec/ssl.png" width="80">'] = 'symantec';
            hashtable['<img src="assets/img/marketconnect/weebly/logo.png" width="80">'] = 'weebly';
            hashtable['<img src="assets/img/marketconnect/cpanelseo/logo-sml.png" width="80">'] = 'cpanelseo';
            hashtable['<img src="assets/img/marketconnect/nordvpn/logo.png" width="80">'] = 'nordvpn';
            hashtable['<img src="assets/img/marketconnect/threesixtymonitoring/logo-sml.png" width="80">'] = 'threesixtymonitoring';
            hashtable['<img src="assets/img/marketconnect/xovinow/logo-sml.png" width="80">'] = 'xovinow';
            function changeLogos() {
                $('.promo-banner,.addon-promo-container').each(function( index ) {
                    var banner = $(this);
                    $.each(hashtable, function( index, value ) {

                        if (banner.html().includes(index)){
                            if (activeStyle == "modern"){
                                styleUrl = "modern/"
                            }else{
                                styleUrl = ""
                            }
                            banner.html(banner.html().replace(index, ''));
                            banner.find('.logo').load(assetsUrl+styleUrl+value+'.tpl').removeClass('hidden');
                        }
                    });
                });
            };
            $(document).ready(function() {
                changeLogos();
            });
        {/literal}    
    </script>
{/if}