<div class="modal" id="deleteMenuItemModal" data-delete-menu-item-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-danger">{$lang.menu.menu_items.modal.remove_menu_item.title}</h6>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>{$lang.menu.menu_items.modal.remove_menu_item.desc}</p>
            </div>
            <div class="modal__actions">
                <button class="btn btn--danger" type="button" data-delete-menu-item-modal-submit data-parent="" data-index="" data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">{$lang.general.confirm}</span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>