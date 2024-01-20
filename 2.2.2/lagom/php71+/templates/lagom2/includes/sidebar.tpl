{if file_exists("templates/$template/includes/overwrites/sidebar.tpl")}
    {include file="{$template}/includes/overwrites/sidebar.tpl"}
{else}
    {foreach $sidebar as $item}
        <div menuItemName="{$item->getName()}" class="panel panel-sidebar{if $item->getName() == "Client Details" && $sidebarAccountBoxStyle} panel-sidebar-{$sidebarAccountBoxStyle}{/if} {if $item->getClass()}{$item->getClass()}{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} hidden-sm hidden-xs{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="panel-heading">
                {if $RSThemes.addonSettings.show_gravatar_image == 'displayed' && $item->getName() == "Client Details"}
                {else}
                    <h5 class="panel-title">
                        {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                        {$item->getLabel()}
                        {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        <i class="fa fa-chevron-up panel-minimise pull-right"></i>
                    </h5>
                {/if}
            </div>
            {if $item->hasBodyHtml()}
                <div class="panel-body">
                    {if $RSThemes.addonSettings.show_gravatar_image == 'displayed' && $item->getName() == "Client Details"}
                        <div class="client-avatar">
                            <img src="https://www.gravatar.com/avatar/{$clientsdetails.email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                        </div>
                    {/if}
                    {$item->getBodyHtml()}
                </div>
            {/if}
            {if $item->hasChildren()}
                <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getUri()}
                            <a menuItemName="{$childItem->getName()}" 
                                href="{if $item->getName() =="Domain Details Management" || $item->getName() =="Service Details Overview"}{if $childItem->getUri()|strstr:"action" || ($childItem->getUri()|strstr:"https://")}{$childItem->getUri()}{else}{$childItem->getUri()|replace:$WEB_ROOT:""|replace:"/":""}{/if}{else}{$childItem->getUri()}{/if}" 
                                class="list-group-item{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"
                                {if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}
                                {assign "customActionData" $childItem->getAttribute('dataCustomAction')}
                                {if is_array($customActionData)}
                                   data-active="{$customActionData['active']}"
                                   data-identifier="{$customActionData['identifier']}"
                                   data-serviceid="{$customActionData['serviceid']}"
                                {/if}
                                {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} 
                                id="{$childItem->getId()}"
                            >
                            {if $childItem->hasBodyHtml()}
                                {$childItem->getBodyHtml()}
                            {else}
                                {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                                {if $item->getName() == "Announcements Months"}
                                    {if $childItem->getName() != "Older" && $childItem->getName() != "RSS Feed"}
                                        <i class="ls ls-calendar"></i>
                                    {else}
                                        {if $childItem->hasIcon()}
                                            <i class="{$childItem->getIcon()}"></i>
                                        {/if}
                                    {/if}
                                {elseif $item->getName() == "Attachments"}
                                       <i class="ls ls-download"></i>
                                {else}
                                    {if $childItem->hasIcon()}
                                        <i class="{$childItem->getIcon()}"></i>
                                    {/if}
                                {/if}
                                {$childItem->getLabel()|replace:'style="color':'class="status" style="--status-color'|replace: 'loading hidden w-hidden':'loading w-hidden'|replace: '<i class="fas fa-spinner fa-spin"></i>':'    <div class="spinner spinner-sm"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div>'}
                                {if is_array($customActionData)}<span class="loading w-hidden" style="display: none;">{include file="$template/includes/common/loader.tpl" classes="spinner-sm"} </span>{/if}
                            {/if}
                            </a>
                        {else}
                            <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasBodyHtml()}
                                {$childItem->getBodyHtml()}
                            {else}
                                {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}

                                {if $item->getName() == "Ticket Information" && $childItem->getName() != "Subject"}
                                    {$childItem->getLabel()|replace:'<br />':'<span class="pull-right">'}</span>
                                {elseif $childItem->getName() == "Subject"}
                                    {$childItem->getLabel()|replace:'class="label"':''|replace:'style="background-color':'class="status" style="--status-color'}
                                {else}
                                    {$childItem->getLabel()}
                                {/if}
                            {/if}
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}
            {if $item->hasFooterHtml()}
                <div class="panel-footer clearfix">
                    {$item->getFooterHtml()}
                    {if $item->getName() == "Client Details"}
                       <a href="{$WEB_ROOT}/logout.php" class="btn btn-outline btn-sm btn-block">
                           {$LANG.clientareanavlogout}
                       </a>
                    {/if}

                </div>
            {/if}
        </div>
        {* {if $item->getExtra('mobileSelect') and $item->hasChildren()}
            <div class="panel hidden-lg hidden-md {if $item->getClass()}{$item->getClass()}{else}panel-default{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                <div class="panel-heading">
                    <h5 class="panel-title">
                        {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                        {$item->getLabel()}
                        {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                    </h5>
                </div>
                <div class="panel-body">
                    <form role="form">
                        <select class="form-control" onchange="selectChangeNavigate(this)">
                            {foreach $item->getChildren() as $childItem}
                                <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item" {if $childItem->isCurrent()}selected="selected"{/if}>
                                    {$childItem->getLabel()}
                                    {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                                </option>
                            {/foreach}
                        </select>
                    </form>
                </div>
                {if $item->hasFooterHtml()}
                    <div class="panel-footer">
                        {$item->getFooterHtml()}
                    </div>
                {/if}
            </div>
        {/if} *}
    {/foreach}
{/if}
