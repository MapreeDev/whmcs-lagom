{if file_exists("templates/$template/oauth/overwrites/login.tpl")}
    {include file="{$template}/oauth/overwrites/login.tpl"}  
{else}
    <div class="main-body">
        <div class="container">
            <div class="login">
                <div class="login-header">
                    {if $appLogo}
                        <div class="logo">
                            <img src="{$appLogo}" />
                        </div>
                    {else}
                        {include file="$template/includes/login/logo.tpl"}
                    {/if}
                </div>  
                <div class="login-wrapper">
                    <div class="login-body">  
                        {if $incorrect}
                            {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
                        {/if}
                        <div class="header-lined text-center m-b-3x">
                            <h5>
                                <span class="text-lighter text-small">{$LANG.restrictedpage}</span>
                                <br>
                                {lang key='oauth.loginToGrantApp' appName=$appName}
                            </h5>
                        </div>
                        <form method="post" action="{$issuerurl}dologin.php" role="form" class="login-form">
                            <div class="form-group">
                                <label for="inputEmail">{$LANG.clientareaemail}</label>
                                <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
                            </div>
                            <div class="form-group">
                                <div class="d-flex space-between">
                                    <label for="inputPassword">{$LANG.clientareapassword}</label>
                                    <a href="{routePath('password-reset-begin')}">{lang key='forgotpw'}</a>
                                </div>
                                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
                            </div>
                            <div class="form-group">
                                <label class="checkbox m-b-2x">
                                    <input class="icheck-control" type="checkbox" name="rememberme" /> {$LANG.loginrememberme}
                                </label>
                            </div>
                            <button type="submit" class="btn btn-lg btn-primary btn-block" id="btnLogin">
                                {lang key='login'}
                            </button>
                        </form>
                    </div>
                    <div class="login-footer" style="height: auto">
                        <div class="text-center">
                            {if $loggedin}
                                <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmLogout">
                                    <input type="hidden" name="logout" value="1"/>
                                    <input type="hidden" name="request_hash" value="{$request_hash}"/>
                                    <p class="m-b-1x">
                                        {lang key='oauth.currentlyLoggedInAs' firstName=$loggedinuser.firstname lastName=$loggedinuser.lastname}.
                                        <a href="#" onclick="jQuery('#frmLogout').submit()">{lang key='oauth.notYou'}</a>
                                    </p>
                                </form>
                            {/if}
                            <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
                                <input type="hidden" name="return_to_app" value="1"/>
                                <input type="hidden" name="request_hash" value="{$request_hash}"/>
                                <a href="#" onclick="jQuery('#frmCancelLogin').submit()">
                                    {lang key='oauth.returnToApp' appName=$appName}
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>        
        </div>     
    </div>     
    <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
        <input type="hidden" name="login_declined" value="yes"/>
        <input type="hidden" name="request_hash" value="{$request_hash}"/>
    </form>
{/if}