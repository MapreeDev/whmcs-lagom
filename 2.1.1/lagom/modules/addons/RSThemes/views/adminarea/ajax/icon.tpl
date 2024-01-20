{assign var="iconLocation" value="./../../../assets/svg-icons"}

<ul class="nav nav--h nav--tabs" data-icon-sets>
    <li class="nav__item is-active">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-small">
            <span>{$lang.menu.menu_items.modal.icon.ls}</span>
        </a>
    </li>
    <li class="nav__item">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-medium">
            <span>{$lang.menu.menu_items.modal.icon.lm}</span>
        </a>
    </li>
    <li class="nav__item ">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-font-awesome">
            <span>{$lang.menu.menu_items.modal.icon.fa}</span>
        </a>
    </li>
</ul>

{assign var=icons value=$iconsArray}
<div class="tab-content">
    <div class="tab-pane is-active" id="{$type}-lagom-small">
        <div class="media" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media__list" data-media-list>
                {foreach $icons['lagomSmall'] as $lagomSmallIcon}
                    <label class="media__item" data-media-item="{$lagomSmallIcon['name']} {$lagomSmallIcon['class']}{foreach $lagomSmallIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
                        <div class="media__item-icon">
                            <i class="{$lagomSmallIcon['class']}"></i>
                        </div>
                        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$lagomSmallIcon['class']}">
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
            </div>
        </div>
    </div>
    <div class="tab-pane" id="{$type}-lagom-medium">
        <div class="media" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media__list" data-media-list>
                {foreach $icons['lagomMedium'] as $lagomMediumIcon}
                    <label class="media__item" data-media-item="{$lagomMediumIcon['name']} {$lagomMediumIcon['class']}{foreach $lagomMediumIcon['searchTerms'] as $searchTerm} {$searchTerm}{/foreach}">
                        <div class="media__item-icon">
                            <i class="{$lagomMediumIcon['class']}"></i>
                        </div>
                        <input class="media__item-input lagom-icon" type="radio" name="item[font-icon]" value="{$lagomMediumIcon['class']}">
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
            </div>
        </div>
    </div>
    <div class="tab-pane" id="{$type}-font-awesome">
        <div class="media" data-media-container>
            <div class="media__search input-group">
                <i class="input-group__addon lm lm-search"></i>
                <input type="text" class="form-control" placeholder="Search" data-media-search>
            </div>
            <div class="media__list" data-media-list>
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
            </div>
        </div>
    </div>
</div>
