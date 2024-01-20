<div 
    class="modal" 
    id="reimport-menu" 
    data-modal-reimport-menu
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=QuickApi&method=buildDisplayMenu&displayId={$displayRuleId}"
> 
    <div class="modal__dialog">
        <div class="modal__content"> 
            <div class="modal__top top">
                <div class="top__title">Restore Default Menus</div>
                <div class="top__toolbar">
                    <button 
                        class="close btn btn--xs btn--icon btn--link" 
                        data-dismiss="lu-modal" 
                        aria-label="Close"
                        data-modal-reimport-menu-close
                    >
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <div data-modal-reimport-menu-info>
                    <p class="text-gray p-3">During this process we'll completely delete all menus linked to the current display rule from database, and then we'll replace them with the default navigation menus. Please avoid closing this pop-up or your web browser during this process. If you do, it could disrupt the import, and your menus might not work properly.</p>
                    <div class="form-group m-t-3x m-b-4x">
                        <label class="checkbox m-t-0x align-items-start">
                            <input class="form-checkbox" type="checkbox" name="reimport-menu-confirm" data-modal-reimport-menu-confirm> 
                            <span class="form-indicator"></span>
                            <span class="form-text">Yes, I understood</span>
                        </label>
                    </div>
                </div>
                <div class="is-hidden" data-modal-reimport-menu-refresh>
                    <p class="text-gray p-3 m-b-4x">We're currently restoring the menu, please refrain from closing your browser.</p>
                </div>
                <div class="is-hidden" data-modal-reimport-menu-success>
                    <p class="m-b-4x text-center p-3">
                       <span class="text-gray">Default menu restoration has been</span> <b>completed successfully</b>.
                    </p>
                </div>
            </div>
            <div class="modal__actions" data-modal-reimport-menu-actions>
                <button 
                    class="btn" 
                    disabled data-modal-reimport-menu-btn
                >
                    <span class="btn__text">
                        Confirm
                    </span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <button 
                    data-dismiss="lu-modal" 
                    aria-label="Close" 
                    type="button" 
                    class="btn btn--default btn--outline"
                    data-modal-reimport-menu-close
                >
                    <span class="btn__text">
                        Cancel
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
