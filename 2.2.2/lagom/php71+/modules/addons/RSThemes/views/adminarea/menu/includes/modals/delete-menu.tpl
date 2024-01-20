<div class="modal" id="deleteMenuModal" data-delete-menu-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger">{$lang.menu.modal.remove_menu.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>{$lang.menu.modal.remove_menu.desc}</p>
            </div>
            <div class="modal__actions">
                <a data-delete-menu-modal-submit data-btn-loader class="btn btn--danger" href="{$helper->url('Menu@delete',['templateName'=>$template->getMainName(), 'menuId' => $menu->id])}">
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">{$lang.general.confirm}</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>