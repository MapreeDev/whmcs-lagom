{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
            <div class="main-sidebar hidden-xs hidden-sm hidden-md {if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky">{/if}
                    {include file="orderforms/$carttpl/sidebar-categories.tpl"}
                {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
            </div>
        {/if}
        <div class="main-content{if $mainContentClasses} {$mainContentClasses}{/if}">
            {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            {if count($addons) == 0}
                <div class="message message-no-data" id="noAddons">
                    <div class="message-image">
                        {include file="$template/includes/common/svg-icon.tpl" icon="addon"}           
                    </div>
                    <h6 class="message-title">{$LANG.cartproductaddonsnone}</h6>
                </div>     
            {/if}
            <div class="products">
                <div class="row row-eq-height">
                    {foreach $addons as $num => $addon}
                        <div class="col-md-6 col-sm-12">
                            <form class="package package-sm package-left package-addons" method="post" action="{$smarty.server.PHP_SELF}?a=add">
                                <input type="hidden" name="aid" value="{$addon.id}" />
                                <h3 class="package-title m-t-0">{$addon.name}</h3>
                                <div class="package-content">    
                                    <p>{$addon.description}</p>
                                </div>
                                <div class="package-select">
                                    <select name="productid" id="inputProductId{$num}" class="form-control">
                                        {foreach $addon.productids as $product}
                                            <option value="{$product.id}">
                                                {$product.product}{if $product.domain} - {$product.domain}{/if}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="package-footer">
                                    <div class="package-price">
                                        <div class="price price-sm price-inline">
                                            {if $addon.free}
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$LANG.orderfree                                                 
                                                    priceType="free"
                                                }
                                            {else}
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$addon.recurringamount
                                                    priceCycle=$addon.billingcycle|lower
                                                    priceCycleShort=true
                                                    priceSetupFee=$addon.setupfee
                                                }
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="package-actions">
                                        <button type="submit" class="btn btn-lg btn-primary">{$LANG.ordernowbutton}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        {if $num % 2 != 0}
                            </div>
                            <div class="row row-eq-height">
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/if}