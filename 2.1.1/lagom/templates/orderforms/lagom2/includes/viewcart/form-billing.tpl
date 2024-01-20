{if file_exists("templates/orderforms/$carttpl/includes/viewcart/overwrites/form-billing.tpl")}
    {include file="templates/orderforms/$carttpl/includes/viewcart/overwrites/form-billing.tpl"}
{else}    
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.billingdetails}</h2>
        </div>
        <div class="section-body">
            {if $custtype neq "new" && $loggedin}
                <input type="hidden" name="custtype" id="inputCustType" value="{$custtype}" />
                <div class="panel-group panel-group-condensed m-b-0" id="containerExistingAccountSelect" data-inputs-container>
                    {foreach $accounts as $account}
                        <div class="panel panel-check {if $selectedAccountId == $account->id}checked{/if} {if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled{/if}" data-virtual-input>
                            <div class="panel-heading check">
                                <label class="w-100">
                                    <input id="account{$account->id}" class="icheck-control account-select{if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled{/if}" type="radio" name="account_id" value="{$account->id}" {if $account->isClosed || $account->noPermission || $inExpressCheckout} disabled="disabled"{/if}{if $selectedAccountId == $account->id} checked="checked"{/if}>
                                    <div class="check-content d-flex align-center">
                                        <span>{if $account->company}{$account->company}{else}{$account->fullName}{/if}</span>
                                        {if $account->isClosed || $account->noPermission}
                                            <div class="label label-default account-select-label">
                                                {if $account->isClosed}
                                                    {lang key='closed'}
                                                {else}
                                                    {lang key='noPermission'}
                                                {/if}
                                            </div>
                                        {elseif $account->currencyCode}
                                            <div class="label label-info account-select-label">
                                                {$account->currencyCode}
                                            </div>
                                        {/if}
                                    </div>
                                </label>
                            </div>
                            <div class="panel-collapse collapse {if $selectedAccountId == $account->id}show{/if}" data-input-collapse role="tabpanel">
                                <div class="panel-body">
                                    <address>
                                        <span class="address-item">{$account->email} </span> <br />
                                        <span class="address-item">{$account->address1}{if $account->address2}, {$account->address2}{/if}</span><br />
                                        <span class="address-item">{if $account->city}{$account->city},{/if}{if $account->postcode} {$account->postcode}{/if}</span> <br />
                                        <span class="address-item">{if $account->state}{$account->state}{/if}</span> <br />
                                        <span class="address-item">{$account->countryName}</span> <br />
                                        <span class="address-item">{if $account->phonenumber}{$account->phonenumber}{/if}</span>
                                    </address>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                    <div class="panel panel-check {if !$selectedAccountId || !is_numeric($selectedAccountId)} checked{/if} {if $inExpressCheckout}disabled{/if}" data-virtual-input>
                        <div class="panel-heading check">
                            <label>
                                <input class="icheck-control account-select" type="radio" name="account_id" value="new" {if !$selectedAccountId || !is_numeric($selectedAccountId)} checked="checked" {/if}{if $inExpressCheckout} disabled="disabled" class="disabled" {/if}>
                                <div class="check-content">
                                    <span>{lang key='orderForm.createAccount'}</span>
                                </div>
                            </label>
                        </div>
                        <div class="panel-collapse collapse  {if $custtype neq "existing"}show{/if}" data-input-collapse role="tabpanel">
                            <div class="panel-body">
                                {include file="orderforms/$carttpl/includes/register-user-fields.tpl"}
                            </div>

                        </div>
                    </div>
                </div>
            {else}
                <div class="panel-group panel-group-condensed m-b-0" data-inputs-container>
                    <div class="panel panel-check  {if $custtype eq "existing"}checked{/if}" data-virtual-input>
                        <div class="panel-heading check">
                            <label>
                                <input type="radio" class="icheck-control" name="custtype" {if $custtype eq "existing" }checked{/if} value="existing" />
                                <div class="check-content">
                                    <span>{$LANG.orderForm.existingCustomerLogin}</span>
                                </div>
                            </label>
                        </div>
                        <div class="panel-collapse collapse {if $custtype eq "existing"}show{/if}" data-input-collapse role="tabpanel">
                            <div class="panel-body">
                                <div class="alert alert-lagom alert-danger w-hidden" id="existingLoginMessage"></div>
                                <div class="inline-form flex-column-sm">
                                        <div class="inline-form-element w-100">
                                        <label for="inputFirstName_exsist" class="control-label">{$LANG.orderForm.emailAddress}</label>
                                        <input type="text" name="loginemail" id="inputLoginEmail" class="form-control" value="{$loginemail}">
                                    </div>
                                    <div class="inline-form-element w-100">
                                        <label for="password_exsist" class="control-label">{$LANG.clientareapassword}</label>
                                        <input type="password" name="loginpassword" id="inputLoginPassword" class="form-control">
                                    </div>
                                    <div class="inline-form-element m-r-0">
                                        <label class="control-label hidden-xs">&nbsp;</label>
                                        <button type="button" id="btnExistingLogin" data-btn-loader class="btn btn-block btn-primary btn-md">
                                            <span>
                                                {lang key='login'}
                                            </span>
                                            <div class="loader loader-button">
                                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                            </div>
                                        </button>
                                    </div>
                                </div>
                                {include file="orderforms/$carttpl/linkedaccounts.tpl" linkContext="checkout-existing"}
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-check  {if $custtype neq "existing"}checked{/if}" data-virtual-input>
                        <div class="panel-heading check">
                            <label>
                                <input type="radio" class="icheck-control" name="custtype" {if $custtype neq "existing" }checked{/if} value="new" />
                                <div class="check-content">
                                    <span>{$LANG.orderForm.createAccount}</span>
                                </div>
                            </label>
                        </div>
                        <div class="panel-collapse collapse {if $custtype neq "existing"}show{/if}" data-input-collapse role="tabpanel">
                            <div class="panel-body social-wide">
                                {include file="orderforms/$carttpl/includes/register-user-fields.tpl"}
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    </div>
{/if}    