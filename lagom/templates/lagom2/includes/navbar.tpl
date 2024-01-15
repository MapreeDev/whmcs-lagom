{if file_exists("templates/$template/includes/overwrites/navbar.tpl")}
    {include file="{$template}/includes/overwrites/navbar.tpl"}
{else}
    {foreach $navbar as $item}
        {if $item->getUri() == $currentUrl && $navtype == "primary"}
            {assign var="activeGroup" value=$item->getName()}
        {/if}       
        {if $item->hasChildren()}
            {foreach $item->getChildren() as $childItem}
                {if $childItem->getUri() == $currentUrl || $currentUrl|strstr:"/ssl-certificates/"}
                    {assign var="activePage" value=$childItem->getName()}
                    {if $currentUrl|strstr:"/ssl-certificates/"}
                        {assign var="activePage" value="symantec"}
                    {/if}
                    {if $navtype == "primary"}
                        {assign var="activeGroup" value=$item->getName()}
                        {if $currentUrl|strstr:"/ssl-certificates/"}
                            {assign var="activeGroup" value="Website & Security"}
                        {/if}
                    {/if}
                {/if}       
            {/foreach}
        {/if}
    {/foreach}
    
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
                        href="{if $item->getUri()|strstr:"javascript:void"}{$item->getUri()|replace:"/":""}{else}{$item->getUri()}{/if}"
                    {/if}
                    {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}
                    {if $RSThemes.layouts.name == "left-nav" && $navtype == "primary" && $item->getUri() && $item->getUri()!= "#" && $item->hasChildren()}data-nav-href="{$item->getUri()}"{/if}
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
                                    <img src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}" alt="Avatar">
                                </div>
                            {/if}
                            {if $item->getLabel() && $item->getLabel() != ""}
                                <div class="active-client">
                                    <span class="item-text">{$clientsdetails.firstname} {$clientsdetails.lastname}</span>
                                    <span>{$clientsdetails.companyname}</span>
                                </div>
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
            {if $item->hasFooterHtml()}
                {$item->getFooterHtml()}
            {/if}
            {if $item->getAttribute('languageDropdown')}
                {include file="$template/includes/common/language-chooser-dropdown.tpl"}
            {elseif $item->getAttribute('currencyDropdown')}
                {include file="$template/includes/common/currency-dropdown.tpl"}    
            {elseif $item->hasChildren()}
                <ul class="dropdown-menu {if $RSThemes.layouts.name == "left-nav-wide" && $navtype == "primary"}{else}has-scroll{/if} {if $item->getName() == "Account" && $loggedin}dropdown-menu-right{/if} {if $item->getAttribute('notificationDropdown')}client-alerts{/if}">
                    {if $RSThemes.layouts.vars.type == "navbar-left" && $navtype == "primary"}
                        <li class="dropdown-header">{$item->getLabel()}</li>
                    {/if}
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getName() == 'Client Details' && $loggedin}
                            <li class="dropdown-header dropdown-header--account">
                                {if $RSThemes.addonSettings.show_gravatar_image == 'displayed'}
                                    <div class="client-avatar client-avatar-sm">
                                        <img src="https://www.gravatar.com/avatar/{$loggedinuser->email|md5}" alt="Avatar">
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
                                <a href="{$childItem->getUri()}"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
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
        </li>
    {/foreach}
{/if}