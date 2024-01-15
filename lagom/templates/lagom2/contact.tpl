{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
<div class="login login-lg m-a">
    <div class="login-wrapper">
        <div class="login-body">
            {if !$sent}
                <div class="login-header">
                    <h1 class="login-title">{$displayTitle}</h1>
                </div>
            {/if}
            {if $sent}
                <div class="message message-no-data essage-lg message-success">
                    <div class="message-icon">
                        <i class="lm lm-check"></i>
                    </div>
                    <h2 class="message-title"> {$LANG.contactsent}</h2>
                    <a href="{$systemurl}" class="btn btn-default">
                        {lang key="errorPage.404.home"}
                    </a>
                </div>
            {else}
                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}
                <form method="post" action="contact.php" role="form">
                    <input type="hidden" name="action" value="send" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputName" class="control-label">{$LANG.supportticketsclientname}</label>
                                <input type="text" name="name" value="{$name}" class="form-control" id="inputName" />
                            </div>
                        </div>    
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">{$LANG.supportticketsclientemail}</label>
                                <input type="email" name="email" value="{$email}" class="form-control" id="inputEmail" />
                            </div>   
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputSubject" class="control-label">{$LANG.supportticketsticketsubject}</label>
                                <input type="subject" name="subject" value="{$subject}" class="form-control" id="inputSubject" />   
                            </div>
                        </div>
                        <div class="col-md-12">    
                            <div class="form-group">
                                <label for="inputMessage" class="control-label">{$LANG.contactmessage}</label>
                                <textarea name="message" rows="7" class="form-control" id="inputMessage">{$message}</textarea>
                            </div>
                        </div>
                    </div>      
                    {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}    
                        {include file="$template/includes/captcha.tpl"}
                    {/if}
                    {if ($captcha->isEnabled() && in_array($captcha, ['invisible'])) || !$captcha->isEnabledForForm($captchaForm) || !$captcha->isEnabled()}
                        <div class="form-actions flex-center">
                            <button type="submit" class="btn btn-primary {$captcha->getButtonClass($captchaForm)}">{$LANG.contactsend}</button>  
                        </div>
                    {/if}
                </form> 
            {/if}
        </div>    
    </div>
</div>   
{/if}