{if file_exists("templates/$template/includes/overwrites/alert.tpl")}
    {include file="{$template}/includes/overwrites/alert.tpl"}  
{else}
    <div class="alert alert-lagom alert-{if $type eq "error"}danger{elseif $type}{$type}{else}info{/if}{if $textcenter} text-center{/if}{if $hide} hidden{/if}{if $additionalClasses} {$additionalClasses}{/if}"{if $idname} id="{$idname}"{/if}>
        {if $icon}
            <span class="alert-icon ls {$icon}"></span> 
        {/if}
        <div class="alert-body">
            {if $errorshtml}
                <strong>{$LANG.clientareaerrors}</strong>
                <ul>
                    {$errorshtml}
                </ul>
            {else}
                {if $title}
                    <h2>{$title}</h2>
                {/if}
                {$msg}
            {/if}
        </div>
    </div>
{/if}