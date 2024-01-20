{if file_exists("templates/$template/payment/bank/overwrites/select.tpl")}
    {include file="{$template}/payment/bank/overwrites/select.tpl"}  
{else} 
    {if count($existingAccounts) > 0}
        <div class="panel-nav">
            <ul class="nav nav-tabs">
                <li>
                    <a {if $existingAccount && $payMethodId neq "new"}class="active"{/if} href="#existingBankInfo" data-simple-radio-tab data-toggle="tab" aria-expanded="true">                                    
                        {$LANG.paymentMethodsManage.bankAccount}
                    </a>
                </li>
                <li>
                    <a {if $payMethodId eq "new" || !$existingAccount}class="active"{/if} href="#newBankInfoTab" data-simple-radio-tab data-toggle="tab" aria-expanded="false">
                        <div class="hidden">
                            <input id="newAccountInfo"
                                type="radio"
                                class="icheck-control"
                                name="paymethod"
                                value="new"
                                {if $payMethodId eq "new" || !$existingAccount} checked="checked"{/if}
                            >    
                        </div>
                        {$LANG.paymentMethods.addNewBank}
                    </a>
                </li>
            </ul>
        </div>
    {/if}
    <div class="panel-body">
        {if count($existingAccounts) == 0}
            <input id="newAccountInfo" type="checkbox" class="hidden" name="paymethod" value="new" {if $payMethodId eq "new" || !$existingAccount} checked="checked"{/if}>    
            <h5>{lang key='paymentMethods.addNewBank'}</h5>
        {/if}
        <div class="tab-content">
            <div id="existingBankInfo" class="tab-pane {if $existingAccount && $payMethodId neq "new"}active{/if}">
                {if count($existingAccounts) > 0}
                    <div class="cc-list cc-list-bank">
                        {foreach $existingAccounts as $bankAccount}
                            {assign "payMethod" $bankAccount.payMethod nocache}
                            <div class="cc-item" data-paymethod-id="{$bankAccount.paymethodid}">
                                <div class="cc-item-checkbox">
                                    <input
                                        id="existingAccount{$bankAccount.paymethodid}"
                                        type="radio"
                                        name="paymethod"
                                        class="existing-account icheck-control"
                                        data-billing-contact-id="{$bankAccount.billingcontactid}"
                                        {if $existingAccount && $payMethodId eq $bankAccount.paymethodid}
                                            {assign "preselectedBillingContactId" {$bankAccount.billingcontactid}}
                                            checked="checked"
                                            data-loaded-paymethod="true"
                                        {elseif !$existingAccount}
                                            disabled="disabled"
                                        {/if}
                                        {if !$hasRemoteInput}onclick="hideNewAccountInputFields();"{/if}
                                        value="{$bankAccount.paymethodid}"
                                    >
                                </div>
                                <div class="cc-item-icon">
                                    <i class="{$payMethod->getFontAwesomeIcon()}"></i>
                                </div>
                                <div class="cc-item-name">
                                    {$payMethod->payment->getDisplayName()}
                                </div>
                                <div class="cc-item-desc {if $payMethod->getDescription() == "-"}empty{/if}" >
                                    {$payMethod->getDescription()}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                {/if}
            </div>
            {if !$hasRemoteInput}
                {include file="$template/payment/$cardOrBank/inputs.tpl"}
            {/if}
            {if count($existingAccounts) == 0}<div id="btnSubmitContainer" class="form-group submit-container"></div>{/if}
        </div>    
    </div>

    {literal}
    <style type="text/css">
        #ibanElement.StripeElement {
            padding-top: 12px!important;
            padding-bottom: 12px!important;
        }
        .form-group.bank-details > label.col-sm-4 {
            padding: 0;
        }
        #newBillingAddress + .form-group.bank-details,
        #newBankInfoTab + .form-group.bank-details {
            margin-left: -12px;
            margin-right: -12px;
        }
        #newBillingAddress + .form-group.bank-details:after,
        #newBankInfoTab + .form-group.bank-details:after {
            display: block;
            content: "";
            clear: both;
        }
        #newBillingAddress + .form-group.bank-details > label,
        #newBankInfoTab + .form-group.bank-details > label{
            display: none;
        }
        #newBillingAddress + .form-group.bank-details > div,
        #newBankInfoTab + .form-group.bank-details > div {
            width: 66.66667%;
        }
    </style>
    {/literal}
{/if}