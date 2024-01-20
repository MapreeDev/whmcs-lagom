{if file_exists("templates/$template/includes/common/overwrites/svg-icon.tpl")}
    {include file="{$template}/includes/common/overwrites/svg-icon.tpl"}
{else}
    {if file_exists("templates/$template/assets/svg-icon/custom/$icon.tpl")}
        {if isset($onDark)}
            {include file="{$template}/assets/svg-icon/custom/$icon.tpl" onDark=$onDark}
        {else}
            {include file="{$template}/assets/svg-icon/custom/$icon.tpl" onDark=false}
        {/if}
    {elseif file_exists("templates/$template/assets/svg-icon/$icon.tpl")}
        {if isset($onDark)}
            {include file="{$template}/assets/svg-icon/$icon.tpl" onDark=$onDark}
        {else}
            {include file="{$template}/assets/svg-icon/$icon.tpl" onDark=false}
        {/if}
    {/if}
{/if}