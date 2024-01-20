{if isset($styleConfigurationPage) && $styleConfigurationPage}
    {if isset($angularDistCss) && $angularDistCss}
        {foreach from=$angularDistCss item=dist} 
            <link href="{$dist}" rel="stylesheet" type="text/css"/>
        {/foreach}
    {/if}
{/if}