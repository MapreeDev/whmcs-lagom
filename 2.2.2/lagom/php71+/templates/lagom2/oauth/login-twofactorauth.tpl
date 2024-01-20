{if file_exists("templates/$template/oauth/overwrites/login-twofactorauth.tpl")}
    {include file="{$template}/oauth/overwrites/login-twofactorauth.tpl"}  
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
                        <p class="login-desc">{$LANG.restrictedpage}</p>
                        <h1 class="login-title">{$LANG.twofactorauth}</h1>
                        <form class="loginForm" method="post" action="{$issuerurl}dologin.php" role="form">
                            <div id="loginWithBackupCode"{if !$backupcode} class="hidden"{/if}>
                                {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofabackupcodelogin textcenter=true}
                                <div class="form-group">
                                    <input type="text" name="code" class="form-control" placeholder="{$LANG.twofabackupcodelogin}">
                                </div>    
                                <button type="submit" name="backupcode" value="1" class="btn btn-primary btn-block" id="btnLogin">
                                    <span class="btn-text">
                                        {lang key='login'}
                                    </span>
                                    <div class="loader loader-button hidden" >
                                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                    </div>
                                </button>
                            </div>
                            <div id="loginWithSecondFactor"{if $backupcode} class="hidden"{/if}>
                                {if $incorrect}
                                    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
                                {elseif $error}
                                    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
                                {else}
                                    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
                                {/if}
                                <div class="form-group">
                                    {$challenge}
                                </div>
                                {$LANG.twofacantaccess2ndfactor} <a href="#" onclick="jQuery('#loginWithSecondFactor').hide();jQuery('#loginWithBackupCode').removeClass('hidden').show();">{$LANG.twofaloginusingbackupcode}</a> 
                            </div>
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