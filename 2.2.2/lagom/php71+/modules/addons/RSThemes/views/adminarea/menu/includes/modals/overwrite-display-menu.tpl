<div class="modal" id="overwriteDisplayMenuModal" data-menu-overwrite-rules-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger">{$lang.modal.overwrite_menu_display_rules.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="m-b-3x"><strong>{$lang.modal.overwrite_menu_display_rules.desc}</strong></p>
                <ul class="list" data-menu-overwrite-rules-modal-list>
                
                </ul>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" data-menu-overwrite-rules-modal-submit data-btn-loader data-menu-form="#updateMenuForm">
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">{$lang.general.confirm}</span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>