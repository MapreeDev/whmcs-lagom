<div class="modal" id="cookieBoxTranslationsModal" data-cookiebox-translation-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default">{$lang.modal.cookie_box_translation.title}</h6>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body p-b-0x">
                <div class="row" data-cookiebox-translation-form>
                    {foreach $whmcsLanguages as $whmcsLanguage}
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label class="form-label">{ucfirst($whmcsLanguage)}</label>
                                <textarea class="form-control lang-{$whmcsLanguage}-input" name={$whmcsLanguage}>{if isset($cookiebox_settings[$whmcsLanguage])}{$cookiebox_settings[$whmcsLanguage]}{/if}</textarea>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
            <div class="modal__actions">
                <button class="btn btn--primary" type="button" data-cookiebox-translation-modal-submit data-btn-loader>
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">{$lang.general.save_changes}</span>
                </button>
                <a class="btn btn--default btn--outline" data-dismiss="lu-modal">
                    <span class="btn__text">{$lang.general.cancel}</span>
                </a>
            </div>
        </div>
    </div>
</div>