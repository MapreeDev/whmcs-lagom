{if file_exists("templates/orderforms/$carttpl/includes/overwrites/existing-paymethods.tpl")}
    {include file="templates/orderforms/$carttpl/includes/overwrites/existing-paymethods.tpl"}
{else}

    {if $selectedAccountId === $client->id}
    <div class="cc-list">
    {foreach $client->payMethods->validateGateways()->sortByExpiryDate() as $payMethod}
        {assign "payMethodExpired" 0}
        {assign "expiryDate" ""}
        {if $payMethod->isCreditCard()}
            {if ($payMethod->payment->isExpired())}
                {assign "payMethodExpired" 1}
            {/if}
    
            {if $payMethod->payment->getExpiryDate()}
                {assign "expiryDate" $payMethod->payment->getExpiryDate()->format('m/Y')}
            {/if}
        {/if}
        <div class="cc-item {if $payMethodExpired}disabled{/if}" data-paymethod-id="{$payMethod->id}">
            <div class="cc-item-checkbox">
                <input
                    type="radio"
                    name="ccinfo"
                    class="existing-card icheck-control"
                    {if $payMethodExpired}disabled{/if}
                    data-payment-type="{$payMethod->getType()}"
                    data-payment-gateway="{$payMethod->gateway_name}"
                    data-order-preference="{$payMethod->order_preference}"
                    value="{$payMethod->id}">
            </div>
            <div class="cc-item-icon" >
                {if $payMethod->payment->getDisplayName()|strstr:"Visa"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/visa.svg" alt=""/>
                {elseif $payMethod->payment->getDisplayName()|strstr:"Jcb"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/jcb.svg" alt=""/>
                {elseif $payMethod->payment->getDisplayName()|strstr:"Mastercard" || $payMethod->payment->getDisplayName()|strstr:"MasterCard"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/mastercard.svg" alt=""/>
                {elseif $payMethod->payment->getDisplayName()|strstr:"Amex"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/american-express.svg" alt=""/>
                {elseif $payMethod->payment->getDisplayName()|strstr:"Discover"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/discover.svg" alt=""/>
                {elseif $payMethod->payment->getDisplayName()|strstr:"Diners"}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/credit-card.svg" alt=""/>
                {else}
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/creditcards/credit-card.svg" alt=""/>
                {/if}
            </div>                                                       
    
        
            <div class="cc-item-name" >
                {if $payMethod->isCreditCard() || $payMethod->isRemoteBankAccount()}
                    {$payMethod->payment->getDisplayName()}
                {else}
                    <span class="type">
                        {$payMethod->payment->getAccountType()}
                    </span>
                    {substr($payMethod->payment->getAccountNumber(), -4)}
                {/if}
            </div>
            <div class="cc-item-desc {if $payMethod->getDescription() == "-"}empty{/if}" >
                {$payMethod->getDescription()}
            </div>
            <div class="cc-item-status" >
                {$expiryDate}
            </div>
            <div class="cc-item-actions" >
                <span class="status status-{$payMethod->getStatus()|lower}">{$payMethod->getStatus()}</span>
            </div>
        </div>
    {/foreach}
    </div>
{/if}
{/if}