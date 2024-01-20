{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/captcha.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/captcha.tpl"}
{else}
    {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm) && !$captcha->recaptcha->isInvisible()}
        <div class="domain-search-captcha domainchecker-homepage-captcha {if $pageClass}{$pageClass}{/if}">
            <div class="captcha-container captcha captcha-centered text-center m-a form-group" id="captchaContainer">
                    {if $captcha == "recaptcha"} 
                        <div class="recaptcha-container"></div>
                    {elseif $captcha != "recaptcha"}
                    <div class="captchatext text-light">{lang key="cartSimpleCaptcha"}</div>
                    <div class="input-group">                                 
                        <div class="input-group-addon">
                            <img id="inputCaptchaImage" src="includes/verifyimage.php" align="middle" />
                        </div>    
                        <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                    </div>
                {/if}
            </div>
        </div>
    {/if}
{/if}