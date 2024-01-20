{if $type == "related-services"}
    {assign var="hiddeStatus" value=false scope=parent}
    {if $relatedservice.id|strstr:"S"}
        {assign var="relatedId" value=$relatedservice.id|replace:"S":""}
        {foreach $services as $service}
            {if $service.id == $relatedId}
                 {if $service.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveServicesStatus']}
                    {assign var="hiddeStatus" value=true scope=parent}
                {/if}
            {/if}
        {/foreach}
    {/if}
    {if $relatedservice.id|strstr:"D"}
        {assign var="relatedId" value=$relatedservice.id|replace:"D":""}
        {foreach $domains as $domain}
            {if $domain.id == $relatedId}
                 {if $domain.status|in_array:$RSThemes['pages'][$templatefile]['config']['hideInactiveDomainStatus']}
                    {assign var="hiddeStatus" value=true scope=parent}
                {/if}
            {/if}
        {/foreach}
    {/if}
{/if}