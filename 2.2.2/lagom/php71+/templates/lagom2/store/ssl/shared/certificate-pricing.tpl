{if file_exists("templates/$template/store/ssl/shared/overwrites/certificate-pricing.tpl")}
    {include file="{$template}/store/ssl/shared/overwrites/certificate-pricing.tpl"}  
{else} 
    {foreach $certificates.$type as $product}
        {if $product->pricing()->annual()}
            {append var='billingCycles' value="annually" index='0'}
        {/if}
        {if $product->pricing()->biennial()}
            {append var='billingCycles' value="biennially" index='1'}
        {/if}
        {if $product->pricing()->triennial()}
            {append var='billingCycles' value="triennially" index='2'}
        {/if}
    {/foreach}
    <div class="site-section{if $secondarySectionStyle == 'secondary'} section-secondary{else if $secondarySectionStyle == 'primary'} section-primary{/if} section-pricing" id="pricing" {$type}>
        <div class="container">
            <h2 class="section-title">{lang key='store.ssl.shared.pricing'}</h2>
            <div class="product-billing-switcher">
                <div class="btn-group hidden-sm hidden-xs" role="group">
                {foreach $billingCycles as $cycle}
                    <button type="button" class="btn btn-sm cycle-change {$cycle}{if $cycle@first} active{/if}" data-cycle="{$cycle}"> 
                        {if $cycle == "annually"}
                            {$LANG.orderpaymenttermannually}
                        {elseif $cycle == "biennially"}
                            {$LANG.orderpaymenttermbiennially}
                        {elseif $cycle == "triennially"}
                            {$LANG.orderpaymenttermtriennially}
                        {else}
                            {$cycle|@ucfirst}
                        {/if}
                    </button>
                {/foreach}
                </div>
                <div class="dropdown visible-sm visible-xs">
                    <button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">
                        <span id="cycle-text">{$LANG.orderpaymenttermannually}</span>
                        <i class="ls ls-caret"></i>
                    </button>
                    <div class="dropdown-menu">
                        {foreach $billingCycles as $cycle}
                            <button type="button" class="btn btn-sm cycle-change {$cycle}{if $cycle@first} active{/if}" data-cycle="{$cycle}"> 
                                {if $cycle == "annually"}
                                    {$LANG.orderpaymenttermannually}
                                {elseif $cycle == "biennially"}
                                    {$LANG.orderpaymenttermbiennially}
                                {elseif $cycle == "triennially"}
                                    {$LANG.orderpaymenttermtriennially}
                                {else}
                                    {$cycle|@ucfirst}
                                {/if}
                            </button>
                        {/foreach}
                    </div>
                </div>
            </div>  
            {if is_array($certificates.$type)}
                <div class="section-content certificate-options">
                    <div class="row row-eq-height row-eq-height-xs">
                        {if count($certificates.$type) > 0}
                            {foreach $certificates.$type as $product}
                                <div class="col-md-{if count($certificates.$type) == 1}12{elseif count($certificates.$type) == 2}6{else}4{/if}">
                                    <div class="package package-lg {if $hasFeatured.$type && $product->isFeatured} package-featured{/if}">
                                        {if $hasFeatured.$type && $product->isFeatured}
                                            <span class="label-corner label-primary">{$rslang->trans('order.featured')}</span>
                                        {/if}
                                        <h4 class="package-title">{$product->name}</h4>
                                        <div class="package-price">
                                            {if $product->pricing()->annual()}
                                            <div class="pricing-text price annually">
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$product->pricing()->annual()->yearlyPrice()|replace:"/":""|replace:$LANG.pricingCycleShort.annually:''
                                                    priceCycle="annually"
                                                }  
                                            </div>
                                            {/if}
                                            {if $product->pricing()->biennial()}
                                            <div class="pricing-text price biennially {if $product->pricing()->annual()}hidden{/if}">
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$product->pricing()->biennial()->price()|replace:"/":""|replace:$LANG.pricingCycleShort.annually:''
                                                    priceCycle="biennially"
                                                }  
                                            </div>
                                            {/if}
                                            {if $product->pricing()->triennial()}
                                            <div class="pricing-text price triennially {if $product->pricing()->annual() || $product->pricing()->biennial()}hidden{/if}">
                                                {include file="$template/includes/common/price.tpl" 
                                                    price=$product->pricing()->triennial()->price()|replace:"/":""|replace:$LANG.pricingCycleShort.annually:''
                                                    priceCycle="triennially"
                                                }  
                                            </div>
                                            {/if}
                                            <div class="pricing-text not-available hidden">-</div>
                                        </div>    
                                        <ul class="package-features">                              
                                            <li>{lang key='store.ssl.shared.encryption256'}</li>
                                            <li>{lang key='store.ssl.shared.issuanceTime'}: {$certificateFeatures.{$product->configoption1}.issuance}</li>
                                            <li>{lang key='store.ssl.shared.greatFor'}: <b>{$certificateFeatures.{$product->configoption1}.for} </b> </li>
                                            <li>{lang key='store.ssl.shared.warrantyValue'}: <b>USD ${$certificateFeatures.{$product->configoption1}.warranty}</b></li>
                                            <li>{lang key='store.ssl.shared.siteSeal'}</li>
                                            <li>{lang key='store.ssl.shared.freeReissues'}</li>
                                            <li>{lang key='store.ssl.shared.browserSupport'}: <b>99.9%</b></li>
                                        </ul>
                                        <div class="package-actions">
                                            <form method="post" action="{routePath('cart-order')}">
                                                <input type="hidden" name="pid" value="{$product->id}">
                                                <input type="hidden" name="billingcycle" value="">
                                                <button type="submit" class="btn btn-lg btn-primary{if $secondarySectionStyle == 'primary'}-faded{/if} btn-block btn-signup">{$LANG.store.ssl.landingPage.buyNow}</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        {else}
                            <div class="col-9">
                                <div class="lead preview-text">
                                    {lang key='store.ssl.shared.noProducts'}
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
        </div>
    </div>           
    <script src="{$WEB_ROOT}/templates/{$template}/store/ssl/shared/master.js"></script>      
{/if}