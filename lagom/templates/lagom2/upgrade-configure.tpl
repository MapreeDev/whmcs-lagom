{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="upgrade">
        {if $errorMessage}
            <div class="message message-danger message-lg message-no-data">
                <div class="message-icon">
                    <i class="lm lm-close"></i>
                </div>
                <h3 class="message-title">{lang key="genericerror.title"}</h3>
                <p class="message-desc">{$errorMessage}</p>
                <button type="button" onclick="history.back();" class="btn btn-default">
                    {lang key="goback"}
                </button>
            </div>
        {else}
            <p>{$LANG.upgradechoosepackage}</p>
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{lang key="upgradeService.serviceBeingUpgraded"}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default active">
                        <div class="panel-body">
                            <h4>
                                {if $serviceToBeUpgraded->isService()}
                                    {$serviceToBeUpgraded->product->productGroup->name} - {$serviceToBeUpgraded->product->name}
                                {else}
                                    {$serviceToBeUpgraded->productAddon->name}
                                {/if}
                            </h4>
                            <h5>
                                {if $serviceToBeUpgraded->domain}
                                    {$serviceToBeUpgraded->domain}
                                {elseif $serviceToBeUpgraded->isAddon() && $serviceToBeUpgraded->service->domain}
                                    {$serviceToBeUpgraded->service->domain}
                                {else}
                                    {lang key="noDomain"}
                                {/if}
                            </h5>						
                            <a href="{$WEB_ROOT}/clientarea.php?action=productdetails&id={if $serviceToBeUpgraded->isService()}{$serviceToBeUpgraded->id}{elseif $serviceToBeUpgraded->isAddon()}{$serviceToBeUpgraded->service->id}{/if}" class="btn btn-default">
                                {lang key="manage"}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{lang key="upgradeService.chooseNew"}</h2>
                </div>
                <div class="section-body">
                    <div class="row row-eq-height">
                        {foreach $upgradeProducts as $product}
                            <div class="col-lg-3">
                                <div class="package package-sitelock">
                                    <h3 class="package-title">{$product->name}</h5>
                                    {if $product->id == $serviceToBeUpgraded->productId}
                                        <div class="current">
                                            {lang key="upgradeService.currentProduct"}
                                        </div>
                                    {/if}
                                    {if $product->productKey == $recommendedProductKey}
                                        <div class="recommended">
                                            {lang key="upgradeService.recommended"}
                                        </div>
                                    {/if}
                                    <div class="package-content">
                                        <ul class="package-features">
                                        {foreach $product->features as $label => $value}
                                            <li >
                                                <span>{$label}</span>

                                                {if is_bool($value)}
                                                    <i class="lm lm-{if $value}check{else}times{/if} text-primary"></i>
                                                {else}
                                                    {$value}
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </div>
                                    <div class="footer m-t-3x">
                                        <form method="post" action="{routePath('upgrade-add-to-cart')}">
                                            <input type="hidden" name="isproduct" value="{$isService}">
                                            <input type="hidden" name="serviceid" value="{$serviceToBeUpgraded->id}">
                                            <input type="hidden" name="productid" value="{$product->id}">
                                            {if $allowMultipleQuantities}
                                                <div class="form-group text-left" data-input-number>
                                                    <label class="control-label">{lang key='orderForm.qty'}</label>
                                                    <div class="input-number">
                                                        <input type="number" name="qty" data-input-number-input min="{$minimumQuantity}" value="{$currentQuantity}" class="">
                                                        <div class="input-number-actions">
                                                            <div class="plus" data-input-number-inc></div>
                                                            <div class="minus" data-input-number-dec></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group m-b-0">
                                                    <label class="control-label">		
                                                        {$LANG.orderbillingcycle}
                                                    </label>
                                            {/if}
                                            <select name="billingcycle" class="form-control m-b-16">
                                                {foreach $product->pricing()->allAvailableCycles() as $cycle}
                                                    {if is_null($permittedBillingCycles) || in_array($cycle->cycle(), $permittedBillingCycles)}
                                                        <option value="{$cycle->cycle()}">
                                                            {if $cycle->isRecurring()}
                                                                {if $cycle->isYearly()}
                                                                    {$cycle->cycleInYears()}
                                                                {else}
                                                                    {$cycle->cycleInMonths()}
                                                                {/if}
                                                                -
                                                            {/if}
                                                            {$cycle->toFullString()}
                                                        </option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                            {if $allowMultipleQuantities}
                                                </div>
                                            {/if}
                                            <button type="submit" class="btn btn-primary btn-block"{if !$product->eligibleForUpgrade} disabled="disabled"{/if}>
                                                {lang key="upgradeService.select"}
                                            </button>
                                        </form>
                                    </div>
                                </div>							
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/if}
    </div>
{/if}