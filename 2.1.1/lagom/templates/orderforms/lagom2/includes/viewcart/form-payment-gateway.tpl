{if file_exists("templates/orderforms/$carttpl/includes/viewcart/overwrites/form-payment-gateway.tpl")}
    {include file="templates/orderforms/$carttpl/includes/viewcart/overwrites/form-payment-gateway.tpl"}
{else}
    <div class="section" id="paymentGatewaysDetails">
        <div class="section-header">
            <h2 class="section-title">{$LANG.orderpaymentmethod}</h2>
        </div>    
        <div class="section-body">
            <div class="panel{if !$canUseCreditOnCheckout} hidden{/if}">
                <div class="panel-body">
                    <div class="credit-balance"><p class="credit-balance-title">{$LANG.availcreditbal}:</p><span>{$creditBalance}</span></div>
                    <div id="applyCreditContainer" class="apply-credit-container radio-content" data-apply-credit="{$applyCredit}">
                        <div class="form-group">
                            <div class="radio">
                                <label>
                                    <input class="icheck-control" id="useCreditOnCheckout" type="radio" name="applycredit" value="1" {if $applyCredit} checked{/if}>
                                    <span id="spanFullCredit" {if !($creditBalance->toNumeric() >= $total->toNumeric())} class="hidden"{/if}>
                                        {lang key='cart.applyCreditAmountNoFurtherPayment' amount=$total}
                                    </span>
                                    <span id="spanUseCredit" {if $creditBalance->toNumeric() >= $total->toNumeric()} class="hidden"{/if}>
                                        {lang key='cart.applyCreditAmount' amount=$creditBalance}
                                    </span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="radio m-b-0">
                                <label>
                                    <input id="skipCreditOnCheckout" class="icheck-control" type="radio" name="applycredit" value="0" {if !$applyCredit} checked{/if}>
                                    <span>{lang key='cart.applyCreditSkip' amount=$creditBalance}</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            {if !$inExpressCheckout}
            <div id="paymentGatewaysContainer">
                <div class="section">
                    <div class="section-body">
                        <div class="panel-group panel-group-condensed m-b-0" data-inputs-container>
                            {foreach $gateways as $gateway}
                                <div class="panel panel-check {if $selectedgateway eq $gateway.sysname}checked{/if} {$gateway.sysname|lower|replace:" ":"-"}" data-virtual-input>
                                    <div class="panel-heading check">
                                        <label>
                                            <input type="radio" name="paymentmethod" value="{$gateway.sysname}" data-payment-type="{$gateway.payment_type}" data-show-local="{$gateway.show_local_cards}" data-remote-inputs="{$gateway.uses_remote_inputs}" class="icheck-control payment-methods{if $gateway.type eq "CC"} is-credit-card{/if}" {if $selectedgateway eq $gateway.sysname} checked{/if} />
                                            <div class="check-content">
                                                <span>{$gateway.name}</span>
                                            </div>
                                            {assign var=gatewayIcon value=$gateway.sysname|lower|replace:" ":"-"}
                                            <span class="check-icon" data-gateway-icon-name="{$gatewayIcon}">
                                                {if file_exists("templates/$template/assets/img/gateways/{$gatewayIcon}.png")}
                                                    <img src="templates/{$template}/assets/img/gateways/{$gatewayIcon}.png" alt="" />
                                                {elseif file_exists("templates/$template/assets/img/gateways/{$gatewayIcon}.svg")}
                                                    <img src="templates/{$template}/assets/img/gateways/{$gatewayIcon}.svg" alt="" />
                                                {elseif file_exists("templates/$template/assets/svg-icon/gateway-$gatewayIcon.tpl")}
                                                    {include file="$template/assets/svg-icon/gateway-$gatewayIcon.tpl"}
                                                {/if}
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        <div class="alert alert-lagom alert-danger text-center gateway-errors w-hidden m-t-5x"></div>
                    </div>
                </div>                
                <div class="section{if $selectedgatewaytype neq "CC"} hidden{/if}" id="creditCardInputFields">
                    <div class="section-heading">
                        <h3 class="section-title">{$LANG.orderForm.paymentDetails}</h3>
                    </div>
                    <div class="panel panel-form" data-input-collapse role="tabpanel">
                        <div class="cc-input-container">
                            {if $client && $client->payMethods->count() !== 0}
                                <ul class="panel-tabs nav nav-tabs">
                                    <li class="active">
                                        <a href="#existingCardsContainer" data-radio-tab aria-expanded="true">
                                            {$LANG.creditcarduseexisting}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#newCardInfoTab" data-radio-tab data-radio-target="#new" aria-expanded="true">
                                            {$LANG.creditcardenternewcard}
                                        </a>
                                    </li>
                                </ul>
                            {else}
                                <label class="hidden">
                                    <input type="radio" name="ccinfo" class="icheck-control" value="new" id="new" {if !$client || $client->payMethods->count() === 0} checked="checked"{/if} />
                                </label>
                            {/if}
                            <div class="panel-body">
                                {if $client && $client->payMethods->count() !== 0}
                                <div class="tab-content">
                                    <div id="existingCardsContainer" class="tab-pane existing-cc-grid active" data-template="{$template}">
                                        {include file="orderforms/{$carttpl}/includes/existing-paymethods.tpl"}
                                        <div class="row cvv-input" id="existingCardInfo">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label for="inputCardCvvExisting" class="control-label">{$LANG.creditcardcvvnumbershort}</label>
                                                    <div class="form-tooltip">
                                                        <input type="tel" name="cccvv" id="inputCardCVV2" class="form-control" autocomplete="cc-cvc">
                                                        <i class="ls ls-info-circle tooltip-icon" data-cc-popover-show></i>
                                                        <div data-cc-popover class="popover top">
                                                            <div class="arrow"></div>
                                                            <div class="popover-content">
                                                                <img src='{$BASE_PATH_IMG}/ccv.gif' width='180' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span class="field-error-msg help-block">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="newCardInfoTab" class="tab-pane{if $client->payMethods->count() === 0} active{/if}">
                                        <span class="hidden">
                                            <input type="radio" name="ccinfo" class="icheck-control"  value="new" id="new"{if !$client || $client->payMethods->count() === 0} checked="checked"{/if} />
                                        </span>
                                {/if}
                                        <div id="newCardInfo">
                                            <div class="row">
                                                <div class="col-md-6 new-card-container" id="cardNumberContainer">
                                                    <div class="form-group fieldgroup-creditcard">
                                                        <label class="control-label">{$LANG.creditcardcardnumber}</label>
                                                        <input type="tel" name="ccnumber" id="inputCardNumber" class="form-control field cc-number-field" placeholder="{$LANG.orderForm.cardNumber}" autocomplete="cc-number" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}">
                                                    </div>
                                                </div>
                                            </div>
                                            {if $showccissuestart}
                                            <div class="row">
                                                <div class="col-sm-6 new-card-container">
                                                    <div class="form-group">
                                                        <label for="inputCardStart" class="control-label">
                                                            {$LANG.creditcardcardstart}
                                                        </label>
                                                        <input type="tel" name="ccstartdate" id="inputCardStart" class="form-control" placeholder="MM / YY ({$LANG.creditcardcardstart})" autocomplete="cc-exp">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 new-card-container">
                                                    <div class="form-group">
                                                        <label for="inputCardIssue" class="control-label">
                                                            {$LANG.creditcardcardissuenum}
                                                        </label>
                                                        <input type="tel" name="ccissuenum" id="inputCardIssue" class="form-control" placeholder="{$LANG.creditcardcardissuenum}">
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="inputCardExpiry" class="control-label">
                                                            {$LANG.creditcardcardexpires}
                                                        </label>
                                                        <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="form-control" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6" id="cvv-field-container">
                                                    <div class="form-group">
                                                        <label for="inputCardCVV" class="control-label">
                                                            {$LANG.creditcardcvvnumbershort}
                                                        </label>
                                                        <div class="form-tooltip">
                                                            <input type="tel" name="cccvv" id="inputCardCVV" class="form-control" autocomplete="cc-cvc">
                                                            <i class="ls ls-info-circle tooltip-icon" data-cc-popover-show></i>
                                                            <div data-cc-popover class="popover top">
                                                                <div class="arrow"></div>
                                                                <div class="popover-content">
                                                                    <img src='{$BASE_PATH_IMG}/ccv.gif' width='180' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="#newCardSaveSettings">
                                            <div class="row">
                                                <div class="col-md-6" id="inputDescriptionContainer">
                                                    <div class="form-group m-b-0">
                                                        <label for="inputDescription" class="control-label">
                                                            {$LANG.paymentMethods.descriptionInput} {$LANG.paymentMethodsManage.optional}
                                                        </label>
                                                        <input type="text" class="form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" />
                                                    </div>
                                                </div>
                                            </div>    
                                            {if $allowClientsToRemoveCards}
                                                <div class="new-card-container" id="inputNoStoreContainer">
                                                    <input type="hidden" name="nostore" value="1">
                                                    <div class="checkbox">
                                                        <input class="icheck-control" type="checkbox" checked="checked" name="nostore" id="inputNoStore" value="0">
                                                        {$LANG.creditCardStore}
                                                    </div>
                                                </div>
                                            {/if}
                                        </div>
                                {if $client && $client->payMethods->count() !== 0}
                                    </div>
                                </div>
                                {/if}
                            </div>
                        </div>{* .cc-input-container *}
                    </div>{* .panel *}
                </div>{* .section *}
            </div>{* #paymentGatewaysContainer *}
            {else}
                {if $expressCheckoutOutput}
                    {$expressCheckoutOutput}
                {else}
                    <p align="center">
                        {lang key='paymentPreApproved' gateway=$expressCheckoutGateway}
                    </p>
                {/if}
            {/if}{* !$inExpressCheckout *}
        </div>{* .section-body *}
    </div>{* .section *}
{/if}    