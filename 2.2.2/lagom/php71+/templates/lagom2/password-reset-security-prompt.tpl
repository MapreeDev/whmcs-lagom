{if file_exists("templates/$template/overwrites/password-reset-email-prompt.tpl")}
    {include file="{$template}/overwrites/password-reset-email-prompt.tpl"}  
{else} 
    <p class="login-desc">{$LANG.pwresetsecurityquestionrequired}</p>
    <form class="loginForm" method="post" action="{routePath('password-reset-security-verify')}">
        <div class="form-group">
            <label for="inputAnswer">{$securityQuestion}</label>
            <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
        </div>

        <button type="submit" class="btn btn-primary btn-block">
            <span class="btn-text">
                {$LANG.pwresetsubmit}
            </span>
            <div class="loader loader-button hidden" >
                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
            </div>
        </button>
    </form>
{/if}    
