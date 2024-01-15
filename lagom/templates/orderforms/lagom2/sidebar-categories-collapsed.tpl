{if file_exists("templates/orderforms/$carttpl/overwrites/sidebar-categories-collapsed.tpl")}
    {include file="templates/orderforms/$carttpl/overwrites/sidebar-categories-collapsed.tpl"}
{else}
    {if $RSThemes['pages'][$templatefile]['config']['hideSidebar'] != '1'}
    <div class="categories-collapsed visible-xs visible-sm visible-md clearfix">
        {include file="orderforms/$carttpl/sidebar-categories-selector.tpl"}
        {*
        {if !$loggedin && $currencies}
            <div class="pull-right form-inline">
                <form method="post" action="{$WEB_ROOT}/cart.php{if $action}?a={$action}{if $domain}&domain={$domain}{/if}{elseif $gid}?gid={$gid}{/if}">
                    <select name="currency" onchange="submit()" class="form-control">
                        <option value="">{$LANG.choosecurrency}</option>
                        {foreach from=$currencies item=listcurr}
                            <option value="{$listcurr.id}"{if $listcurr.id == $currency.id} selected{/if}>{$listcurr.code}</option>
                        {/foreach}
                    </select>
                </form>
            </div>
        {/if}
        *}
    </div>
    {/if}
{/if}
