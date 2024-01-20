{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else} 	
    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    {if in_array('state', $optionalFields)}
        <script>
            var stateNotRequired = true;
        </script>
    {/if}

    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

    <form method="post" action="?action=details" role="form">
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.orderForm.personalInformation}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-default panel-form">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputFirstName" class="control-label">{$LANG.clientareafirstname}</label>
                                    <input type="text" name="firstname" id="inputFirstName" value="{$clientfirstname}"{if in_array('firstname', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputLastName" class="control-label">{$LANG.clientarealastname}</label>
                                    <input type="text" name="lastname" id="inputLastName" value="{$clientlastname}"{if in_array('lastname', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputEmail" class="control-label">{$LANG.clientareaemail}</label>
                                    <input type="email" name="email" id="inputEmail" value="{$clientemail}"{if in_array('email', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputPhone" class="control-label">{$LANG.clientareaphonenumber}</label>
                                    <input type="tel" name="phonenumber" id="inputPhone" value="{$clientphonenumber}"{if in_array('phonenumber',$uneditablefields)} readonly=""{/if} class="form-control" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="inputLanguage" class="control-label">{$LANG.clientarealanguage}</label>
                                    <select name="accountLanguage" id="inputAccountLanguage" class="form-control"
                                            {if in_array('language', $uneditablefields)} disabled="disabled"{/if}>
                                        <option value="">{lang key='default'}</option>
                                        {foreach $languages as $language}
                                            <option value="{$language}"{if $language eq $clientLanguage} selected="selected"{/if}
                                            >{$language|ucfirst}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.orderForm.billingAddress}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-default panel-form">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputCompanyName" class="control-label">{$LANG.clientareacompanyname}</label>
                                    <input type="text" name="companyname" id="inputCompanyName" value="{$clientcompanyname}"{if in_array('companyname', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                            {if $showTaxIdField}
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputTaxId" class="control-label">{lang key=$taxIdLabel}</label>
                                        <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$clientTaxId}"{if in_array('tax_id', $uneditablefields)} readonly="readonly"{/if} />
                                    </div>
                                </div>
                            {/if}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputAddress1" class="control-label">{$LANG.clientareaaddress1}</label>
                                    <input type="text" name="address1" id="inputAddress1" value="{$clientaddress1}"{if in_array('address1', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputAddress2" class="control-label">{$LANG.clientareaaddress2}</label>
                                    <input type="text" name="address2" id="inputAddress2" value="{$clientaddress2}"{if in_array('address2', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputCity" class="control-label">{$LANG.clientareacity}</label>
                                    <input type="text" name="city" id="inputCity" value="{$clientcity}"{if in_array('city', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="country">{$LANG.clientareacountry}</label>
                                    {$clientcountriesdropdown}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputState" class="control-label">{$LANG.clientareastate}</label>
                                            <input type="text" name="state" id="inputState" value="{$clientstate}"{if in_array('state', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputPostcode" class="control-label">{$LANG.clientareapostcode}</label>
                                            <input type="text" name="postcode" id="inputPostcode" value="{$clientpostcode}"{if in_array('postcode', $uneditablefields)} readonly="readonly"{/if} class="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputPaymentMethod" class="control-label">{$LANG.paymentmethod}</label>
                                    <select name="paymentmethod" id="inputPaymentMethod" class="form-control">
                                        <option value="none">{$LANG.paymentmethoddefault}</option>
                                        {foreach from=$paymentmethods item=method}
                                            <option value="{$method.sysname}"{if $method.sysname eq $defaultpaymentmethod} selected="selected"{/if}>{$method.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputBillingContact" class="control-label">{$LANG.defaultbillingcontact}</label>
                                    <select name="billingcid" id="inputBillingContact" class="form-control">
                                        <option value="0">{$LANG.usedefaultcontact}</option>
                                        {foreach from=$contacts item=contact}
                                            <option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>					
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $customfields}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.additionalInfo}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default panel-form">
                        <div class="panel-body">
                            <div class="row">
                                {foreach from=$customfields key=num item=customfield}
                                    <div class="col-md-6">
                                        <div class="form-group"> 
                                            {if $customfield.type eq 'tickbox'}            
                                                <label class="checkbox" for="customfield{$customfield.id}">
                                                    {$customfield.input|replace:'type="checkbox"':'class="form-checkbox icheck-control" type="checkbox"'}
                                                    {$customfield.name}
                                                </label>
                                                {if $customfield.description}<span class="help-block">{$customfield.description}</span>{/if}
                                            {else}
                                                <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
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
        {if $emailPreferencesEnabled}
             <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.clientareacontactsemails}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default panel-form">
                        <div class="panel-body">    
                            {foreach $emailPreferences as $emailType => $value}
                                <div class="checkbox">
                                    <label>
                                        <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                                        <input class="icheck-control" type="checkbox" name="email_preferences[{$emailType}]" id="{$emailType}Emails" value="1"{if $value} checked="checked"{/if} />
                                        {lang key="emailPreferences."|cat:$emailType}
                                    </label>
                                </div>    
                            {/foreach}
                        </div>
                    </div>        
                </div>            
            </div>
        {/if}
        {if $showMarketingEmailOptIn}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{lang key='emailMarketing.joinOurMailingList'}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default panel-form">
                        <div class="panel-body">
                            <p>{$marketingEmailOptInMessage}</p>
                            <div class="panel panel-switch m-w-xs m-b-0">
                                <div class="panel-body">
                                    <span class="switch-label">{$rslang->trans('generals.receive_emails')}: </span>
                                    <label class="switch switch--lg switch--text">
                                        <input class="switch__checkbox" type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if}>
                                        <span class="switch__container"><span class="switch__handle"></span></span>
                                    </label> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        {/if}
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
            <input class="btn btn-default" type="reset" value="{$LANG.clientareacancel}" />
        </div>
    </form>
{/if}

{* {literal}
<script>
    $(document).ready(function(){
        $('[type="reset"]').on('click', function(){
            var form = $(this).closest('form');
            form.find('.icheck-control').each(function(){
                $(this).iCheck('update');
            });
        });
    });
</script>
{/literal} *}
