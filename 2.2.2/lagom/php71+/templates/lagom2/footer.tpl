{if file_exists("templates/$template/overwrites/footer.tpl")}
    {include file="{$template}/overwrites/footer.tpl"}
{else}
    {if isset($RSThemes['footer-layouts'])}
        {include file=$RSThemes['footer-layouts']['mediumPath']}
    {else}
        {include file="templates/{$template}/core/layouts/footer/default/default.tpl"}
    {/if}
{/if}