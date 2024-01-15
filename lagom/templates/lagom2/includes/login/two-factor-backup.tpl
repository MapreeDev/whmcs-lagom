{if file_exists("templates/$template/includes/login/overwrites/two-factor.tpl")}
     {include file="{$template}/includes/login/overwrites/two-factor-backup.tpl"}  
{else}
    {include file="$template/includes/common/layouts-vars.tpl"}
    <div class="login">
        <div class="login-header">
            {if $RSThemes['pages'][$templatefile]['config']['showLogo'] == '1'}
                {include file="$template/includes/login/logo.tpl"}  
            {/if}
        </div>
        <div class="login-wrapper">
            <div class="login-body"> 
                {if $skipAppNav && $lagomClientAlerts->default}
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                <p class="login-desc">{$LANG.restrictedpage}</p>
                <h1 class="login-title">{$LANG.twofactorauth}</h1>
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
                <h4 class="text-center">{$LANG.twofanewbackupcodeis}</h4>
                {include file="$template/includes/alert.tpl" type="success" msg=$newBackupCode textcenter=true}
                <p class="text-lighter text-center text-small">{$LANG.twofabackupcodeexpl}</p>
                <a href="{routePath('clientarea-home')}" class="btn btn-primary btn-lg btn-block">
                    {$LANG.continue}
                </a>
            </div>
        </div> 
        {include file="$template/includes/login/language-chooser.tpl"}   
    </div>
{/if}