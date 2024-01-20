{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    {if !$status}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.sslinvalidlink textcenter=true}
        <p class="text-left">
            <button class="btn btn-default" onclick="history.go(-1)"><i class="ls ls-reply"></i>{$LANG.back}</button>
        </p>
    {else}
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error"  errorshtml=$errormessage}
        {/if}
        {if $status eq "Awaiting Configuration"}
            <form method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=2">
                <div class="section">
                    <div class="section-header">
                        <h3>{$LANG.sslserverinfo}</h3>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {include file="$template/includes/alert.tpl" type="info" msg={lang key='sslserverinfodetails'}}
                           <div class="form-group">
                                <label for="inputServerType">{$LANG.sslservertype}</label>
                                <select name="servertype" id="inputServerType" class="form-control">
                                    <option value="" selected>{lang key='ssl.selectWebserver' serverType={lang key='sslservertype'}}</option>
                                    {foreach from=$webservertypes key=webservertypeid item=webservertype}
                                        <option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected{/if}>
                                            {$webservertype}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputCsr">{$LANG.sslcsr}</label>
                                <textarea name="csr" id="inputCsr" rows="7" class="form-control">
                                    {if $csr}{$csr}{else}-----BEGIN CERTIFICATE REQUEST----------END CERTIFICATE REQUEST-----{/if}
                                </textarea>
                            </div>  
                            {foreach $additionalfields as $heading => $fields}
                                <h4>{$heading}</h4>
                                <fieldset>
                                    {foreach $fields as $vals}
                                        <div class="form-group row">
                                            <label class="col-md-4 col-form-label text-md-right" for="inputAdditionalField">{$vals.name}</label>
                                            <div class="col-md-8">
                                                {$vals.input} {$vals.description}
                                            </div>
                                        </div>
                                    {/foreach}
                                </fieldset>
                            {/foreach}
                        </div>
                    </div>
                </div>
                
                <div class="section">
                    <div class="section-header">
                        <h3>{$LANG.ssladmininfo}</h3>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {include file="$template/includes/alert.tpl" type="info" msg={lang key='ssladmininfodetails'}}
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputFirstName">{$LANG.clientareafirstname}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="firstname" id="inputFirstName" value="{$firstname}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputLastName">{$LANG.clientarealastname}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="lastname" id="inputLastName" value="{$lastname}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputOrgName">{$LANG.organizationname}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="orgname" id="inputOrgName" value="{$orgname}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputJobTitle">{$LANG.jobtitle}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="jobtitle" id="inputJobTitle" value="{$jobtitle}" />
                                        <p class="help-block">{$LANG.jobtitlereqforcompany}</p>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputEmail">{$LANG.clientareaemail}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="email" id="inputEmail" value="{$email}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputAddress1">{$LANG.clientareaaddress1}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="address1" id="inputAddress1" value="{$address1}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputAddress2">{$LANG.clientareaaddress2}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="address2" id="inputAddress2" value="{$address2}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputCity">{$LANG.clientareacity}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="city" id="inputCity" value="{$city}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputState">{$LANG.clientareastate}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="state" id="inputState" value="{$state}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputPostcode">{$LANG.clientareapostcode}</label>
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="postcode" id="inputPostcode" value="{$postcode}" />
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputCountry">{$LANG.clientareacountry}</label>
                                    <div class="col-sm-12">
                                    <select name="country" id="inputCountry" class="form-control">
                                        {foreach from=$clientcountries item=thisCountryName key=thisCountryCode}
                                            <option value="{$thisCountryCode}" {if $thisCountryCode eq $country}selected="selected"{/if}>{$thisCountryName}</option>
                                        {/foreach}
                                    </select>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="col-sm-12" for="inputPhoneNumber">{$LANG.clientareaphonenumber}</label>
                                    <div class="col-sm-12">
                                        <input type="tel" class="form-control" name="phonenumber" id="inputPhoneNumber" value="{$phonenumber}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <p class="text-left m-t-2x">
                    <button id="btnOrderContinue" class="btn btn-primary" type="submit"><i class="ls ls-share"></i>{$LANG.continue}</button>
                </p>
            </form>
        {else}
            {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sslnoconfigurationpossible textcenter=true}
            <form method="post" action="clientarea.php?action=productdetails">
                <input type="hidden" name="id" value="{$serviceid}" />
                <p>
                    <button class="btn btn-default" type="submit"><i class="ls ls-reply"></i>{$LANG.back}</button>
                </p>
            </form>
        {/if}
    {/if}
{/if}
