<div class="modal" id="restoreDefaultModal" data-restore-default-modal> 
    <div class="modal__dialog">
        <div class="modal__content"> 
            <div class="modal__top top">
                <div class="top__title text-danger">Restore Default Settings</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <p class="m-b-3x">Restoring default settings will REMOVE ALL customizations made into “Default” style.</p>
                <div class="form-group m-t-2x">
                    <label class="radio m-t-0x">
                        <input class="form-radio" type="radio" name="restore-confirm-radio" value="activeTab" checked>
                        <span class="form-indicator"></span>
                        <span class="form-text">Restore data for active tab</span>
                    </label>
                    <label class="radio m-t-0x">
                        <input class="form-radio" type="radio" name="restore-confirm-radio" value="allTab"> 
                        <span class="form-indicator"></span>
                        <span class="form-text">Restore data for all tabs</span>
                    </label>
                </div> 
                <p class="text-danger m-b-0x">
                    <strong>This action cannot be undone.</strong>
                </p>
                <div class="form-group m-t-2x">
                    <label class="checkbox m-t-0x align-items-start">
                        <input class="form-checkbox" type="checkbox" name="restore-confirm-checkbox"> 
                        <span class="form-indicator"></span>
                        <span class="form-text">Yes, I understand that this action cannot be undone and I want to overwrite all changes.</span>
                    </label>
                </div>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" disabled data-restore-default-modal-btn data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text export__btn">
                        Confirm
                    </span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline">
                    <span class="btn__text">
                        Cancel
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
