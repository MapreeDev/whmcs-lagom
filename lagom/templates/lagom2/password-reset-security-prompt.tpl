{if file_exists("templates/$template/overwrites/password-reset-email-prompt.tpl")}
    {include file="{$template}/overwrites/password-reset-email-prompt.tpl"}  
{else} 
    <p class="login-desc">{$LANG.pwresetsecurityquestionrequired}</p>
    <form method="post" action="{routePath('password-reset-security-verify')}">
        <div class="form-group">
            <label for="inputAnswer">{$securityQuestion}</label>
            <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
        </div>
        <button type="submit" class="btn btn-primary btn-block">{$LANG.pwresetsubmit}</button>
    </form>
{/if}    
