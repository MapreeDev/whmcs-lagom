<div class="list-group-item-content" data-href="clientarea.php?action=productdetails&id={$service->id}">
    <div class="list-group-item-name">
        <span><b>{$service->product->productGroup->name}</b> - {$service->product->name}</span>
        <span class="text-domain">{$service->domain}</span>
    </div>
    <div class="list-group-item-status">
        {assign var="nexDueTS" value=strtotime($service->nextduedate)}
        {if $service->billingcycle == "Monthly"}
            {assign var="nexDueTSConv" value=strtotime( "-3 day", strtotime($service->nextduedate))}
        {else}
            {assign var="nexDueTSConv" value=strtotime( "-30 day", strtotime($service->nextduedate))}
        {/if}
        {assign var="todayDate" value=strtotime($todaysdate)}
        {math assign="days" equation='(x-y)/z' x=$nexDueTS y=$todayDate z="86400"}
        {if $days < 0}
            {math assign="days" equation='x*y' x=$days y="-1"}
        {/if}
        
        {if ($nexDueTSConv <= $todayDate) && ($service->nextduedate != '0000-00-00')}
            <span class="status-expiry text-danger">
            {lang key='domainRenewal.expiredDaysAgo' days=$days}
            <i class="ls ls-exclamation-circle"></i>
            </span>
        {/if}
        <span class="label label-{$statusProperties[$service->domainStatus]['modifier']}"
              title="{$statusProperties[$service->domainStatus]['translation']}"
        >
            {$statusProperties[$service->domainStatus]['translation']}
        </span>
    </div>
    <div class="list-group-item-actions">
        {if !empty($buttonData)}
            <div class="list-group-item-dropdown dropdown" data-service-id="{$service->id}">    
                <button type="button"
                        class="btn btn-sm btn-default dropdown-toggle"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    <span>{$LANG.manage}</span>
                    <i class="ls ls-caret"></i>
                </button>
                <ul class="dropdown-menu" data-service-id="{$service->id}" data-href="clientarea.php?action=productdetails&id={$service->id}">
                    {foreach $buttonData as $buttonDatum}
                        <li class="dropdown-item btn-custom-action{if !$buttonDatum['active']} disabled{/if}"
                            data-serviceid="{$buttonDatum['serviceid']}"
                            data-identifier="{$buttonDatum['identifier']}"
                            data-active="{$buttonDatum['active']}"
                            {if !$buttonDatum['active']}disabled="disabled"{/if}
                        >
                            {$buttonDatum['display']}
                            <span class="loading w-hidden">
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}   
                            </span>
                        </li>
                    {/foreach}
                    <li class="dropdown-item">{$LANG.manage}</li>
                </ul>
            </div>    
        {else}
            <button class="btn btn-default btn-sm btn-view-details">
                {$LANG.manage}
            </button>    
        {/if}
    </div>
</div>