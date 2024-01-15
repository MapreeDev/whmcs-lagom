{if file_exists("templates/orderforms/$carttpl/includes/viewcart/overwrites/promo-code.tpl")}
    {include file="templates/orderforms/$carttpl/includes/viewcart/overwrites/promo-code.tpl"}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.cartpromo}</h2>
        </div>
        <div class="section-body">
            {if $promotioncode}
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="promo-code-description">
                            <i class="ls ls-addon"></i>
                            <span>{$promotiondescription}</span>
                        </div>
                    </div>
                    <div class="panel-footer d-flex space-between">
                        <div class="content">
                            <span class="code">{$promotioncode} </span>
                        </div>
                        <div class="content">
                            <a href="{$WEB_ROOT}/cart.php?a=removepromo" class="btn btn-default btn-sm"><i class="ls ls-trash"></i> {$LANG.orderForm.removePromotionCode}</a>
                        </div>
                    </div>
                </div>
            {else}
                <div class="search-box search-box-sm search-box-{$searchBoxStyle} {if $hookOutput}m-b-0{else}m-b-40{/if}">
                    <form method="post" action="cart.php?a=checkout">
                        <div class="search-group">
                            <div class="search-field">
                                <i class="search-field-icon lm lm-tag"></i>
                                <input class="form-control" type="text" name="promocode" id="inputPromotionCode" placeholder="{$LANG.orderPromoCodePlaceholder}"/>
                            </div>
                            <div class="search-group-btn">
                                <button class="btn btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}" type="submit" name="validatepromo">{$LANG.orderpromovalidatebutton}</button>
                            </div>
                        </div>
                    </form>
                </div>
            {/if}
            {if $promoBannerStatus}
                {include file="$template/core/extensions/PromoBanners/promo-slide.tpl" setting="cart-view" class="m-t-3x"}
            {/if}
        </div>
    </div>
{/if}    