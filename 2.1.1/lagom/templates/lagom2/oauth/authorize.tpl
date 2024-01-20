{if file_exists("templates/$template/oauth/overwrites/authorize.tpl")}
    {include file="{$template}/oauth/overwrites/authorize.tpl"}  
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
                        <div class="header-lined text-center m-b-3x">
                            <h5>
                                <span class="text-lighter text-small">{$LANG.restrictedpage}</span>
                                <br>
                                {lang key='oauth.authoriseAppToAccess' appName=$appName}
                            </h5>
                        </div>
                        <div class="permission-grants form-group">
                            <p>{lang key='oauth.willBeAbleTo'}:</p>
                            <ul>
                                {foreach $requestedPermissions as $permission}
                                    <li>{$permission}</li>
                                {/foreach}
                            </ul>
                        </div>
                        <form method="post" action="#" role="form">
                            {foreach $requestedAuthorizations as $auth}
                                <input type="hidden" name="authz[]" value="{$auth}" />
                            {/foreach}
                        
                            <button name="userAuthorization" id="userAuthorizationAccepted" value="yes" type="submit" class="btn btn-block btn-primary">
                                {lang key='oauth.authorise'}
                            </button>
                            <button name="userAuthorization" id="userAuthorizationDeclined" value="no" type="submit" class="btn btn-block btn-default m-t-2x">
                                {lang key='cancel'}
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
{/if}