{if file_exists("templates/$template/includes/login/overwrites/password-reset.tpl")}
     {include file="{$template}/includes/login/overwrites/password-reset.tpl"}  
{else}
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login">
        <div class="login-header">
            {if $RSThemes['pages'][$templatefile]['config']['showLogo'] == '1' || $showLogo}
                {include file="$template/includes/login/logo.tpl"}  
            {/if}
        </div>
        <div class="login-wrapper">
            <div class="login-body"> 
                <h1 class="login-title">{$LANG.pwreset}</h1>
                {if $skipAppNav && $lagomClientAlerts->default}                   
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                {if $loggedin && $innerTemplate}
                    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
                {else}
                    {if $successMessage}
                        {include file="$template/includes/common/message.tpl" type="success" msg=$successTitle desc=$successMessage textcenter=true}
                    {else}
                        {if $errorMessage}
                            {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
                        {/if}
                        {if $innerTemplate}
                            {include file="$template/password-reset-$innerTemplate.tpl"}
                        {/if}
                    {/if}
                {/if}
            </div>
            {if $condlinks.allowClientRegistration}
            <div class="login-footer">
                <div class="text-light">{$rslang->trans('social.not_member')} <a href="{$WEB_ROOT}/register.php">{$LANG.orderForm.createAccount}</a></div>
            </div>
            {/if}
        </div>
        {include file="$template/includes/login/language-chooser.tpl" type="login"}   
    </div>
{/if}