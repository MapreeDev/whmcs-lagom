
{include file="orderforms/$carttpl/common.tpl"}
<div class="main-banner banner-home banner-{$siteBannerStyle}">
    <div class="container">
        <h1 class="banner-title">{$LANG.findyourdomain}</h1>
        <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
            <input type="hidden" name="a" value="checkDomain">
            <div class="domain-search-input search-group search-group-lg search-group-combined">
                <div class="search-field">
                    <input class="form-control"  type="text" name="domain" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                    <div class="search-field-icon"><i class="lm lm-search"></i></div>
                </div>
                <div class="search-group-btn">
                    <button class="btn btn-primary domain-check-availability {if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}" type="submit" id="btnCheckAvailability">
                        <span>{$LANG.search}</span>
                        <div class="loader loader-button">
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                        </div>
                    </button>
                </div>
            </div>
            {include file="orderforms/$carttpl/includes/domain/captcha.tpl" pageClass="rspage-modern"}
        </form>
    </div>
    {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-bg"} 
</div>
<div class="main-body">
    <div class="container">
        <div class="m-w-lg m-h-a">
            {* <div class="section domain-lookup-loader message message-lg hidden" id="primaryLookupSearching">
                <div class="loader">
                    {include file="$template/includes/common/loader.tpl"}  
                </div>
            </div> *}
            <div class="section hidden" id="DomainSearchResults" data-scroll-to-results="false">
                <div class="domain-checker-result-headline" id="searchDomainInfo">
                    <div class="hidden" id="primaryLookupResult">
                        {include file="orderforms/$carttpl/includes/domain/search-result.tpl"}
                    </div>
                </div>
                {if $spotlightTlds}
                    {include file="orderforms/$carttpl/includes/domain/spotlight.tpl"}
                {/if}
                {include file="orderforms/$carttpl/includes/domain/suggested.tpl"}
            </div>
            {if $RSThemes['pages'][$templatefile]['config']['showFeaturedTLD'] == '1'}
            {include file="orderforms/$carttpl/includes/domain/featured-tlds.tpl"}
            {/if}
            {include file="orderforms/$carttpl/includes/domain/tld-pricing.tpl"}
            {include file="orderforms/$carttpl/includes/domain/bottom-sticky.tpl" type="domainsearch"}
        </div>
    </div>
</div>
{if $invalid}
<script>
    jQuery(document).ready(function() {
        jQuery('#primaryLookupSearching').toggle();
        jQuery('#primaryLookupResult').children().toggle();
        jQuery('#primaryLookupResult').toggle();
        jQuery('#DomainSearchResults').toggle();
        jQuery('.domain-invalid').toggle();
    });
</script>
{/if}

{if ($lookupTerm && !$captchaError && !$invalid) || (!$captcha->isEnabled() && $lookupTerm && !$invalid)}
<script>
    jQuery(document).ready(function() {
        {literal}
            setTimeout(function(){
                jQuery('#btnCheckAvailability').trigger('click');
            }, 500);
        {/literal}
    });
</script>              
{/if}