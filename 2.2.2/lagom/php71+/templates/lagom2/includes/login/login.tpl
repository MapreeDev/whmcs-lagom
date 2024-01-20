{if file_exists("templates/$template/includes/login/overwrites/login.tpl")}
    {include file="{$template}/includes/login/overwrites/login.tpl"}  
{else}
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login">
        {if ($RSThemes['pages'][$templatefile]['config']['showLogo'] == '1' || $showLogo)}
        {include file="$template/includes/login/logo.tpl"}  
        {/if}
        <div class="login-wrapper">
            <div class="login-body"> 
                <h1 class="login-title">{$LANG.clientareahomeloginbtn}</h1>
                {include file="$template/includes/flashmessage.tpl"}
                {if $skipAppNav && $lagomClientAlerts->default}
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                {if $linkableProviders}
                    <div class="providerLinkingFeedback"></div>
                {/if}
                <form class="login-form" method="post" action="{routePath('login-validate')}" role="form">
                    <div class="form-group">
                        <label for="inputEmail">{$LANG.clientareaemail}</label>
                        <input type="email" name="username" class="form-control input-lg" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus tabindex="1">
                    </div>
                    <div class="form-group">
                        <div class="d-flex space-between">
                            <label for="inputPassword">{$LANG.clientareapassword}</label>
                            <a href="{routePath('password-reset-begin')}" tabindex="3">{$rslang->trans('login.forgot')}</a>
                        </div>
                        <input type="password" name="password" class="form-control input-lg" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" tabindex="2">
                    </div>
                    <div class="form-group">
                        <label class="checkbox m-b-2x">
                            <input class="icheck-control" type="checkbox" name="rememberme" /> {$LANG.loginrememberme}
                        </label>
                    </div>
                    {if $captcha->isEnabled()}
                    <div class="login-captcha">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                    {/if}
                    {* <input class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}" id="login" type="submit" value="{$LANG.loginbutton}" tabindex="4" /> *}
                    <button type="submit" class="btn btn-lg btn-primary btn-block {$captcha->getButtonClass($captchaForm)}" id="login" tabindex="4">
                        <span class="btn-text">
                            {$LANG.loginbutton}
                        </span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                        </div>
                    </button>
                </form>
                {if !$RSThemes['pages'][$templatefile]['config']['socialButtons'] == '1' && $linkableProviders}
                <div class="login-divider">
                    <span></span>
                    <span>{$LANG.or}</span>
                    <span></span>
                </div> 
                {include file="$template/includes/linkedaccounts.tpl" customFeedback=true linkContext="login"}
                {/if}
                {if $SocialMediaLogInAddonIsActive && $social_media_login_integration} 
                    <div class="login-divider">
                        <span></span>
                        <span>{$LANG.or}</span>
                        <span></span>
                    </div> 
                    <div class="social-media social-media-login">
                        {$social_media_login_integration}
                    </div>
                {/if}
            </div>
            {if $condlinks.allowClientRegistration}
            <div class="login-footer">
                <div class="text-light">{$rslang->trans('social.not_member')} <a href="{$WEB_ROOT}/register.php" tabindex="5" >{$LANG.orderForm.createAccount}</a></div>
            </div>
            {/if}
        </div>
        {include file="$template/includes/login/language-chooser.tpl" type="login"}   
    </div>
{/if}    