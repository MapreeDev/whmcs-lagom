
{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
            <div class="main-sidebar hidden-xs hidden-sm hidden-md {if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>{/if}
                    {include file="orderforms/$carttpl/sidebar-categories.tpl"}
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
            </div>
        {/if}
        <div class="main-content{if $mainContentClasses} {$mainContentClasses}{/if}">
            {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
                {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            {/if}
            {if $errormessage}
                <div class="alert alert-lagom alert-danger">
                    {$errormessage}
                </div>
            {elseif !$productGroup}
                <div class="alert alert-lagom alert-info">
                    {lang key='orderForm.selectCategory'}
                </div>
            {/if}
            {if is_array($products)}
                <div class="section products" id="products">
                    <div class="row row-eq-height row-eq-height-sm">
                        {assign var=counter value=1}
                        {assign var=productsCount value=$products|count}
                        {foreach from=$products item=product}
                            {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
                            <div class="col{if ($RSThemes['pages'][$templatefile]['config']['horizontalPackage'] == 1) || $RSThemes['pages']['products']['config']['productColumns'] == 1} col-12{/if}">
                                <div class="package{if $product.isFeatured} package-featured{/if}{if $RSThemes['pages'][$templatefile]['config']['horizontalPackage'] == 1} package-horizontal{/if}" id="{$idPrefix}">
                                    <div class="package-side package-side-left">
                                        <div class="package-header">   
                                            {if $product.isFeatured}
                                                <span class="label-corner label-primary">{$rslang->trans('order.featured')}</span>
                                            {/if}
                                            <h3 class="package-title">{$product.name}</h3>
                                            <div class="package-price">
                                                <div class="price">
                                                    {if $product.bid}
                                                        <div class="price-starting-from">{$LANG.bundledeal}</div>
                                                        {if $product.displayprice}                                                        
                                                            {include file="$template/includes/common/price.tpl" 
                                                                price=$product.displayprice
                                                            }
                                                        {/if}
                                                    {else}
                                                        {if $product.pricing.hasconfigoptions}
                                                            <div class="price-starting-from">{$LANG.startingfrom}</div>
                                                        {/if}
                                                        
                                                        {if isset($RSThemes['addonSettings']['price_calculation']) && $RSThemes['addonSettings']['price_calculation'] == "lowest"}
                                                            {if $display_billing_monthly_price}
                                                                {include file="$template/includes/common/price.tpl" 
                                                                    price=formatCurrency($productsPricing[$product.pid]->tabs[$productsPricing[$product.pid]->cycle]['price'])
                                                                    priceCycle="monthly"
                                                                    priceType=$productsPricing[$product.pid]->billing
                                                                    priceSetupFee=$product.pricing.minprice.setupFee
                                                                }
                                                            {else}       
                                                                {$setupFeePrice = false}                                          
                                                                {if $productsPricing[$product.pid]->billing == "recurring"}
                                                                    {if $productsPricing[$product.pid]->cycle == "monthly"}
                                                                        {$sf = "msetupfee"}
                                                                    {elseif $productsPricing[$product.pid]->cycle == "quarterly"}
                                                                        {$sf = "qsetupfee"}
                                                                    {elseif $productsPricing[$product.pid]->cycle == "semiannually"}
                                                                        {$sf = "ssetupfee"}
                                                                    {elseif $productsPricing[$product.pid]->cycle == "annually"}
                                                                        {$sf = "asetupfee"}
                                                                    {elseif $productsPricing[$product.pid]->cycle == "biennially"}
                                                                        {$sf = "bsetupfee"}
                                                                    {elseif $productsPricing[$product.pid]->cycle == "triennially"}
                                                                        {$sf = "tsetupfee"}
                                                                    {/if}
                                                                    {if $product.pricing.rawpricing[$sf] !== "0.00" && $product.pricing.rawpricing[$sf] !== "0,00"}
                                                                        {$setupFeePrice = formatCurrency($product.pricing.rawpricing[$sf])}
                                                                    {/if}
                                                                {else}
                                                                    {if $productsPricing[$product.pid]->billing == "onetime"}
                                                                    {$setupFeePrice = $product.pricing.minprice.setupFee}
                                                                    {/if}   
                                                                {/if}
                                                                
                                                                {include file="$template/includes/common/price.tpl" 
                                                                    price=formatCurrency($productsPricing[$product.pid]->tabs[$productsPricing[$product.pid]->cycle]['real_price'])
                                                                    priceCycle=$productsPricing[$product.pid]->cycle
                                                                    priceType=$productsPricing[$product.pid]->billing
                                                                    priceSetupFeeLowest=$setupFeePrice
                                                                }
                                                                
                                                            {/if} 
                                                        {else}
                                                            {if isset($DiscountCenterAddonIsActive)}
                                                                {include file="$template/includes/common/price.tpl" 
                                                                    price=$product.pricing.minprice.price 
                                                                    priceCycle=$product.pricing.minprice.cycle
                                                                    priceType=$product.pricing.type
                                                                }
                                                            {else}
                                                                {include file="$template/includes/common/price.tpl" 
                                                                    price=$product.pricing.minprice.price 
                                                                    priceCycle=$product.pricing.minprice.cycle
                                                                    priceType=$product.pricing.type
                                                                    priceSetupFee=$product.pricing.minprice.setupFee
                                                                }
                                                            {/if}    
                                                        {/if}
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="package-body">
                                            <div class="package-content">
                                                {if $product.features}
                                                    <ul class="package-features">
                                                        {foreach $product.features as $feature => $value}
                                                            <li id="{$idPrefix}-feature{$value@iteration}">
                                                                {$feature} {$value}
                                                            </li>
                                                        {/foreach}
                                                    </ul>
                                                {/if}
                                                {if $product.featuresdesc}
                                                    {$product.featuresdesc}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="package-footer package-side package-side-right">
                                        <div class="package-price">
                                            <div class="price">
                                                {if $product.bid}
                                                    <div class="price-starting-from">{$LANG.bundledeal}</div>

                                                    {if $product.displayprice}                                                        
                                                        {include file="$template/includes/common/price.tpl" 
                                                            price=$product.displayprice
                                                        }
                                                    {/if}
                                                {else}
                                                    {if $product.pricing.hasconfigoptions}
                                                        <div class="price-starting-from">{$LANG.startingfrom}</div>
                                                    {/if}
                                                    {if isset($DiscountCenterAddonIsActive)}
                                                        {include file="$template/includes/common/price.tpl" 
                                                            price=$product.pricing.minprice.price 
                                                            priceCycle=$product.pricing.minprice.cycle
                                                            priceType=$product.pricing.type
                                                        }
                                                    {else}
                                                        {include file="$template/includes/common/price.tpl" 
                                                            price=$product.pricing.minprice.price 
                                                            priceCycle=$product.pricing.minprice.cycle
                                                            priceType=$product.pricing.type
                                                            priceSetupFee=$product.pricing.minprice.setupFee
                                                        }
                                                    {/if}                                                
                                                {/if}
                                            </div>
                                        </div>
                                        {$bestCycle = false}
                                        {if isset($RSThemes['addonSettings']['price_calculation']) && $RSThemes['addonSettings']['price_calculation'] == "lowest"}
                                            {if $product.productUrl|strstr:"?"}
                                                {$bestCycle="&billingcycle=`$productsPricing[$product.pid]->cycle`"}
                                            {else}
                                                {$bestCycle="?billingcycle=`$productsPricing[$product.pid]->cycle`"}
                                            {/if}
                                        {/if}

                                        {if isset($product_restock_notifierAddonIsActive)}
                                            {if $product.stockcontrol == 1 && $product.qty <= 0}
                                                <a href="index.php?m=product_restock_notifier&_action=notify&_pid={$product.pid}" class="btn btn-lg btn-primary-faded {if $RSThemes['pages']['products']['config']['productColumns'] == '4' && $RSThemes['pages']['products']['config']['hideSidebar'] == '0'} no-min-width{/if} {if $product.pending_notification}disabled{/if}" {if $product.pending_notification}disabled="true"{/if}>
                                                    {if $product.pending_notification}
                                                        {$rslang->trans('restock_notifier.be_notified')}
                                                    {else}
                                                        {$rslang->trans('restock_notifier.on_restock')}
                                                    {/if}
                                                </a>
                                            {else}
                                                <a href="{$product.productUrl}{if $bestCycle}{$bestCycle}{/if}" class="btn btn-lg btn-primary btn-order-now {if $RSThemes['pages']['products']['config']['productColumns'] == '4' && $RSThemes['pages']['products']['config']['hideSidebar'] == '0'} no-min-width{/if} {if $product.stockControlEnabled && $product.qty == '0'}disabled{/if}" id="{$idPrefix}-order-button" {if $product.hasRecommendations} data-has-recommendations="1"{/if}>
                                                    {$LANG.ordernowbutton}
                                                </a>
                                            {/if}
                                        {else}
                                            <a href="{$product.productUrl}{if $bestCycle}{$bestCycle}{/if}" class="btn btn-lg btn-primary btn-order-now {if $RSThemes['pages']['products']['config']['productColumns'] == '4' && $RSThemes['pages']['products']['config']['hideSidebar'] == '0'} no-min-width{/if} {if $product.stockControlEnabled && $product.qty == '0'}disabled{/if}" id="{$idPrefix}-order-button" {if $product.hasRecommendations} data-has-recommendations="1"{/if}>
                                                {$LANG.ordernowbutton}
                                            </a>
                                        {/if}
                                        {if $product.stockControlEnabled}
                                            <div class="package-qty">
                                                {$product.qty} {$LANG.orderavailable}
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                            
                            {if $RSThemes['pages'][$templatefile]['config']['productColumns'] == '2'}
                                {if $counter % 2 == 0}</div><div class="row row-eq-height row-eq-height-sm">{/if}
                            {elseif $RSThemes['pages']['products']['config']['productColumns'] == '3'}
                                {if $counter % 3 == 0}</div><div class="row row-eq-height row-eq-height-sm">{/if}
                            {elseif $RSThemes['pages']['products']['config']['productColumns'] == '4'}
                                {if $counter % 4 == 0}</div><div class="row row-eq-height row-eq-height-sm">{/if}
                            {else}
                                {if $productsCount == '4'}
                                    {if $counter % 2 == 0}</div><div class="row row-eq-height row-eq-height-sm">{/if}
                                {/if}
                            {/if}
                            {$counter = $counter +1}
                        {/foreach}
                    </div>
                </div>
            {/if}  
            {if $productGroup}  
                {if count($productGroup.features) > 0}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.orderForm.includedWithPlans}</h2>
                        </div>
                        <div class="section-body">
                            <div class="panel panel-form">
                                <div class="panel-body">
                                    <ul class="list-features list-info">
                                        {foreach $productGroup.features as $features}
                                            <li><i class="lm lm-check"></i><span class="h6 m-b-0">{$features.feature}<span></li>
                                        {/foreach}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
            {/if}    
        </div>
    </div>
    {include file="orderforms/$carttpl/includes/recommendations-modal.tpl"}
{/if}