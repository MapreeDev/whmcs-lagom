{if file_exists("templates/orderforms/$carttpl/includes/viewcart/overwrites/summary-table.tpl")}
    {include file="templates/orderforms/$carttpl/includes/viewcart/overwrites/summary-table.tpl"}
{else}
    <div class="section">
        <div class="section-body">
            <form method="post" action="{$smarty.server.PHP_SELF}?a=view">
                <div class="panel panel-cart{if $showqtyoptions || $showAddonQtyOptions} has-qty{/if}">
                    <div class="panel-heading cart-heading">
                        <div class="row">
                            <div class="{if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                {$LANG.orderForm.productOptions}
                            </div>
                            {if $showqtyoptions || $showAddonQtyOptions}
                                <div class="col-sm-2">
                                    {$LANG.orderForm.qty}
                                </div>
                            {/if}
                            <div class="col">
                                {$LANG.orderForm.priceCycle}
                            </div>
                        </div>
                    </div>
                    {foreach $products as $num => $product}
                        <div class="panel-body cart-item">
                            <div class="row" data-input-number>
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}" data-content="{$LANG.orderproduct}">
                                    <div class="cart-item-title">
                                        <span class="cart-item-title-main">{$product.productinfo.groupname} - {$product.productinfo.name}</span>
                                        {if $product.domain}
                                            <span class="cart-item-title-small">{$product.domain}</span>
                                        {/if}
                                    </div>
                                </div>
                                {if $showqtyoptions || $showAddonQtyOptions}
                                <div class="prod-qty{if !$product.allowqty} prod-qty-empty{/if} col-2" data-content="{$LANG.quantity}">
                                        {if $product.allowqty}
                                            <div class="input-number">
                                                <input type="number" data-input-number-input name="qty[{$num}]" min=1 value="{$product.qty}" min="0" />
                                                <div class="input-number-actions">
                                                    <div class="plus" data-input-number-inc></div>
                                                    <div class="minus" data-input-number-dec></div>
                                                </div>
                                            </div>
                                        {else}
                                            -
                                        {/if}
                                    </div>
                                {/if}
                                <div class="prod-price col" data-content="{$LANG.orderprice}">
                                    {if $RSThemes['pages'][$templatefile]['config']['hideProductBillingCycleDropdown'] == "1"}
                                        <div class="cart-item-price price price-xs">
                                            {if (
                                                    $product.pricing.totalTodayExcludingTaxSetup|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                                    $product.pricing.totalTodayExcludingTaxSetup|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                                ) && (
                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                )
                                            }
                                                {$LANG.orderfree}
                                            {else}
                                                {$product.pricing.totalTodayExcludingTaxSetup}<span class="price-cycle-inline">{if $product.billingcycle !="free"}/{/if}{if $product.billingcycle =="onetime"}{$LANG.orderpaymenttermonetime}{elseif $product.billingcycle eq "monthly"}{$rslang->trans('order.period.short.monthly')}{elseif $product.billingcycle eq "quarterly"}{$rslang->trans('order.period.short.quarterly')}{elseif $product.billingcycle eq "semiannually"}{$rslang->trans('order.period.short.semiannually')}{elseif $product.billingcycle eq "annually"}{$rslang->trans('order.period.short.annually')}{elseif $product.billingcycle eq "biennially"}{$rslang->trans('order.period.short.biennially')}{elseif $product.billingcycle eq "triennially"}{$rslang->trans('order.period.short.triennially')}{/if}</span>
                                            {/if}
                                            {if $product.pricing.productonlysetup}
                                                + {$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}</span>
                                            {/if}
                                        </div>
                                    {else}
                                        <div class="cart-item-pricing dropdown" data-input-number-price>
                                            <button class="btn btn-default dropdown-toggle" type="button" id="{$num}ProductPricing" name="{$num}ProductPricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <span  class="cart-item-price" data-input-number-price>{$product.pricing.totalTodayExcludingTaxSetup}{if $product.billingcycle !="free"}/{/if}{if $product.billingcycle =="onetime"}{$LANG.orderpaymenttermonetime}{elseif $product.billingcycle eq "monthly"}{$rslang->trans('order.period.short.monthly')}{elseif $product.billingcycle eq "quarterly"}{$rslang->trans('order.period.short.quarterly')}{elseif $product.billingcycle eq "semiannually"}{$rslang->trans('order.period.short.semiannually')}{elseif $product.billingcycle eq "annually"}{$rslang->trans('order.period.short.annually')}{elseif $product.billingcycle eq "biennially"}{$rslang->trans('order.period.short.biennially')}{elseif $product.billingcycle eq "triennially"}{$rslang->trans('order.period.short.triennially')}{/if}
                                                    {if $product.pricing.productonlysetup}
                                                        + {$product.pricing.productonlysetup->toPrefixed()} {$LANG.ordersetupfee}</span>
                                                    {/if}
                                                </span>
                                                <span class="caret"></span>
                                            </button>     
                                            <ul class="dropdown-menu" aria-labelledby="{$num}ProductPricing" >
                                                {foreach $allAvailableCycles[$num] as $cycle}
                                                    {if is_null($permittedBillingCycles) || in_array($cycle['cycle'], $permittedBillingCycles)}
                                                        <li>
                                                            <a href="" onclick="selectProductPeriodInCart('{$num}', '{$cycle['cycle']}', '{$cycle['toFullStringCalculated']}'); return false;">
                                                                {$cycle['toFullStringCalculated']}
                                                            </a>
                                                        </li>
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}    
                                    {if $product.proratadate}
                                    <span class="renewal cycle" data-input-number-price>({$LANG.orderprorata} <span class="prorata-date">{$product.proratadate}</span>)</span>
                                    {/if}
                                    <button class="btn btn-primary-faded hidden" data-input-number-update data-toggle="tooltip" data-html="true" data-original-title="{$LANG.carttaxupdateselectionsupdate}" title="">
                                        <i class="ls ls-info-circle"></i>{$LANG.carttaxupdateselectionsupdate}
                                    </button>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions">
                                        <a href="{$WEB_ROOT}/cart.php?a=confproduct&i={$num}" data-toggle="tooltip" data-html="true" data-original-title="{$LANG.orderForm.edit}" title="" class="btn btn-icon">
                                            <i class="lm lm-edit"></i>
                                        </a>
                                        <button type="button" class="btn btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('p', '{$num}')">
                                            <i class="lm lm-trash"></i>
                                        </button>
                                    </div>
                                </div>
                                {if $product.configoptions || $product.addons}
                                    <div class="w-100"></div>
                                    <div class="prod-addons col">
                                        <div class="prod-addons-container">
                                            {foreach key=confnum item=configoption from=$product.configoptions}
                                                <div class="addon-item row">
                                                    <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                        <span class="item-name">{$configoption.name}:</span>
                                                        <span class="item-value"> {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$configoption.option}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}</span>
                                                    </div>
                                                    {if $showqtyoptions || $showAddonQtyOptions}
                                                        <div class="addon-qty addon-qty-empty col-4 col-md-2">
                                                                -
                                                        </div>
                                                    {/if}
                                                    <div class="addon-price col">
                                                        <span class="item-price">{if $configoption.recurring->toNumeric() && $configoption.recurring->toNumeric() != 0}{$configoption.recurring}{else}-{/if}</span>
                                                    </div>
                                                </div>
                                            {/foreach}
                                            {foreach key=addonnum item=addon from=$product.addons}
                                                <div class="addon-item row"{if $showAddonQtyOptions && $addon.allowqty===2} data-input-number-secondary{/if}>
                                                    <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                        <span class="item-name">{$LANG.orderaddon}:</span>
                                                        <span class="item-value">{$addon.name}</span>
                                                    </div>
                                                    {if $showqtyoptions || $showAddonQtyOptions}
                                                        <div class="addon-qty{if $addon.allowqty !== 2} addon-qty-empty{/if} col-4 col-md-2">
                                                            {if $addon.allowqty === 2}
                                                                <div class="input-number input-number-sm">
                                                                    <input type="number" data-input-number-secondary-input name="paddonqty[{$num}][{$addonnum}]" value="{$addon.qty}" min="0" />
                                                                    <div class="input-number-actions">
                                                                        <div class="plus" data-input-number-secondary-inc></div>
                                                                        <div class="minus" data-input-number-secondary-dec></div>
                                                                    </div>
                                                                </div>
                                                            {else}
                                                                - 
                                                            {/if}
                                                        </div>
                                                    {/if}
                                                    <div class="addon-price col">
                                                        <span class="item-price" {if $showAddonQtyOptions && $addon.allowqty===2}data-input-number-secondary-price{/if}>
                                                            {if $addon.billingcycle != "free"}
                                                                {$addon.totaltoday}/{if $addon.billingcycle =="free"}{$LANG.orderpaymenttermfree}{elseif $addon.billingcycle =="onetime"}{$LANG.orderpaymenttermonetime}{elseif $addon.billingcycle eq "monthly"}{$rslang->trans('order.period.short.monthly')}{elseif $addon.billingcycle eq "quarterly"}{$rslang->trans('order.period.short.quarterly')}{elseif $addon.billingcycle eq "semiannually"}{$rslang->trans('order.period.short.semiannually')}{elseif $addon.billingcycle eq "annually"}{$rslang->trans('order.period.short.annually')}{elseif $addon.billingcycle eq "biennially"}{$rslang->trans('order.period.short.biennially')}{elseif $addon.billingcycle eq "triennially"}{$rslang->trans('order.period.short.triennially')}{/if}
                                                            {else}
                                                                -
                                                            {/if}
                                                            {if $addon.setup}{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}{/if}
                                                            {if $addon.isProrated}<br />({$LANG.orderprorata} {$addon.prorataDate}){/if}
                                                        </span>
                                                        <button class="btn btn-primary-faded hidden" {if $showAddonQtyOptions && $addon.allowqty===2}data-input-number-secondary-update{/if} data-toggle="tooltip" data-html="true" data-original-title="{$LANG.carttaxupdateselectionsupdate}" title="">
                                                            <i class="ls ls-info-circle"></i>{$LANG.carttaxupdateselectionsupdate}
                                                        </button>
                                                    </div>
                                                    <div class="addon-actions">
                                                        <div class="cart-item-actions">
                                                            <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'products', '{$addonnum}')">
                                                                <i class="lm lm-trash"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                    {foreach $domains as $num => $domain}
                        <div class="panel-body cart-item">
                            <div class="row">
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}" data-content="{$LANG.orderdomain}">
                                    <div class="cart-item-title">
                                        <span class="cart-item-title-main">{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</span>
                                        {if $domain.domain}
                                            <span class="cart-item-title-small">{$domain.domain}</span>
                                        {/if}
                                    </div>
                                </div>
                                {if $showqtyoptions || $showAddonQtyOptions}
                                    <div class="prod-qty prod-qty-empty col-2" data-content="{$LANG.quantity}">
                                            -
                                    </div>
                                {/if}
                                <div class="prod-price col" data-content="{$LANG.orderprice}">
                                    <span class="cart-item-price">
                                        <span class="{if count($domain.pricing) == 1 || $domain.type == 'transfer'}{else}hidden{/if}" data-domain-price-single="{$domain.domain}" >
                                            <span data-domain-price-single-price>{$domain.price}{$domain.shortYearsLanguage}</span>
                                            <span class="renewal cycle">
                                                {if isset($domain.renewprice)}{lang key='domainrenewalprice'} <span class="renewal-price cycle">{$domain.renewprice}{$domain.shortRenewalYearsLanguage}{/if}</span>
                                            </span>
                                        </span>
                                        <span class="{if count($domain.pricing) == 1 || $domain.type == 'transfer'}hidden{else}{/if}" data-domain-price-multi="{$domain.domain}">
                                            <div class="cart-item-pricing dropdown">
                                                <button class="btn btn-default dropdown-toggle" type="button" id="{$domain.domain}Pricing" name="{$domain.domain}Pricing" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                    <span data-domain-price-multi-price>{$domain.price}{$domain.shortYearsLanguage}</span>
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="{$domain.domain}Pricing" data-domain-lang-year="{lang key='orderForm.year'}" data-domain-lang-years="{lang key='orderForm.years'}">
                                                    {foreach $domain.pricing as $years => $price}
                                                        <li>
                                                            <a href="#" onclick="selectDomainPeriodInCart('{$domain.domain}', '{$price.register}', {$years}, '{if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if}');return false;">
                                                                {$years} {if $years == 1}{lang key='orderForm.year'}{else}{lang key='orderForm.years'}{/if} @ {$price.register}
                                                            </a>
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                            <span class="renewal cycle">
                                                {lang key='domainrenewalprice'} <span class="renewal-price cycle">{if isset($domain.renewprice)}{$domain.renewprice}{$domain.shortRenewalYearsLanguage}{/if}</span>
                                            </span>
                                        </span>
                                    </span>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions">
                                        <a href="{$WEB_ROOT}/cart.php?a=confdomains" data-toggle="tooltip" data-html="true" data-original-title="{$LANG.orderForm.edit}" title="" class="btn btn-icon">
                                            <i class="lm lm-edit"></i>
                                        </a>
                                        <button type="button" class="btn btn-icon" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('d', '{$num}')">
                                            <i class="lm lm-trash"></i>
                                        </button>
                                    </div>
                                </div>                     
                                {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}                       
                                    <div class="w-100"></div>
                                    <div class="prod-addons col">
                                        <div class="prod-addons-container">
                                            {if $domain.dnsmanagement}
                                            <div class="addon-item row">
                                                <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col{/if}">
                                                    <div class="content">
                                                        <span class="item-value">{$LANG.domaindnsmanagement}</span>
                                                    </div>
                                                </div>
                                                {if $showqtyoptions || $showAddonQtyOptions}
                                                <div class="addon-qty addon-qty-empty col"></div>
                                                {/if}
                                                <div class="addon-actions">
                                                    <div class="cart-item-actions">
                                                        <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'domains', 'dnsmanagement')">
                                                            <i class="lm lm-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                            {if $domain.emailforwarding}
                                                <div class="addon-item row">
                                                    <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col{/if}">
                                                        <div class="content">
                                                            <span class="item-value">{$LANG.domainemailforwarding}</span>
                                                        </div>
                                                    </div>
                                                    {if $showqtyoptions || $showAddonQtyOptions}
                                                        <div class="addon-qty addon-qty-empty col"></div>
                                                    {/if}
                                                    <div class="addon-actions">
                                                        <div class="cart-item-actions">
                                                            <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'domains' , 'emailforwarding')">
                                                                <i class="lm lm-trash"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if $domain.idprotection}
                                                <div class="addon-item row">
                                                    <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col{/if}">
                                                        <div class="content">
                                                            <span class="item-value">{$LANG.domainidprotection}</span>
                                                        </div>
                                                    </div>
                                                    {if $showqtyoptions || $showAddonQtyOptions}
                                                        <div class="addon-qty addon-qty-empty col"></div>
                                                    {/if}
                                                    <div class="addon-actions">
                                                        <div class="cart-item-actions">
                                                            <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'domains' , 'idprotection')">
                                                                <i class="lm lm-trash"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                    {foreach $renewalsByType['services'] as $num => $service}
                        <div class="panel-body cart-item">
                            <div class="row">
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                    <div class="cart-item-title">
                                        <span class="cart-item-title-main">{$service.name}</span>
                                        <span class="cart-item-title-small">{$service.domainName}</span>
                                    </div>
                                </div>
                                {if $showqtyoptions || $showAddonQtyOptions}
                                    <div class="prod-qty prod-qty-empty col-sm-2" data-content="{$LANG.quantity}">
                                        -
                                    </div>
                                {/if}
                                <div class="prod-price col" data-content="{$LANG.orderprice}">
                                    <div class="cart-item-price price price-xs">
                                        {$service.recurringBeforeTax}<span class="price-cycle-inline">/{$LANG['pricingCycleShort'][$service.billingCycle|lower]}</span>
                                    </div>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions d-flex">
                                        <button type="button" class="btn btn-icon" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('r','{$num}','service')">
                                            <i class="lm lm-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    {foreach $renewalsByType['domains'] as $num => $domain}
                        <div class="panel-body cart-item">
                            <div class="row">
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}" data-content="{$LANG.orderdomain}">
                                    <div class="cart-item-title">
                                        <span class="cart-item-title-main">{$LANG.domainrenewal}</span>
                                        <span class="cart-item-title-small">{$domain.domain}</span>
                                    </div>
                                </div>
                                {if $showqtyoptions || $showAddonQtyOptions}
                                    <div class="prod-qty prod-qty-empty col-sm-2" data-content="{$LANG.quantity}">
                                        -
                                    </div>
                                {/if}
                                <div class="prod-price col" data-content="{$LANG.orderprice}">
                                    <div class="cart-item-price price price-xs">
                                        {$domain.price}<span class="price-cycle-inline">/{$domain.regperiod}{$rslang->trans('order.period.short.annually')}</span>
                                    </div>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions d-flex">
                                        <button type="button" class="btn btn-icon" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('r', '{$num}', 'domain')">
                                            <i class="lm lm-trash"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
                                <div class="prod-addons col">
                                    <div class="prod-addons-container">
                                        {if $domain.dnsmanagement}
                                        <div class="addon-item row">
                                            <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                <span class="item-name">{$LANG.orderaddon}:</span>
                                                <span class="item-value">{$LANG.domaindnsmanagement}</span>
                                            </div>
                                            {if $showqtyoptions || $showAddonQtyOptions}
                                            <div class="addon-qty addon-qty-empty col-4 col-md-2">
                                                    -
                                            </div>
                                            {/if}
                                            <div class="col">
                                                -
                                            </div>
                                            <div class="addon-actions">
                                                <div class="cart-item-actions">
                                                    <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'renewals','dnsmanagement')">
                                                        <i class="lm lm-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        {/if}
                                        {if $domain.emailforwarding}
                                            <div class="addon-item row">
                                                <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                    <span class="item-name">{$LANG.orderaddon}:</span>
                                                    <span class="item-value">{$LANG.domainemailforwarding}</span>
                                                </div>
                                                {if $showqtyoptions || $showAddonQtyOptions}
                                                    <div class="addon-qty addon-qty-empty col-4 col-md-2">
                                                            -
                                                    </div>
                                                {/if}
                                                <div class="col">
                                                    -
                                                </div>
                                                <div class="addon-actions">
                                                    <div class="cart-item-actions">
                                                        <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'renewals', 'emailforwarding')">
                                                            <i class="lm lm-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                        {if $domain.idprotection}
                                            <div class="addon-item row">
                                                <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                    <span class="item-name">{$LANG.orderaddon}:</span>
                                                    <span class="item-value">{$LANG.domainidprotection}</span>
                                                </div>
                                                {if $showqtyoptions || $showAddonQtyOptions}
                                                    <div class="addon-qty addon-qty-empty col-4 col-md-2">
                                                            -
                                                    </div>
                                                {/if}
                                                <div class="col">
                                                    -
                                                </div>
                                                <div class="addon-actions">
                                                    <div class="cart-item-actions">
                                                        <button type="button" class="btn btn-xs btn-icon btn-hover-danger" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeAddonItem('{$num}', 'renewals', 'idprotection')">
                                                            <i class="lm lm-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                    {foreach $addons as $num => $addon}
                        <div class="panel-body cart-item">
                            <div class="row" data-input-number>
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}" data-content="{$LANG.orderaddon}">
                                    <span class="cart-item-title">
                                        <span class="cart-item-title-main">{$addon.name} - {$addon.productname}</span>
                                        {if $addon.domainname}
                                            <span class="cart-item-title-small">{$addon.domainname}</span>
                                        {/if}
                                    </span>
                                </div>
                                {if $showqtyoptions || $showAddonQtyOptions}
                                    <div class="prod-qty{if $addon.allowqty !== 2} prod-qty-empty{/if} col-2" data-content="{$LANG.quantity}">
                                        {if $addon.allowqty === 2}
                                            <div class="input-number">
                                                <input type="number" data-input-number-input name="addonqty[{$num}]" value="{$addon.qty}" min="0" />
                                                <div class="input-number-actions">
                                                    <div class="plus" data-input-number-inc></div>
                                                    <div class="minus" data-input-number-dec></div>
                                                </div>
                                            </div>
                                        {else}
                                            -
                                        {/if}
                                    </div>
                                {/if}
                                <div class="prod-price col" data-content="{$LANG.orderprice}">
                                    <span class="cart-item-price price price-xs" data-input-number-price>
                                        {$addon.totaltoday}{if $addon.billingcycle != 'Free'}<span class="price-cycle-inline">/{if $addon.billingcycle =="free"}{$LANG.orderpaymenttermfree}{elseif $addon.billingcycle =="onetime"}{$LANG.orderpaymenttermonetime}{elseif $addon.billingcycle eq "monthly"}{$rslang->trans('order.period.short.monthly')}{elseif $addon.billingcycle eq "quarterly"}{$rslang->trans('order.period.short.quarterly')}{elseif $addon.billingcycle eq "semiannually"}{$rslang->trans('order.period.short.semiannually')}{elseif $addon.billingcycle eq "annually"}{$rslang->trans('order.period.short.annually')}{elseif $addon.billingcycle eq "biennially"}{$rslang->trans('order.period.short.biennially')}{elseif $addon.billingcycle eq "triennially"}{$rslang->trans('order.period.short.triennially')}{/if}</span>
                                        {/if}
                                        {if $addon.setup}{$addon.setup->toPrefixed()} {$LANG.ordersetupfee}{/if}
                                        {if $addon.isProrated}<br /><small>({$LANG.orderprorata} {$addon.prorataDate})</small>{/if}
                                    </span>
                                    <button class="btn btn-primary-faded hidden" data-input-number-update data-toggle="tooltip" data-html="true" data-original-title="{$LANG.carttaxupdateselectionsupdate}" title="">
                                        <i class="ls ls-info-circle"></i>{$LANG.carttaxupdateselectionsupdate}
                                    </button>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions d-flex">
                                        <button type="button" class="btn btn-icon" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('a', '{$num}')">
                                            <i class="lm lm-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    {foreach $upgrades as $num => $upgrade}
                        <div class="panel-body cart-item" data-input-number>
                            <div class="row">
                                <div class="prod-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}" data-content="{$LANG.upgrade}">
                                    <span class="cart-item-title">
                                        <span class="cart-item-title-main">{$LANG.upgrade}</span>                                                
                                        {if $upgrade->type == 'service'}
                                            <span class="cart-item-title-small">{$upgrade->originalProduct->productGroup->name}<br>{$upgrade->originalProduct->name} => {$upgrade->newProduct->name}</span>
                                        {elseif $upgrade->type == 'addon'}
                                            <span class="cart-item-title-small">{$upgrade->originalAddon->name} => {$upgrade->newAddon->name}</span>
                                        {/if}
                                        {if $upgrade->type == 'service'}
                                            <span class="cart-item-title-small">{$upgrade->service->domain}</span>
                                        {/if}
                                    </span>
                                </div>
                                {if $showqtyoptions || $showUpgradeQtyOptions}
                                    <div class="prod-qty{if !$upgrade->allowMultipleQuantities} prod-qty-empty{/if} col-sm-2" data-content="{$LANG.quantity}">
                                        {if $upgrade->allowMultipleQuantities}
                                            <div class="input-number">
                                                <input type="number" data-input-number-input name="upgradeqty[{$num}]" value="{$upgrade->qty}" min="{$upgrade->minimumQuantity}" />
                                                <div class="input-number-actions">
                                                    <div class="plus" data-input-number-inc></div>
                                                    <div class="minus" data-input-number-dec></div>
                                                </div>
                                            </div>
                                        {else}
                                            -
                                        {/if}
                                    </div>
                                {/if}
                                <div class="prod-price col">
                                    <span class="cart-item-price price price-xs" data-input-number-price>
                                        <span>
                                            {if (
                                                    $upgrade->newRecurringAmount|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                                    $upgrade->newRecurringAmount|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                                ) && (
                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                )
                                            }
                                                {$LANG.orderfree}
                                            {else}
                                                {$upgrade->newRecurringAmount}
                                            {/if}    
                                        </span>
                                        <span class="price-cycle-inline">{$upgrade->localisedNewCycle}</span>
                                    </span>
                                    <button class="btn btn-primary-faded hidden" data-input-number-update data-toggle="tooltip" data-html="true" data-original-title="{$LANG.carttaxupdateselectionsupdate}" title="">
                                        <i class="ls ls-info-circle"></i>{$LANG.carttaxupdateselectionsupdate}
                                    </button>
                                </div>
                                <div class="prod-actions">
                                    <div class="cart-item-actions d-flex">
                                        <button type="button" class="btn btn-icon btn-sm" data-toggle="tooltip" data-html="true" data-original-title=" {$LANG.orderForm.remove}" onclick="removeItem('u', '{$num}')">
                                            <i class="ls ls-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            {if $upgrade->totalDaysInCycle > 0}
                                <div class="w-100"></div>
                                <div class="prod-addons col">
                                    <div class="prod-addons-container">
                                        <div class="addon-item row">
                                            <div class="addon-name {if $showqtyoptions || $showAddonQtyOptions}col-6{else}col-7{/if}">
                                                <span class="item-group">
                                                    {$LANG.upgradeCredit}
                                                </span>
                                                <div class="upgrade-calc-msg">
                                                    {lang key="upgradeCreditDescription" daysRemaining=$upgrade->daysRemaining totalDays=$upgrade->totalDaysInCycle}
                                                </div>
                                            </div>
                                            {if $showqtyoptions || $showAddonQtyOptions}
                                                <div class="addon-qty addon-qty-empty col-4 col-md-2">
                                                        -
                                                </div>
                                            {/if}
                                            <div class="item-price col">
                                                <span>{$upgrade->creditAmount}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                            </div>
                        </div>
                    {/foreach}
                    <div class="panel-footer d-flex space-between">
                        <div class="content {if $taxenabled && !$loggedin}{else}d-flex space-between w-100 flex-nowrap{/if}">
                            <a href="cart.php" class="btn btn-default btn-sm"><i class="ls ls-reply"></i>{$LANG.orderForm.continueShopping}</a>
                            {if $taxenabled && !$loggedin}
                                <a data-toggle="modal" data-target="#estimate-taxes" class="btn btn-default btn-sm" href="#"><i class="ls ls-bank-note"></i>{$LANG.orderForm.estimateTaxes}</a>
                            {else}
                                <button type="button" class="btn btn-default btn-sm" id="btnEmptyCart"><i class="ls ls-trash"></i>{$LANG.emptycart}</button>
                            {/if}
                        </div>            
                        <div class="content">
                            {if $taxenabled && !$loggedin}
                                <button type="button" class="btn btn-default btn-sm" id="btnEmptyCart"><i class="ls ls-trash"></i>{$LANG.emptycart}</button>
                            {/if}
                        </div>            
                    </div>
                </div>
            </form>
        </div>
    </div>
{/if}