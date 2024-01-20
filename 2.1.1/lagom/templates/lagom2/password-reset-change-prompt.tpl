{if file_exists("templates/$template/overwrites/password-reset-change-prompt.tpl")}
    {include file="{$template}/overwrites/password-reset-change-prompt.tpl"}  
{else} 
    <p class="login-desc">{$LANG.pwresetenternewpw}</p>
    <form class="using-password-strength" method="POST" action="{routePath('password-reset-change-perform')}">
        <input type="hidden" name="answer" id="answer" value="{$securityAnswer}" />
        <div id="newPassword1" class="form-group has-feedback">
            <label class="control-label" for="inputNewPassword1">{$LANG.newpassword}</label>
            <div class="input-password-strenght">
                <input type="password" name="newpw" id="inputNewPassword1" class="form-control" autocomplete="off" />
                <span class="text-small text-lighter"><span id="passwordStrengthTextLabel">{$LANG.pwstrengthenter}</span><i data-toggle="tooltip" title="{$LANG.passwordtips}" data-html="true" data-container="body" class="ls ls-info-circle"></i></span>
            </div>
            {include file="$template/includes/pwstrength.tpl"}
        </div>
        <div id="newPassword2" class="form-group has-feedback">
            <label class="control-label" for="inputNewPassword2">{$LANG.confirmnewpassword}</label>
            <input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
            <div id="inputNewPassword2Msg"></div>
        </div>
        <input class="btn btn-primary btn-block" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
    </form>
{/if}