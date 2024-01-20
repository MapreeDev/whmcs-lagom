<div class="modal seo-translation-modal" id="{$type}SeoTranslationModal" >
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default"></i>{$label}</h6>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body has-scroll p-b-0x">
                <form id="{$type}SeoTranslationFrom" data-seo-form data-ajax-url="{$helper->url('Page@getSeoTranslationText',['templateName'=>$template->getMainName()])}">
                    <div class="row">
                        {foreach $whmcsLanguages as $whmcsLanguage}
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="form-label">{ucfirst($whmcsLanguage)}</label>
                                    <textarea class="form-control lang-{$whmcsLanguage}-input" type="text" value="" name=languages[{$whmcsLanguage}]></textarea>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <input type="hidden" name="type" value="{$type}">
                </form>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" type="submit" form="{$type}SeoTranslationFrom" >
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader preloader--light"></span>
                </button>
                <a class="btn btn--default btn--outline" data-dismiss="lu-modal">
                    <span class="btn__text">Cancel</span>
                </a>
            </div>
        </div>
    </div>
</div>
