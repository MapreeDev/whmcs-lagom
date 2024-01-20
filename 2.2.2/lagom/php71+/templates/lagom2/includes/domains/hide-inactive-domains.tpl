{* Hide Inactive Services - status dropdown - toggle inactive statuses *}

{if $type == "status-dropdown"}
    {assign var="hiddeStatus" value=false scope=parent}
    {assign var="statusCounter" value=0}                                        
    {if $status.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
        {assign var="hiddeStatus" value=true scope=parent}
        {if $statusCounter == 0}{assign var="hiddeStatus" value=true scope=parent}{/if}
    {/if}
{/if}
{* Hide Inactive Services - switcher - toggle inactive domains *}
{if $type == "switcher"}
    {assign var="serviceCounter" value=0}
    {foreach key=num item=domain from=$domains}
        {if $domain.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
            {assign var="serviceCounter" value=$serviceCounter+1}
        {/if}
    {/foreach}
    <label class="d-flex" data-inactive-services>
        <span data-inactive-services-text="hide" {if !$hideInactiveServices['inactiveDomains']}class="hidden"{/if}>{$rslang->trans('hide_incactive_services.services.hide')|replace:"%s":$serviceCounter}</span>
        <span data-inactive-services-text="hidden"{if $hideInactiveServices['inactiveDomains']}class="hidden"{/if}>{$rslang->trans('hide_incactive_services.services.hidden')|replace:"%s":$serviceCounter}</span>
        <div class="switch switch--sm">
            <input class="switch__checkbox" type="checkbox" name="hideInactiveDomains" value="1" {if !$hideInactiveServices['inactiveDomains']}checked{/if} data-inactive-services-checkbox>
            <span class="switch__container"><span class="switch__handle"></span></span>
        </div>
    </label>  
{/if}  

{* Hide Inactive Services - Table Cell Additional text for filtering *}
{if $type == "table-cell"}
    {assign var="hiddeStatus" value=false}
    {if $domain['status']|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
        {assign var="hiddeStatus" value=true}
    {/if}    
    {if !$hiddeStatus}<span class="hidden">lagomshowservice</span>{/if}
{/if}