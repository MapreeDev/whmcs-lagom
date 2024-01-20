{if file_exists("templates/$template/modules/servers/cpanel/overwrites/overview.tpl")}
    {include file="{$template}/modules/servers/cpanel/overwrites/overview.tpl"}  
{else}
    <script src="modules/servers/cpanel/js/client.js"></script>
    <div class="product-details">
        <div class="row row-eq-height row-eq-height-sm">
            <div class="col-md-6">
                <div class="product-icon" id="cPanelPackagePanel">
                    <div class="product-content">
                        <div class="product-image">
                            {include file="$template/includes/common/svg-icon.tpl" icon="addon" onDark=true}
                        </div>
                        <h2 class="product-name"><span class="product-group-name">{$groupname} - </span>{$product}</h2>
                        <div class="product-status">{$LANG.clientareastatus}:
                            <span class="label label-success">{$status}</span>
                        </div>
                    </div>
                    {if $domain}  
                    {if isset($RSThemes['pages'][$templatefile]) && $RSThemes['pages'][$templatefile]['config']['removeUrlFromDomainName'] == "0"}<a class="product-footer" href="http://{$domain}">{$domain}</a>{else}<span class="product-footer">{$domain}</span>{/if}
                    {/if}
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default cpanel-usage-stats" id="cPanelUsagePanel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col" id="diskUsage">
                                <div class="usage-stats">
                                    <span>{lang key='diskUsage'}</span>
                                    <div class="knob-dial">
                                    <input type="text" value="{$diskpercent|substr:0:-1}" class="usage-dial" data-bgColor="#e6e8ec" data-fgColor="#0c70de" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($diskpercent, 0, -1) > 100}{$diskpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="104" data-thickness=.3 data-height="80" />        
                                    </div>
                                    <span>{$diskusage} M / {$disklimit} M</span>
                                </div>
                            </div>
                            <div class="col" id="bandwidthUsage">
                                <div class="usage-stats">
                                    <span>{lang key='bandwidthUsage'}</span>
                                    <input type="text" value="{$bwpercent|substr:0:-1}" class="usage-dial" data-bgColor="#e6e8ec" data-fgColor="#0c70de" data-angleOffset="-125" data-angleArc="250" data-min="0" data-max="{if substr($bwpercent, 0, -1) > 100}{$bwpercent|substr:0:-1}{else}100{/if}" data-readOnly="true" data-width="104" data-thickness=.3 data-height="80" />
                                    <span>{$bwusage} M / {$bwlimit} M</span>
                                </div>
                            </div>
                        </div>
                        <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                        <script type="text/javascript">
                            jQuery(function() {
                                jQuery(".usage-dial").knob({
                                    'change': function (v) { },
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
                        {if $bwpercent|substr:0:-1 > 75}
                            <div class="text-danger text-center">
                                 {if $bwpercent|substr:0:-1 > 100}
                                    {lang key='usageStatsBwOverLimit'}
                                {else}
                                    {lang key='usageStatsBwLimitNear'}
                                {/if}
                                {if $packagesupgrade}
                                    <a href="upgrade.php?type=package&id={$serviceid}" class="btn btn-xs btn-danger">
                                        <i class="fa fa-arrow-circle-up"></i>
                                         {lang key='usageUpgradeNow'}
                                    </a>
                                {/if}
                            </div>
                        {elseif $diskpercent|substr:0:-1 > 75}
                            <div class="text-danger text-center">
                                {if $diskpercent|substr:0:-1 > 100}
                                    {lang key='usageStatsDiskOverLimit'}
                                {else}
                                    {lang key='usageStatsDiskLimitNear'}
                                {/if}
                                {if $packagesupgrade}
                                    <a href="upgrade.php?type=package&id={$serviceid}" class="btn btn-xs btn-danger">
                                        <i class="fa fa-arrow-circle-up"></i>
                                        {lang key='usageUpgradeNow'}
                                    </a>
                                {/if}
                            </div>
                        {else}
                            <div class="text-center">
                                {lang key='usageLastUpdated'} {$lastupdate}
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>

    {* Quick Shortcuts *}
    {if $systemStatus == 'Active'}
        {if count($wpInstances) || $allowWpClientInstall}
            <div class="section">
                <h3>WordPress®</h3>
                <div class="panel panel-default" id="cPanelWordPress" data-service-id="{$serviceId}" data-wp-domain="{$wpDomain}">
                    <div class="panel-body" {if !count($wpInstances)}style="display: none" {/if}>
                        <div class="row{if !$allowWpClientInstall} no-margin{/if}" id="wordpressInstanceRow" >
                            <div class="col-md-4">
                                <select class="form-control" id="wordPressInstances">
                                    {foreach $wpInstances as $wpInstance}
                                        <option value="{$wpInstance.instanceUrl}">
                                            {$wpInstance.blogTitle}
                                            {if $wpInstance.path} ({$wpInstance.path}){/if}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-outline btn-block" id="btnGoToWordPressHome">
                                    <i class="ls ls-dashboard"></i>
                                    {lang key='wptk.goToWebsite'}
                                </button>
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-outline btn-block" id="btnGoToWordPressAdmin">
                                    <i class="ls ls-sign-in"></i>
                                    {lang key='wptk.goToAdmin'}
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body panel-form">        
                        <div class="row" {if !$allowWpClientInstall}style="display: none"{/if}>
                            <div class="col-md-12">
                                <h5>{lang key='wptk.createNew'}</h5>
                                <p class="small" id="newWordPressFullUrlPreview">https://{$wpDomain}/</p>
                            </div>
                            <div class="col-md-12" id="wordPressInstallResultRow" style="display: none">
                                <div class="alert alert-lagom alert-success" style="display: none">
                                    {lang key='wptk.installationSuccess'}
                                </div>
                                <div class="alert alert-lagom alert-danger" style="display: none">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="wpNewBlogTitle" placeholder="New Blog Title" />
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="wpNewPath" placeholder="Path (optional)" />
                            </div>
                            <div class="col-md-3">
                                <input type="password" class="form-control" id="wpAdminPass" placeholder="Admin Password" />
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-primary btn-block" id="btnInstallWordpress">
                                    <i class="fal fa-plus"></i>
                                    {lang key='wptk.installWordPressShort'}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{lang key='quickShortcuts'}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-default" id="cPanelQuickShortcutsPanel">
                    <div class="panel-body">
                        <div class="row cpanel-feature-row">
                            <div class="col-sm-3 col-xs-6" id="cPanelEmailAccounts">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_Accounts" target="_blank">
                                    <i class="lm lm-user"></i>
                                    {$LANG.cPanel.emailAccounts}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelForwarders">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_Forwarders" target="_blank">
                                    <i class="lm lm-arrow-fat-right"></i>
                                    {$LANG.cPanel.forwarders}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelAutoResponders">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Email_AutoResponders" target="_blank">
                                    <i class="lm lm-arrow-fat-left"></i>
                                    {$LANG.cPanel.autoresponders}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelFileManager">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=FileManager_Home" target="_blank">
                                    <i class="lm lm-folder"></i>
                                    {$LANG.fileManager}
                                </a>
                            </div>
                        </div>
                        <div class="row cpanel-feature-row">
                            <div class="col-sm-3 col-xs-6" id="cPanelBackup">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Backups_Home" target="_blank">
                                    <i class="lm lm-backup"></i>
                                    {$LANG.cPanel.backup}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelSubdomains">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Domains_SubDomains" target="_blank">
                                    <i class="lm lm-globe"></i>
                                    {$LANG.cPanel.subdomains}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelAddonDomains">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Domains_AddonDomains" target="_blank">
                                    <i class="lm lm-plus-circle"></i>
                                    {$LANG.cPanel.addonDomains}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelCronJobs">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Cron_Home" target="_blank">
                                    <i class="lm lm-clock"></i>
                                    {$LANG.cPanel.cronJobs}
                                </a>
                            </div>
                        </div>
                        <div class="row cpanel-feature-row">
                            <div class="col-sm-3 col-xs-6" id="cPanelMySQLDatabases">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Database_MySQL" target="_blank">
                                    <i class="lm lm-database"></i>
                                    {$LANG.mysqlDatabases}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelPhpMyAdmin">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Database_phpMyAdmin" target="_blank">
                                    <i class="lm lm-php-admin"></i>
                                    {$LANG.cPanel.phpMyAdmin}
                                </a>
                            </div>
                            <div class="col-sm-3 col-xs-6" id="cPanelAwstats">
                                <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;dosinglesignon=1&amp;app=Stats_AWStats" target="_blank">
                                    <i class="lm lm-line-graph"></i>
                                    {$LANG.cPanel.awstats}
                                </a>
                            </div>
                            {if $hasWPTDeluxe}
                                <div class="col-sm-3 col-xs-6" id="cPanelWptk">
                                    <a class="btn btn-link btn-block" href="clientarea.php?action=productdetails&amp;id={$serviceid}&amp;addonId={$wptkDeluxeAddonId}&amp;doaddonsignon=1" target="_blank" class="d-block mb-3">
                                        <i class="lm lm-layout"></i>
                                        {$LANG.cPanel.wptk}
                                    </a>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.cPanel.createEmailAccount}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-default panel-form" id="cPanelQuickEmailPanel">
                    <div class="panel-body">
                        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.cPanel.emailAccountCreateSuccess textcenter=true hide=true idname="emailCreateSuccess" additionalClasses="alert-primary email-create-feedback"}
                        {include file="$template/includes/alert.tpl" type="danger" msg=$LANG.cPanel.emailAccountCreateFailed|cat:' <span id="emailCreateFailedErrorMsg"></span>' textcenter=true hide=true idname="emailCreateFailed" additionalClasses="alert-primary email-create-feedback"}
                        <form id="frmCreateEmailAccount" onsubmit="doEmailCreate();return false">
                            <input type="hidden" name="id" value="{$serviceid}" />
                            <input type="hidden" name="email_quota" value="250" />
                            <div class="row row-sm">
                                <div class="form-group col-sm-6 m-b-0x">
                                    <label>{$LANG.contactemail}</label>
                                    <div class="input-group">
                                        <input type="text" name="email_prefix" class="form-control" placeholder="{$LANG.cPanel.usernamePlaceholder}">
                                        <span class="input-group-addon">@{$domain}</span>
                                    </div>
                                </div>
                                <div class="form-group col-sm-6 m-b-0x">
                                    <label>{$LANG.clientareapassword}</label>
                                    <div class="input-group">
                                        <input type="password" name="email_pw" class="form-control" placeholder="{$LANG.cPanel.passwordPlaceholder}">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary btn-block">{$LANG.cPanel.create}</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>    
        </div>
    {else}
        <div class="alert alert-lagom alert-primary alert-warning text-center d-block" role="alert" id="cPanelSuspendReasonPanel">
            {if $suspendreason}
                <strong>{$suspendreason}</strong><br />
            {/if}
            {$LANG.cPanel.packageNotActive} {$status}.<br />
            {if $systemStatus eq "Pending"}
                {$LANG.cPanel.statusPendingNotice}
            {elseif $systemStatus eq "Suspended"}
                {$LANG.cPanel.statusSuspendedNotice}
            {/if}
        </div>
    {/if}
    {foreach $hookOutput as $output}
        <div class="section section-hook-output no-float-banner">
            {$output}
        </div>  
    {/foreach}
    {if $availableAddonProducts}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{lang key='addonsExtras'}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-form" id="cPanelExtrasPurchasePanel">
                    <div class="panel-body">
                        <form method="post" action="cart.php?a=add">
                            <input type="hidden" name="serviceid" value="{$serviceid}" />
                            <div class="row row-sm">
                                <div class="col-sm-8">
                                <select name="aid" class="form-control">
                                    {foreach $availableAddonProducts as $addonId => $addonName}
                                        <option value="{$addonId}">{$addonName}</option>
                                    {/foreach}
                                </select>
                                </div>
                                <div class="col-sm-4">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        {lang key='purchaseActivate'}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>    
    {/if}
    <div class="section">
        <div class="section-body">
            <div class="panel panel-default">
                <ul class="panel-tabs nav nav-tabs">
                    <li>
                        <a href="#billingInfo" data-toggle="tab" class="active"><i class="ls ls-wallet"></i> {lang key='billingOverview'}</a>
                    </li>
                    <li>
                        <a href="#domainInfo" data-toggle="tab" aria-expanded="true"><i class="ls ls-location"></i>{$LANG.clientareahostingdomain}</a>
                    </li>
                    {if $metricStats}
                    <li>
                        <a href="#tab-metrics" data-toggle="tab" aria-expanded="true"><i class="ls ls-location"></i>{$LANG.metrics.title}</a>
                    </li>
                    {/if}
                    {if $customfields}
                    <li>
                        <a href="#customFields" data-toggle="tab" aria-expanded="true"><i class="ls ls-hosting"></i> {$LANG.additionalInfo}</a>
                    </li>
                    {/if}
                    {if $configurableoptions}
                    <li>
                        <a href="#confiOptions" data-toggle="tab" aria-expanded="false"><i class="ls ls-configure"></i> {$LANG.orderconfigpackage}</a>
                    </li>
                    {/if}
                </ul>
                <div class="tab-content">
                    <div class="panel-body tab-pane active billingOverview" id="billingInfo">
                        <div class="row">				
                            {if $firstpaymentamount neq $recurringamount}
                            <div class="col-sm-6 col-md-3 m-b-2x">
                                <div class="text-faded text-small">
                                    {$LANG.firstpaymentamount}
                                </div>
                                <div>
                                    {$firstpaymentamount}
                                </div>
                            </div>
                            {/if}
                            <div class="col-sm-6 col-md-3 m-b-2x">
                                <div class="text-faded text-small">
                                        {$LANG.clientareahostingregdate}
                                </div>
                                <div>
                                    {$regdate}
                                </div>
                            </div>
                            {if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
                                <div class="col-sm-6 col-md-3 m-b-2x">
                                    <div class="text-faded text-small">
                                        {$LANG.recurringamount}
                                    </div>
                                    <div>
                                        {$recurringamount}
                                    </div>
                                </div>
                            {/if}
                            <div class="col-sm-6 col-md-3 m-b-2x">
                                <div class="text-faded text-small">
                                    {$LANG.clientareahostingnextduedate}
                                </div>
                                <div>
                                    {$nextduedate}
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 m-b-2x">
                                <div class="text-faded text-small">
                                    {$LANG.orderbillingcycle}
                                </div>
                                <div>
                                    {$billingcycle}
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 m-b-2x">
                                <div class="text-faded text-small">
                                    {$LANG.orderpaymentmethod}
                                </div>
                                <div>
                                    {$paymentmethod}
                                </div>
                            </div>
                        </div>			
                    </div>
                    <div class="panel-body tab-pane" id="domainInfo">
                        <div class="cpanel-actions-container">
                            <p class="text-center">{$domain}</p>
                            <div class="cpanel-actions-btn">
                                <a href="http://{$domain}" class="btn btn-primary" target="_blank">{$LANG.visitwebsite}</a>
                                {if $domainId}
                                    <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-primary" target="_blank">{$LANG.managedomain}</a>
                                {/if}
                            </div>
                        </div>
                    </div>
                    {if $metricStats}
                    <div class="tab-pane" id="tab-metrics">
                        <div id="cPanelMetricStatsPanel">
                            {include file="$template/clientareaproductusagebilling.tpl"}
                        </div>
                    </div>    
                    {/if}
                    {if $customfields}
                    <div class="tab-pane" id="customFields">
                        <ul class="list-info list-info-50 list-info-bordered">
                            {foreach from=$customfields item=field}
                                <li>
                                    <span class="list-info-title">{$field.name}</span>
                                    <span class="list-info-text">
                                        {if empty($field.value)}
                                            {$LANG.blankCustomField}
                                        {else}
                                            {$field.value}
                                        {/if}
                                    </span>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    {if $configurableoptions}
                    <div class="tab-pane" id="confiOptions">
                        <ul class="list-info list-info-50 list-info-bordered">
                            {foreach from=$configurableoptions item=configoption}
                                <li>
                                    <span class="list-info-title">{$configoption.optionname}</span>
                                    <span class="list-info-text">{if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}</span>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/if}    