
{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}	
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
        <form id="frmProductDomain">
            <input type="hidden" id="frmProductDomainPid" value="{$pid}" />
            <div class="panel panel-choose-domain">
                <div class="panel-body panel-domain-option">
                    <div class="content">
                        {if $incartdomains}
                            <label class="radio">
                                <input type="radio" class="icheck-control" name="domainoption" value="incart" id="selincart" /><span>{$LANG.cartproductdomainuseincart}</span>
                            </label>
                        {/if}
                        {if $registerdomainenabled}
                            <label class="radio">
                                <input type="radio" class="icheck-control" name="domainoption" value="register" id="selregister"{if $domainoption eq "register"} checked{/if} /><span>{$LANG.cartregisterdomainchoice|sprintf2:$companyname}</span>
                            </label>
                        {/if}
                        {if $transferdomainenabled}
                            <label class="radio">
                                <input type="radio" class="icheck-control" name="domainoption" value="transfer" id="seltransfer"{if $domainoption eq "transfer"} checked{/if} /><span>{$LANG.carttransferdomainchoice|sprintf2:$companyname}</span>
                            </label>
                        {/if}
                        {if $owndomainenabled}
                            <label class="radio">
                                <input type="radio" class="icheck-control" name="domainoption" value="owndomain" id="selowndomain"{if $domainoption eq "owndomain"} checked{/if} /><span>{$LANG.cartexistingdomainchoice|sprintf2:$companyname}</span>
                            </label>
                        {/if}
                        {if $subdomains}
                            <label class="radio">
                                <input type="radio" class="icheck-control" name="domainoption" value="subdomain" id="selsubdomain"{if $domainoption eq "subdomain"} checked{/if} /><span>{$LANG.cartsubdomainchoice|sprintf2:$companyname}</span>
                            </label>
                        {/if}
                    </div>
                </div>
                <div class="panel-body panel-domain-search panel-domain-search-{$searchBoxStyle}">
                    {if $incartdomains}
                        <div class="inline-form hidden" id="domainincart">
                            <div class="inline-form-element w-100">
                                <select class="form-control input-lg" id="incartsld" name="incartdomain">
                                    {foreach key=num item=incartdomain from=$incartdomains}
                                        <option value="{$incartdomain}">{$incartdomain}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="inline-form-element">                        
                                <button class="btn btn-lg btn-block btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}" type="submit">
                                    <span>{$LANG.orderForm.use}</span>
                                    <div class="loader loader-button">
                                        {if $searchBoxStyle == 'default'}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                        {else}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                        {/if}
                                    </div>
                                </button>
                            </div>
                        </div>
                    {/if}
                    {if $registerdomainenabled}
                        <div class="inline-form hidden" id="domainregister">
                            <div class="inline-form-element w-100">
                                <input class="form-control input-lg" type="text" placeholder="{$rslang->trans('order.search_domain')}" id="registersld" value="{$sld}" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                            </div>
                            <div class="inline-form-element">
                                <div class="dropdown" data-dropdown-select>
                                    <div class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                                        <input name="domaintld" id="registertld" type="hidden" data-dropdown-select-value value="{if $tld}{$tld}{else}{$registertlds[0]}{/if}">
                                        <div class="tld-select">
                                            <span data-dropdown-select-value-view>
                                                {if $tld}
                                                    {$tld}
                                                {else}
                                                    {$registertlds[0]}
                                                {/if}	
                                            </span>
                                            <b class="caret"></b>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu dropdown-menu-search pull-right">
                                        <div class="dropdown-header input-group align-center">
                                            <i class="input-group-icon lm lm-search"></i>
                                            <input class="form-control" placeholder="Search..." type="text" data-dropdown-select-search>
                                        </div>
                                        <div class="dropdown-menu-items has-scroll" data-dropdown-select-list>
                                            {foreach from=$registertlds item=listtld}
                                                <div class="dropdown-menu-item {if $tld == $listtld}active{elseif $registertlds[0] == $listtld}active{/if}" data-value="{$listtld}">
                                                    <a class="">{$listtld}</a>
                                                </div>	
                                            {/foreach}
                                        </div>
                                        <div class="dropdown-menu-item dropdown-menu-no-data">
                                            <span class="text-info text-large">
                                                {$LANG.norecordsfound}
                                            </span>
                                        </div>                                             
                                    </div>
                                </div>								
                            </div>
                            <div class="inline-form-element">                        
                                <button class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}" type="submit" >
                                    <span>{$LANG.orderForm.check}</span>
                                    <div class="loader loader-button">
                                        {if $searchBoxStyle == 'primary'}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                        {else}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                        {/if}
                                    </div>
                                </button>
                            </div>
                        </div>
                    {/if}
                    {if $transferdomainenabled}
                        <div class="inline-form hidden" id="domaintransfer">
                            <div class="inline-form-element w-100">
                                <input class="form-control input-lg" type="text" id="transfersld" placeholder="{$rslang->trans('order.search_domain')}" value="{$sld}" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}"/>
                            </div>
                            <div class="inline-form-element">
                                <div  class="dropdown" data-dropdown-select>
                                    <div class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                                        <input name="domaintld" id="transfertld" type="hidden" data-dropdown-select-value value="{if $tld}{$tld}{else}{$transfertlds[0]}{/if}">
                                        <div class="tld-select">
                                            <span data-dropdown-select-value-view>
                                                {if $tld}
                                                    {$tld}
                                                {else}
                                                    {$transfertlds[0]}
                                                {/if}	
                                            </span>
                                            <b class="caret"></b>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu dropdown-menu-search pull-right">
                                        <div class="dropdown-header input-group align-center">
                                            <i class="input-group-icon lm lm-search"></i>
                                            <input class="form-control" placeholder="Search..." type="text" data-dropdown-select-search>
                                        </div>
                                        <div class="dropdown-menu-items has-scroll" data-dropdown-select-list>
                                            {foreach from=$transfertlds item=listtld}
                                                <div class="dropdown-menu-item" data-value="{$listtld}">
                                                    <a class="">{$listtld}</a>
                                                </div>	
                                            {/foreach}
                                        </div>
                                        <div class="dropdown-menu-item dropdown-menu-no-data">
                                            <span class="text-info text-large">
                                                {$LANG.norecordsfound}
                                            </span>
                                        </div>       
                                    </div>	
                                </div>								
                            </div>
                            <div class="inline-form-element">                        
                                <button type="submit" class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}">
                                    <span>{$LANG.orderForm.transfer}</span>
                                    <div class="loader loader-button">                                        
                                        {if $searchBoxStyle == 'primary'}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                        {else}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                        {/if}
                                    </div>
                                </button>
                            </div>
                        </div>
                    {/if}
                    {if $owndomainenabled}
                        <div class="inline-form hidden" id="domainowndomain">
                            <div class="inline-form-element w-100">
                                <input type="text" id="owndomainsld" value="{$sld}" placeholder="{$LANG.yourdomainplaceholder}" class="form-control input-lg" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                            </div>
                            <div class="inline-form-element">
                                <input type="text" id="owndomaintld" value="{$tld|substr:1}" placeholder="{$LANG.yourtldplaceholder}" class="form-control input-lg" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.required'}" />
                            </div>
                            <div class="inline-form-element">                        
                                <button type="submit" class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}">
                                    <span>{$LANG.orderForm.use}</span>
                                    <div class="loader loader-button">
                                        {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                                    </div>
                                </button>
                            </div>
                        </div>
                    {/if}
                    {if $subdomains}
                        <div class="inline-form hidden" id="domainsubdomain">
                            <div class="inline-form-element w-100">
                                <input type="text" id="subdomainsld" value="{$sld}" placeholder="yourname" class="form-control input-lg" autocapitalize="none" data-toggle="tooltip" data-placement="top" data-trigger="manual" title="{lang key='orderForm.enterDomain'}" />
                            </div>
                            <div class="inline-form-element">
                                <div  class="dropdown" data-dropdown-select>
                                    <div class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true">
                                        <input name="domaintld" id="subdomaintld" type="hidden" data-dropdown-select-value value="{if $sld}{$sld}{else}{$subdomains[0]}{/if}">
                                        <div class="tld-select">
                                            <span data-dropdown-select-value-view>
                                                {if $sld}
                                                    {$sld}
                                                {else}
                                                    {$subdomains[0]}
                                                {/if}
                                            </span>
                                            <b class="caret"></b>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu dropdown-menu-search pull-right ps">
                                        <div class="dropdown-header input-group align-center">
                                            <i class="input-group-icon lm lm-search"></i>
                                            <input class="form-control" placeholder="{$LANG.search}..." type="text" data-dropdown-select-search>
                                        </div>
                                        <div class="nav-divider">
                                            <a href="">
                                                -----
                                            </a>
                                        </div>
                                        <div class="dropdown-menu-items" data-dropdown-select-list>
                                            {foreach $subdomains as $subid => $subdomain}
                                                <div class="dropdown-menu-item" data-value="{$subdomain}">
                                                    <a>{$subdomain}</a>
                                                </div>
                                            {/foreach}
                                        </div>
                                        <div class="dropdown-menu-item dropdown-menu-no-data">
                                            <span class="text-info text-large">
                                                {$LANG.norecordsfound}
                                            </span>
                                        </div>
                                        <div class="ps__rail-x">
                                            <div class="ps__thumb-x" tabindex="0"></div>
                                        </div>
                                        <div class="ps__rail-y">
                                            <div class="ps__thumb-y" tabindex="0"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="inline-form-element">                        
                                <button type="submit" class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}">
                                    <span>{$LANG.orderForm.check}</span>
                                    <div class="loader loader-button">
                                        {if $searchBoxStyle == 'primary'}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}
                                        {else}
                                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}
                                        {/if} 
                                    </div>
                                </button>
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
            {if $freedomaintlds}
                <p class="domain-suggestions-warning">* {$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</p>
            {/if}
        </form>
        {* <div id="primaryLookupSearching" class="domain-lookup-loader message message-lg message-no-data hidden">
            <div class="loader">
                {include file="$template/includes/common/loader.tpl"}  
            </div>
        </div>*}   
        <form method="post" action="{$WEB_ROOT}/cart.php?a=add&pid={$pid}&domainselect=1" id="frmProductDomainSelections">
            <input type="hidden" id="resultDomainOption" name="domainoption" />
            <input type="hidden" id="resultDomain" name="domains[]" />
            <input type="hidden" id="resultDomainPricingTerm" />
            <div id="DomainSearchResults" class="hidden">
                <div id="searchDomainInfo" class="domain-checker-result-headline">
                    <div id="primaryLookupResult" {if $isBundle || $RSThemes['pages'][$templatefile]['config']['showContinueButton'] == "1"}data-product-bundle{/if}>
                        {include file="orderforms/$carttpl/includes/domain/search-result.tpl" configProductDomain="true"}
                    </div>
                </div>
                {if $registerdomainenabled}
                    {if $spotlightTlds}
                        {include file="orderforms/$carttpl/includes/domain/spotlight.tpl" configProductDomain="true"}
                    {/if}
                    {include file="orderforms/$carttpl/includes/domain/suggested.tpl" configProductDomain="true"}
                {/if}
            </div>
            {include file="orderforms/$carttpl/includes/domain/bottom-sticky.tpl" type="productdomian"}
            
        </form>
    </div>
    {include file="orderforms/$carttpl/includes/recommendations-modal.tpl"}
{/if}