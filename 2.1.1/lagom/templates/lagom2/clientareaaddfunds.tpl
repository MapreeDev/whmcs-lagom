{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $addfundsdisabled}
        {include file="$template/includes/common/message.tpl" type="danger" customClass="message-no-data" msg=$LANG.clientareaaddfundsdisabled}
    {elseif $notallowed}
        {include file="$template/includes/common/message.tpl" type="danger" customClass="message-no-data" msg=$LANG.clientareaaddfundsnotallowed}
    {elseif $errormessage}
        {include file="$template/includes/alert.tpl" type="danger" msg=$errormessage}
    {/if}
    {if !$addfundsdisabled && !$notallowed}    
        <div class="panel panel-lg panel-default">
            <div class="panel-body">            
            <form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds" class="m-w-sm m-a">
                <p class="text-light">{$LANG.addfundsdescription}</p>
                <div class="form-group">
                    <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label>
                    <select name="paymentmethod" id="paymentmethod" class="form-control">
                        {foreach from=$gateways item=gateway}
                            <option value="{$gateway.sysname}">{$gateway.name}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group">
                    <label for="amount" class="control-label">{$LANG.addfundsamount}:</label>
                        {if $RSThemes['pages'][$templatefile]['config']['amountCalculated'] == "1"}
                            <div class="buttons-group buttons-5 m-b-2x" id="add-credits-buttons">
                                {assign var=maximumbal value=((($maximumbalance->toNumeric()-$clientsdetails.credit)/100)|round)*100}
                                {assign var=maximum value=$maximumamount->toNumeric()}
                                {if $maximum > $maximumbal && $maximumbal > 0}
                                    {assign var=maximum value=$maximumbal}
                                {/if}
                                {assign var=minimum value=(($maximum/5/10)|round)*10}
                            
                                {for $i=1 to 5}
                                    {assign var=step value=$minimum*$i}
                                    {if $step > $maximum}
                                        {assign var=step value=$maximum}
                                    {/if}
                                    <button class="btn btn-lg btn-outline{if $amount == $step} active{/if}" type="button" data-price="{$step|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$step}</button>
                                {/for}
                            </div>
                        {else}
                            {assign var="newAmount1" value="10"}
                            {assign var="newAmount2" value="25"}
                            {assign var="newAmount3" value="50"}
                            {assign var="newAmount4" value="75"}
                            {assign var="newAmount5" value="100"}
                            {for $i=1 to 5}
                                {assign var="value" value="amountVal{$i}"}
                                {if $RSThemes['pages'][$templatefile]['config'][$value]}
                                    {assign var="newAmount{$i}" value=$RSThemes['pages'][$templatefile]['config'][$value]}
                                {/if}
                            {/for}
                            <div class="buttons-group buttons-5 m-b-2x" id="add-credits-buttons">
                                <button class="btn btn-lg btn-outline{if $amount == $newAmount1} active{/if}" type="button" data-price="{$newAmount1|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$newAmount1}</button>
                                <button class="btn btn-lg btn-outline{if $amount == $newAmount2} active{/if}" type="button" data-price="{$newAmount2|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$newAmount2}</button>
                                <button class="btn btn-lg btn-outline{if $amount == $newAmount3} active{/if}" type="button" data-price="{$newAmount3|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$newAmount3}</button>
                                <button class="btn btn-lg btn-outline{if $amount == $newAmount4} active{/if}" type="button" data-price="{$newAmount4|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$newAmount4}</button>
                                <button class="btn btn-lg btn-outline{if $amount == $newAmount5} active{/if}" type="button" data-price="{$newAmount5|string_format:"%.2f"}">{$WHMCSCurrency.prefix}{$newAmount5}</button>
                            </div>
                        {/if}
                    <div class="input-group">
                        <input type="text" name="amount" id="amount" value="{$amount}" class="form-control" required />
                    </div>
                </div> 
                <div class="form-actions">
                    <button type="submit" value="{$LANG.addfunds}" class="btn btn-lg btn-block btn-primary" data-btn-loader>
                        <span>{$LANG.addfunds}</span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                        </div>
                    </button>
                </div>
            </form>
            </div>
        </div>
    {/if}
{/if}