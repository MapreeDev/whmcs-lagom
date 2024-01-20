{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/suggested.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/suggested.tpl"}
{else}
    <div class="section suggested-domains{if !$showSuggestionsContainer} hidden{/if}">
        <div class="section-header">
            <h2 class="section-title">{lang key='orderForm.suggestedDomains'}</h2>        
            <p class="section-desc">{lang key='domainssuggestionswarnings'}</p>
        </div>
        <ul class="domain-lookup-result list-group hidden" id="domainSuggestions">
            <li class="domain-suggestion list-group-item hidden">
                <div class="content">
                    <span class="domain"></span><span class="extension"></span>
                    <span class="promo hidden">
                        <span class="sales-group-hot label label-danger hidden">{lang key='domainCheckerSalesGroup.hot'}</span>
                        <span class="sales-group-new label label-success hidden">{lang key='domainCheckerSalesGroup.new'}</span>
                        <span class="sales-group-sale label label-purple hidden">{lang key='domainCheckerSalesGroup.sale'}</span>  
                    </span>
                </div>
                <div class="actions">
                    <span class="price price-xs price-right"></span>
                    <div class="btn-group btn-group-remove">
                        <button type="button" class="btn btn-sm {if $RSThemes.styles.vars.futuristic}btn-outline btn-default{else}btn-primary-faded{/if} btn-add-to-cart" data-whois="1" data-domain="" {if $RSThemes.styles.vars.futuristic}data-system-style="futuristic"{/if}>
                            <span class="to-add">{$LANG.addtocart}</span>
                            <span class="added"><i class="ls ls-check"></i>{lang key='domaincheckeradded'}</span>
                            <span class="unavailable">{$LANG.domaincheckertaken}</span>
                        </button>
                        <button type="button" class="btn btn-sm btn-primary btn-remove-domain hidden" data-system-template="{$template}" data-domain="" title="{$LANG.orderForm.remove}" {if $RSThemes.styles.vars.futuristic}data-system-style="futuristic"{/if}>
                            <i class="ls ls-trash"></i> 
                            <div class="loader loader-button hidden">
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                            </div>
                        </button>
                    </div>
                    <button type="button" class="btn btn-primary domain-contact-support hidden">{lang key='domainChecker.contactSupport'}</button>
                </div>
            </li>
        </ul>
        <div class="more-suggestions hidden">
            <a id="moreSuggestions" href="#" onclick="loadMoreSuggestions(); return false;">{{lang key='domainsmoresuggestions'}|replace:"!":""}<i class="ls ls-sort-desc"></i></a>
            <span id="noMoreSuggestions" class="no-more small hidden">{lang key='domaincheckernomoresuggestions'}</span>
        </div>
    </div>
{/if}