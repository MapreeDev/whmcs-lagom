{if file_exists("templates/orderforms/$carttpl/overwrites/sidebar-categories-selector.tpl")}
    {include file="templates/orderforms/$carttpl/overwrites/sidebar-categories-selector.tpl"}
{else}
    {if $panel}
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $panel->hasIcon()}
                    <i class="{$panel->getIcon()}"></i>&nbsp;
                {/if}

                {$panel->getLabel()}

                {if $panel->hasBadge()}
                    &nbsp;<span class="badge">{$panel->getBadge()}</span>
                {/if}
            </h3>
        </div>
        <div class="panel-body">
            <form role="form">
                <select class="form-control" onchange="selectChangeNavigate(this)">
                    {foreach $panel->getChildren() as $child}
                        <option menuItemName="{$child->getName()}" value="{$child->getUri()}" class="list-group-item" {if $child->isCurrent()}selected="selected"{/if}>
                            {$child->getLabel()}

                            {if $child->hasBadge()}
                                ({$child->getBadge()})
                            {/if}
                        </option>
                    {/foreach}
                </select>
            </form>
        </div>
        {if $panel->hasFooterHtml()}
            <div class="panel-footer">
                {$panel->getFooterHtml()}
            </div>
        {/if}
    {else}
        <div class="categories-sidebar">
            <div class="dropdown">
                <a href="#" data-toggle="dropdown" class="btn btn-default">
                    {if $groupname}
                        {$groupname}
                    {elseif $domain eq "register"}
                        {$LANG.navregisterdomain}
                    {elseif $transferdomainenabled}
                        {$LANG.transferinadomain}
                    {elseif $gid eq "addons"}
                        {$LANG.cartproductaddons}
                    {elseif $gid eq "renewals"}
                        {$LANG.domainrenewals}
                    {/if} 
                    <i class="ls ls-caret"></i>
                </a>
                <ul class="dropdown-menu has-scroll">
                    {foreach $secondarySidebar as $panel}
                        {if $panel->getName() != "Choose Currency"}
                            <li class="dropdown-title h6">{$panel->getLabel()}</li>
                            {if $panel->hasChildren()}
                                {foreach $panel->getChildren() as $child}
                                    {if $child->getClass() != "active" && $child->getUri()}
                                    <li>
                                        <a menuItemName="{$child->getName()}" href="{$child->getUri()}" class="{if $child->getClass()} {$child->getClass()}{/if}{if $child->isCurrent()} active{/if}"{if $child->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $child->getAttribute('target')} target="{$child->getAttribute('target')}"{/if} id="{$child->getId()}">
                                            {$child->getLabel()}
                                        </a>
                                    </li>
                                    {/if}
                                {/foreach}
                            {/if}
                        {/if}
                    {/foreach}
                </ul>
            </div>
        </div>
    {/if}
{/if}