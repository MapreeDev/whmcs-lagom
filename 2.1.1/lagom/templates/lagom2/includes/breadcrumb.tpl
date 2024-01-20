{if file_exists("templates/$template/includes/overwrites/breadcrumb.tpl")}
    {include file="{$template}/includes/overwrites/breadcrumb.tpl"}  
{else}    
    <ol class="breadcrumb">
        {foreach $breadcrumb as $item}
            <li {if $item@last} class="active"{/if}>
                {if !$item@last}<a href="{$item.link}">{/if}
                {$item.label}
                {if !$item@last}</a>{/if}
            </li>
        {/foreach}
    </ol>
{/if}