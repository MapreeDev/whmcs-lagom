{if file_exists("templates/$template/includes/login/overwrites/two-factor.tpl")}
     {include file="{$template}/includes/login/overwrites/two-factor.tpl"}  
{else}
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login">
        {if ($RSThemes['pages'][$templatefile]['config']['showLogo'] == '1' || $showLogo)}
        {include file="$template/includes/login/logo.tpl"}
        {/if}
        <div class="login-wrapper">
            <div class="login-body"> 
                <h1 class="login-title">{$LANG.twofactorauth}</h1>
                {if $skipAppNav && $lagomClientAlerts->default}
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                {include file="$template/includes/flashmessage.tpl" align="center"}
                {if $newbackupcode}
                    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
                {elseif $incorrect}
                    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
                {elseif $error}
                    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
                {else}
                    <p class="login-desc">{$LANG.twofa2ndfactorreq}</p>
                {/if}
                <form method="post" action="{routePath('login-two-factor-challenge-verify')}" id="frmTwoFactorChallenge" class="loginForm {if $usingBackup} hidden{/if}">
                    <div class="form-group m-b-0">
                        {$challenge}
                        <button id="btnLogin1" type="submit" class="btn btn-primary btn-block btn-lg">
                            <span class="btn-text">
                                {$LANG.loginbutton}
                            </span>
                            <div class="loader loader-button hidden" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                            </div>
                        </button>
                    </div>
                </form>
                <form method="post" action="{routePath('login-two-factor-challenge-backup-verify')}" id="frmTwoFactorBackup" class="loginForm {if !$usingBackup} hidden{/if}">
                    <div class="form-group m-b-24">
                        <input type="text" name="twofabackupcode" class="form-control input-lg" placeholder="{$LANG.twofabackupcodelogin}">
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnLogin2">
                        <span class="btn-text">
                            {$LANG.loginbutton}
                        </span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                        </div>
                    </button>
                    <a class="btn btn-default btn-block" href="#" id="backupCodeCancel">{lang key='cancel'}</a>
                </form>
            </div>    
            <div class="login-footer" id="frmTwoFactorChallengeFooter">
                <div class="text-light text-center {if $usingBackup}hidden{/if}">{$LANG.twofacantaccess2ndfactor} <a href="#" id="loginWithBackupCode">{$LANG.twofaloginusingbackupcode}</a></div>
            </div>
        </div>    
        {include file="$template/includes/login/language-chooser.tpl" type="login"}
    </div>
    {literal}
        <script>
            jQuery(document).ready(function() {
                jQuery('#loginWithBackupCode').click(function(e) {
                    e.preventDefault();
                    jQuery('#frmTwoFactorChallenge').addClass('hidden');
                    jQuery('#frmTwoFactorChallengeFooter').addClass('hidden');
                    jQuery('#frmTwoFactorBackup').removeClass('hidden');
                });
                jQuery('#backupCodeCancel').click(function(e) {
                    e.preventDefault();
                    jQuery('#frmTwoFactorChallenge').removeClass('hidden');
                    jQuery('#frmTwoFactorChallengeFooter').removeClass('hidden');
                    jQuery('#frmTwoFactorBackup').addClass('hidden');
                });
            });
        </script>
    {/literal}
{/if}    