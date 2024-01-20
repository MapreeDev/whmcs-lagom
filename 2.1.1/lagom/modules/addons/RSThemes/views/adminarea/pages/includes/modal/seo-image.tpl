<div class="modal" id="seoImageModal" data-seo-image-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title h6">Seo Image</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <form data-seo-image-form data-ajax-url="{$helper->url('Page@seoImage',['templateName' => $template->getMainName()])}" data-assets-url="{$whmcsURL}/templates/{$themeName}/assets">
                <div class="modal__body p-t-1x p-b-0x">
                    {include file="adminarea/pages/includes/modal/tabs.tpl" type='seo-image'}
                </div>
                <div class="modal__actions">
                    <button class="btn btn--primary" type="submit">
                        <span class="btn__text">Add Selected</span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">Cancel</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
