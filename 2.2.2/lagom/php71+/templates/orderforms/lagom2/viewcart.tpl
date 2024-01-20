{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <script>
        // Define state tab index value
        var statesTab = 10;
        var stateNotRequired = true;
    </script>    
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        <div class="main-content {if $mainContentClasses} {$mainContentClasses}{/if}">        
        {if $cartitems == 0}
            <div class="message message-no-data">
                <div class="message-image">
                    {include file="$template/includes/common/svg-icon.tpl" icon="basket"}                        
                </div>
                <h6 class="message-title">{$LANG.cartempty}</h6>
                <div class="message-action">
                    <a class="btn btn-primary" href="{$WEB_ROOT}/cart.php">
                        {$rslang->trans('order.start_shopping')}
                    </a>
                </div>
            </div>        
            {if $promoSliderExtension  && $promoBannerStatus eq '1'}
                {include file="$template/core/extensions/PromoBanners/promo-slide.tpl" setting="cart-view" class="m-t-3x"}
            {/if}
        {else}
            {if $promoerrormessage}
            <div class="alert alert-lagom alert-primary alert-danger" role="alert">
                <div class="alert-body">
                    {$promoerrormessage}
                </div>
            </div>
            {elseif $errormessage}
            <div class="alert alert-lagom alert-primary alert-danger" role="alert">
                <div class="alert-body">
                    <p>{$LANG.orderForm.correctErrors}:</p>
                    <ul>
                        {$errormessage}
                    </ul>
                </div>
            </div>
            {elseif $promotioncode && $rawdiscount eq "0.00"}
            <div class="alert alert-lagom alert-primary alert-info" role="alert">
                <div class="alert-body">
                    {$LANG.promoappliedbutnodiscount}
                </div>
            </div>
            {elseif $promoaddedsuccess}
            <div class="alert alert-lagom alert-primary alert-success" role="alert">
                <div class="alert-body">
                    {$LANG.orderForm.promotionAccepted}
                </div>
            </div>
            {/if}
            {if $bundlewarnings}
            <div class="alert alert-lagom alert-primary alert-warning" role="alert">
                <div class="alert-body">
                    <strong>{$LANG.bundlereqsnotmet}</strong><br />
                    <ul>
                        {foreach from=$bundlewarnings item=warning}
                            <li>{$warning}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
            {/if}
            {include file="orderforms/$carttpl/includes/viewcart/summary-table.tpl"}
            {*{include file="orderforms/$carttpl/includes/viewcart/choose-currency.tpl"}*}
            {if $RSThemes['pages'][$templatefile]['config']['hidePromoBox'] != "1"}
                {include file="orderforms/$carttpl/includes/viewcart/promo-code.tpl"}
            {/if}
            {if $hookOutput}
            <div class="section">
                {foreach $hookOutput as $output}
                    {$output|replace:'style="margin:20px 0;"':''|replace:'<div class="sub-heading"><span>':'<div class="section-header"><span class="section-title">'|replace:'<div class="sub-heading"><span class="primary-bg-color">':'<div class="section-header"><span class="section-title">'}
                {/foreach}
            </div>
            {/if}
            <script>
                window.langPasswordStrength = "{$LANG.pwstrength}";
                window.langPasswordWeak = "{$LANG.pwstrengthweak}";
                window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
                window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
                window.langPasswordTooShort = "{$rslang->trans('login.at_least_pass')}";
            </script>
            <form method="post" action="{$smarty.server.PHP_SELF}?a=checkout" name="orderfrm" class="billing-details-form" id="frmCheckout">
                <input type="hidden" name="submit" value="true" />
                
                {include file="orderforms/$carttpl/includes/viewcart/form-billing.tpl"}
                {include file="orderforms/$carttpl/includes/viewcart/form-domain-details.tpl"}
                {include file="orderforms/$carttpl/includes/viewcart/form-payment-gateway.tpl"}

                {if $showMarketingEmailOptIn}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{lang key='emailMarketing.joinOurMailingList'}</h2>
                        <p class="section-desc">{$marketingEmailOptInMessage}</p>
                    </div>
                    <div class="section-body">
                        <div class="panel panel-switch m-w-288{if $marketingEmailOptIn} checked{/if}">
                            <div class="panel-body">
                                <span class="switch-label">{$rslang->trans('generals.receive_emails')}</span>
                                <label class="switch switch--lg switch--text">
                                    <input class="switch__checkbox" type="checkbox" name="marketingoptin" value="1" {if $marketingEmailOptIn} checked{/if}>
                                    <span class="switch__container"><span class="switch__handle"></span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
                {if $shownotesfield}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.orderForm.additionalNotes}</h5>
                    </div>
                    <div class="section-body">
                        <textarea name="notes" class="form-control" rows="4" placeholder="{$LANG.ordernotesdescription}">{$orderNotes}</textarea>
                    </div>
                </div>
                {/if}
                {if $captcha}
                    {include file="$template/includes/captcha.tpl"}
                {/if}
                {if $servedOverSsl}
                <div class="section">
                    <div class="section-body">
                        <div class="alert alert-warning checkout-security-msg">
                            <div class="alert-body">
                                <i class="ls ls-lock"></i>
                                {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
                <input class="hidden" type="checkbox" name="accepttos" id="accepttos" />
                <button type="submit" id="submit-checkout" class="hidden btn btn-primary btn-lg {if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}">
                    {$LANG.completeorder}
                </button>
            </form>
            <script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
            <script>
                var hideCvcOnCheckoutForExistingCard = '{if $canUseCreditOnCheckout && $applyCredit && ($creditBalance->toNumeric() >= $total->toNumeric())}1{else}0{/if}';
            </script>
        {/if}
        </div>
        <div class="main-sidebar main-sidebar-lg">
            <div class="sidebar-sticky sidebar-sticky-summary" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
                <div class="panel panel-summary panel-summary-{$summaryStyle} order-summary" id="orderSummary">
                    <div class="loader" id="orderSummaryLoader" style="display: none;">
                    {if $summaryStyle == 'default'}
                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                    {else}
                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                    {/if}
                    </div>
                    <div class="panel-heading">
                        <h2 class="panel-title">{$LANG.ordersummary}</h2>
                    </div>
                    {include file="orderforms/$carttpl/ordersummary-checkout.tpl"}
                </div>
                {if $accepttos}
                    <div class="checkbox m-t-0" id="tos-checkbox">
                        <label>
                            <input class="icheck-control" type="checkbox" data-tos-checkbox />
                            <span>{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></span>
                        </label>
                    </div>
                {/if}
            </div>
        </div>
    </div>

    {* end of .main-grid *}

    <div class="order-summary order-summary-mob is-fixed" id="orderSummary" data-fixed-actions href="#orderSummary">    
        <button type="button" class="btn btn-lg btn-primary-faded btn-checkout{if $cartitems == 0} disabled{/if}" {if $cartitems == 0} disabled{/if} data-btn-loader id="checkout">
            <span><i class="ls ls-share"></i>{$LANG.orderForm.checkout}</span>
            <div class="loader loader-button hidden">
                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
            </div>
        </button>
    </div>
    
    {* modals *}
    {include file="orderforms/$carttpl/includes/viewcart/modal/empty-cart.tpl"}
    {include file="orderforms/$carttpl/includes/viewcart/modal/remove-item.tpl"}
    {include file="orderforms/$carttpl/includes/viewcart/modal/remove-addon.tpl"}
    {include file="orderforms/$carttpl/includes/viewcart/modal/estimate-taxes.tpl"}
    {include file="orderforms/$carttpl/includes/recommendations-modal.tpl"}
{/if}
