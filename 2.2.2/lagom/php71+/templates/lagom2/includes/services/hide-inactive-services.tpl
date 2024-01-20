{* Hide Inactive Services - status dropdown - toggle inactive statuses *}

{if $type == "status-dropdown"}
    {assign var="hiddeStatus" value=false scope=parent}
    {assign var="statusCounter" value=0}                                        
    {if $status.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
        {foreach key=num item=service from=$services}
            {if $service.status == $status.status}
                {if $service.status == "Terminated" && $status.status == "Terminated" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays'] > 0}
                    {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays']} days"} 
                    {assign var="todayDate" value=strtotime("{$todysDateText}")}
                    {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
                    {assign var="compareDates" value=$todayDate - $serviceDate}
                    {if $compareDates < 0}
                        {assign var="statusCounter" value=$statusCounter + 1}                                                         
                    {/if}
                {elseif $service.status == "Cancelled" && $status.status == "Cancelled" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays'] > 0}    
                    {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays']} days"} 
                    {assign var="todayDate" value=strtotime("{$todysDateText}")}
                    {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
                    {assign var="compareDates" value=$todayDate - $serviceDate}
                    {if $compareDates < 0}
                        {assign var="statusCounter" value=$statusCounter + 1}                                                         
                    {/if}
                {else}
                    {assign var="hiddeStatus" value=true scope=parent}
                {/if}
            {/if}
        {/foreach}
        {if $statusCounter == 0}{assign var="hiddeStatus" value=true scope=parent}{/if}
    {/if}
{/if}

{* Hide Inactive Services - switcher - toggle inactive services *}
{if $type == "switcher"}
    {assign var="serviceCounter" value=0}
    {foreach key=num item=service from=$services}
        {if $service.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
            {if $service.status == "Terminated" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays'] > 0}                               
                {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays']} days"} 
                {assign var="todayDate" value=strtotime("{$todysDateText}")}
                {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
                {assign var="compareDates" value=$todayDate - $serviceDate}
                {if $compareDates > 0}
                    {assign var="serviceCounter" value=$serviceCounter+1}
                {/if}
            {elseif $service.status == "Cancelled" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays'] > 0}
                    {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays']} days"} 
                {assign var="todayDate" value=strtotime("{$todysDateText}")}
                {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
                {assign var="compareDates" value=$todayDate - $serviceDate}
                {if $compareDates > 0}
                    {assign var="serviceCounter" value=$serviceCounter+1}
                {/if}
            {else}
                {assign var="serviceCounter" value=$serviceCounter+1}
            {/if}
        {/if}
    {/foreach}
    <label class="d-flex" data-inactive-services>
        <span data-inactive-services-text="hide" {if !$hideInactiveServices['inactiveServices']}class="hidden"{/if}>{$rslang->trans('hide_incactive_services.services.hide')|replace:"%s":$serviceCounter}</span>
        <span data-inactive-services-text="hidden"{if $hideInactiveServices['inactiveServices']}class="hidden"{/if}>{$rslang->trans('hide_incactive_services.services.hidden')|replace:"%s":$serviceCounter}</span>
        <div class="switch switch--sm">
            <input class="switch__checkbox" type="checkbox" name="hideInactiveSercices" value="1" {if !$hideInactiveServices['inactiveServices']}checked{/if} data-inactive-services-checkbox>
            <span class="switch__container"><span class="switch__handle"></span></span>
        </div>
    </label>  
{/if}  



{* Hide Inactive Services - Table Cell Additional text for filtering *}
{if $type == "table-cell"}
    {assign var="hiddeStatus" value=false}
    {if $service['status']|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
        {if $service.status == "Terminated" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays'] > 0}                               
            {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesTerminatedDays']} days"} 
            {assign var="todayDate" value=strtotime("{$todysDateText}")}
            {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
            {assign var="compareDates" value=$todayDate - $serviceDate}
            {if $compareDates > 0}
                {assign var="hiddeStatus" value=true}
            {/if}
        {elseif $service.status == "Cancelled" && $RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays'] > 0} 
            {assign var="todysDateText" value="-{$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesCancelledDays']} days"} 
            {assign var="todayDate" value=strtotime("{$todysDateText}")}
            {assign var="serviceDate" value=strtotime($service.normalisedNextDueDate)}
            {assign var="compareDates" value=$todayDate - $serviceDate}
            {if $compareDates > 0}
                {assign var="hiddeStatus" value=true}
            {/if}   
        {else}
            {assign var="hiddeStatus" value=true}
        {/if}
    {/if}    
    {if !$hiddeStatus}<span class="hidden">lagomshowservice</span>{/if}
{/if}