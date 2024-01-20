{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-grid{if $mainGrid} {$mainGrid}{/if}">
        {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
        <div class="main-sidebar hidden-xs hidden-sm hidden-md {if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>{/if}
                {include file="orderforms/$carttpl/sidebar-categories.tpl"}
            {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
        </div>
        {/if}
        <div class="main-content{if $mainContentClasses} {$mainContentClasses}{/if}">
            {include file="orderforms/$carttpl/sidebar-categories-collapsed.tpl"}
            <h5>{lang key='orderForm.transferExtend'}*</h5>        
            <form method="post" action="{$WEB_ROOT}/cart.php" id="frmDomainTransfer">
                <input type="hidden" name="a" value="addDomainTransfer">
                <input name="epp" type="hidden" value="">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-body">
                                <div id="transferUnavailable" class="alert alert-warning slim-alert text-center hidden"></div>
                                <div class="form-group">
                                    <label for="inputTransferDomain">{lang key='domainname'}</label>
                                    <input type="text" class="form-control" name="domain" id="inputTransferDomain" value="{$lookupTerm}" placeholder="{lang key='yourdomainplaceholder'}.{lang key='yourtldplaceholder'}" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                                </div>
                                {if $captcha->isEnabled() && !$captcha->recaptcha->isEnabled()}
                                    <div class="form-group captcha-container" id="captchaContainer">
                                        <label>{lang key='cartSimpleCaptcha'}</label>
                                        <div class=" input-group w-100">
                                            <div class="input-group-addon">
                                                <img id="inputCaptchaImage" src="{$systemurl}includes/verifyimage.php" />
                                            </div>
                                            <input id="inputCaptcha" placeholder="{$LANG.enter_code}" type="text" name="code" maxlength="6" class="form-control" data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}" />
                                        </div>
                                    </div>
                                {elseif $captcha->isEnabled() && $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                    <div class="form-group recaptcha-container" id="captchaContainer"></div> 
                                {/if}
                                <button type="submit" id="btnTransferDomain" class="btn btn-primary {if $RSThemes.styles.name == "modern"}btn-lg{/if} btn-transfer {$captcha->getButtonClass($captchaForm)}">
                                    <span id="addToCart"><i class="ls ls-basket m-r-8"></i>{lang key="ordernowbutton"}</span>
                                    <span class="loader loader-button">
                                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <p class="text-light">* {lang key='orderForm.extendExclusions'}</p>
        </div>
    </div>
    {* modals *}
    {include file="orderforms/$carttpl/includes/domain/modal/epp-code.tpl"}
    {if ($lookupTerm && !$captchaError && !$invalid) || (!$captcha->isEnabled() && $lookupTerm && !$invalid)}
    <script>
        jQuery(document).ready(function() {
            {literal}
                setTimeout(function(){
                    jQuery('#btnTransferDomain').trigger('click');
                }, 500);
            {/literal}
        });
    </script>              
    {/if}
{/if}