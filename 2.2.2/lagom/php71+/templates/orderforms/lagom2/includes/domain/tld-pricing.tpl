{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/tld-pricing.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/tld-pricing.tpl"}
{else}
    <div class="section domain-pricing{if $customClass} {$customClass}{/if}">
        <div class="section-header">
            <h2 class="section-title">{lang key='pricing.browseExtByCategory'}</h2>
        </div> 
        <div class="section-body">        
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
                {if $RSThemes['pages'][$templatefile]['config']['showTLDCategoryFilter'] == '1'}
                <div class="tld-categories">
                    {assign var=firstCat value=$categoriesWithCounts|@key}
                    <select multiple class="form-control custom-multiselect" id="domain-filter">
                        <option value="All" selected>{lang key='all'} ({$pricing['pricing']|count})</option>
                        {foreach $categoriesWithCounts as $category => $count key=key}
                            <option value="{$category}">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</option>
                        {/foreach}
                    </select>
                </div>
                {/if}
                <div class="tld-search search-group">
                    <div class="search-field">
                        <input type="text" id="table-search" class="form-control" placeholder="{$LANG.tableentersearchterm}" >
                        <div class="search-field-icon"><i class="lm lm-search"></i></div>     
                    </div>
                </div>
            </div>
            <div class="tld-table table-container clearfix">
                <table class="table table-list hidden" id="tableDomainPricing">
                    <thead>
                        <tr>
                            <th>{lang key='orderdomain'}</th>
                            <th class="hidden">{lang key='category'}</th>   
                            <th class="hidden">key</th>                         
                            <th>{lang key='pricing.register'}</th>
                            <th>{lang key='pricing.transfer'}</th>
                            <th>{lang key='pricing.renewal'}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pricing['pricing'] as $tld => $price}
                            <tr>
                                <td>
                                    <strong class="tld-name"><span>.</span>{$tld}</strong>
                                    {if $price.group}
                                        {if $price.group == "hot"}
                                            {assign var="grouplabel" value="danger"}
                                            {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['hot']}
                                        {elseif $price.group == "new"}
                                            {assign var="grouplabel" value="success"}
                                            {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['new']}
                                        {elseif $price.group == "sale"}
                                            {assign var="grouplabel" value="purple"}
                                            {assign var="grouptext" value=$LANG['domainCheckerSalesGroup']['sale']}
                                        {/if}
                                        <span class="label label-{$grouplabel}">{$grouptext}!</span>
                                    {/if}
                                </td>
                                <td class="hidden">
                                    All
                                    {foreach $price.categories as $category}
                                        {$category} 
                                    {/foreach}
                                </td>  
                                <td class="hidden">
                                    {$price@index}
                                </td>                              
                                <td data-order="{current($price.register)|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:",":""|replace:".":""}">
                                    <span class="tld-label">{lang key='pricing.register'}</span>
                                    {if isset($price.register) && current($price.register) > 0}
                                        {current($price.register)}<br>
                                        <small>{key($price.register)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {elseif isset($price.register) && current($price.register) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                                <td data-order="{current($price.transfer)|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:",":""|replace:".":""}">
                                    <span class="tld-label">{lang key='pricing.transfer'}</span>
                                    {if isset($price.transfer) && current($price.transfer) > 0}
                                        {current($price.transfer)}<br>
                                        <small>{key($price.transfer)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {elseif isset($price.transfer) && current($price.transfer) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                                <td data-order="{current($price.renew)|replace:$WHMCSCurrency.prefix:""|replace:$WHMCSCurrency.suffix:""|replace:",":""|replace:".":""}">
                                    <span class="tld-label">{lang key='pricing.renewal'}</span>
                                    {if isset($price.renew) && current($price.renew) > 0}
                                        {current($price.renew)}<br>
                                        <small>{key($price.renew)} {if key($price.register) > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                                    {elseif isset($price.renew) && current($price.renew) == 0}
                                        <small>{lang key='orderfree'}</small>
                                    {else}
                                        <small>{lang key='na'}</small>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
                <div class="loder loader-table" id="tableLoading">
                    {include file="$template/includes/common/loader.tpl"}
                </div>
            </div>        
        </div>
    </div>
{/if}