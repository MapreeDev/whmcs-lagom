<div class="modal" id="refreshLicense" data-refresh-license-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger"></i>{$lang.modal.refresh_license.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <p class="m-b-3x">{$lang.modal.refresh_license.desc}</p>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" data-refresh-license-modal-btn data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text export__btn">
                        {$lang.general.confirm}
                    </span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline">
                    <span class="btn__text">
                        {$lang.general.cancel}
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
