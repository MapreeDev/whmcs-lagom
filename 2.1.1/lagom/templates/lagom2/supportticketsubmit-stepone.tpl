{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.supportticketschoosedepartment}</h2>
        </div>
        <div class="section-body">
            {if $departments}
                <div class="list-group">
                    {foreach from=$departments key=num item=department}
                        <a class="list-group-item has-icon" href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
                            <i class="list-group-item-icon lm lm-envelope"></i>
                            <div class="list-group-item-body {if $supportHours}list-group-support-hours{/if}">
                                <div class="list-group-item-heading">
                                    {$department.name} 
                                        {* If active supporthours in department  *}
                                        {if $supportHours && file_exists("templates/$template/includes/support-hours/departments-hours.tpl")}
                                            <div class="support-time-box d-flex">
                                                {include file="{$template}/includes/support-hours/departments-hours.tpl"}
                                            </div>
                                        {/if}
                                        
                                        {* 
                                            -- Start of integration code --
                                            - Integration code for: Premium Support Tickets For WHMCS from ModulesGarden
                                            - Module URL: https://www.modulesgarden.com/products/whmcs/premium-support-tickets
                                        *}

                                        {if $PremiumSupportTickets.$num}  
                                            {if $PremiumSupportTickets.$num.canCreate}
                                                <span class="label label-success m-l-1x">{$PremiumSupportTickets.$num.message}</span>
                                            {else}
                                                <span class="label label-danger m-l-1x">{$PremiumSupportTickets.$num.message}</span>
                                            {/if}
                                        {/if}
                                        {* -- End of integration code -- *}
                                </div>

                                {if $department.description}
                                    <p class="list-group-item-text">{$department.description}</p>
                                {/if}
                                {*
                                    -- Start of integration code --
                                    - Integration code for: Premium Support Tickets For WHMCS from ModulesGarden
                                    - Module URL: https://www.modulesgarden.com/products/whmcs/premium-support-tickets
                                *}
                                {if $PremiumSupportTickets.$num}                      
                                    {if $PremiumSupportTickets.$num.canCreate}
                                        <p class="list-group-item-text">
                                            {$PremiumSupportTickets.$num.havePointsMsg} {$PremiumSupportTickets.$num.havePoints}
                                        </p>
                                    {else}
                                        <p class="list-group-item-text">
                                            {$PremiumSupportTickets.$num.requiredPointsMsg} {$PremiumSupportTickets.$num.requiredPoints} <br />
                                            {$PremiumSupportTickets.$num.havePointsMsg} {$PremiumSupportTickets.$num.havePoints} <br />
                                        </p>
                                    {/if}
                                {/if}
                                {* -- End of integration code -- *}
                            </div>
                        </a>    
                    {/foreach}
                </div>
            {else}
                <div class="message message-no-data">
                    <div class="message-image">
                        {include file="$template/includes/common/svg-icon.tpl" icon="ticket"}
                    </div>
                    <h6 class="message-title">{$LANG.nosupportdepartments}</h6>
                </div>
            {/if}
        </div>
    </div>
{/if}
