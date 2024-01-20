{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/bottom-sticky.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/bottom-sticky.tpl"}
{else}
    {if $type == "domainsearch"}
        <div id="bottom-action-anchor" class="bottom-action-anchor"></div>
        <div class="bottom-action-sticky hidden" data-fixed-actions href="#bottom-action-anchor">
            <div class="container">
                <div class="sticky-content">
                    <div class="badge badge-circle-lg" id="cartItemCount">0</div>
                    <span class="m-l-1x">{$rslang->trans('domains.domains_selected')}</span>
                </div>
                <div class="sticky-actions">
                    <a href="cart.php?a=confdomains" id="btnDomainContinue" class="btn btn-lg btn-primary" data-btn-loader>
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
    {elseif $type == "productdomian"}
        <div id="bottom-action-anchor" class="bottom-action-anchor"></div>
        <div class="bottom-action-sticky hidden" data-fixed-actions href="#bottom-action-anchor">
            <div class="container">
                <div class="sticky-content">
                    <div class="badge badge-circle-lg" id="cartItemCount">0</div>
                    <span class="m-l-1x">{$rslang->trans('domains.domains_selected')}</span>
                </div>
                <div class="sticky-actions">
                    <button id="btnDomainContinue" type="submit" class="btn btn-lg btn-primary" disabled="disabled" data-btn-loader>
                        <span><i class="ls ls-share"></i><span class="btn-text">{$LANG.continue}</span></span>
                        <div class="loader loader-button hidden">
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                        </div>
                    </button>
                </div>
            </div>
        </div>
    {/if}
{/if}