<div class="modal" id="saveConfirmationModal" data-save-confirmation-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title">
                    {$lang.modal.settings.title}
                </div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal"
                            aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p><strong>{$lang.modal.settings.subtitle}</strong></p>
            </div>
            <div class="modal__actions">
                <a class="btn btn--primary" data-confirm-save-changes data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">
                        {$lang.general.confirm}
                    </span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline">
                    <span class="btn__text">
                        {$lang.general.cancel}
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>