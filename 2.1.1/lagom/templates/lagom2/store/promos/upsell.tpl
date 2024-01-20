{if file_exists("templates/lagom2/store/promos/overwrites/upsell.tpl")}
    {include file="templates/lagom2/store/promos/overwrites/upsell.tpl"}  
{else}
    <div class="promo-slider promo-slider-default">
        <div class="promo-slider-wrapper">
            <div class="promo-slider-background">
                <div class="promo-slider-shape">
                    {include file="templates/lagom2/includes/common/svg-illustration.tpl" illustration="site/banner-shape" template="lagom2"}
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
                                <form method="post" action="{$targetUrl}">
                                    <input type="hidden" name="pid" value="{$product->id}">
                                    {if $serviceId}
                                        <input type="hidden" name="serviceid" value="{$serviceId}">
                                    {/if}
                                    <button class="btn btn-primary{if $promoSliderStyle == 'primary'}-faded{/if}" type="submit">
                                    {if $product->isFree()}
                                        {$promotion->getCta()}
                                        {lang key="orderfree"}
                                    {else}
                                        {$promotion->getCta()} {$product->name}
                                        {lang key="fromJust"}
                                        {if $product->pricing()->first()->isYearly()}
                                            {$product->pricing()->first()->yearlyPrice()}
                                        {elseif $product->pricing()->first()->isOneTime()}
                                            {$product->pricing()->first()->oneTimePrice()}
                                        {else}
                                            {$product->pricing()->first()->monthlyPrice()}
                                        {/if}
                                    {/if}
                                    </button>
                                    {if $promotion->getLearnMoreRoute()}
                                        <a class="btn btn-outline btn-default" href="{$promotion->getLearnMoreRoute()}">{lang key='learnmore'}...</a>
                                    {/if}
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="promo-slider-icons" data-animation-icons>
                        {include file="templates/lagom2/includes/common/svg-illustration.tpl" illustration="products/{$promotion->getServiceName()}" template="lagom2"} 
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}