{if file_exists("templates/$template/includes/login/overwrites/register.tpl")}
     {include file="{$template}/includes/login/overwrites/register.tpl"}  
{else}
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login login-lg">   
        {if ($RSThemes['pages'][$templatefile]['config']['showLogo'] == '1' || $showLogo)} 
        {include file="$template/includes/login/logo.tpl"}
        {/if}
        <div class="login-wrapper">
            <div class="login-body register" id="registration">                
                <h1 class="login-title">{$LANG.register}</h1>
                {if $skipAppNav && $lagomClientAlerts->default}                    
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                {include file="$template/includes/login/register-form.tpl"}
            </div> 
            <div class="login-footer">
                <div class="text-center text-light">{$rslang->trans('login.already_registered')} <a href="{$WEB_ROOT}/login.php">{$rslang->trans('login.sign_in')}</a> <span class="text-lowercase">{$LANG.remoteAuthn.titleOr}</span> <a href="{routePath('password-reset-begin')}">{$rslang->trans('login.reset_password')}</a></div>
            </div>
        </div>
        {include file="$template/includes/login/language-chooser.tpl" type="login"}   
    </div>
{/if}