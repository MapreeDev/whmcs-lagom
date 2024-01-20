{* Assign correct class to the .main-grid container *}

{if isset($mainGridNoSidebarClass) && $mainGridNoSidebarClass && (!$primarySidebar->hasChildren() && !$secondarySidebar->hasChildren())}
    {assign var=mainGrid value=$mainGridNoSidebarClass scope=parent}
{elseif isset($mainGridOrderClass) && $mainGridOrderClass}
    {assign var=mainGrid value=$mainGridOrderClass scope=parent}
{elseif !isset($skipMainBodyContainer) || !$skipMainBodyContainer}
    {assign var=mainGrid value="row" scope=parent}
{/if}

{* Assign page templates with custom status icons option *}
{assign var=iconsPages value=['clientareadomains', 'supportticketslist', 'clientareainvoices', 'clientareaproducts'] scope=parent}

{* Assign variable to skip the .main-sidebar container with all children *}
{if ((isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainSidebar']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainSidebar'] == "true") ||
$ignoreSidebars ||
(isset($inShoppingCart) && $inShoppingCart) ||
$RSThemes['pages'][$templatefile]['config']['hideSidebar'] == '1' ||
!($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())) && !$forceSidebar}
    {assign var=skipMainSidebar value="true" scope=parent}
{/if}

{* Assign variable to skip the .main-top container with all children // used in left nav layouts *}
{if (isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainTop']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainTop'] == "true") ||
(isset($RSThemes['pages'][$templatefile]['config']['isFullPage']) && $RSThemes['pages'][$templatefile]['config']['isFullPage'] == "1") ||
$templatefile =="oauth/layout" ||
(isset($custompage) && $custompage == 'blank')}
    {assign var=skipMainTop value="true" scope=parent}
{/if}

{* Assign variable to skip the .app-nav container with all children *}
{if (isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainFooter']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainFooter'] == "true") ||
(isset($RSThemes['pages'][$templatefile]['config']['isFullPage']) && $RSThemes['pages'][$templatefile]['config']['isFullPage'] == "1") ||
$templatefile == "oauth/layout" ||
(isset($custompage) && $custompage == 'blank')}
    {assign var=skipAppNav value="true" scope=parent}
{/if}

{* Assign variable to skip the .main-footer container with all children *}
{if (isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainFooter']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainFooter'] == "true") ||
(isset($RSThemes['pages'][$templatefile]['config']['isFullPage']) && $RSThemes['pages'][$templatefile]['config']['isFullPage'] == "1") ||
$templatefile == "oauth/layout" ||
(isset($custompage) && $custompage == 'blank')}
    {assign var=skipMainFooter value="true" scope=parent}
{/if}

{* Assign variable to skip the .main-body container with all children *}
{if (isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainBody']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainBody'] == "true") ||
$ignoreMainBody ||
(isset($custompage) && $custompage == 'full') ||
(isset($custompage) && $custompage == 'blank')}
    {assign var=skipMainBody value="true" scope=parent}
{/if}

{* Assign variable to skip the .main-header container with all children *}
{if (isset($RSThemes['pages'][$templatefile]['optionvars']['skipMainHeader']) && $RSThemes['pages'][$templatefile]['optionvars']['skipMainHeader'] == "true") ||
$ignoreHeader ||
(isset($custompage) && $custompage == 'full') ||
(isset($custompage) && $custompage == 'blank')}
    {assign var=skipMainHeader value="true" scope=parent}
{/if}


{* Custom page titles - This is used to overwrite default titles shown in the page title/banner *}

{if $templatefile == "clientareahome" ||
$templatefile == "homepage"}
    {assign var="displayTitle" value=$rslang->trans('generals.my_dashboard') scope=parent}
{elseif $templatefile == "viewinvoice" }
    {assign var="displayTitle" value=$LANG.invoicesview scope=parent}
{elseif $templatefile == "viewquote"}
    {assign var="displayTitle" value=$rslang->trans('billing.view_quote') scope=parent}
{elseif $templatefile == "configureproduct"}
    {assign var="displayTitle" value=$LANG.orderconfigure scope=parent}
{elseif $templatefile == "configureproductdomain"}
    {assign var="displayTitle" value=$LANG.domaincheckerchoosedomain scope=parent}
{elseif $templatefile == "configuredomains"}
    {assign var="displayTitle" value=$LANG.cartdomainsconfig scope=parent}
{elseif $templatefile == "viewcart" ||  $templatefile == "checkout"}
    {assign var="displayTitle" value=$LANG.cartreviewcheckout scope=parent}
{elseif $templatefile == "domainregister"}
    {assign var="displayTitle" value=$LANG.registerdomain scope=parent}
{elseif $templatefile == "domaintransfer"}
    {assign var="displayTitle" value=$LANG.transferdomain scope=parent}
{elseif $templatefile == "domain-renewals"}
    {assign var="displayTitle" value=$LANG.domainrenewals scope=parent}
    {assign var=RSheaderRenewalSearch value=true scope=parent}
{elseif $templatefile == "service-renewals"}
    {assign var="displayTitle" value=$LANG.renewService.titleAltPlural scope=parent}
    {assign var=RSheaderRenewalSearch value=true scope=parent}
{elseif $templatefile == "products"}
    {if $productGroup.headline}
        {assign var="displayTitle" value=$productGroup.headline scope=parent}
    {else}
        {assign var="displayTitle" value=$productGroup.name scope=parent}
    {/if}
{elseif $templatefile == "fraudcheck"}
    {assign var="displayTitle" value=$LANG.cartfraudcheck scope=parent}
{elseif $templatefile == "complete"}
    {assign var="displayTitle" value=$LANG.orderconfirmation scope=parent}
{elseif $templatefile == "error"}
    {assign var="displayTitle" value=$LANG.thereisaproblem scope=parent}
{elseif $templatefile == "clientareaproductdetails"}
    {assign var="displayTitle" value=$LANG.clientareaproductdetails scope=parent}
{/if}

{* Extended Footer cols - used for Footer Extended Layout *}

{if $rsFooter.primary}
    {assign var="footerColCount" value=count($rsFooter.primary)}
    {if $footerColCount == 1}
        {assign var="footerPrimaryCol" value="12" scope=parent}
    {elseif $footerColCount == 2}
        {assign var="footerPrimaryCol" value="6" scope=parent}
    {elseif $footerColCount == 3}
        {assign var="footerPrimaryCol" value="4" scope=parent}
    {elseif $footerColCount >= 4 }
        {assign var="footerPrimaryCol" value="3" scope=parent}
    {/if}
{/if}