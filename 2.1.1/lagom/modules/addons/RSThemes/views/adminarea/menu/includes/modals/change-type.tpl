<div class="modal modal--hero" id="changeTypeModal" data-modal-change-type>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>{$lang.menu.menu_items.modal.change_type.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>{$lang.menu.menu_items.modal.change_type.desc}</p>
            </div>
            <div class="modal__actions">
                <button data-modal-change-type-submit data-index data-parent type="button" class="btn btn--danger">
                    <span class="btn__text">{$lang.general.confirm}</span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>