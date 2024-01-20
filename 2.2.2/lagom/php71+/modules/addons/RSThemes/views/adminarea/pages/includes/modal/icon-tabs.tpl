<ul class="nav nav--h nav--tabs" data-icon-sets>
    <li class="nav__item is-active">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-small" data-media-load>
            <span>{$lang.menu.menu_items.modal.icon.ls}</span>
        </a>
    </li>
    <li class="nav__item">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-lagom-medium" data-media-load>
            <span>{$lang.menu.menu_items.modal.icon.lm}</span>
        </a>
    </li>
    <li class="nav__item ">
        <a class="nav__link" data-toggle="lu-tab" href="#{$type}-font-awesome" data-media-load>
            <span>{$lang.menu.menu_items.modal.icon.fa}</span>
        </a>
    </li>
</ul>

<div class="tab-content">
    <div class="tab-pane is-active" id="{$type}-lagom-small" data-media-container>
        <div class="media__search input-group">
            <i class="input-group__addon lm lm-search"></i>
            <input type="text" class="form-control" placeholder="Search" data-media-search>
        </div>
        <div class="media">
           <div class="media__list has-scroll" data-media-list data-media-insert="lagomsmall">

            </div>
            <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
        </div>
    </div>
    <div class="tab-pane" id="{$type}-lagom-medium" data-media-container> 
        <div class="media__search input-group">
            <i class="input-group__addon lm lm-search"></i>
            <input type="text" class="form-control" placeholder="Search" data-media-search>
        </div>
        <div class="media">
            <div class="media__list has-scroll" data-media-list data-media-insert="lagommedium">

            </div>
            <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
        </div>
    </div>
    <div class="tab-pane" id="{$type}-font-awesome" data-media-container>
        <div class="media__search input-group">
            <i class="input-group__addon lm lm-search"></i>
            <input type="text" class="form-control" placeholder="Search" data-media-search>
        </div>
        <div class="media">
            <div class="media__list has-scroll" data-media-list data-media-insert="fontawesome">

            </div>
            <div class="media__preloader preloader is-hidden" data-media-preloader>
                </div>
        </div>
    </div>
</div>