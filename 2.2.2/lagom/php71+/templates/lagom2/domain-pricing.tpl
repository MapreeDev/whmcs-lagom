

{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/tablelist.tpl" tableName="DomainPricing" saveState="false"}
    <script type="text/javascript">
        jQuery(document).ready(function(){
            var table = jQuery('#tableDomainPricing').removeClass('hidden').DataTable();
            table.order(2, 'asc');
            table.draw();
            jQuery('#tableLoading').addClass('hidden');
        });
    </script>   
    <div class="tld-toolbar">
        <div class="tld-categories">
            {assign var=firstCat value=$tldCategories|@key}
            <select multiple class="form-control custom-multiselect" id="domain-filter">
                <option value="All" selected>{lang key='all'} ({$pricing|count})</option>
                {foreach $tldCategories as $category => $count key=key}
                    <option value="{$category}" {if $category == $firstCat}{/if}>{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</option>
                {/foreach}
            </select>
        </div>
        <div class="tld-search search-group">
            <div class="search-field">
                <i class="search-field-icon lm lm-search"></i>
                <input type="text" id="table-search" class="form-control" placeholder="{$LANG.tableentersearchterm}" >
            </div>
        </div>
    </div>
    <div class="tld-table table-container">
        <table class="table table-list hidden" id="tableDomainPricing">
            <thead>
                <tr>
                    <th>{lang key='domaintld'}</th>
                    <th>{lang key='category'}</th>
                    <th class="hidden">key</th>     
                    <th>{lang key='pricing.register'}</th>
                    <th>{lang key='pricing.transfer'}</th>
                    <th>{lang key='pricing.renewal'}</th>
                    <th>{lang key='gracePeriod'}</th>
                    <th>{lang key='redemptionPeriod'}</th>
                </tr>
            </thead>
            <tbody>
            {foreach $pricing as $extension => $data}
                <tr>
                    <td>
                    <strong class="tld-name"><span>.</span>{$extension}</strong>
                        {if $data.group}
                            {if $data.group == "hot"}
                                {assign var="grouplabel" value="danger"}
                                {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['hot']}
                            {elseif $data.group == "new"}
                                {assign var="grouplabel" value="success"}
                                {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['new']}
                            {elseif $data.group == "sale"}
                                {assign var="grouplabel" value="purple"}
                                {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['sale']}
                            {/if}
                            <span class="label label-{$grouplabel}">
                                {$grouptext}!
                            </span>
                        {/if}
                    </td>
                    <td>
                        <span class="tld-label">{lang key='category'}</span>
                        {$data.categories[0]}
                        <span class="hidden">
                            All
                            {foreach $data.categories as $category}
                                {$category}
                            {/foreach}
                        </span>
                    </td>
                    <td class="hidden">
                        {$data@index}
                    </td>       
                    {foreach $data.register as $years => $price}
                        <td data-order="{$price->toNumeric()|replace:",":""|replace:".":""}">
                        <span class="tld-label">{lang key='pricing.register'}</span>
                            {if $price >= 0}
                                {$price}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>{lang key="domainregnotavailable"}</small>
                            {/if}
                        </td>
                        {break}
                        {foreachelse}
                        <td>-</td>
                    {/foreach}
                    {foreach $data.transfer as $years => $price}
                        <td data-order="{$price->toNumeric()|replace:",":""|replace:".":""}">
                        <span class="tld-label">{lang key='pricing.transfer'}</span>
                            {if $price >= 0}
                                {$price}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>{lang key="domainregnotavailable"}</small>
                            {/if}
                        </td>
                        {break}
                        {foreachelse}
                        <td>-</td>
                    {/foreach}
                    {foreach $data.renew as $years => $price}
                        <td data-order="{$price->toNumeric()|replace:",":""|replace:".":""}">
                            <span class="tld-label">{lang key='pricing.renewal'}</span>
                            {if $price >= 0}
                                {$price}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>{lang key="domainregnotavailable"}</small>
                            {/if}
                        </td>
                        {break}
                        {foreachelse}
                        <td>-</td>
                    {/foreach}
                    <td>
                        {if is_null($data.grace_period)}
                            -
                        {else}
                            <span class="tld-label">{lang key='gracePeriod'}</span>
                            {$data.grace_period.days} {lang key='domainrenewalsdays'}<br>
                            <small>({$data.grace_period.price})</small>
                        {/if}
                    </td>
                    <td>
                        {if is_null($data.redemption_period)}
                            -
                        {else}
                            <span class="tld-label">{lang key='redemptionPeriod'}</span>
                            {$data.redemption_period.days} {lang key='domainrenewalsdays'}<br>
                            <small>({$data.redemption_period.price})</small>
                        {/if}
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="7">{lang key="pricing.noExtensionsDefined"}</td>
                </tr>
            {/foreach}
            </tbody>
        </table>
        <div class="loder loader-table" id="tableLoading">
            {include file="$template/includes/common/loader.tpl"}
        </div>
    </div>
{/if}