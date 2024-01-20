{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-lg message-no-data">
        {if $success}
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="protect-your-reputation"}  
            </div>
            <h2 class="message-text">{lang key="emailVerification.success"}</h2>
            <a href="{routePath('login-index')}" class="btn btn-primary ">
                {lang key="orderForm.continueToClientArea"}
            </a>
        {elseif $expired}   
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="icon-website-time-maschine"}      
            </div>
            <h2 class="message-text">{lang key="emailVerification.expired"}</h2>
            {if $loggedin}
                <button class="btn btn-default  btn-resend-verify-email" data-email-sent="{$LANG.emailSent}" data-error-msg="{$LANG.error}" data-uri="{routePath('user-email-verification-resend')}">
                    {$LANG.resendEmail}
                </button>
            {else}
                <h6 class="message-text">{lang key="emailVerification.loginToRequest"}</h6>
            {/if}
            <a href="{routePath('login-index')}" class="btn btn-primary ">
                {lang key="orderForm.continueToClientArea"}
            </a>
        {else}
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="icon-malware-detection-and-restore"}   
            </div>
            <h2 class="message-text">{lang key="emailVerification.notFound"}</h2>
            {if !$loggedin}
                <h6 class="message-text">{lang key="emailVerification.loginToRequest"}</h6>
            {/if}
            <a href="{routePath('login-index')}" class="btn btn-primary ">
                {lang key="orderForm.continueToClientArea"}
            </a>
        {/if}    
    </div>
{/if}