{if isset($primaryNavbarHtmlCache) && $navtype == "primary"}
    {$primaryNavbarHtmlCache}
{elseif isset($secondaryNavbarHtmlCache) && $navtype != "primary"}
    {$secondaryNavbarHtmlCache}
{else}
    {if file_exists("templates/$template/includes/overwrites/navbar.tpl")}
        {include file="{$template}/includes/overwrites/navbar.tpl"}
    {else}
        {if $pageType != "website"}
            {foreach $navbar as $item}
                {$activeGroup = false}
                {if $item->getUri() == $currentUrl && isset($navtype) && $navtype == "primary" && !$item->getClass()|strstr:"nav-item-btn" && !$item->hasChildren()}
                    {assign var="activeGroup" value=$item->getName()}  
                {/if}
                {if $item->hasChildren()}
                    {foreach $item->getChildren() as $childItem}
                        {$activePage = false}
                        {if $childItem->getUri() && ($childItem->getUri() == $currentUrl || ($currentUrl|strstr:"/ssl-certificates/" && $childItem->getUri()|strstr:"/ssl-certificates" && !$currentUrl|strstr:"/ssl-certificates/manage") || $childItem->getUri()|replace:".php":"" == $currentUrl)}
                            {assign var="activePage" value=$childItem->getName()}
                            {if isset($navtype) && $navtype == "primary"}
                                {assign var="activeGroup" value=$item->getName()}
                            {/if}
                        {/if}
                        {if $activePage}{break}{/if}
                    {/foreach}
                {/if}
                {if $activeGroup}{break}{/if}
            {/foreach}
        {/if}
        {foreach $navbar as $item}
            <li
                menuItemName="{$item->getName()}"
                class="{if $item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')}dropdown{/if}{if $item->getClass()}{$item->getClass()}{/if}{if $item->getName() == $activeGroup} active{/if}{if $RSThemes['layouts']['name'] == 'left-nav-wide' && $item->getName() == $activeGroup && $item->hasChildren()} open{/if}"
                id="{$item->getId()}"
                {if $item->getAttribute('languageDropdown')}data-language-select{/if}
            >
                {if $item->hasBodyHtml()}
                    {$item->getBodyHtml()}
                {else}
                    <a
                        {if $item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')}
                            class="dropdown-toggle"
                            href="#"
                            data-toggle="dropdown"
                        {else}
                            {if $item->getUri()|strstr:"javascript:void" || $item->getUri()|strstr:"tel:" || $item->getUri()|strstr:"mailto:"}
                                href="{$item->getUri()|replace:"/":""}"
                            {else}
                                href="{$item->getUri()}"
                            {/if}
                        {/if}
                        {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}
                        {if $RSThemes.layouts.templateLayout ==  "left-nav" && $navtype == "primary" && $item->getUri() && $item->getUri()!= "#" && $item->hasChildren()}data-nav-href="{$item->getUri()}"{/if}
                    >
                        {if ($RSThemes.addonSettings.show_gravatar_image == 'hidden' && $item->getName() == 'Account') || ($RSThemes.addonSettings.show_gravatar_image == 'displayed' && !$loggedin && $item->getName() == 'Account')}
                            {if $item->hasIcon()}
                                <i class="{$item->getIcon()}"></i>
                            {elseif $item->hasHeadingHtml()}
                                {$item->getHeadingHtml()}
                            {/if}
                        {elseif $item->hasIcon() && $item->getName() != 'Account'}
                            <i class="{$item->getIcon()}"></i>
                        {elseif $item->hasHeadingHtml() && $item->getName() != 'Account'}
                            {$item->getHeadingHtml()}
                        {/if}
                        {if $item->getName() == 'Account'}
                            {if $loggedin}
                                {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                    <div class="client-avatar client-avatar-sm">
                                        <img class="lazyload" data-src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                    </div>
                                {/if}
                                {if $item->getLabel() && $item->getLabel() != ""}
                                    {if $loggedinuser && !empty($loggedinuser->first_name)}
                                        <div class="active-client">
                                            <span class="item-text">{$loggedinuser->first_name} {$loggedinuser->last_name}</span>
                                            {if $clientsdetails.userid == $clientsdetails.client_id}
                                                <span>{$clientsdetails.companyname}</span>
                                            {/if}
                                        </div>
                                    {else}
                                        <div class="active-client">
                                            <span class="item-text">{$clientsdetails.firstname} {$clientsdetails.lastname}</span>
                                            <span>{$clientsdetails.companyname}</span>
                                        </div>
                                    {/if}
                                {/if}
                            {elseif $item->getLabel() && $item->getLabel() != ""}
                                <span class="item-text">{$LANG.myaccount}</span>
                            {/if}
                        {elseif $item->getLabel() && $item->getLabel() != ""}
                            <span class="item-text">{$item->getLabel()}</span>
                        {/if}
                        {if $item->hasBadge()}{$item->getBadge()}{/if}
                        {if ($item->hasChildren() || $item->getAttribute('languageDropdown') || $item->getAttribute('currencyDropdown')) && !$item->getAttribute('notificationDropdown')}<b class="ls ls-caret"></b>{/if}
                    </a>
                {/if}
                {if $item->getAttribute('languageDropdown')}
                    {include file="templates/$template/includes/common/language-chooser-dropdown.tpl"}
                {elseif $item->getAttribute('currencyDropdown')}
                    {include file="templates/$template/includes/common/currency-dropdown.tpl"}
                {elseif $item->hasChildren()}
                    {* MEGA MENU *}
                    {if $item->getClass()|strstr:"dropdown-mega"}
                        <div class="dropdown-menu dropdown-lazy {if $RSThemes.layouts.templateLayout ==  "left-nav-wide" && $navtype == "primary"}{else}has-scroll{/if} {if $item->getName() == "Account" && $loggedin}dropdown-menu-right{/if} {if $item->getAttribute('notificationDropdown')}client-alerts{/if}">
                            <div class="dropdown-menu-body">
                                <div class="dropdown-menu-content">
                                    {$headerFirst = false}
                                    {foreach from=$item->getChildren() key=$key item=$childItem}
                                        {if $childItem@index == 0 && $childItem->getName()|strstr:"Header" && $childItem->getClass()|strstr:"nav-header"}
                                            {$headerFirst = true}
                                        {/if}
                                    {/foreach}
                                    {if !$headerFirst}<div class="dropdown-menu-parent">
                                        <div class="dropdown-menu-cols">
                                            <ul class="dropdown-menu-list">{/if}
                                                {counter assign=i start=0 print=false}
                                                {foreach $item->getChildren() as $childItem}
                                                    {counter}
                                                    {if $childItem->getName() == 'Client Details' && $loggedin}
                                                        <li class="dropdown-menu-item dropdown-header dropdown-header--account">
                                                            {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                                                <div class="client-avatar client-avatar-sm">
                                                                    <img class="lazyload hidden" data-src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                                                </div>
                                                            {/if}
                                                            <div class="dropdown-header-info">
                                                                {$childItem->getLabel()}
                                                            </div>
                                                        </li>
                                                    {else}
                                                        {if !$childItem->getName()|strstr:"Divider" && !$childItem->getClass()|strstr:"nav-divider" && !$childItem->getName()|strstr:"Header" && !$childItem->getClass()|strstr:"nav-header"}
                                                            <li menuItemName="{$childItem->getName()}" class="dropdown-menu-item {if $childItem->getClass()}{$childItem->getClass()}{/if} {if $childItem->getName() == $activePage}active{/if}" id="{$childItem->getId()}">
                                                                {if $childItem->hasBodyHtml()}
                                                                    {$childItem->getBodyHtml()}
                                                                {else}
                                                                    <a
                                                                        {if $childItem->getUri()|strstr:"javascript:void" || $childItem->getUri()|strstr:"tel:" || $childItem->getUri()|strstr:"mailto:"}
                                                                            href="{$childItem->getUri()|replace:"/":""}"
                                                                        {else}
                                                                            href="{$childItem->getUri()}"
                                                                        {/if}
                                                                        {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}
                                                                    >
                                                                        {if $childItem->hasIcon()}
                                                                            <i class="{$childItem->getIcon()}"></i>
                                                                        {elseif $childItem->hasHeadingHtml()}
                                                                            {$childItem->getHeadingHtml()}
                                                                        {/if}
                                                                        {$childItem->getLabel()}
                                                                        {if $childItem->hasBadge()}{$childItem->getBadge()}{/if}
                                                                    </a>
                                                                {/if}
                                                                {if $childItem->hasFooterHtml()}
                                                                    {$childItem->getFooterHtml()}
                                                                {/if}
                                                            </li>
                                                        {elseif $childItem->getName()|strstr:"Header" && $childItem->getClass()|strstr:"nav-header"}
                                                            {if $i != "1"}
                                                                </ul></div></div>
                                                            {/if}
                                                            <div class="dropdown-menu-parent">
                                                                <div class="nav-header">
                                                                    {$childItem->getBodyHtml()}
                                                                </div>
                                                                <div class="dropdown-menu-cols">
                                                                    <ul class="dropdown-menu-list">
                                                        {else}
                                                            </ul><ul class="dropdown-menu-list">
                                                        {/if}
                                                    {/if}
                                                {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                {if $item->hasFooterHtml()}
                                    <div class="dropdown-menu-sidebar">
                                        <div class="dropdown-menu-sidebar-content">
                                            {$item->getFooterHtml()}
                                        </div>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    {else}
                        {* DEFAULT & EXTENDED *}
                        <ul class="dropdown-menu dropdown-lazy{if $RSThemes.layouts.templateLayout ==  "left-nav-wide" && $navtype == "primary"}{else}has-scroll{/if} {if $item->getName() == "Account" && $loggedin}dropdown-menu-right{/if} {if $item->getAttribute('notificationDropdown')}client-alerts{/if}">
                            {if $RSThemes.layouts.vars.type == "navbar-left" && $navtype == "primary"}
                                <li class="dropdown-header">{$item->getLabel()}</li>
                            {/if}
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getName() == 'Client Details' && $loggedin}
                                    <li class="dropdown-header dropdown-header--account">
                                        {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                            <div class="client-avatar client-avatar-sm">
                                                <img class="lazyload hidden" data-src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                            </div>
                                        {/if}
                                        <div class="dropdown-header-info">
                                            {$childItem->getLabel()}
                                        </div>
                                    </li>
                                {else}
                                <li menuItemName="{$childItem->getName()}" class="{if $childItem->getClass()}{$childItem->getClass()}{/if} {if $childItem->getName() == $activePage}active{/if}" id="{$childItem->getId()}">
                                    {if $childItem->hasBodyHtml()}
                                        {$childItem->getBodyHtml()}
                                    {else}
                                        <a
                                            {if $childItem->getUri()|strstr:"javascript:void" || $childItem->getUri()|strstr:"tel:" || $childItem->getUri()|strstr:"mailto:"}
                                                href="{$childItem->getUri()|replace:"/":""}"
                                            {else}
                                                href="{$childItem->getUri()}"
                                            {/if}
                                            {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}
                                        >
                                            {if $childItem->hasIcon()}
                                                <i class="{$childItem->getIcon()}"></i>
                                            {elseif $childItem->hasHeadingHtml()}
                                                {$childItem->getHeadingHtml()}
                                            {/if}
                                            {$childItem->getLabel()}
                                            {if $childItem->hasBadge()}{$childItem->getBadge()}{/if}
                                        </a>
                                    {/if}
                                    {if $childItem->hasFooterHtml()}
                                        {$childItem->getFooterHtml()}
                                    {/if}
                                </li>
                                {/if}
                            {/foreach}
                        </ul>
                    {/if}
                {/if}
            </li>
        {/foreach}
    {/if}
{/if}