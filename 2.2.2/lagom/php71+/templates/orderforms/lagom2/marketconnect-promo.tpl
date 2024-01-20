<div class="mc-promo {$promotion->getClass()}" id="promo_{$product->productKey}">
    {assign var="promo_icon" value=" "|explode:$promotion->getClass()}
    <div class="header">
        <div class="cta">
            <div class="price">
                {if $product->isFree()}
                    {lang key="orderfree"}
                {elseif $product->pricing()->first()}
                    {$product->pricing()->setQuantity($cartItem.qty)->first()->breakdownPrice()}
                {/if}
            </div>
            <button type="button" class="btn btn-sm btn-add" data-product-key="{$product->productKey}">
                <span class="text">
                    {lang key="addtocart"}
                </span>
                <span class="arrow">
                    <i class="ls ls-arrow-right"></i>
                </span>
            </button>
        </div>
        <div class="expander">
            <i class="lm lm-plus rotate down" data-toggle="tooltip" data-placement="right" title="Click to learn more"></i>
        </div>
        {* <div class="icon">
            {if $promo_icon[0] != "nordvpn" && $promo_icon[0] != "threesixtymonitoring"}
                {include file="lagom2/includes/common/svg-illustration.tpl" illustration="products/{$promo_icon[0]}" template="lagom2"}
            {/if}
        </div> *}
        <div class="content">
            <div class="headline">{$promotion->getHeadline()}</div>
            <div class="tagline">{$promotion->getTagline()}</div>
        </div>
    </div>
    <div class="body">
        {if $promotion->hasFeatures()}
            <ul>
                {foreach $promotion->getFeatures() as $feature}
                    <li><i class="ls ls-check"></i> {$feature}</li>
                {/foreach}
            </ul>
        {/if}
    </div>
</div>