{assign var="iconLocation" value="./../../../assets/svg-icons"}
{foreach $icons['fontAwesome'] as $fontAwesomeIcon}
    <label class="media__item" data-toggle="lu-tooltip" data-title="{$fontAwesomeIcon['name']}" data-media-item="{$fontAwesomeIcon['name']} {$fontAwesomeIcon['class']}{foreach $fontAwesomeIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
        <div class="media__item-icon">
            <i class="{$fontAwesomeIcon['class']}"></i>
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$fontAwesomeIcon['class']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
{include file="./../includes/media/no-data.tpl"}