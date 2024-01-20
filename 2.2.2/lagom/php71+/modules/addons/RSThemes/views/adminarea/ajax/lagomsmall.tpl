{assign var="iconLocation" value="./../../../assets/svg-icons"}
{foreach $icons['lagomSmall'] as $lagomSmallIcon}
    <label class="media__item" data-toggle="lu-tooltip" data-title="{$lagomSmallIcon['name']}" data-media-item="{$lagomSmallIcon['name']} {$lagomSmallIcon['class']}{foreach $lagomSmallIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
        <div class="media__item-icon">
            <i class="{$lagomSmallIcon['class']}"></i>
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$lagomSmallIcon['class']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
{include file="./../includes/media/no-data.tpl"}