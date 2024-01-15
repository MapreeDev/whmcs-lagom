{if file_exists("templates/$template/core/layouts/main-menu/{$RSThemes.layouts.name}/header.tpl")}
    {include file="{$template}/core/layouts/main-menu/{$RSThemes.layouts.name}/header.tpl"}
{/if}

{include file="$template/includes/common/layouts-vars.tpl"}  

{if !$skipAppNav}
    <div class="app-nav app-nav-{$leftNavStyle}">
        <div class="app-nav-header">
            <div class="container">
                <button class="app-nav-toggle navbar-toggle" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {include file="$template/includes/common/logo.tpl"}
                {include file="$template/includes/menu/top-nav.tpl"}
            </div>
        </div>
        {include file="$template/includes/menu/mainmenu.tpl"}
    </div>
{/if}

{include file="$template/includes/network-issues-notifications.tpl"}

<div class="app-main {if $isOnePageOrder}app-main-order{/if}">
    {if !$skipMainTop}
        <div class="main-top">
            <div class="container">
                {include file="$template/includes/menu/top-nav.tpl"}
            </div>
        </div>
    {/if}
    {include file="$template/includes/verifyemail.tpl"}
    {include file="$template/includes/validateuser.tpl"}
    {if !$skipMainHeader && !$isOnePageOrder}
        <div class="main-header">
            <div class="container">
                {if !$inShoppingCart}
                {include file="$template/includes/pageheader.tpl" title="$displayTitle {if $product}$product{/if}" desc=$tagline showbreadcrumb=true}
                {else}
                {include file="$template/includes/pageheader.tpl" title="$displayTitle {if $product}$product{/if}" desc=$tagline showbreadcrumb=false}
                {/if}
            </div>
        </div>
    {/if} 
    {if !$skipAppNav && ($skipMainBody || $isOnePageOrder) && $lagomClientAlerts->default}
        <div class="custom-alerts">
            {$lagomClientAlerts->default}
        </div>
    {/if}
    {if !$skipMainBody && !$isOnePageOrder}
        <div class="main-body{if $appMainBodyClasses} {$appMainBodyClasses}{/if}">
            <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
                {if !$skipAppNav && $lagomClientAlerts->default}
                    <div class="custom-alerts">
                        {$lagomClientAlerts->default}
                    </div>
                {/if}
                {if !$inShoppingCart}<div class="main-grid">{/if}
                {* Main grid with sidebar *}
                {if !$skipMainSidebar}
                    <div class="main-sidebar {if $sidebarOnRight || $RSThemes['layouts']['name'] == 'left-nav-wide'} main-sidebar-right {/if}">
                        {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}<div class="sidebar-sticky">{/if}
                            <div class="sidebar sidebar-primary">
                                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar} 
                                {include file="$template/includes/sidebar/sidebar-custom.tpl"}
                            </div>
                            <div class="sidebar sidebar-secondary ">
                                {include file="$template/includes/sidebar/sidebar-secondary-custom.tpl"}
                                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                                {include file="$template/includes/sidebar/sidebar-promo.tpl"}
                            </div>
                        {if $RSThemes['addonSettings']['sticky_sidebars'] == "true"}</div>{/if}
                    </div>
                    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
                {* Main grid without sidebar *}
                {elseif !$skipMainBodyContainer && !$inShoppingCart}
                    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}">
                {/if}
    {/if}