<div class="modal" id="translationModal" data-translation-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default">Menu item translation</h6>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <form 
                    id="menuItemTranslations" 
                    data-translation-modal-form
                    data-ajax-url="{$helper->url('Menu@menuItemTranslate',['templateName'=>$template->getMainName()])}"
                >
                    <div class="row">
                        {foreach $languages as $language}
                            <div class="col-sm-12 col-md-4">
                                <div class="form-group">
                                    <label class="form-label">{ucfirst($language)}</label>
                                    <input class="form-control lang-{$language}-input" type="text" value="" name=languages[{$language}]>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <input data-translation-modal-parent type="hidden" name="parent" value="">
                    <input data-translation-modal-index type="hidden" name="index" value="">
                </form>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" type="submit" form="menuItemTranslations" data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">Save Changes</span>
                </button>
                <a class="btn btn--default btn--outline" data-dismiss="lu-modal">
                    <span class="btn__text">Cancel</span>
                </a>
            </div>
        </div>
    </div>
</div>