{if file_exists("templates/orderforms/$carttpl/includes/viewcart/overwrites/choose-currency.tpl")}
    {include file="templates/orderforms/$carttpl/includes/viewcart/overwrites/choose-currency.tpl"}
{else}    
    {if !$loggedin && $currencies}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.choosecurrency}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-form m-b-0">
                    <div class="panel-body">
                        <form method="post" action="{$WEB_ROOT}/cart.php?a=view">
                            <select name="currency" onchange="submit()" class="form-control">
                                {foreach from=$currencies item=listcurr}
                                    <option value="{$listcurr.id}" {if $listcurr.id==$currency.id} selected{/if}>{$listcurr.code}</option>
                                {/foreach}
                            </select>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/if}
{/if}    