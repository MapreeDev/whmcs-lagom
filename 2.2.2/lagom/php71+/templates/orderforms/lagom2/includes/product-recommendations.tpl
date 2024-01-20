{if file_exists("templates/orderforms/$carttpl/includes/overwrites/product-recommendations.tpl")}
    {include file="templates/orderforms/$carttpl/includes/overwrites/product-recommendations.tpl"}
{else}
    {if !empty($lastProduct)}
    <div class="product-added-panel">
        <div class="product-added-body">
            <div class="product-added-icon">
                <i class="lm lm-check"></i>
            </div>
            <div class="product-added-info">
                <div>
                    <span class="product-name">&nbsp;{$lastProduct.product.name} - </span>
                    <span class="product-group">&nbsp;{$lastProduct.product.productGroup.name}</span>
                </div>
                <div>
                    <span class="product-price">
                        {if !$lastProduct.pricing->isFree()}
                            &nbsp;{$lastProduct.pricing->price()->toFull()}
                            {if $lastProduct.pricing->setup() && $lastProduct.pricing->setup()->toNumeric() > 0}
                                + {$lastProduct.pricing->setup()->toFull()} {lang key="ordersetupfee"}
                            {/if}
                        {/if}
                    </span>
                    <span class="product-cycle">&nbsp;{lang key='orderpaymentterm'|cat:$lastProduct.pricing->cycle()}</span>
                </div>
            </div>
        </div>
    </div>
    {/if}
    <div class="product-recommendations-container">
        <div class="product-recommendations">
            {if in_array($templatefile, ['viewcart', 'checkout', 'complete'])}
                <h5 class="recommendation-title">{lang key="recommendations.explain.product"}</h5>
            {elseif !$recommendStyle && $templatefile != 'complete'}
                <h5 class="recommendation-title">{lang key="recommendations.explain.generic"}</h5>
            {elseif $templatefile == 'complete'}
                <div>
                    <h4 class="recommendation-title">{lang key="recommendations.title.generic"}</h4>
                    <p class="">
                        {if !empty($productRecommendations.order)}
                            {lang key="recommendations.title.yourOrder"}
                        {else}
                            {lang key="recommendations.title.yourProducts"}
                        {/if}
                    </p>
                </div>
            {/if}
            {if $productRecommendations}
                {foreach $productRecommendations as $categoryKey => $categoryRecommendations}
                    {if $templatefile == 'complete' && $categoryKey == 'own' && !empty($productRecommendations.own) && !empty($productRecommendations.order)}
                        <h5 class="recommendation-title">
                            {lang key="recommendations.title.yourProducts"}
                        </h5>
                    {/if}
                    {foreach $categoryRecommendations as $categoryRecommendation}
                        {if $recommendStyle && $templatefile != 'complete'}
                            <h5 class="recommendation-title">{lang key="recommendations.explain.ordered" productName=$categoryRecommendation.name}</h5>
                        {/if}
                        {foreach $categoryRecommendation.recommendations as $recommendation}
                            {assign var="price" value=$recommendation->pricing()->first()}
                            <div class="product-recommendation" data-color="{$recommendation.color}">
                                <div class="el-left" style="background-color:{$recommendation->color};"></div>
                                <div class="product-recommendation-content{if !$recommendation.shortDescription} header-static{/if}">
                                    <h6 class="product-recommendation-title truncate">{$recommendation.productGroup.name} - {$recommendation.name}</h6>
                                    <p class="product-recommendation-desc truncate">
                                        {$recommendation.shortDescription}
                                    </p>
                                </div>
                                <div class="product-recommendation-footer">
                                    <div class="product-recommendation-price">
                                        <h4 {if !$recommendation->isFree()}class="w-hidden hidden"{/if}>{lang key="orderfree"}</h4>
                                        {if !$recommendation->isFree() && $price}
                                            <h4 class="breakdown-price">
                                                {if $price->isOneTime()}
                                                    {$price->price()->toFull()}
                                                {elseif $price->isRecurring()}
                                                    {$price->breakdownPrice()}
                                                {/if}
                                            </h4>
                                        {/if}
                                        {if !$recommendation->isFree() && !is_null($price->setup()) && $price->setup()->toNumeric() > 0}
                                            <span class="setup-fee"><small>{$price->setup()->toFull()}&nbsp;{lang key="ordersetupfee"}</small></span>
                                        {/if}
                                    </div>
                                    <div class="product-recommendation-actions">
                                        <a class="btn btn-sm btn-add" href="{$recommendation->getRoutePath()}" role="button" style="background-color:{$recommendation->color};">
                                            {lang key="addtocart"}
                                        </a>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/foreach}
                {/foreach}
            {/if}
        </div>
    </div>
{/if}    