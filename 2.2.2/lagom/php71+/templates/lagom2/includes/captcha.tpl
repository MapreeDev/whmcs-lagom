{if file_exists("templates/$template/includes/overwrites/captcha.tpl")}
    {include file="{$template}/includes/overwrites/captcha.tpl"}  
{else}     
    {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
        {if $templatefile == "viewcart" && !in_array($captcha, ['invisible'])}
            <div class="section">
                <div class="panel panel-default panel-form">
                    <div class="panel-body">
        {/if}
        {if $captcha == "recaptcha"}
            {if $templatefile == "homepage"}
                <div class="domain-search-captcha">
            {/if}    
            <div id="google-recaptcha-domainchecker" class="recaptcha-container center-block {if $templatefile == "contact"} d-flex justify-center{/if}"></div>
            {if $templatefile == "contact"}
                <div class="form-actions d-flex justify-center"><button type="submit" class="btn btn-primary {$captcha->getButtonClass($captchaForm)}">{$LANG.contactsend}</button></div>
            {/if}
            {if $templatefile == "homepage"}
                </div>
            {/if}
        {elseif !in_array($captcha, ['invisible', 'recaptcha'])}
            <div class="{if $templatefile !='clientregister' &&  $templatefile !='contact'}text-center{/if} captcha captcha-centered m-a form-group" id="captchaContainer">
                <div id="default-captcha-domainchecker" class="{if $filename == 'domainchecker'}input-group input-group-box {/if}{if $templatefile !='contact'}text-center{else}section{/if}">
                    <div class="captchatext text-light">{lang key="captchaverify"}</div>
                    {if $templatefile == "contact"}
                        <div class="d-flex space-between flex-nowrap">
                    {/if}
                    <div class="captchaimage input-group {if $templatefile == "login" || $templatefile == "password-reset-container"}w-100{/if}">
                        <div class="input-group-addon">
                             <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                        </div>
                        <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}"/>
                    </div>
                    {if $templatefile == "contact"}
                        <button type="submit" class="btn btn-primary {$captcha->getButtonClass($captchaForm)}">{$LANG.contactsend}</button>  
                        </div>
                    {/if}
                </div>    
            </div>
            <div class="clearfix"></div>
        {/if}
        {if $templatefile == "viewcart" && !in_array($captcha, ['invisible'])}
            		</div>
                </div>
            </div>
        {/if}
        {if in_array($captcha, ['invisible'])}
            {literal}
                <style>
                    #divDynamicRecaptcha[data-size="invisible"] + .tooltip{
                        display: none!important;
                    }
                </style>
            {/literal}
        {/if}
    {/if}
{/if}    