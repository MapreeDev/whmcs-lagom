{if file_exists("templates/$template/includes/common/overwrites/svg-illustration.tpl")}
    {include file="{$template}/includes/common/overwrites/svg-illustration.tpl"}
{else}
    {if file_exists("templates/$template/assets/svg-illustrations/custom/$illustration.tpl")}
        {include file="{$template}/assets/svg-illustrations/custom/$illustration.tpl"}
    {elseif file_exists("templates/$template/assets/svg-illustrations/$illustration.tpl")}
        {include file="{$template}/assets/svg-illustrations/$illustration.tpl"}
    {/if}
{/if}