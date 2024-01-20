{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}   
    <div class="row subscription-manage">
        <div class="col-12 has-shadow">

            {if $errorMessage}

                {include file="$template/includes/alert.tpl" type="danger" msg=$errorMessage textcenter=true}

            {elseif $infoMessage}

                {include file="$template/includes/alert.tpl" type="info" msg=$infoMessage textcenter=true}

            {elseif $action == 'optin'}

                <p class="text-center">{$LANG.newslettersubscribed}</p>

            {elseif $action == 'optout'}

                {if file_exists("templates/$template/assets/svg-icon/64-email-plus.tpl")}
                    {include file="$template/assets/svg-icon/64-email-plus.tpl"}
                {/if}
                <h5>{$LANG.newsletterremoved}</h5>
                <p>{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>

            {/if}

            <a href="{$WEB_ROOT}/index.php" class="btn btn-default btn-primary">
                <i class="fa fa-home"></i>
                {$LANG.returnhome}
            </a>
        </div>
    </div>
{/if}    
