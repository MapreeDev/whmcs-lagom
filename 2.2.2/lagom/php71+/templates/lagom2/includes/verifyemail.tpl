{if file_exists("templates/$template/includes/overwrites/verifyemail.tpl")}
    {include file="{$template}/includes/overwrites/verifyemail.tpl"}  
{else}
    {if $showEmailVerificationBanner}
        <div class="alert alert-lagom alert-warning verification-banner email-verification">
            <div class="container">
                <div class="alert-body">
                    <div>
                        <i class="ls ls-exclamation-circle"></i>{$LANG.verifyEmailAddress}
                    </div>
                    <button id="btnResendVerificationEmail" class="btn btn-warning btn-sm btn-resend-verify-email" data-email-sent="{$LANG.emailSent}" data-error-msg="{$LANG.error}" data-uri="{routePath('user-email-verification-resend')}">
                        <span>{$LANG.resendEmail}</span>
                        <span class="loader loader-button">
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                        </span>
                    </button>
                </div>
                <div class="alert-actions">
                    <button id="btnEmailVerificationClose" data-uri="{routePath('dismiss-email-verification')}" type="button" class="btn btn-sm btn-icon close"><i class="ls ls-close"></i></button>
                </div> 
            </div>
        </div>
    {/if}
{/if}