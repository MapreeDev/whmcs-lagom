
{include file="orderforms/$carttpl/common.tpl"}
<div class="main-banner banner banner-home banner-{$siteBannerStyle}">
    <div class="container">
        <h1 class="banner-title">{lang key='orderForm.transferToUs'}</h1>
        <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainTransfer">
            <input type="hidden" name="a" value="addDomainTransfer">
            <input name="epp" type="hidden" value="">
            <div class="domain-search-input search-group search-group-combined">
                <div class="search-field search-field-lg">
                    <i class="search-field-icon lm lm-search"></i>
                    <input class="form-control form-control-lg" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                </div>
                <div class="search-group-btn">
                    <button  class="btn btn-lg btn-primary domain-check-availability{if $captcha} {$captcha->getButtonClass($captchaForm)}{/if}" type="submit" id="btnCheckAvailability">{$LANG.domainstransfer}</button>
                </div>
            </div>
            <div class="domain-search-auth form-group m-t-0">
                <div id="transferUnavailable" class="alert alert-lagom alert-warning slim-alert text-center hidden"></div>
            </div>
            {include file="orderforms/$carttpl/includes/domain/captcha.tpl"}
        </form>
    </div>
    {include file="$template/includes/common/svg-illustration.tpl" illustration="banner-bg"} 
</div>
<div class="main-body">
    <div class="container">
        <div class="m-w-lg m-h-a">
            {if $RSThemes['pages'][$templatefile]['config']['showFeaturedTLD'] == '1'}
            {include file="orderforms/$carttpl/includes/domain/featured-tlds.tpl"}
            {/if}
            {include file="orderforms/$carttpl/includes/domain/tld-pricing.tpl" domainTransfer="true"}
            {include file="orderforms/$carttpl/includes/domain/bottom-sticky.tpl" type="domainsearch"}
        </div>
    </div>
</div>
{* modals *}
{include file="orderforms/$carttpl/includes/domain/modal/epp-code.tpl"}
<script>
    jQuery(document).ready(function() {
        {if $invalid}
            jQuery('#primaryLookupSearching').toggle();
            jQuery('#primaryLookupResult').children().toggle();
            jQuery('#primaryLookupResult').toggle();
            jQuery('#DomainSearchResults').toggle();
            jQuery('.domain-invalid').toggle();
        {/if}
    });
</script>