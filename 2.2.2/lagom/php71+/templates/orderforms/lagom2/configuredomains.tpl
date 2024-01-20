{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}  
    <script>
    var _localLang = {
        'addToCart': '{$LANG.orderForm.addToCart|escape}',
        'addedToCartRemove': '{$LANG.orderForm.addedToCartRemove|escape}'
    }
    </script>
    {include file="orderforms/$carttpl/common.tpl"}
    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
        <form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains" id="frmConfigureDomains">
            <input type="hidden" name="update" value="true" />
                {if $errormessage}
                    <div class="alert alert-lagom alert-danger" role="alert">
                        <div class="alert-body">
                            <p>{$LANG.orderForm.correctErrors}:</p>
                            <ul>
                                {$errormessage}
                            </ul>
                        </div>
                    </div>
                {/if}
                {if $domains}
                <div class="section">
                    <div class="section-body">
                        {foreach $domains as $num => $domain}
                            <div class="panel panel-lg panel-default panel-form panel-domain-info{if $domain.fields} panel-separated{/if}">
                                <div class="panel-body">
                                    <div class="domain-info">
                                        <div class="domain-info-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="content-delivery-network"}      
                                        </div>
                                        <div class="domain-info-body">
                                            <div class="domain-info-top">
                                                <div class="domain-info-title">{$domain.domain}</div>
                                                <button type="button" class="btn btn-sm btn-default" onclick="removeItem('d', '{$num}')">
                                                    <i class="ls ls-trash"></i><span class="btn-text">{$LANG.orderForm.remove}</span>
                                                </button>
                                            </div>
                                            <div class="domain-info-bottom">
                                                {if $domain.hosting}
                                                    <span class="domain-info-hosting">
                                                        <span class="label label-success"><i class="ls ls-check"></i>{$LANG.cartdomainshashosting}</span>
                                                    </span>
                                                {elseif !$RSThemes.pages.configuredomains.config.displayProminentHosting}
                                                    <span class="domain-info-hosting">
                                                        <a href="{$WEB_ROOT}/cart.php" class="label label-primary-faded"><i class="ls ls-close"></i>{$LANG.cartdomainsnohosting}</a>
                                                    </span>
                                                {/if}
                                                <span class="domain-info-period">{$LANG.orderregperiod}: {$domain.regperiod} {$LANG.orderyears}</span>
                                            </div> 
                                        </div>
                                    </div>
                                    {if $domain.dnsmanagement || $domain.emailforwarding || $domain.idprotection}
                                        <div class="domain-info-addons row" data-inputs-container>
                                            {if $domain.dnsmanagement}
                                                <div class="col-lg-4">
                                                    <div class="panel panel-check{if $domain.dnsmanagementselected} checked{/if}" data-virtual-input>
                                                        <div class="check">
                                                            <label>
                                                                <input class="icheck-control" type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} {if !$domain.dnsmanagement} disabled{/if} />
                                                                <div class="check-content">
                                                                    <h6 class="check-title">{$LANG.domaindnsmanagement}<i class="ls ls-info-circle" data-toggle="tooltip" title="{$LANG.domainaddonsdnsmanagementinfo}"></i></h6>
                                                                    <p class="check-subtitle">{$domain.dnsmanagementprice} / {$domain.regperiod} {$LANG.orderyears}</p>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if $domain.idprotection}
                                                <div class="col-lg-4">
                                                    <div class="panel panel-check{if $domain.idprotectionselected} checked{/if}" data-virtual-input>
                                                        <div class="check">
                                                            <label>
                                                                <input class="icheck-control" type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} />
                                                                <div class="check-content">
                                                                    <h6 class="check-title">{$LANG.domainidprotection}<i class="ls ls-info-circle" data-toggle="tooltip" title="{$LANG.domainaddonsidprotectioninfo}"></i></h6>
                                                                    <p class="check-subtitle">{$domain.idprotectionprice} / {$domain.regperiod} {$LANG.orderyears}</p>
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if $domain.emailforwarding}
                                            <div class="col-lg-4">
                                                <div class="panel panel-check{if $domain.emailforwardingselected} checked{/if}" data-virtual-input>
                                                    <div class="check">
                                                        <label>
                                                            <input class="icheck-control" type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if}/>
                                                            <div class="check-content">
                                                                <h6 class="check-title"> 
                                                                    {$LANG.domainemailforwarding}
                                                                    <span class="ls ls-info-circle" data-toggle="tooltip" title="{$LANG.domainaddonsemailforwardinginfo}"></span>
                                                                </h6>                                               
                                                                <p class="check-subtitle">{$domain.emailforwardingprice} / {$domain.regperiod} {$LANG.orderyears}</p>
                                                            </div>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                        </div>
                                    {/if}
                                </div> 
                                {if $RSThemes.pages.configuredomains.config.displayProminentHosting && !$domain.hosting}
                                    <div class="panel-body panel-body-hosting">
                                        <h5 class="m-b-1x">{$rslang->trans('domains.domains_hosting.title')}</h5>
                                        <p>{$rslang->trans('domains.domains_hosting.desc')}</p>
                                        <div class="panel-actions">
                                            <a class="btn btn-primary" href="{$WEB_ROOT}/cart.php">{$rslang->trans('domains.domains_hosting.btn_text')}</a>
                                        </div>
                                        <div class="panel-icon">
                                            {include file="lagom2/includes/common/svg-illustration.tpl" illustration="products/sitebuilder"}
                                        </div>
                                    </div>
                                {/if}
                                {if $domain.eppenabled}
                                <div class="domain-info-additional panel-body">
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-4 col-lg-2">{$LANG.domaineppcode}</label>
                                        <div class="col-md-8 col-lg-10">
                                            <input class="form-control" type="text" name="epp[{$num}]" id="inputEppcode{$num}" value="{$domain.eppvalue}"/>
                                            <span class="help-block m-b-0">{$LANG.domaineppcodedesc}</span>
                                        </div>
                                    </div>
                                </div>
                                {/if}
                                {if $domain.fields}
                                    <div class="domain-info-additional panel-body">
                                        {foreach from=$domain.fields key=domainfieldname item=domainfield}
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-4 col-lg-2">{$domainfieldname}:</label>
                                                <div class="col-form-label col-checkbox col-md-8 col-lg-10">{$domainfield|replace:'type="checkbox"':'type="checkbox" class="icheck-control"'}</div>
                                            </div>
                                        {/foreach}
                                    </div>
                                {/if}
                            </div>
                        {/foreach}
                    </div>
                </div>
                {/if}
            {if $atleastonenohosting}
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.domainnameservers}</h2>
                        <p class="section-desc">{$LANG.cartnameserversdesc}</p>
                    </div>
                    <div class="section-body">
                        <div class="panel panel-default panel-form ">
                            <div class="panel-body p-t-2x">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs1">{$LANG.domainnameserver1}</label>
                                            <input type="text" class="form-control" id="inputNs1" name="domainns1" value="{$domainns1}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs2">{$LANG.domainnameserver2}</label>
                                            <input type="text" class="form-control" id="inputNs2" name="domainns2" value="{$domainns2}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs3">{$LANG.domainnameserver3}</label>
                                            <input type="text" class="form-control" id="inputNs3" name="domainns3" value="{$domainns3}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs1">{$LANG.domainnameserver4}</label>
                                            <input type="text" class="form-control" id="inputNs4" name="domainns4" value="{$domainns4}" />
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="inputNs5">{$LANG.domainnameserver5}</label>
                                            <input type="text" class="form-control" id="inputNs5" name="domainns5" value="{$domainns5}" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            {/if}
            <div id="bottom-action-anchor" class="bottom-action-anchor"></div>
            <div class="bottom-action-sticky" data-fixed-actions href="#bottom-action-anchor">
                <div class="container">
                    <div class="sticky-content"></div>
                    <div class="sticky-actions">
                        <button type="submit" data-btn-loader class="btn btn-lg btn-primary">
                            <span><i class="ls ls ls-share"></i><span class="btn-text">{$LANG.continue}</span></span>
                            <div class="loader loader-button hidden">
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    {include file="orderforms/$carttpl/includes/recommendations-modal.tpl"}
{/if}
<form method="post" action="cart.php">
    <input type="hidden" name="a" value="remove" />
    <input type="hidden" name="r" value="" id="inputRemoveItemType" />
    <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
    <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
                        <span aria-hidden="true"><i class="lm lm-close"></i></span>
                    </button>
                    <h3 class="modal-title">                                
                        <span>{$LANG.orderForm.removeItem}</span>
                    </h3>
                </div>
                <div class="modal-body">
                    {$LANG.cartremoveitemconfirm}
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">{$LANG.yes}</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.no}</button>
                </div>
            </div>
        </div>
    </div>
</form>