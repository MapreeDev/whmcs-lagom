{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
        <div class="main-sidebar hidden-sm hidden-md{if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky">{/if}
                {include file="orderforms/$carttpl/sidebar-categories.tpl"}
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
        </div>
        {/if}
        <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
            {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            <div class="search-box search-box-{$searchBoxStyle}">
                <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainChecker">
                    <input type="hidden" name="a" value="checkDomain">
                    <div class="domain-search-input search-group">
                        <div class="search-field search-field-lg">
                            <i class="search-field-icon lm lm-search"></i>
                            <input class="form-control form-control-lg"  type="text" name="domain" placeholder="{$LANG.findyourdomain}" value="{$lookupTerm}" id="inputDomain" data-toggle="tooltip" data-delay="100" data-placement="top" data-trigger="manual" title="{lang key='orderForm.domainOrKeyword'}" />
                        </div>
                        <div class="search-group-btn">
                            <button class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if} domain-check-availability {if $captcha}{$captcha->getButtonClass($captchaForm)}{/if}" type="submit" id="btnCheckAvailability">
                                <span>{$LANG.search}</span>
                                <div class="loader loader-button">
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                                </div>
                            </button>
                        </div>
                    </div>
                    {include file="orderforms/$carttpl/includes/domain/captcha.tpl"}
                </form>
            </div>
                <div id="DomainSearchResults" class="hidden">
                    {* <div id="primaryLookupSearching" class="domain-lookup-loader message message-lg message-no-data {if (!$lookupTerm || $captchaError || $invalid)}hidden{/if}">
                        <div class="loader">
                            {include file="$template/includes/common/loader.tpl"}  
                        </div>
                    </div> *}
                    <div class="domain-checker-result-headline" id="searchDomainInfo">
                        <div id="primaryLookupResult" class="hidden">
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
                <div class="section">
                    <div class="section-body">
                        <div class="row row-eq-height row-eq-height-sm">
                            <div class="col-md-{if $domainTransferEnabled}6{else}12{/if}">
                                <div class="domain-promo-box">
                                    <div class="promo-box-body">
                                        <div class="promo-box-content">
                                            <div class="promo-box-icon">
                                                {include file="$template/includes/common/svg-icon.tpl" icon="web-hosting"}  
                                            </div>
                                            <div class="promo-box-header">
                                                <h5>{lang key='orderForm.addHosting'}</h5>
                                                <p class="description">{lang key='orderForm.chooseFromRange'}</p>
                                            </div>
                                        </div>
                                        <div class="promo-box-content promo-box-content-between">
                                            <p class="promo-description">{lang key='orderForm.packagesForBudget'}</p>
                                            <a href="{$WEB_ROOT}/cart.php" class="btn btn-primary">
                                                {lang key='orderForm.exploreNow'}
                                            </a>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                            {if $domainTransferEnabled}
                                <div class="col-md-6">
                                    <div class="domain-promo-box">
                                        <div class="promo-box-body">
                                            <div class="promo-box-content">
                                                <div class="promo-box-icon">
                                                    {include file="$template/includes/common/svg-icon.tpl" icon="transfer-domain"}
                                                </div>
                                                <div class="promo-box-header">
                                                    <h5>{lang key='orderForm.transferToUs'}</h5>
                                                    <p class="description text-primary">{lang key='orderForm.transferExtend'}*</p>
                                                </div>
                                            </div>
                                            <div class="promo-box-content promo-box-content-between">
                                                <p class="promo-description">* {lang key='orderForm.extendExclusions'}</p>
                                                <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-primary">{lang key='orderForm.transferDomain'}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>    
                            {/if}
                        </div>
                    </div>
                </div>
                <div id="bottom-action-anchor" class="bottom-action-anchor"></div>
                <div class="bottom-action-sticky hidden" data-fixed-actions href="#bottom-action-anchor">
                    <div class="container">
                        <div class="sticky-content">
                            <div class="badge badge-circle-lg" id="cartItemCount">0</div>
                            <span class="m-l-1x">{$rslang->trans('domains.domains_selected')}</span>
                        </div>
                        <div class="sticky-actions">
                            <a class="btn btn-lg btn-primary" href="cart.php?a=confdomains" id="btnDomainContinue"  data-btn-loader>
                                <span>
                                    <i class="ls ls-share"></i>
                                    <span class="btn-text">{$LANG.continue}</span>
                                </span>
                                <div class="loader loader-button hidden" >
                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
        <script>
            jQuery(document).ready(function() {
                {if ($lookupTerm && !$captchaError && !$invalid) || (!$captcha->isEnabled() && $lookupTerm && !$invalid)}
                    {literal}
                        setTimeout(function(){
                            jQuery('#btnCheckAvailability').trigger('click');
                        }, 500);
                    {/literal}  
                {/if}
                {if $invalid}
                    jQuery('#primaryLookupSearching').toggle();
                    jQuery('#primaryLookupResult').children().toggle();
                    jQuery('#primaryLookupResult').toggle();
                    jQuery('#DomainSearchResults').toggle();
                    jQuery('.domain-invalid').toggle();
                {/if}
            });
        </script>
    </div>
{/if} 