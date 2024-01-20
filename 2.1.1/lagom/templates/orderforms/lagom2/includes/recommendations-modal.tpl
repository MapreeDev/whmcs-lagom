{if file_exists("templates/orderforms/$carttpl/includes/overwrites/recommendations-modal.tpl")}
    {include file="templates/orderforms/$carttpl/includes/overwrites/recommendations-modal.tpl"}
{else}
    {if in_array($templatefile, ['configureproductdomain', 'configureproduct'])}
        <div class="hidden" id="divProductHasRecommendations" data-value="{$productinfo.hasRecommendations}"></div>
    {/if}
    <div class="modal modal-lg fade modal-recomendations" id="recommendationsModal" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                    <h3 class="modal-title">
                        {if in_array($templatefile, ['viewcart', 'complete', 'checkout'])}
                            {lang key="recommendations.title.generic"}
                        {else}
                            {lang key="recommendations.title.addedTo"}
                        {/if}
                    </h3>
                </div>
                <div class="modal-body has-scroll">
                    {include file="templates/orderforms/$carttpl/includes/product-recommendations.tpl"}
                </div>
                <div class="modal-footer m-t-3x">
                    <a class="btn btn-primary btn-block btn-lg" href="#" id="btnContinueRecommendationsModal" data-dismiss="modal" role="button">
                        <span><i class="ls ls-share"></i>{$LANG.continue}</span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="product-recommendation clonable w-hidden hidden">
            <div class="header">
                <div class="cta">
                    <div class="price">
                        <span class="w-hidden hidden">{lang key="orderfree"}</span>
                        <span class="breakdown-price"></span>
                        <span class="setup-fee"><small>&nbsp;{lang key="ordersetupfee"}</small></span>
                    </div>
                    <button type="button" class="btn btn-sm btn-add">
                        <span class="text">{lang key="addtocart"}</span>
                        <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                    </button>
                </div>
                <div class="expander">
                    <i class="fas fa-chevron-right rotate" data-toggle="tooltip" data-placement="right" title="{lang key="recommendations.learnMore"}"></i>
                </div>
                <div class="content">
                    <div class="headline truncate"></div>
                    <div class="tagline truncate">
                        {lang key="recommendations.taglinePlaceholder"}
                    </div>
                </div>
            </div>
            <div class="body clearfix"><p></p></div>
        </div>
    </div>
{/if}    