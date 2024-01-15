{if file_exists("templates/$template/overwrites/clientareaproductusagebilling.tpl")}
    {include file="{$template}/overwrites/clientareaproductusagebilling.tpl"}  
{else}
    <div class="panel-body">
        <p class="alert alert-lagom alert-info m-b-0">{$LANG.metrics.explanation}</p>
    </div>
    <div class="panel-table table-responsive m-b-0">
        <table class="table m-b-0">
            <tr>
                <th>{$LANG.metrics.metric}</th>
                <th>{$LANG.metrics.currentUsage}</th>
                <th>{$LANG.metrics.pricing}</th>
                <th>{$LANG.metrics.lastUpdated}</th>
                <th></th>
            </tr>
            {foreach $metricStats as $metric}
                <tr>
                    <td>{$metric.displayName}</td>
                    <td>{$metric.currentValue}</td>
                    <td>
                        {if count($metric.pricing) > 1}
                            {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}  
                        {elseif count($metric.pricing) == 1}
                            {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                            {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                        {else}
                            &mdash;
                        {/if}
                        {include file="$template/usagebillingpricing.tpl"}
                    </td>
                    <td>{if is_string($metric.lastUpdated)}{$metric.lastUpdated}{else}{$metric.lastUpdated->diffForHumans()}{/if}</td>
                    <td>
                        {if count($metric.pricing) > 1}
                            <button type="button" class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                                {$LANG.metrics.pricing}
                            </button>
                        {/if}
                    </td>
                </tr>
            {/foreach}
        </table>
    </div>
{/if}    


