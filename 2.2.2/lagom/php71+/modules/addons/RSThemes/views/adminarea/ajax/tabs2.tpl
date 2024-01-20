{assign var="iconLocation" value="./../../../assets/svg-icons"}
{assign var="iconsPath" value="./../../../../../../templates/{$themeName}/assets/svg-icon"}
{assign var="ilustrationPath" value="./../../../../../../templates/{$themeName}/assets/svg-illustrations"}
{assign var="imagesPath" value="{$whmcsURL}/templates/{$themeName}/assets/img"}

{foreach $template->getAllIllustrations() as $key => $illustration}
    {if $illustration.path|strstr:"custom/"}
        {assign var="hasCustomIllustration" value=true}
    {/if}
{/foreach}

{if $hasCustomIllustration}
    <h6 class="media__subtitle" data-media-item="{foreach $template->getAllIllustrations() as $key => $illustration}{if $illustration.path|strstr:"/custom/"} {$illustration['name']}{if isset($illustration['tags'] && is_array($illustration['tags']))}{foreach $illustration['tags'] as $tag} {$tag}{/foreach}{/if}{/if}{/foreach}">Custom Illustrations</h6>
    {foreach $template->getAllIllustrations() as $key => $illustration}
        {if $illustration.path|strstr:"/custom/"}
            {assign var=illustrationName value="/"|explode:$illustration['name']}
            <label 
                class="media__item" 
                data-media-item="{$illustration['name']} {if isset($illustration['tags'] && is_array($illustration['tags']))}{foreach $illustration['tags'] as $tag} {$tag}{/foreach}{/if}" 
                data-toggle="lu-tooltip" 
                data-title="{$illustrationName|@end}"
            >
                <div class="media__item-icon">
                    {include file="{$illustration.path}"}
                </div>
                <input class="media__item-input lagom-icon" type="radio" name="item[illustration]" value="{$illustration['name']}">
                <span class="media__item-border"></span>
                <span class="media__item-label"></span>
            </label>
        {/if}
    {/foreach}
    <h6 class="media__subtitle" data-media-item="{foreach $template->getAllIllustrations() as $key => $illustration}{if !$illustration.path|strstr:"/custom/"} {$illustration['name']}{if isset($illustration['tags'] && is_array($illustration['tags']))}{foreach $illustration['tags'] as $tag} {$tag}{/foreach}{/if}{/if}{/foreach}">
        Lagom Illustrations
    </h6>
{/if}

{foreach $template->getAllIllustrations() as $key => $illustration}
    {if !$illustration.path|strstr:"/svg-illustrations/custom/" && $illustration.path|strstr:"/modern/"}
        {assign var=illustrationName value="/"|explode:$illustration['name']}
        <label 
            class="media__item {if $illustration.path|strstr:"section-bg/modern/"}media__item--extension-hide{/if}" 
            data-media-item="{$illustration['name']} {if isset($illustration['tags'] && is_array($illustration['tags']))}{foreach $illustration['tags'] as $tag} {$tag}{/foreach}{/if}" 
            data-toggle="lu-tooltip" 
            data-title="{$illustrationName|@end}"
        >
            <div class="media__item-icon">
                {include file="{$illustration.path}"}
            </div>
            <input class="media__item-input lagom-icon" type="radio" name="item[illustration]" value="{$illustration['name']}">
            <span class="media__item-border"></span>
            <span class="media__item-label"></span>
        </label>
    {/if}
{/foreach}
{include file="./../includes/media/no-data.tpl"}