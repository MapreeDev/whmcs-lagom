{if file_exists("templates/$template/includes/login/overwrites/register-form.tpl")}
     {include file="{$template}/includes/login/overwrites/register-form.tpl"}  
{else}
    {if in_array('state', $optionalFields)}
        <script>
            var statesTab = 10;
            var stateNotRequired = true;
        </script>
    {/if}
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
    <script>
        window.langPasswordStrength = "{$LANG.pwstrength}";
        window.langPasswordWeak = "{$LANG.pwstrengthweak}";
        window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
        window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
        window.langPasswordTooShort = "{$rslang->trans('login.at_least_pass')}";
    </script>
    {if $registrationDisabled}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="'|cat:"$WEB_ROOT"|cat:'/cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
    {/if}
    {if !$registrationDisabled}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    <form method="post" class="loginForm" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
        <input type="hidden" name="register" value="true"/>
        <div class="section section-sm" id="containerNewUserSignup">
            {if $linkableProviders}
                <div class="section section-sm">
                    <div class="section-body">
                        {if $RSThemes['pages'][$templatefile]['config']['socialButtons'] == '1'}
                            {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}
                        {else}
                            {include file="$template/includes/linkedaccounts.tpl" linkContext="registration" circleButtons="true"}
                        {/if}
                        <div class="login-divider"><span></span><span>{$rslang->trans('social.fill_form_below')}</span><span></span></div>
                    </div>
                </div>
            {/if}
            <div class="section section-sm">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.orderForm.personalInformation}</h2>
                </div>
                <div class="section-body"  id="personalInformation">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputFirstName" {if !in_array('firstname', $optionalFields)} class="label-required" {/if}>
                                    {$LANG.orderForm.firstName} {if in_array('firstname', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                </label>
                                <input type="text" name="firstname" id="inputFirstName" class="form-control" placeholder="" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputLastName" {if !in_array('lastname', $optionalFields)} class="label-required" {/if}>
                                    {$LANG.orderForm.lastName} {if in_array('lastname', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                </label>
                                <input type="text" name="lastname" id="inputLastName" class="form-control" placeholder="" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputEmail" class="label-required">
                                    {$LANG.orderForm.emailAddress}
                                </label>
                                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="" value="{$clientemail}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputPhone" {if !in_array('phonenumber', $optionalFields)} class="label-required" {/if}>
                                    {$LANG.orderForm.phoneNumber} {if in_array('phonenumber', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                </label>
                                <input type="tel" name="phonenumber" id="inputPhone" class="form-control" placeholder="" value="{$clientphonenumber}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section section-sm">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.orderForm.billingAddress}</h2>
                </div>
                <div class="section-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputCompanyName">
                                    {$LANG.orderForm.companyName} ({$LANG.orderForm.optional})
                                </label>
                                <input type="text" name="companyname" id="inputCompanyName" class="form-control" placeholder="" value="{$clientcompanyname}">
                            </div>
                        </div>
                        {if $showTaxIdField}
                            <div class="col-md-6">  
                                <div class="form-group">
                                    <label for="inputTaxId">
                                        {lang key=\WHMCS\Billing\Tax\Vat::getLabel()} ({$LANG.orderForm.optional})
                                    </label>
                                    <input type="text" name="tax_id" id="inputTaxId" class="form-control" placeholder="{lang key=\WHMCS\Billing\Tax\Vat::getLabel()}" value="{$clientsdetails.tax_id}">
                                </div>
                            </div>
                        {/if}
                        <div class="col-md-6">    
                            <div class="form-group ">
                                <label for="inputAddress1" {if !in_array('address1', $optionalFields)} class="label-required" {/if}> 
                                    {$LANG.orderForm.streetAddress} {if in_array('address1', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                </label>
                                <input type="text" name="address1" id="inputAddress1" class="form-control" placeholder="" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}>
                            </div>
                        </div>
                        <div class="col-md-6">        
                            <div class="form-group ">
                                <label for="inputAddress2">
                                    {$LANG.orderForm.streetAddress2} ({$LANG.orderForm.optional})
                                </label>
                                <input type="text" name="address2" id="inputAddress2" class="form-control" placeholder="" value="{$clientaddress2}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group ">
                                <label for="inputCity" {if !in_array('city', $optionalFields)} class="label-required" {/if}>
                                    {$LANG.orderForm.city} {if in_array('city', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                </label>
                                <input type="text" name="city" id="inputCity" class="form-control" placeholder="" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}>
                            </div>
                        </div>
                        <div class="col-md-6">        
                            <div class="form-group ">
                                <label for="inputCountry"  id="inputCountryIcon" class="label-required">
                                    {$LANG.orderForm.country}
                                </label>
                                <select name="country" id="inputCountry" class="form-control">
                                    {foreach $clientcountries as $countryCode => $countryName}
                                        <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                            {$countryName}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">        
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="stateinput" {if !in_array('state', $optionalFields)} class="label-required" {/if}>
                                            {$LANG.orderForm.state} {if in_array('state', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                        </label>
                                        <input type="text" name="state" id="state" class="form-control" placeholder="" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputPostcode" {if !in_array('postcode', $optionalFields)} class="label-required" {/if}> 
                                            {$LANG.orderForm.postcode} {if in_array('postcode', $optionalFields)} ({$LANG.orderForm.optional}){/if}
                                        </label>
                                        <input type="text" name="postcode" id="inputPostcode" class="form-control" placeholder="" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>  
            </div>
            {if $customfields || $currencies}
            <div class="section section-sm">    
                <div class="section-header">
                    <h2 class="section-title">{$LANG.orderadditionalrequiredinfo}<br><i><small class="text-lighter">{lang key='orderForm.requiredField'}</small></i></h2>
                </div>
                <div class="section-body">
                    <div class="row">
                        {if $customfields}

                            {foreach from=$customfields key=num item=customfield }
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        {if $customfield.type eq 'tickbox'}            
                                            <label class="checkbox" for="customfield{$customfield.id}">
                                                {$customfield.input|replace:'type="checkbox"':'class="form-checkbox icheck-control" type="checkbox"'}
                                                <span {if $customfield.required} class="label-required"{/if}>{$customfield.name} {if !$customfield.required} ({$LANG.orderForm.optional}){/if}</span>
                                            </label>
                                            {if $customfield.description}<span class="help-block">{$customfield.description}</span>{/if}
                                        {else}
                                            <label class="control-label {if $customfield.required} label-required{/if}" for="customfield{$customfield.id}">{$customfield.name}{if !$customfield.required} ({$LANG.orderForm.optional}){/if}</label>
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
                                {if $customfield@iteration % 2 == 0}
                                    </div>
                                    <div class="row">
                                {/if}
                            {/foreach}
                        {/if}
                        {if $currencies}
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label for="inputCurrency" class="label-required">
                                        {$LANG.choosecurrency}
                                    </label>
                                    <select id="inputCurrency" name="currency" class="form-control">
                                        {foreach from=$currencies item=curr}
                                            <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
            {/if}
        </div>
        <div class="section section-sm{if $remote_auth_prelinked && !$securityquestions } hidden{/if}" id="containerNewUserSecurity">
            <h5 class="section-title">{$LANG.orderForm.accountSecurity}</h5>
            <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                <div id="passwdFeedback" style="display: none;" class="alert alert-lagom alert-info text-center col-md-12"></div>
                <div class="col-md-6">
                    <div class="form-group has-feedback" id="newPassword1">
                        <div class="password-content password-content-top password-content-group">
                            <label for="inputNewPassword1" class="label-required">
                                {$LANG.clientareapassword}
                            </label>
                            <div class="progress m-t-0" id="passwordStrengthBar" style="display: none">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                    <span class="sr-only">New Password Rating: 0%</span>
                                </div>
                            </div>
                            <span class="text-small text-lighter password-content-text"><span id="passwordStrengthTextLabel">{$rslang->trans('login.at_least_pass')}</span><i data-toggle="tooltip" title="{$LANG.passwordtips}" data-html="true" data-container="body" class="ls ls-info-circle m-l-1x"></i></span>
                        </div>
                        <div class="input-password-strenght">
                            <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="form-control" placeholder="" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                        </div> 
                        {include file="$template/includes/pwstrength.tpl"}
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-feedback" id="newPassword2">
                        <label for="inputNewPassword2" class="label-required">
                            {$LANG.clientareaconfirmpassword}
                        </label>
                        <input type="password" name="password2" id="inputNewPassword2" class="form-control" placeholder="" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                        <div id="inputNewPassword2Msg"></div>
                    </div>
                </div>     
            </div>
            {if $securityquestions}
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="inputSecurityQId" class="label-required">
                            {$rslang->trans('login.security_question')}
                        </label>
                        <select name="securityqid" id="inputSecurityQId" class="form-control">
                            <option value="">{$LANG.clientareasecurityquestion}</option>
                            {foreach $securityquestions as $question}
                                <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                    {$question.question}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group ">
                            <label for="inputSecurityQAns" class="label-required">
                                {$LANG.clientareasecurityanswer}
                            </label>
                            <input type="password" name="securityqans" id="inputSecurityQAns" class="form-control" placeholder="" autocomplete="off">
                        </div>
                    </div>
                </div>
            {/if}    
        </div> 
        {if $showMarketingEmailOptIn}
            <div class="section section-sm">
                <div class="section-header">
                    <h2 class="section-title">{lang key='emailMarketing.joinOurMailingList'}</h2>
                    <p class="section-desc">{$marketingEmailOptInMessage}</p>
                </div>
                <div class="panel panel-switch m-w-xs">
                    <div class="panel-body">
                        <span class="switch-label">{$rslang->trans('generals.receive_emails')}: </span>
                        <label class="switch switch--lg switch--text">
                            <input class="switch__checkbox" type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if}>
                            <span class="switch__container"><span class="switch__handle"></span></span>
                        </label> 
                    </div>
                </div>
            </div>
        {/if}
        {if $accepttos}
        <div class="section section-sm">
            <div class="section-body">
                <div class="checkbox">
                    <label>
                        <input class="icheck-control accepttos" type="checkbox" name="accepttos">
                        <span class="label-required">{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></span>
                    </label>
                </div>
            </div>
        </div>
        {/if}
        {include file="$template/includes/captcha.tpl"}
        <div class="form-actions">
            {* <input class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}" type="submit" value="{$LANG.clientregistertitle}"/> *}
            <button type="submit" class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}">
                <span class="btn-text">
                    {$LANG.clientregistertitle}
                </span>
                <div class="loader loader-button hidden" >
                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                </div>
            </button>
        </div>
    </form>
    {/if}    
{/if}    