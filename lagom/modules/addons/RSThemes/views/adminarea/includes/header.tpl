{if $styleConfigurationPage}
    {if $angularDistCss}
        {foreach from=$angularDistCss item=dist} 
            <link href="{$dist}" rel="stylesheet" type="text/css"/>
        {/foreach}
    {/if}
{/if}