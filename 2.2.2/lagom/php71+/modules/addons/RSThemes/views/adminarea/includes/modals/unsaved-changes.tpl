<div class="modal" id="unsavedChanges" data-unsaved-changes-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger">{$lang.modal.unsaved_changes.title}</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>{$lang.modal.unsaved_changes.desc1}</p>
                <p class="text-danger">
                    <strong>{$lang.modal.unsaved_changes.desc2}</strong>
                </p>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" data-unsaved-changes-modal-btn data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text export__btn">
                        {$lang.modal.unsaved_changes.btn_confirm}
                    </span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline">
                    <span class="btn__text">
                        {$lang.modal.unsaved_changes.btn_dismiss}
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
