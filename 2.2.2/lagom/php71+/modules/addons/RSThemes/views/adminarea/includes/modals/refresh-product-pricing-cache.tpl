<div 
    class="modal" 
    id="refresh-product-pricing-cache" 
    data-modal-refresh-product-pricing-cache
    data-ajax-url="{$whmcsURL}/modules/addons/RSThemes/src/Api/adminApi.php?controller=ProductPrice&method=reloadPrice&startFrom="
> 
    <div class="modal__dialog">
        <div class="modal__content"> 
            <div class="modal__top top">
                <div class="top__title">Refresh Product Pricing Cache</div>
                <div class="top__toolbar">
                    <button 
                        class="close btn btn--xs btn--icon btn--link" 
                        data-dismiss="lu-modal" 
                        aria-label="Close"
                        data-modal-refresh-product-pricing-cache-close
                    >
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <div data-modal-refresh-product-pricing-cache-info>
                    <p class="text-gray p-3">The product cache will be refreshed. This may take up to several minutes, do not close the modal or browser during this process.</p>
                    <div class="form-group m-t-3x m-b-4x">
                        <label class="checkbox m-t-0x align-items-start">
                            <input class="form-checkbox" type="checkbox" name="refresh-product-pricing-cache-confirm" data-modal-refresh-product-pricing-cache-confirm> 
                            <span class="form-indicator"></span>
                            <span class="form-text">Yes, I understood</span>
                        </label>
                    </div>
                </div>
                <div class="is-hidden" data-modal-refresh-product-pricing-cache-refresh>
                    <p class="text-gray p-3">Refreshing pricing cache in progress, do not close your browser.</p>
                    <div class="progress m-t-3x m-b-2x">
                        <div class="progress__bar">
                            <div class="progress__fill" data-modal-refresh-product-pricing-cache-progress></div>
                        </div>
                    </div>
                    <div class="d-flex w-100 m-t-2x m-b-4x justify-content-center align-items-center p-3">
                        <span class="p-r-1x text-gray">Done</span> <div class="font-weight--medium" data-modal-refresh-product-pricing-cache-done>0</div>
                        <span class="p-h-1x text-gray">of</span> <div class="font-weight--medium" data-modal-refresh-product-pricing-cache-total>??</div>
                    </div>
                </div>
                <div class="is-hidden" data-modal-refresh-product-pricing-cache-success>
                    <p class="m-b-4x text-center p-3">
                       <span class="text-gray">Product Pricing Cache refresh</span> <b>completed successfully</b>.
                    </p>
                </div>
            </div>
            <div class="modal__actions" data-modal-refresh-product-pricing-cache-actions>
                <button 
                    class="btn" 
                    disabled data-modal-refresh-product-pricing-cache-btn
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
                    data-modal-refresh-product-pricing-cache-close
                >
                    <span class="btn__text">
                        Cancel
                    </span>
                </button>
            </div>
        </div>
    </div>
</div>
