{assign var="iconLocation" value="./../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$themeName}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

{foreach $template->getAllIcons() as $key => $icon}
    {if $icon.path|strstr:"custom/"}
        {assign var="hasCustomIcon" value=true}
    {/if}
{/foreach}

{if $hasCustomIcon}
    <h6 class="media__subtitle" data-media-item="{foreach $template->getAllIcons() as $key => $icon}{if $icon.path|strstr:"/custom/"}{$icon['name']}{if isset($icon['tags'] && is_array($icon['tags']))}{foreach $icon['tags'] as $tag} {$tag}{/foreach}{/if}{/if}{/foreach}">Custom Icons</h6>
    {foreach $template->getAllIcons() as $key => $icon}
        {if $icon.path|strstr:"/custom/"}
            <label class="media__item" data-media-item="{$icon['name']}{if isset($icon['tags'] && is_array($icon['tags']))}{foreach $icon['tags'] as $tag} {$tag}{/foreach}{/if}" data-toggle="lu-tooltip" data-title="{$icon['name']}">
                <div class="media__item-icon">
                    {include file="{$icon.path}"}
                </div>
                <input class="media__item-input lagom-icon" type="radio" name="item[icon]" value="{$icon['name']}">
                <span class="media__item-border"></span>
                <span class="media__item-label"></span>
            </label>
        {/if}
    {/foreach}
    <h6 class="media__subtitle" data-media-item="{foreach $template->getAllIcons() as $key => $icon}{if !$icon.path|strstr:"/custom/"} {$icon['name']}{if isset($icon['tags'] && is_array($icon['tags']))}{foreach $icon['tags'] as $tag} {$tag}{/foreach}{/if}{/if}{/foreach}">
        Lagom Icons
    </h6>
{/if}

{foreach $template->getAllIcons() as $key => $icon}
    {if !$icon.path|strstr:"/custom/"}
        <label class="media__item" data-media-item="{$icon['name']}{if isset($icon['tags'] && is_array($icon['tags']))}{foreach $icon['tags'] as $tag} {$tag}{/foreach}{/if}" data-toggle="lu-tooltip" data-title="{$icon['name']}">
            <div class="media__item-icon">
                {include file="{$icon.path}"}
            </div>
            <input class="media__item-input lagom-icon" type="radio" name="item[icon]" value="{$icon['name']}">
            <span class="media__item-border"></span>
            <span class="media__item-label"></span>
        </label>
    {/if}
{/foreach}
{include file="./../includes/media/no-data.tpl"}