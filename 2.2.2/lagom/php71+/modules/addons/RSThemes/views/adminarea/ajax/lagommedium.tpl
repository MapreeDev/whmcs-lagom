{assign var="iconLocation" value="./../../../assets/svg-icons"}
{foreach $icons['lagomMedium'] as $lagomMediumIcon}
    <label class="media__item" data-toggle="lu-tooltip" data-title="{$lagomMediumIcon['name']}" data-media-item="{$lagomMediumIcon['name']} {$lagomMediumIcon['class']}{foreach $lagomMediumIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
        <div class="media__item-icon">
            <i class="{$lagomMediumIcon['class']}"></i>
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$lagomMediumIcon['class']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
{include file="./../includes/media/no-data.tpl"}