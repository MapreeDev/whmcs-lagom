{if file_exists("templates/orderforms/$carttpl/overwrites/sidebar-categories.tpl")}
    {include file="templates/orderforms/$carttpl/overwrites/sidebar-categories.tpl"}
{else}
    {foreach $secondarySidebar as $panel}
        <div menuItemName="{$panel->getName()}" class="panel {if $panel->getClass()}{$panel->getClass()}{else}panel-sidebar{/if}{if $panel->getExtra('mobileSelect') and $panel->hasChildren()} hidden-sm hidden-xs{/if}"{if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}"{/if}>
            <div class="panel-heading">
                <h3 class="panel-title">
                    {if $panel->hasIcon()}
                        <i class="{$panel->getIcon()}"></i>&nbsp;
                    {/if}

                    {$panel->getLabel()}

                    {if $panel->hasBadge()}
                        &nbsp;<span class="badge">{$panel->getBadge()}</span>
                    {/if}

                    <i class="fa fa-chevron-up panel-minimise pull-right"></i>
                </h3>
            </div>

            {if $panel->hasBodyHtml()}
                <div class="panel-body">
                    {$panel->getBodyHtml()}
                </div>
            {/if}

            {if $panel->hasChildren()}
                <div class="list-group{if $panel->getChildrenAttribute('class')} {$panel->getChildrenAttribute('class')}{/if}">
                    {foreach $panel->getChildren() as $child}
                        {if $child->getUri()}
                            <a menuItemName="{$child->getName()}" href="{$child->getUri()}" class="list-group-item{if $child->isDisabled()} disabled{/if}{if $child->getClass()} {$child->getClass()}{/if}{if $child->isCurrent()} active{/if}"{if $child->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $child->getAttribute('target')} target="{$child->getAttribute('target')}"{/if} id="{$child->getId()}">
                                {if $child->hasIcon()}
                                    <i class="{$child->getIcon()}"></i>&nbsp;
                                {elseif $child->getLabel()|strstr:"VPS" || $child->getLabel()|strstr:"Dedicated" || $child->getLabel()|strstr:"Hosting"}
                                    <i class="ls ls-hosting"></i>
                                {elseif $child->getLabel()|strstr:"SSL"}
                                    <i class="ls ls-shield"></i>
                                {elseif $child->getLabel()|strstr:"Product Addons"}
                                    <i class="ls ls-addon"></i>
                                {else}
                                    <i class="ls ls-box"></i>
                                {/if}

                                {$child->getLabel()}

                                {if $child->hasBadge()}
                                    &nbsp;<span class="badge">{$child->getBadge()}</span>
                                {/if}
                            </a>
                        {else}
                            <div menuItemName="{$child->getName()}" class="list-group-item{if $child->getClass()} {$child->getClass()}{/if}" id="{$child->getId()}">
                                {if $child->hasIcon()}
                                    <i class="{$child->getIcon()}"></i>&nbsp;
                                {/if}

                                {$child->getLabel()}

                                {if $child->hasBadge()}
                                    &nbsp;<span class="badge">{$child->getBadge()}</span>
                                {/if}
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}

            {if $panel->hasFooterHtml()}
                <div class="panel-footer clearfix">
                    {$panel->getFooterHtml()}
                </div>
            {/if}
        </div>

        {if $panel->getExtra('mobileSelect') and $panel->hasChildren()}
            {* Mobile Select only supports dropdown menus *}
            <div class="panel hidden-lg hidden-md {if $panel->getClass()}{$panel->getClass()}{else}panel-default{/if}"{if $panel->getAttribute('id')} id="{$panel->getAttribute('id')}"{/if}>
                {include file="orderforms/$carttpl/sidebar-categories-selector.tpl"}
            </div>
        {/if}

    {/foreach}
{/if}