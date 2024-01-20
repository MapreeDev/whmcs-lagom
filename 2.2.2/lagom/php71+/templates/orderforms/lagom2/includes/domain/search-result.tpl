{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/search-result.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/search-result.tpl"}
{else}
    <div id="idnLanguageSelector" class="message message-no-data idn-language-selector idn-language hidden">
        <p class="text-center">
            {lang key='cart.idnLanguageDescription'}
        </p>
        <div class="form-group w-100 m-b-0">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <select name="idnlanguage" class="form-control">
                        <option value="">{lang key='cart.idnLanguage'}</option>
                        {foreach $idnLanguages as $idnLanguageKey => $idnLanguage}
                            <option value="{$idnLanguageKey}">{lang key='idnLanguage.'|cat:$idnLanguageKey}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <span class="field-error-msg help-block text-center text-danger">
                {lang key='cart.selectIdnLanguageForRegister'}
            </span>
        </div>
    </div>
    <div class="domain-available message message-lg message-success message-h">
        <div class="message-content m-w-lg">
            <div class="message-icon">
                <i class="lm lm-check"></i>
            </div>        
            <div class="message-body">
                <div class="message-title">
                    {$LANG.domainavailablemessage}
                </div>
                <div class="domain-price">
                    <div class="price price-sm price-left"></div>
                </div>
            </div>
            <div class="message-actions">          
                {if $configProductDomain && ($isBundle || $RSThemes['pages'][$templatefile]['config']['showContinueButton'] == "1")}
                    <button type="submit" class="btn btn-lg btn-primary" data-whois="0" data-domain="">
                        <span><i class="ls ls-share"></i><span class="btn-text">{$LANG.continue}</span></span>
                    </button>
                {else}
                    <div class="btn-group btn-group-remove">
                        <button type="submit" class="btn btn-lg btn-primary-faded btn-add-to-cart" {if $configProductDomain}data-product-domain=true{/if} data-whois="0" data-domain="">
                            <span class="to-add">{lang key='orderForm.addToCart'}</span>
                            <span class="added"><i class="lm lm-check"></i>{lang key='domaincheckeradded'}</span>
                            <span class="unavailable" style="display: none;">{$LANG.domaincheckertaken}</span>
                        </button>
                        <button type="button" class="btn btn-lg btn-primary btn-remove-domain hidden" data-system-template="{$template}" data-domain="" data-toggle="tooltip" title="{$LANG.orderForm.remove}">
                            <i class="lm lm-trash"></i> 
                            <div class="loader loader-button hidden">
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                            </div>
                        </button>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    {if $templatefile == "domainregister"}
        <div class="domain-tld-unavailable domain-checker-unavailable message message-lg message-danger message-h">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <div class="message-body">
                <p class="message-title">{lang key='orderForm.domainHasUnavailableTld'}</p>
            </div>
        </div>
    {/if}
    <div class="domain-unavailable message message-lg message-danger message-h">
        <div class="message-icon">
            <i class="lm lm-close"></i>
        </div>
        <div class="message-body">
            <p class="message-title">{lang key='orderForm.domainIsUnavailable'}</p>
        </div>
    </div>
    <div class="domain-invalid message message-lg message-danger message-h">
        <div class="message-icon">
            <i class="lm lm-close"></i>
        </div>        
        <div class="message-body">
            <p class="message-title">{lang key='orderForm.domainInvalid'}</p>
            <p class="text-light">
                {lang key='orderForm.domainInvalidCheckEntry'}
            </p>
        </div>
    </div>
    <div class="domain-error message message-lg message-danger message-h">
        <div class="message-icon">
            <i class="lm lm-close"></i>
        </div>
        <div class="message-body">
            <p class="message-title"></p>
        </div>    
    </div>
    {if $configProductDomain}
    <div class="transfer-eligible message message-lg message-success message-h">
        <div class="message-icon">
            <i class="lm lm-check"></i>
        </div>
        <div class="message-body">
            <p class="message-title">{lang key='orderForm.transferEligible'}</p>
            <p class="text-light">
                <span class="transfer-eligible-desc-uk hidden">{$rslang->trans('order.change_domains_ipstag')}</span>
                <span class="transfer-eligible-desc hidden">{lang key='orderForm.transferUnlockBeforeContinuing'}</span>
            </p>
            <div class="domain-price">
                <span class="domain-price-text">{lang key='orderForm.domainPriceTransferLabel'}</span>
                <div class="price price-sm price-left"></div>
            </div>
        </div>
        <div class="message-actions">
            <button type="submit" class="btn btn-primary btn-lg">
                <i class="ls ls-share m-r-8"></i>{lang key='continue'}
            </button>
        </div>
    </div>
    <div class="transfer-not-eligible message message-lg message-danger message-h">
        <div class="message-icon">
            <i class="lm lm-close"></i>
        </div>
        <div class="message-body">
            <p class="message-title">{lang key='orderForm.transferNotEligible'}</p>
            <p class="text-light">
                {lang key='orderForm.transferNotRegistered'}
                <br />
                {lang key='orderForm.trasnferRecentlyRegistered'}
                <br />
                {lang key='orderForm.transferAlternativelyRegister'}
            </p>
        </div>
    </div>
    {/if}
{/if}