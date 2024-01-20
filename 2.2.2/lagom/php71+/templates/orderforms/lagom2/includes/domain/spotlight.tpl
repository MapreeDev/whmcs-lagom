{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/spotlight.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/spotlight.tpl"}
{else}
    <div class="section spotlight-tlds new" id="spotlightTlds">
        <div class="section-header">
            <h2 class="section-title">{lang key='featuredProduct'}</h2>
        </div> 
        <div class="section-body">
            <div class="spotlights">
                {foreach $spotlightTlds as $key => $data}
                    <div class="spotlight-col swiper-slide col">
                        <div class="spotlight" id="spotlight{$data.tldNoDots}">
                            <div class="spotlight-body">
                                <div class="spotlight-top">
                                    <div class="spotlight-price">
                                        {if $data.group == "hot"}
                                            {assign var="grouplabel" value="danger"}
                                        {elseif $data.group == "new"}
                                            {assign var="grouplabel" value="success"}
                                        {elseif $data.group == "sale"}
                                            {assign var="grouplabel" value="warning"}
                                        {/if}
                                        {if $data.group}
                                            <span class="label label-corner label-{$grouplabel}">{$data.groupDisplayName}</span>
                                        {/if}
                                        <span>{$data.register}</span>
                                    </div>
                                    <div class="spotlight-content">
                                        <span class="extension">{$data.tld|replace:".":"<span>.</span>"}</span>
                                    </div>
                                    <div class="spotlight-footer domain-lookup-result">
                                        <button type="button" class="btn btn-sm {if $RSThemes.styles.vars.futuristic}btn-outline btn-default{else}btn-primary-faded{/if} btn-disabled btn-block unavailable btn-unavailable hidden" disabled="disabled">
                                            {lang key='domainunavailable'}
                                        </button>
                                        <button type="button" class="btn btn-sm {if $RSThemes.styles.vars.futuristic}btn-outline btn-default{else}btn-primary-faded{/if} btn-disabled btn-block invalid btn-unavailable hidden" disabled="disabled">
                                            {lang key='domainunavailable'}
                                        </button>
                                        <div class="btn-group btn-group-remove">
                                            <button type="button" class="btn btn-sm {if $RSThemes.styles.vars.futuristic}btn-outline btn-default{else}btn-primary-faded{/if} btn-add-to-cart hidden" data-whois="0" data-domain="" {if $RSThemes.styles.vars.futuristic}data-system-style="futuristic"{/if}>
                                                <span class="to-add">{lang key='orderForm.add'}</span>
                                                <span class="added"><i class="ls ls-check"></i>{lang key='domaincheckeradded'}</span>
                                                <span class="unavailable">{$LANG.domaincheckertaken}</span>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-primary btn-remove-domain hidden" data-system-template="{$template}" data-domain="" data-toggle="tooltip" title="{$LANG.orderForm.remove}" {if $RSThemes.styles.vars.futuristic}data-system-style="futuristic"{/if}>
                                                <i class="ls ls-trash"></i> 
                                                <div class="loader loader-button hidden">
                                                    {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                                </div>
                                            </button>
                                        </div>
                                        <button type="button" class="btn {if $RSThemes.styles.vars.futuristic}btn-outline btn-default{else}btn-primary-faded{/if} btn-sm btn-loading">
                                            <span class="invisible"></span>
                                            {if $RSThemes.styles.vars.futuristic}
                                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                                            {else}
                                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                                            {/if} 
                                        </button>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/if}