{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}    
    {if $overdueinvoice}
        <div class="message message-danger message-lg message-no-data">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h3 class="message-title">{$rslang->trans('nodata.upgrade_not_available')}</h3>
            <p class="message-desc">{$LANG.upgradeerroroverdueinvoice}</p>
            <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">
                {$LANG.backtoservicedetails}
            </a>
        </div>
    {elseif $existingupgradeinvoice}
        <div class="message message-danger message-lg message-no-data">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h3 class="message-title">{$rslang->trans('nodata.upgrade_not_available')}</h3>
            <p class="message-desc">{$LANG.upgradeexistingupgradeinvoice}</p>
            <a href="submitticket.php" class="btn btn-default">
                {$LANG.submitticketdescription}
            </a>
        </div>
    {elseif $upgradenotavailable}
        <div class="message message-danger message-lg message-no-data">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h3 class="message-title">{$rslang->trans('nodata.upgrade_not_available')}</h3>
            <p class="message-desc">{$LANG.upgradeNotPossible}</p>
            <a href="submitticket.php" class="btn btn-default">
                {$LANG.submitticketdescription}
            </a>
        </div>
    {else}
        {if $type eq "package"}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.upgradecurrentconfig}:</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default active">
                        <div class="panel-body">
                            <strong>{$groupname} - {$productname}</strong> {if $domain} ({$domain}){/if}
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-header">
                     <h2 class="section-title">{$LANG.upgradenewconfig}:</h2>
                </div>
                <div class="section-body">
                    <div class="row row-eq-height">
                        {$showFreeLang = false}
                        {$pricingTerm}
                        {if                                                                            
                            isset($RSThemes.addonSettings.free_product_price) && 
                            $RSThemes.addonSettings.free_product_price == "enabled" &&
                            isset($RSThemes.addonSettings.free_product_price_value) &&
                            $RSThemes.addonSettings.free_product_price_value == "all"
                        }
                            {foreach key=num item=upgradepackage from=$upgradepackages}
                                {if $upgradepackage.pricing.minprice.simple != "-1.00" && $upgradepackage.pricing.minprice.simple != "-1,00"}
                                    {if $upgradepackage.pricing.minprice.simple|strstr:","}
                                        {$pricingTerm = "comma"}
                                    {/if}
                                    {break}
                                {/if}
                            {/foreach}
                            {$showFreeLang = true}
                            {if $pricingTerm == "comma"}
                                {$freeLangReplaceTerm = "{$WHMCSCurrency.prefix}0,00{$WHMCSCurrency.suffix}"}
                            {else}
                                {$freeLangReplaceTerm = "{$WHMCSCurrency.prefix}0.00{$WHMCSCurrency.suffix}"}
                            {/if}
                        {/if}

                        {foreach key=num item=upgradepackage from=$upgradepackages}
                            <div class="col-lg-4 col-sm-6">
                                <form class="package" method="post" action="{$smarty.server.PHP_SELF}">
                                    <input type="hidden" name="step" value="2">
                                    <input type="hidden" name="type" value="{$type}">
                                    <input type="hidden" name="id" value="{$id}">
                                    <input type="hidden" name="pid" value="{$upgradepackage.pid}">
                                    <h3 class="package-title m-t-0">{$upgradepackage.groupname} - {$upgradepackage.name}</h3>
                                    <div class="package-content">
                                        <div class="form-group m-b-3x">
                                            {if $upgradepackage.pricing.type eq "free"}
                                                <input type="hidden" name="billingcycle" value="free">
                                                <div class="package-price">
                                                    <div class="price">
                                                        {$LANG.orderfree}
                                                    </div>
                                                </div>
                                            {elseif $upgradepackage.pricing.type eq "onetime"}
                                                <input type="hidden" name="billingcycle" value="onetime">
                                                <div class="package-price">
                                                    <div class="price">{$upgradepackage.pricing.onetime}
                                                    </div>
                                                    <div class="package-setup-fee">{$LANG.orderpaymenttermonetime}</div>
                                                </div>        
                                            {elseif $upgradepackage.pricing.type eq "recurring"}
                                                <select name="billingcycle" class="form-control input-lg">
                                                    {if $upgradepackage.pricing.monthly}
                                                        <option value="monthly">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.monthly|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.monthly}
                                                            {/if}
                                                        </option>
                                                    {/if}
                                                    {if $upgradepackage.pricing.quarterly}
                                                        <option value="quarterly">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.quarterly|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.quarterly}
                                                            {/if}
                                                        </option>
                                                    {/if}
                                                    {if $upgradepackage.pricing.semiannually}
                                                        <option value="semiannually">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.semiannually|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.semiannually}
                                                            {/if}                                                            
                                                        </option>
                                                    {/if}
                                                    {if $upgradepackage.pricing.annually}
                                                        <option value="annually">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.annually|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.annually}
                                                            {/if}   
                                                        </option>
                                                    {/if}
                                                    {if $upgradepackage.pricing.biennially}
                                                        <option value="biennially">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.biennially|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.biennially}
                                                            {/if}     
                                                        </option>
                                                    {/if}
                                                    {if $upgradepackage.pricing.triennially}
                                                        <option value="triennially">
                                                            {if $showFreeLang}
                                                                {$upgradepackage.pricing.triennially|replace:$freeLangReplaceTerm:$LANG.orderfree}
                                                            {else}
                                                                {$upgradepackage.pricing.triennially}
                                                            {/if}    
                                                        </option>
                                                    {/if}
                                                </select>
                                            {/if}
                                        </div>  
                                        <ul class="package-features">
                                            <li>
                                                {$upgradepackage.description|replace:"<br/>":"</li>"}
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="package-footer">
                                        <div class="package-actions">
                                            <input type="submit" value="{$LANG.upgradedowngradechooseproduct}" class="btn btn-lg btn-primary" id="btnUpgradeDowngradeChooseProduct"/>                                        
                                        </div>
                                    </div>
                                </form>    
                            </div>
                        {/foreach}
                    </div>    
                </div>
            </div>
        {elseif $type eq "configoptions"}
            <p>{$LANG.upgradechooseconfigoptions}</p>
            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
            {/if}
            <form method="post" action="{$smarty.server.PHP_SELF}">
                <input type="hidden" name="step" value="2" />
                <input type="hidden" name="type" value="{$type}" />
                <input type="hidden" name="id" value="{$id}" />
                {foreach key=num item=configoption from=$configoptions}
                    <div class="upgrade-config-option">
                        <h5>{$configoption.optionname}</h5>
                        <div class="row row-eq-height m-b-neg-3x">
                            <div class="upgrade-current col-md-6">
                                <div class="panel panel-defautl panel-form active">
                                    <div class="panel-body">
                                        <h6>{$LANG.upgradecurrentconfig}</h6>						
                                        {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}	
                                            <input class="form-control" type="text" value="{$configoption.selectedname}" disabled="">
                                        {elseif $configoption.optiontype eq 3}
                                            <label class="switch switch--lg switch--text">
                                                <input class="switch__checkbox" type="checkbox" {if $configoption.selectedqty}checked=""{/if} disabled="">
                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                            </label>
                                        {elseif $configoption.optiontype eq 4}
                                            <div class="input-group">
                                                <input class="form-control" type="number" value="{$configoption.selectedqty}" disabled="">
                                                <span class="input-group-addon">x {$configoption.options.0.name}</span>
                                            </div>
                                        {/if}
                                    </div>
                                </div>
                            </div>
                            <div class="upgrade-new col-md-6">          
                                <div class="panel panel-default panel-form">
                                    <div class="panel-body">
                                        <h6>{$LANG.upgradenewconfig}</h6>
                                        {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}	
                                            <select name="configoption[{$configoption.id}]" class="form-control">
                                                {foreach key=num item=option from=$configoption.options}
                                                    {if $option.selected}
                                                        <option value="{$option.id}" selected>{$LANG.upgradenochange}</option>
                                                    {else}
                                                        <option value="{$option.id}">
                                                            {$option.nameonly}
                                                            {if (
                                                                    $option.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0.00' ||
                                                                    $option.price|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:"" == '0,00'
                                                                ) && (
                                                                    isset($RSThemes.addonSettings.free_product_price) && 
                                                                    $RSThemes.addonSettings.free_product_price == "enabled" &&
                                                                    isset($RSThemes.addonSettings.free_product_price_value) &&
                                                                    $RSThemes.addonSettings.free_product_price_value == "all"
                                                                )
                                                            }
                                                                {$LANG.orderfree}
                                                            {else}
                                                                {$option.price}
                                                            {/if}
                                                        </option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        {elseif $configoption.optiontype eq 3}
                                            <label class="switch switch--lg switch--text">
                                                <input class="switch__checkbox" type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}>
                                                <span class="switch__container"><span class="switch__handle"></span></span>
                                            </label>
                                        {elseif $configoption.optiontype eq 4}
                                            <div class="input-group">
                                                <input class="form-control" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}">
                                                <span class="input-group-addon">x {$configoption.options.0.name}</span>
                                            </div>
                                        {/if}
                                    </div>
                                </div>                            
                            </div>
                        </div>
                    </div>
                {/foreach}
                <div class="form-actions">
                    <input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-primary" />
                </div>
            </form>
        {/if}
    {/if}
{/if}