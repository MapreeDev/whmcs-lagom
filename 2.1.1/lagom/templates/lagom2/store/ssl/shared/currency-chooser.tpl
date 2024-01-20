{if file_exists("templates/$template/store/ssl/shared/overwrites/currency-chooser.tpl")}
    {include file="{$template}/store/ssl/shared/overwrites/currency-chooser.tpl"}  
{else} 
    {if !$loggedin && $currencies}   
        <div class="currency-selector">
            {if $type == 'dv'}
            <div align="right">
            {else} 
            <div align="right">
            {/if}
                <form method="post" action="">
                    <select name="currency" class="form-control" onchange="submit()">
                        <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                        {foreach $currencies as $currency}
                            <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                        {/foreach}
                    </select>
                </form>
            </div>
        </div>
    {/if}
{/if}