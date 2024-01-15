{if file_exists("templates/$template/includes/overwrites/panel.tpl")}
    {include file="{$template}/includes/overwrites/panel.tpl"}  
{else} 
    <div class="panel panel-{$type}">
        {if isset($headerTitle)}
            <div class="panel-heading">
                <h5 class="panel-title"><strong>{$headerTitle}</strong></h3>
            </div>
        {/if}
        {if isset($bodyContent)}
            <div class="panel-body{if isset($bodyTextCenter)} text-center{/if}">
                {$bodyContent}
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="panel-footer{if isset($footerTextCenter)} text-center{/if}">
                {$footerContent}
            </div>
        {/if}
    </div>
{/if}