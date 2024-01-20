{if file_exists("templates/$template/store/addon/overwrites/wp-pricing.tpl")}
    {include file="{$template}/store/addon/overwrites/wp-pricing.tpl"}  
{else}  
    <div class="main-grid main-grid-order">
        <div class="main-content">
            {foreach $clientServices as $service}
            {if $service['addon']}
                <div class="package package-sm package-horizontal package-horizontal-inline packageid-{$service['service']->id}">
                    <div class="package-body">
                        <div class="package-content">                    
                            <h3 class="package-title">{$service['service']->domain}</h3>
                            <div class="package-status">
                                <span class="label label-primary-faded">{$service['service']->product->name}</span>
                            </div>
                        </div>
                        <div class="package-footer">
                            <div class="price price-xs price-left">
                                {if $service['addon']->isFree()}
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$LANG.orderpaymenttermfree
                                        priceType="free"
                                    }  
                                {else}
                                    {include file="$template/includes/common/price.tpl" 
                                        price=$service['addonPrice']->price()
                                        priceCycle=$service['addonPrice']->cycle()|lower
                                        priceType=($service['addon']->isOneTime()) ? 'onetime' : false
                                    }
                                {/if}
                            </div>                       
                            <button class="btn btn-primary btn-add-to-cart"
                                data-product-name="{$service['addon']->name}"
                                data-serviceid="{$service['service']->id}"
                                data-addonid="{$service['addon']->id}"
                                data-domain-name="{$service['service']->domain}"
                                data-price="{$service['addonPrice']->price()->toNumeric()}">
                                {lang key='addtocart'}
                            </button>
                        </div>
                    </div>
                </div>
            {/if}
            {/foreach} 
        </div>
        <div class="main-sidebar main-sidebar-lg">                                
            <div class="sidebar-sticky" {if $RSThemes.addonSettings.show_affixed_navigation == 'enabled'}data-sidebar-sticky{/if}>
                <form method="post" class="cart" data-role="cart-form" action="{fqdnRoutePath('store-add-addons')}">
                    <input type="hidden" name="servicemap">
                    <div class="panel panel-summary panel-summary-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">{$LANG.ordersummary}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="summary-content hidden">
                                <ul class="summary-list order-summary-list">
                                    <li class="list-item list-item-main list-item-template hidden">
                                        <span class="item-name">
                                            <p class="name"></p>
                                            <p class="domain"></p>
                                        </span>
                                        <span class="item-value"></span>
                                        <span class="item-actions">
                                            <a href="#" data-toggle="tooltip" title="{$LANG['orderForm']['remove']}"><i class="ls ls-trash"></i></a>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="price price-left-h">
                                <span class="price-total">{lang key='store.addon.wptk.totalInCart'}</span> 
                                <div class="price-amount"><span>{$activeCurrency->prefix}</span><span class="amt">0.00</span></div>
                            </div>
                            <div class="summary-actions">
                                <button type="submit" class="btn btn-lg btn-primary btn-checkout">
                                    <span><i class="ls ls-share"></i>{$LANG.continue}</span>
                                    <div class="loader loader-button hidden" >
                                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>  
        </div>     
    </div>
    <script>
        $(document).ready(function() {

            var cartTotal = 0;
            var ssoServiceId = {if $ssoService}{$ssoService->id}{else}0{/if};
            var changeServiceMap = function(callback)
            {
                var field = $('form[data-role="cart-form"]').find('input[name="servicemap"]');
                var value = $(field).val();
                try {
                    value = JSON.parse(value);
                } catch (e) {
                    value = {};
                }
                $(field).val(
                    JSON.stringify(
                        callback(value)
                    )
                );
            };
            $('#pricing .package .btn-add-to-cart').click(function(e) {
                e.preventDefault();
                if ($(this).hasClass('disabled')) {
                    return;
                }
                var serviceId = $(this).data('serviceid'),
                    addonId = $(this).data('addonid');
                var row = $('.summary-content .list-item-template').clone()
                    .removeClass('list-item-template hidden')
                    .find('.item-name .name').text($(this).data('product-name')).end()
                    .find('.item-name .domain').text($(this).data('domain-name')).end()
                    .find('.item-value').text($(this).data('price')).end()
                    .attr('data-serviceid', $(this).data('serviceid'))
                    .attr('data-price', $(this).data('price'));
                changeServiceMap(function(serviceMap) {
                    serviceMap[serviceId] = addonId;
                    return serviceMap;
                });
                $('.order-summary-list').append(row);
                $('.summary-content, .order-summary-actions, .order-summary-mob').removeClass('hidden');
                $('body').addClass('mob-is-actions-lg');
                $('.message-no-data').addClass('hidden');
                cartTotal += parseFloat($(this).data('price'));
                $('.price-amount > .amt').text(cartTotal.toFixed(2));
                $(this).closest('.package').find('.btn-add-to-cart').removeClass('btn-primary').addClass('btn-info').html('<i class="lm lm-check"></i>{$LANG.domaincheckeradded}');
            });
            $(document).on('click', '.item-actions', function (e) {
                e.preventDefault();
                var serviceId = $(this).closest('.list-item').data('serviceid');
                var $removeItem = $('.list-item[data-serviceid='+serviceId+']');
                
                cartTotal -= $removeItem.data('price');
                $('.price-amount > .amt').text(cartTotal.toFixed(2));
                $('.packageid-' + serviceId).find('.btn-add-to-cart').removeClass('btn-info').addClass('btn-primary').html("{$LANG['orderForm']['addToCart']}")
                changeServiceMap(function(serviceMap) {
                    if (serviceMap.hasOwnProperty(serviceId)) {
                        delete serviceMap[serviceId];
                    }
                    return serviceMap;
                });
                if ($('.order-summary-list .list-item:not(.list-item-template)').length <= 2) {
                    $('.summary-content, .order-summary-actions, .order-summary-mob').addClass('hidden');
                    $('.message-no-data').removeClass('hidden');
                    $('body').removeClass('mob-is-actions-lg');
                    if ($('body > .overlay').is(':visible')){
                        $('#orderSummaryMob').find('.btn-rounded').trigger('click');
                    }
                    $removeItem.remove();
                } else {
                    $removeItem.remove();
                }
            });
            // pre-add the service we used to SSO from
            if (ssoServiceId) {
                $('.btn-add-to-cart[data-serviceid="' + ssoServiceId + '"]').click();
            }
        });
    </script>
{/if}    