{assign var="iconLocation" value="./../../../assets/svg-icons"}
{foreach $icons['fontAwesome'] as $fontAwesomeIcon}
    <label class="media__item" data-media-item="{$fontAwesomeIcon['name']} {$fontAwesomeIcon['class']}{foreach $fontAwesomeIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
        <div class="media__item-icon">
            <i class="{$fontAwesomeIcon['class']}"></i>
        </div>
        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$fontAwesomeIcon['class']}">
        <span class="media__item-border"></span>
        <span class="media__item-label"></span>
    </label>
{/foreach}
<div class="media__no-data msg p-3x is-hidden" data-media-no-data>
    <div class="msg__icon i-c-6x">
        {include file="$iconLocation/no-data.tpl"}
    </div>
    <div class="msg__body">
        <span class="msg__title">{$lang.menu.menu_items.modal.icon.no_data}</span>
    </div>
</div>