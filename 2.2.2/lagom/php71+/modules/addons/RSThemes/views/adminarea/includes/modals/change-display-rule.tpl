<div class="modal" id="changeDisplayRule" data-change-display-rule-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title">Change Theme Display Rule</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Please confirm, that you'd like to change the "Display Rule", as this change will implement changes to your WHMCS theme. <a href="https://lagom.rsstudio.net/docs/website-builder/display-rules/" target="_blank">Learn more</a> about Display rules in our documentation.</p>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" data-change-display-rule-modal-confirm>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">
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