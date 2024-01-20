{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $RSThemes['pages'][$templatefile]['config']['hideRightBoxWithDetailsUsage'] == "1"}
        {assign var="hideDetailsBox" value=true}
    {/if}
    {if isset($RSThemes.layouts.vars.modules)}
        {foreach from=$RSThemes.layouts.vars.modules item=checkModule}
            {if $checkModule == $module}
                {assign var="customModuleInfo" value=true}
            {/if}
        {/foreach}
    {/if}
    {if $modulecustombuttonresult}
        {if $modulecustombuttonresult == "success"}
            {include file="$template/includes/alert.tpl" type="success" additionalClasses="alert-primary" msg=$LANG.moduleactionsuccess textcenter=true idname="alertModuleCustomButtonSuccess"}
        {else}
            {include file="$template/includes/alert.tpl" type="error" additionalClasses="alert-primary" msg=$LANG.moduleactionfailed|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
        {/if}
    {/if}

    {if $pendingcancellation}
        {include file="$template/includes/alert.tpl" type="error" additionalClasses="alert-primary" msg=$LANG.cancellationrequestedexplanation textcenter=true idname="alertPendingCancellation"}
    {/if}

    {if $unpaidInvoice}
        <div class="alert alert-lagom alert-primary alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
            <div class="alert-body">
                {$unpaidInvoiceMessage}
            </div>
            <div class="alert-actions pull-right">
                <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-{if $unpaidInvoiceOverdue}danger{else}warning{/if}">
                    {lang key='payInvoice'}
                </a>
            </div>
        </div>
    {/if}
    <div class="tab-content margin-bottom {if $hideDetailsBox}details-box-hidden{/if} {if $RSThemes['pages'][$templatefile]['config']['removeUrlFromDomainName'] == "1"}domain-url-disabled{/if} {if $RSThemes['pages'][$templatefile]['config']['removeProductGroupName'] == "1"}product-group-hidden{/if}">
        <div class="tab-pane active" id="Overview">
            {if $tplOverviewTabOutput}
                {$tplOverviewTabOutput}
            {else}
                {if !$customModuleInfo}
                <div class="product-details clearfix">
                    <div class="row row-eq-height row-eq-height-sm">
                        <div class="{if $hideDetailsBox}col-md-12{else}col-md-6{/if}">
                            <div class="product-icon {if $hideDetailsBox} product-icon-sm{/if}">
                                <div class="product-content">
                                    <div class="product-image">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="addon" onDark=true}
                                    </div>
                                    <h2 class="product-name">{if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['removeProductGroupName'] != "1"}<span class="product-group-name">{$groupname} - </span>{/if}{$product}</h2>
                                </div>    
                                {if $domain}  
                                {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['removeUrlFromDomainName'] != "1"}<a class="product-footer" href="http://{$domain}">{$domain}</a>{else}<span class="product-footer">{$domain}</span>{/if}
                                {/if}
                            </div>
                        </div>
                        {if !$hideDetailsBox}
                            <div class="col-md-6">
                                {if $lastupdate}
                                    <div class="panel panel-default panel-form cpanel-usage-stats" id="cPanelUsagePanel">
                                        <div class="panel-body text-center">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="usage-stats">
                                                        <span>{lang key='diskUsage'}</span>
                                                        <input type="text" value="{$diskpercent|substr:0:-1}" class="usage-dial" data-bgColor="#e6e8ec" data-fgColor="{if $RSThemes.styles.vars.colorPrimary}{$RSThemes.styles.vars.colorPrimary}{else}#0c70de{/if}" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($diskpercent, 0, -1) > 100}{$diskpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="104" data-thickness=.3 data-height="80" />                          
                                                        <span>{$diskusage} M / {$disklimit} M</span>
                                                    </div>    
                                                </div>
                                                <div class="col">
                                                    <div class="usage-stats">
                                                        <span>{lang key='bandwidthUsage'}</span>
                                                        <input type="text" value="{$bwpercent|substr:0:-1}" class="usage-dial" data-bgColor="#e6e8ec" data-fgColor="{if $RSThemes.styles.vars.colorPrimary}{$RSThemes.styles.vars.colorPrimary}{else}#0c70de{/if}" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($bwpercent, 0, -1) > 100}{$bwpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="104" data-thickness=.3 data-height="80" />
                                                        <span>{$bwusage} M / {$bwlimit} M</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                                            <script type="text/javascript">
                                                jQuery(function() {
                                                    jQuery(".usage-dial").knob({
                                                        'change': function (v) {},
                                                        draw: function () {
                                                            if ($(this.i).val() > 0){
                                                                $(this.i).val(this.cv + '%');
                                                            }
                                                        }
                                                    });
                                                });
                                            </script>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="text-center limit-near">
                                                {$LANG.clientarealastupdated}: {$lastupdate}
                                            </div>
                                        </div>    
                                    </div>     
                                {else}
                                    <div class="product-info">
                                        <ul class="list-info list-info-v">
                                            <li>
                                                <span class="list-info-title">{$LANG.clientareastatus}</span>
                                                <span class="list-info-text"><span class="status status-{$rawstatus|strtolower}">{$status}</span></span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.clientareahostingregdate}</span>
                                                <span class="list-info-text">{$regdate}</span>
                                            </li>
                                            {if $firstpaymentamount neq $recurringamount}
                                                <li>
                                                    <span class="list-info-title">{$LANG.firstpaymentamount}</span>
                                                    <span class="list-info-text">{$firstpaymentamount}</span>
                                                </li>
                                            {/if}
                                            {if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
                                                <li>
                                                    <span class="list-info-title">{$LANG.recurringamount}</span>
                                                    <span class="list-info-text">{$recurringamount}</span>
                                                </li>
                                            {/if}
                                            {if $quantitySupported && $quantity > 1}
                                                <li>
                                                    <span class="list-info-title">{lang key='quantity'}</span>
                                                    <span class="list-info-text">{$quantity}</span>
                                                </li>  
                                            {/if}
                                            <li>
                                                <span class="list-info-title">{$LANG.orderbillingcycle}</span>
                                                <span class="list-info-text">{$billingcycle}</span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.clientareahostingnextduedate}</span>
                                                <span class="list-info-text">{$nextduedate}</span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.orderpaymentmethod}</span>
                                                <span class="list-info-text"> {$paymentmethod}</span>
                                            </li>
                                            {if $suspendreason}
                                                <li>
                                                    <span class="list-info-title">{$LANG.suspendreason}</span>
                                                    <span class="list-info-text">{$suspendreason}</span>
                                                </li>
                                            {/if}
                                        </ul>
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    </div>
                </div>
                {/if}
                {if $moduleclientarea}
                <div class="panel panel-default panel-product-details">
                    <div class="panel-body">
                    <div class="module-client-area module-{$module} p-0">
                        {$moduleclientarea}
                    </div>
                    </div>
                </div>
                {/if}
                {foreach $hookOutput as $output key=k}
                    <div class="section section-hook-output no-float-banner">
                        {$output}
                    </div>
                {/foreach}
                {if $domain || $configurableoptions || $customfields || $customModuleInfo || $hideDetailsBox}
                <div class="section">
                    <div class="section-body">
                        <div class="panel panel-default">
                            <div class="panel-nav">
                                <ul class="nav nav-tabs">							
                                    {if $customModuleInfo || $lastupdate || $hideDetailsBox}
                                    <li>
                                        <a class=" active" href="#billingInfo" data-toggle="tab"><i class="ls ls-wallet"></i> {$LANG.billingOverview}</a>
                                    </li>							
                                    {/if}
                                    {if $domain}
                                        <li>
                                            <a class="{if !$customModuleInfo && !$lastupdate && !$hideDetailsBox}active{/if}" href="#domain" data-toggle="tab"><i class="ls ls-location"></i> {if $type eq "server"}{$LANG.sslserverinfo}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{$LANG.hostingInfo}{else}{$LANG.clientareahostingdomain}{/if}</a>
                                        </li>
                                    {/if}
                                    {if $configurableoptions}
                                        <li>
                                            <a class="{if !$domain && !$customModuleInfo && !$lastupdate  && !$hideDetailsBox}  active{/if}" href="#configoptions" data-toggle="tab"><i class="ls ls-configure"></i> {$LANG.orderconfigpackage}</a>
                                        </li>
                                    {/if}
                                    {if $metricStats}
                                        <li>
                                            <a class="{if !$domain && !$customModuleInfo && !$configurableoptions && !$lastupdate  && !$hideDetailsBox} active{/if}"  href="#metrics" data-toggle="tab"><i class="fas fa-chart-line fa-fw"></i> {$LANG.metrics.title}</a>
                                        </li>
                                    {/if}
                                    {if $customfields}
                                        <li>
                                            <a class="{if !$domain && !$customModuleInfo && !$metricStats && !$configurableoptions && !$lastupdate  && !$hideDetailsBox} active{/if}" href="#additionalinfo" data-toggle="tab"><i class="ls ls-info-circle"></i> {$LANG.additionalInfo}</a>
                                        </li>
                                    {/if}
                                </ul>
                            </div>               
                            <div class="tab-content">							
                                {if $customModuleInfo || $lastupdate || $hideDetailsBox}
                                    <div class="panel-body tab-pane{if $customModuleInfo || $lastupdate || $hideDetailsBox} active{/if} billingOverview" id="billingInfo">
                                        <div class="row row-eq-height row-eq-height-sm ">				
                                            {if $firstpaymentamount neq $recurringamount}
                                            <div class="col-md-6 col-lg-3">
                                                <div class="row" id="firstPaymentAmount">
                                                    <div class="col-12" >
                                                        <span class="gray-base">
                                                            {$LANG.firstpaymentamount}
                                                        </span>
                                                    </div>
                                                    <div class="col-12">
                                                        {$firstpaymentamount}
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="col-md-6 col-lg-3">
                                                <div class="row" id="registrationDate">
                                                    <div class="col-12">
                                                        <span class="gray-base">
                                                            {$LANG.clientareahostingregdate}
                                                        </span>
                                                    </div>
                                                    <div class="col-12">
                                                        {$regdate}
                                                    </div>
                                                </div>
                                            </div>
                                            {if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
                                                <div class="col-md-6 col-lg-3">
                                                    <div class="row" id="recurringAmount">
                                                        <div class="col-12">
                                                            <span class="gray-base">
                                                                {$LANG.recurringamount}
                                                            </span>
                                                        </div>
                                                        <div class="col-12">
                                                            {$recurringamount}
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if $quantitySupported && $quantity > 1}
                                                <div class="col-md-6 col-lg-3">
                                                    <div class="row">
                                                        <div class="col-xs-12">
                                                            <span class="gray-base">
                                                                {lang key='quantity'}
                                                            </span>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            {$quantity}
                                                        </div>
                                                    </div>
                                                </div> 
                                            {/if}
                                            <div class="col-md-6 col-lg-3">
                                                <div class="row" id="nextDueDate">
                                                    <div class="col-12">
                                                        <span class="gray-base">
                                                            {$LANG.clientareahostingnextduedate}
                                                        </span>
                                                    </div>
                                                    <div class="col-12">
                                                        {$nextduedate}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="row" id="billingCycle">
                                                    <div class="col-12">
                                                        <span class="gray-base">
                                                            {$LANG.orderbillingcycle}
                                                        </span>
                                                    </div>
                                                    <div class="col-12">
                                                        {$billingcycle}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="row" id="paymentMethod">
                                                    <div class="col-12">
                                                        <span class="gray-base">
                                                            {$LANG.orderpaymentmethod}
                                                        </span>
                                                    </div>
                                                    <div class="col-12">
                                                        {$paymentmethod}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                                {if $domain}
                                <div class="tab-pane {if !$customModuleInfo && !$lastupdate && !$hideDetailsBox}active{/if}" id="domain">
                                    <ul class="list-info list-info-50 list-info-bordered">
                                        {if $type eq "server"}
                                            <li>
                                                <span class="list-info-title">{$LANG.serverhostname}</span>
                                                <span class="list-info-text">{$domain}</span>
                                            </li>
                                            {if $dedicatedip}
                                                <li>
                                                    <span class="list-info-title">{$LANG.primaryIP}</span>
                                                    <span class="list-info-text">{$dedicatedip}</span> 
                                                </li>
                                            {/if}
                                            {if $assignedips}
                                                <li>
                                                    <span class="list-info-title">{$LANG.assignedIPs}</span>
                                                    <span class="list-info-text">{$assignedips|nl2br}</span>
                                                </li>
                                            {/if}
                                            {if $RSThemes['addonSettings']['hide_nameserver_fields'] != "displayed"}
                                                {assign var="ns_groups" value=","|explode:$RSThemes['addonSettings']['hide_nameserver_fields']}
                                                {if $groupId|in_array:$ns_groups}
                                                    {assign var="hideNSFields" value=true}
                                                {/if}
                                            {/if}
                                            {if ($ns1 || $ns2) && !$hideNSFields}
                                                <li>
                                                    <span class="list-info-title">{$LANG.domainnameservers}</span>
                                                    <span class="list-info-text">
                                                        {$ns1}<br />{$ns2}
                                                    </span>
                                                </li>
                                            {/if}
                                        {else}
                                            {if $domain}
                                                <li>
                                                    <span class="list-info-title">{$LANG.orderdomain}</span>                                                
                                                    <span class="list-info-text">{$domain}<span class="m-h-1x"><a href="http://{$domain}" target="_blank" class="btn btn-default btn-xs" >{$LANG.visitwebsite}</a></span></span>
                                                </li>
                                                {if $sslStatus}
                                                    <li class="align-center">
                                                        <span class="list-info-title">{$LANG.sslState.sslStatus}</span>                                                
                                                        {assign var="awords" value="/"|explode:$sslStatus->getImagePath()} 
                                                        {assign var="imageSSL" value=$awords|@end}
                                                        <img class="m-r-8 {$sslStatus->getClass()}" src="{$WEB_ROOT}/templates/{$template}/assets/img/ssl/12x12/{$imageSSL|replace:".png":".svg"}" width="12" data-type="service" data-domain="{$domain}" data-showlabel="1"> 
                                                        <span id="statusDisplayLabel">
                                                            {if !$sslStatus->needsResync()}
                                                                {$sslStatus->getStatusDisplayLabel()}
                                                            {else}
                                                                {$LANG.loading}
                                                            {/if}
                                                        </span>
                                                    </li>
                                                    {if $sslStatus->isActive() || $sslStatus->needsResync()}
                                                    <li>
                                                        <span class="list-info-title">{$LANG.sslState.startDate}</span>                                                
                                                        <span class="list-info-text" id="ssl-startdate">
                                                            {if !$sslStatus->needsResync() || $sslStatus->startDate}
                                                                {$sslStatus->startDate->toClientDateFormat()}
                                                            {else}
                                                                {$LANG.loading}
                                                            {/if}
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span class="list-info-title">{$LANG.sslState.expiryDate}</span>                                                
                                                        <span class="list-info-text" id="ssl-expirydate">
                                                            {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                                                                {$sslStatus->expiryDate->toClientDateFormat()}
                                                            {else}
                                                                {$LANG.loading}
                                                            {/if}
                                                        </span>
                                                    </li>
                                                    <li>
                                                        <span class="list-info-title">{$LANG.sslState.issuerName}</span>                                                
                                                        <span class="list-info-text" id="ssl-issuer">
                                                            {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                                                                {$sslStatus->issuerName}
                                                            {else}
                                                                {$LANG.loading}
                                                            {/if}
                                                        </span>
                                                    </li>
                                                    {/if}
                                                {/if}                                            
                                            {/if}
                                            {if $username}
                                                <li>
                                                    <span class="list-info-title">{$LANG.serverusername}</span>
                                                    <span class="list-info-text">{$username}</span>
                                                </li>
                                            {/if}
                                            {if $serverdata}
                                                {if $serverdata.hostname}
                                                    <li>
                                                        <span class="list-info-title">{$LANG.servername}</span>
                                                        <span class="list-info-text">{$serverdata.hostname}</span>
                                                    </li>
                                                {/if}
                                                {if $serverdata.ipaddress}
                                                    <li>
                                                        <span class="list-info-title">{$LANG.domainregisternsip}</span>
                                                        <span class="list-info-text">{$serverdata.ipaddress}</span>
                                                    </li>
                                                {/if}
                                                {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                                                    <li>
                                                        <span class="list-info-title">
                                                            {$LANG.domainnameservers}
                                                        </span>
                                                        <span class="list-info-text">
                                                            {for $i=1 to 5}
                                                                {assign var=key value="nameserver$i"}
                                                                {assign var=keyip value="nameserver`$i`ip"}
                                                                {if $serverdata.$key}{$serverdata.$key} {if {$serverdata.$keyip}}({$serverdata.$keyip}){/if}<br />{/if}
                                                            {/for}
                                                        </span>
                                                    </li>
                                                {/if}
                                            {/if}
                                        {/if}
                                    </ul> 
                                </div>
                                {/if}
                                {if $configurableoptions}
                                <div class="tab-pane {if !$domain && !$customModuleInfo && !$lastupdate && !$hideDetailsBox} active{/if}" id="configoptions">
                                    <ul class="list-info list-info-50 list-info-bordered">
                                        {foreach from=$configurableoptions item=configoption}
                                            <li>
                                                <span class="list-info-title">{$configoption.optionname}</span>
                                                <span class="list-info-text">
                                                    {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                                                </span>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                {/if}
                                {if $metricStats}
                                    <div class="tab-pane {if !$domain && !$customModuleInfo && !$lastupdate && !$configurableoptions && !$hideDetailsBox}active{/if}" id="metrics">
                                        {include file="$template/clientareaproductusagebilling.tpl"}
                                    </div>
                                {/if}
                                {if $customfields}
                                <div class="tab-pane {if !$domain && !$customModuleInfo && !$lastupdate && !$configurableoptions && !$metricStats && !$hideDetailsBox} active{/if} " id="additionalinfo">
                                    <ul class="list-info list-info-50 list-info-bordered">
                                        {foreach from=$customfields item=field}
                                            <li>
                                                <span class="list-info-title">{$field.name}</span>
                                                <span class="list-info-text">{$field.value}</span>
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                {/if}
                                {if $sslInfo}
                                <div class="tab-pane fade text-center" id="ssl-info">
                                    {if $sslInfo->active}
                                        <div class="alert alert-lagom alert-primary alert-success" role="alert">
                                            {lang key='sslActive' expiry=$sslInfo->expiryDate->toClientDateFormat()}
                                        </div>
                                    {else}
                                        <div class="alert alert-lagom alert-primary alert-warning ssl-required" role="alert">
                                            {lang key='sslState.sslInactive'}
                                        </div>
                                    {/if}
                                </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
                {/if}                            
            {/if}

        </div>
            
        <div class="tab-pane " id="Downloads">
            <div class="section">
                <div class="section-body">
                    <div class="kbarticles kbdownloads kbdownloads-panels list-group">
                        {foreach from=$downloads item=download}
                            <div class="kbdownloads-panel list-group-item">
                                <div>
                                    <h6>{$download.title}</h6>
                                    <p>{$download.description}</p>
                                </div>
                                <a class="btn btn-primary-faded" href="{$download.link}">
                                    <i class="lm lm-download"></i>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>    
        </div>
        <div class="tab-pane " id="Addons">
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.clientareahostingaddons}</h2>
                    {if $addonsavailable}
                        <p class="section-desc">{lang key="clientAreaProductAddonsAvailable"}</p>
                    {/if}
                </div>
                <div class="section-body">
                    <div class="row">
                        {foreach from=$addons item=addon}
                            <div class="col-md-6">
                                <div class="panel panel-default panel-accent-blue">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['showProductAddonsId'] == "1"}
                                                #{$addon.id} - 
                                            {/if}
                                            {$addon.name}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <ul class="list-info list-info-50">
                                            <li>
                                                <span class="list-info-title">{$LANG.clientareastatus}</span>
                                                <span class="list-info-text">{$addon.status}</span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.recurringamount}</span>
                                                <span class="list-info-text">{$addon.pricing}</span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.registered}</span>
                                                <span class="list-info-text">{$addon.regdate}</span>
                                            </li>
                                            <li>
                                                <span class="list-info-title">{$LANG.clientareahostingnextduedate}</span>
                                                <span class="list-info-text">{$addon.nextduedate}</span>
                                            </li>
                                        </ul>
                                    </div>
                                    {if $addon.managementActions}
                                        <div class="panel-footer">
                                            {$addon.managementActions}
                                        </div>
                                    {/if}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane " id="Changepw">
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$LANG.serverchangepassword}</h2>
                </div>
                <div class="section-body m-w-448">
                    {if $modulechangepwresult}
                        {if $modulechangepwresult == "success"}
                            {include file="$template/includes/alert.tpl" type="success" additionalClasses="alert-primary" msg=$modulechangepasswordmessage textcenter=true}
                        {elseif $modulechangepwresult == "error"}
                            {include file="$template/includes/alert.tpl" type="error" additionalClasses="alert-primary" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
                        {/if}
                    {/if}
                    <script>
                        window.langPasswordStrength = "{$LANG.pwstrength}";
                        window.langPasswordWeak = "{$LANG.pwstrengthweak}";
                        window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
                        window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
                        window.langPasswordTooShort = "{$rslang->trans('login.at_least_pass')}";
                        
                    </script>
                    <form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
                        <div class="panel paneldefault panel-form">
                            <div class="panel-body">
                                <input type="hidden" name="id" value="{$id}" />
                                <input type="hidden" name="modulechangepassword" value="true" />
                                <div id="newPassword1" class="form-group">
                                    <label for="inputNewPassword1" class="control-label">{$LANG.newpassword}</label>
                                    <div class="input-password-strenght">
                                        <input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
                                        <span class="text-small text-lighter"><span id="passwordStrengthTextLabel">{$rslang->trans('login.at_least_pass')}</span><i data-toggle="tooltip" title="{$LANG.passwordtips}" data-html="true" data-container="body" class="ls ls-info-circle"></i></span>
                                    </div>
                                    {include file="$template/includes/pwstrength.tpl"}
                                </div>
                                <div id="newPassword2" class="form-group m-b-0">
                                    <label for="inputNewPassword2" class="control-label">{$LANG.confirmnewpassword}</label>
                                    <input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
                                    <div id="inputNewPassword2Msg"></div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <input class="btn btn-primary" type="submit" value="{$LANG.clientareasavechanges}" />
                                <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>        
        </div>
    </div>
{/if}
