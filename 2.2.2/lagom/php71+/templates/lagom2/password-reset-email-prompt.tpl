{if file_exists("templates/$template/overwrites/password-reset-email-prompt.tpl")}
    {include file="{$template}/overwrites/password-reset-email-prompt.tpl"}  
{else} 
    <p class="login-desc">{$LANG.pwresetemailneeded}</p>
    <form class="loginForm" method="post" action="{routePath('password-reset-validate-email')}" role="form">
        <input type="hidden" name="action" value="reset" />
        <div class="form-group">
            <label for="inputEmail">{$LANG.loginemail}</label>
            <input type="email" name="email" class="form-control input-lg" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
        </div>
        {if $captcha->isEnabled()}
            <div class="login-captcha">
                {include file="$template/includes/captcha.tpl"}
            </div>
        {/if}   
        <button type="submit" class="btn btn-lg btn-primary btn-block{$captcha->getButtonClass($captchaForm)}">
            <span class="btn-text">
                {$LANG.pwresetsubmit}
            </span>
            <div class="loader loader-button hidden" >
                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
            </div>
        </button>
    </form>
{/if}