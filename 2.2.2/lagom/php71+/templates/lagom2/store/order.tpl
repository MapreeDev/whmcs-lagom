
{if file_exists("templates/$template/includes/store/order.tpl")}
    {include file="{$template}/includes/store/order.tpl"}  
{else}
<div class="container">
    <div class="store-order-container m-w-lg m-h-a">
        <h1>{$product->name}</h1>
        <p class="m-b-5x">{$product->description}</p>
        <form method="post" action="{routePath('cart-order-addtocart')}" id="frmAddToCart">
            <input type="hidden" name="pid" value="{$product->id}">
            <input type="hidden" name="domain_type" value="" id="inputDomainType">
            <div class="section payment-term">
                <div class="section-header">
                    <h2 class="section-title">{lang key='store.choosePaymentTerm'}</h2>
                </div>
                <div class="section-body">
                <div class="panel panel-form">
                    <div class="panel-body">
                        <select name="billingcycle" class="form-control input-lg">
                            {foreach $product->pricing()->allAvailableCycles() as $pricing}
                                <option value="{$pricing->cycle()}"{if $requestedCycle == $pricing->cycle()} selected{/if}>
                                    {if $pricing->isRecurring()}
                                        {if $pricing->isYearly()}
                                            {$pricing->cycleInYears()} - {$pricing->yearlyPrice()}
                                        {else}
                                            {$pricing->cycleInMonths()} - {$pricing->monthlyPrice()}
                                        {/if}
                                    {else}
                                        {$pricing->toFullString()}
                                    {/if}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{lang key='store.chooseDomain'}</h2>
                </div>
                <div class="section-body">
                    <div class="panel panel-default store-choose-domain">
                        <ul class="panel-tabs nav nav-tabs store-domain-tabs" role="tablist">
                            {if $requireDomain}
                                {if (count($domains) > 0 && $loggedin)}
                                    <li role="presentation" class="active"><a href="#existing-domain" aria-controls="existing-domain" role="tab" data-toggle="tab">{lang key='store.chooseExistingDomain'}</a></li>
                                {/if}
                                {if $allowSubdomains}
                                    <li role="presentation"><a href="#sub-domain" aria-controls="sub-domain" role="tab" data-toggle="tab">{lang key='store.subOfExisting'}</a></li>
                                {/if}
                                <li role="presentation"><a id="tabCustomDomainControl" href="#custom-domain" aria-controls="custom-domain" role="tab" data-toggle="tab">{lang key='store.domainAlreadyOwned'}</a></li>
                            {else}
                                <li role="presentation" class="active">
                                    <a id="tabNoDomain" href="#no-domain" role="tab" data-toggle="tab">
                                        {lang key='store.noDomain'}
                                    </a>
                                </li>
                            {/if}
                        </ul>
                        <div class="panel-body">
                            <div class="tab-content store-domain-tab-content">
                                {if $requireDomain}
                                    {if count($domains) > 0 || !$loggedin}                                    
                                        <div role="tabpanel" class="tab-pane active" id="existing-domain">
                                            {if $loggedin}
                                                <div class="store-domain-form">                                            
                                                    <select class="form-control input-lg" name="existing_domain">
                                                        {foreach $domains as $domain}
                                                            <option value="{$domain}"{if $domain == $selectedDomain} selected="selected"{/if}>
                                                                {$domain}
                                                            </option>
                                                        {/foreach}
                                                    </select>
                                                    <span class="domain-validation d-inline-flex align-center text-success">
                                                        <i class="lm lm-check"></i>
                                                        {lang key='store.eligible'}
                                                    </span>                                            
                                                </div>
                                            {else}
                                                <a href="{routePath('cart-order-login')}">{lang key='store.login'}</a> {lang key='store.addToExistingPackage'}
                                            {/if}
                                        </div>
                                    {/if}   
                                    {if $allowSubdomains} 
                                        <div role="tabpanel" class="tab-pane" id="sub-domain">
                                            <div class="store-domain-form">
                                                <div>
                                                    <div >
                                                        <input type="text" class="form-control input-lg subdomain-input" name="sub_domain" placeholder="Your desired subdomain"></div>
                                                    <div >
                                                        .
                                                    </div>
                                                    <div >
                                                        <select class="form-control input-lg" name="existing_sld_for_subdomain" id="existing_sld_for_subdomain">
                                                            {foreach $domains as $domain}
                                                                <option value="{$domain}">{$domain}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <span class="domain-validation subdomain-validation d-inline-flex align-center"></span>
                                            </div>
                                        </div>
                                    {/if}   
                                    <div role="tabpanel" class="tab-pane" id="custom-domain">                                    
                                        <div class="store-domain-form">
                                            <input type="text" class="form-control domain-input input-lg" placeholder="example.com" name="custom_domain" value="{$customDomain}">
                                            <span class="domain-validation domain-input-validation d-inline-flex align-center"></span>
                                        </div>
                                    </div>
                                {else}
                                    <div role="tabpanel" class="tab-pane" id="no-domain">
                                        {lang key='store.noDomainRequired'}
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                    <div class="store-actions row">
                        <div class="col-md-5">
                            <a href="javascript:history.go(-1)" class="btn btn-default">
                                <i class="ls ls-arrow-left"></i>
                                {lang key='back'}
                            </a>
                        </div>
                        <div class="col-md-7 text-right">
                            <button type="submit" name="continue" value="1" class="btn btn-default">
                                {lang key='orderForm.continueShopping'}
                            </button>
                            <button type="submit" name="checkout" value="1" class="btn btn-primary">
                                <i class="ls ls-share"></i>
                                {lang key='orderForm.checkout'}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        {if $upsellProduct && $promotion}
        <div class="promo-slider promo-slider-{$promoSliderStyle}">
            <div class="promo-slider-wrapper">
                <div class="promo-slider-background">
                    <div class="promo-slider-shape">
                        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-shape"}
                    </div>
                </div>
                <div class="promo-slider-slides">
                    <div class="promo-slider-slide">
                        <div class="promo-slider-body">
                            <div class="promo-slider-content" data-animation-content>
                                <h2 class="promo-slider-title">{$promotion->getHeadline()}</h2>
                                <p class="promo-slider-desc p-lg">{$promotion->getTagline()}</p>
                                {if $promotion->getDescription()}
                                    <p class="promo-slider-desc">{$promotion->getDescription()}</p>
                                {/if}                    
                                {if $promotion->hasFeatures()}
                                    <ul class="promo-slider-desc">
                                        {foreach $promotion->getFeatures() as $highlight}
                                            <li>{$highlight}</li>
                                        {/foreach}
                                    </ul>
                                {/if}
                                <div class="promo-slider-actions">
                                <form method="post" action="{routePath('cart-order')}">
                                    <input type="hidden" name="pid" value="{$upsellProduct->id}">
                                    <button type="submit" class="btn btn-lg btn-primary-faded">
                                        {foreach $product->pricing()->allAvailableCycles() as $pricing}
                                            <span class="span-upsell span-upsell-{$pricing->cycle()}">
                                                {if is_null($upsellComparison->diff({$pricing->cycle()}))}
                                                    {$promotion->getCta()} {$upsellProduct->name} {lang key='store.forJust'} {$upsellProduct->pricing()->best()->breakdownPrice()}
                                                {else}
                                                    {$promotion->getCta()} {$upsellProduct->name} {lang key='store.forJust'} {$upsellComparison->diff({$pricing->cycle()})->breakdownPrice()} more
                                                {/if}
                                            </span>
                                        {/foreach}
                                    </button>
                                </form>
                                </div>
                            </div>
                            <div class="promo-slider-more" data-animation-more><i class="ls ls-basket"></i>{$rslang->trans('market_connect.order')}</div>
                        </div>
                        <div class="promo-slider-icons" data-animation-icons>
                            {if $RSThemes.styles.iconType == "modern"}
                                {include file="$template/includes/common/svg-illustration.tpl" illustration="products/modern/{$promotion->getServiceName()}"}  
                            {else}
                                {include file="$template/includes/common/svg-illustration.tpl" illustration="products/{$promotion->getServiceName()}"} 
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {/if}
    </div>
</div>
<script>
    jQuery(document).ready(function(){

        var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
        })();
        jQuery('.store-order-container .subdomain-input').keyup(function() {
            delay(function(){
            jQuery('.subdomain-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('text-success text-danger');

            jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);

            var domainName = jQuery('.subdomain-input').val() + '.' + jQuery('#existing_sld_for_subdomain').val();

            WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + domainName, function(data) {
                if (data.valid) {
                    jQuery('.subdomain-validation').html('<i class="lm lm-check"></i> Valid').addClass('text-success');
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                } else {
                    jQuery('.subdomain-validation').html('<i class="lm lm-close"></i> Invalid domain').addClass('text-danger');
                }
            }, 'json');

            }, 1000 );
        });
        var delay2 = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
        })();
        jQuery('.store-order-container .domain-input').keyup(function() {
            delay2(function(){
            jQuery('.domain-input-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('text-success text-danger');
            jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
            WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + jQuery('.domain-input').val(), function(data) {
                if (data.valid) {
                    jQuery('.domain-input-validation').html('<i class="lm lm-check"></i> Valid').addClass('text-success');
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                } else {
                    jQuery('.domain-input-validation').html('<i class="lm lm-close"></i> Invalid domain').addClass('text-danger');
                }
            }, 'json');
            }, 1000 );
        });

        {if $requireDomain}
            jQuery('.store-domain-tabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                var tab = jQuery(e.target).attr('aria-controls');
                jQuery('#inputDomainType').val(tab);
                if (tab == 'custom-domain' || tab == 'sub-domain') {
                    var validationBlockSelector = tab == 'custom-domain' ? '.domain-input-validation' : '.subdomain-validation';
                    var validationHtml = jQuery(validationBlockSelector).html();
                    if (validationHtml == '<i class="lm lm-check"></i> Valid') {
                        jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                    } else {
                        jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                    }
                } else {
                    {if $loggedin}
                        jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                    {else}
                        jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                    {/if}
                }
            });
        {/if}
        jQuery('.store-domain-tabs li').removeClass('active');
        jQuery('.store-domain-tabs li:first-child a').click();
        {if !$loggedin && $requireDomain}
            jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
        {/if}
        jQuery('.payment-term').find('select').change(function() {
            var cycle = jQuery('.payment-term').find('option:selected').val();
            updateUpsellDetailsOnBillingCycleChange(cycle);
        });
        updateUpsellDetailsOnBillingCycleChange(jQuery('.payment-term').find('option:selected').val());
        {if $customDomain}
            jQuery('#tabCustomDomainControl').click();
            jQuery('.store-order-container .domain-input').trigger('keyup');
        {/if}
    });
    function updateUpsellDetailsOnBillingCycleChange(cycle) {
        jQuery('.span-upsell').hide();
        jQuery('.span-upsell-' + cycle).show();
    }
</script>
{/if}