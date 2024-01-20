{if file_exists("templates/$template/includes/login/overwrites/user-invite.tpl")}
     {include file="{$template}/includes/login/overwrites/user-invite.tpl"}  
{else}
    <script type="text/javascript" src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
    <script>
        window.langPasswordStrength = "{lang key="pwstrength"}";
        window.langPasswordWeak = "{lang key="pwstrengthweak"}";
        window.langPasswordModerate = "{lang key="pwstrengthmoderate"}";
        window.langPasswordStrong = "{lang key="pwstrengthstrong"}";
        jQuery(document).ready(function()
        {
            jQuery("#inputPassword").keyup(registerFormPasswordStrengthFeedback);
        });
    </script>
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login">
        {if $RSThemes['pages'][$templatefile]['config']['showLogo'] == '1'}
            <div class="login-header">
                {include file="$template/includes/login/logo.tpl"}  
            </div>    
        {/if}
        <div class="login-wrapper">
            <div class="login-body"> 
                {if $invite}
                    <div class="login-icon">
                        {include file="$template/includes/common/svg-icon.tpl" icon="outgoing-email-filtering"}        
                    </div>
                    <h1 class="login-title">{lang key="accountInvite.youHaveBeenInvited" clientName=$invite->getClientName()}</h1>
                    {if $skipAppNav && $lagomClientAlerts->default}
                        <div class="custom-alerts">
                            {$lagomClientAlerts->default}
                        </div>
                    {/if}
                    {include file="$template/includes/flashmessage.tpl"}
                    <p class="login-desc">
                        {lang key="accountInvite.givenAccess" senderName=$invite->getSenderName() clientName=$invite->getClientName() ot="<strong>" ct="</strong>"}
                        {if $loggedin}
                            {lang key="accountInvite.inviteAcceptLoggedIn"}
                        {else}
                            {lang key="accountInvite.inviteAcceptLoggedOut"}
                        {/if}
                    </p>  
                    {if $loggedin}
                        <form method="post" class="loginForm" action="{routePath('invite-validate', $invite->token)}">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">
                                <span class="btn-text">
                                    {lang key="accountInvite.accept"}
                                </span>
                                <div class="loader loader-button hidden" >
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                </div>
                            </button>
                        </form>
                    {else}
                        <div class="invite-actions" data-actions>
                            <button type="button" class="btn btn-primary btn-lg btn-block" data-show="register">{lang key="register"}</button>
                            <button type="button" class="btn btn-default btn-lg btn-block" data-show="login">{lang key="login"}</button>
                        </div>
                        <form class="loginForm invite-form hidden" data-invite="login" method="post" action="{routePath('login-validate')}" >
                            <div class="form-group">
                                <label for="inputLoginEmail">{lang key="loginemail"}</label>
                                <input type="email" name="username" class="form-control" id="inputLoginEmail" placeholder="{lang key="loginemail"}" value="{$formdata.email}">
                            </div>
                            <div class="form-group">
                                <div class="d-flex space-between">
                                    <label for="inputLoginPassword">{lang key="loginpassword"}</label>
                                    <a href="{routePath('password-reset-begin')}" tabindex="5">{$rslang->trans('login.forgot')}</a>
                                </div>
                                <input type="password" name="password" class="form-control" id="inputLoginPassword" placeholder="{lang key="loginpassword"}">
                            </div>
                            <div class="login-captcha">
                                {include file="$template/includes/captcha.tpl" captchaForm=$captchaForm nocache}
                            </div>
                            <button type="submit" class="btn btn-primary btn-block btn-lg {$captcha->getButtonClass($captchaForm)}">
                                <span class="btn-text">
                                    {lang key="login"}
                                </span>
                                <div class="loader loader-button hidden" >
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                </div>
                            </button>
                        </form>
                        <form class="loginForm invite-form hidden" data-invite="register" method="post" action="{routePath('invite-validate', $invite->token)}">
                            <div class="form-group">
                                <label for="inputFirstName">{lang key="clientareafirstname"}</label>
                                <input type="text" class="form-control" name="firstname" id="inputFirstName" placeholder="{lang key="clientareafirstname"}" value="{$formdata.firstname}">
                            </div>
                            <div class="form-group">
                                <label for="inputLastName">{lang key="clientarealastname"}</label>
                                <input type="text" class="form-control" name="lastname" id="inputLastName" placeholder="{lang key="clientarealastname"}" value="{$formdata.lastname}">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">{lang key="loginemail"}</label>
                                <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{lang key="loginemail"}" value="{$formdata.email}">
                            </div>
                            <div class="form-group has-feedback">
                                <div class="password-content password-content-top password-content-group">
                                    <label for="inputPassword">{lang key="loginpassword"}</label>
                                    <div class="progress m-t-0" id="passwordStrengthBar" style="display: none">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                            <span class="sr-only">New Password Rating: 0%</span>
                                        </div>
                                    </div>
                                    <span class="text-small text-lighter password-content-text"><span id="passwordStrengthTextLabel">{$rslang->trans('login.at_least_pass')}</span><i data-toggle="tooltip" title="{$LANG.passwordtips}" data-html="true" data-container="body" class="ls ls-info-circle m-l-1x"></i></span>
                                </div>
                                <div class="input-password-strenght">
                                    <input type="password" class="form-control" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" placeholder="{lang key="loginpassword"}" autocomplete="off" />
                                </div>    
                                {include file="$template/includes/pwstrength.tpl"}
                            </div>
                            {if $accept_tos}
                                <label class="checkbox m-b-16">
                                    <input type="checkbox" name="accept" id="accept" />
                                    &nbsp;
                                    {lang key='ordertosagreement'}
                                    <a href="{$tos_url}" target="_blank">{lang key='ordertos'}</a>
                                </label>
                            {/if}
                            <div class="login-captcha">
                                {include file="$template/includes/captcha.tpl" captchaForm=$captchaFormRegister containerClass="form-group row" nocache}
                            </div>
                            <button type="submit" class="btn btn-primary btn-block btn-lg {$captcha->getButtonClass($captchaFormRegister)}">
                                <span class="btn-text">
                                    {lang key="register"}
                                </span>
                                <div class="loader loader-button hidden" >
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                </div>
                            </button>
                        </form>
                    {/if}
                {else}
                    <div class="text-center m-b-16">
                        {include file="$template/includes/common/svg-icon.tpl" icon="icon-website-time-maschine"}     
                    </div>
                    <h1 class="h2 text-center">{lang key="accountInvite.notFound"}</h1>
                    <p class="text-center">{lang key="accountInvite.contactAdministrator"}</p>
                    <a class="btn btn-primary btn-lg btn-block m-t-2x" href="{$WEB_ROOT}/contact.php">{$LANG.contactus}</a>
                {/if}     
            </div>
            <div class="login-footer hidden" data-footer>
                <div class="text-light hidden" data-invite="login">{$rslang->trans('social.not_member')} <a href="#" data-show="register" tabindex="6">{$LANG.orderForm.createAccount}</a></div>
                <div class="text-light hidden" data-invite="register">{$rslang->trans('login.already_registered')} <a href="#" data-show="login"> {$rslang->trans('login.sign_in')}</a></div>
            </div>
        </div>
    </div>
    {include file="$template/includes/login/language-chooser.tpl" type="login"}   
    {literal}
    <script>
        $(document).ready(function(){
            let showBtn = $('[data-show]'),
                actions = $('[data-actions]'),
                footer = $('[data-footer]'),
                invite = $('[data-invite]');

            showBtn.on('click', function(e){
                e.preventDefault();
                let value = $(this).data('show');
                actions.addClass('hidden');
                footer.removeClass('hidden');
                invite.each(function(){
                    if ($(this).data('invite') == value){
                        $(this).removeClass('hidden');
                    }
                    else{
                        $(this).addClass('hidden');
                    }
                });
            })
        });
    </script>
    {/literal}
{/if}    