{if file_exists("templates/$template/payment/card/overwrites/select.tpl")}
    {include file="{$template}/payment/card/overwrites/select.tpl"}  
{else} 
    {if count($existingCards) > 0}
        <div class="panel-nav">
            <ul class="nav nav-tabs">
                <li >
                    <a {if $cardOnFile && $ccinfo neq "new"}class="active"{/if} href="#existingCardInfo" data-simple-radio-tab data-toggle="tab" aria-expanded="true">                                    
                        {$LANG.creditcarduseexisting}
                    </a>
                </li>
                <li >
                    <a {if $ccinfo eq "new" || !$cardOnFile}class="active"{/if} href="#newCardInfoTab" data-simple-radio-tab data-toggle="tab" aria-expanded="false">
                        <div class="hidden">
                            <input id="newCCInfo" type="radio" value="new" name="ccinfo" class="icheck-control" {if $ccinfo eq "new" || !$cardOnFile} checked{/if} />
                        </div>
                        {$LANG.creditcardenternewcard}
                    </a>
                </li>
            </ul>
        </div>
    {/if}

    <div class="panel-body">
        {if count($existingCards) == 0}
            <input id="newCCInfo" type="radio" class="hidden" name="ccinfo" value="new" onclick="{if $remotecode}hideRemoteInputForm(){else}hideNewCardInputFields(){/if};"{if $ccinfo eq "new" || !$cardOnFile} checked{/if} /> 
            <h5>{$LANG.creditcardenternewcard}</h5>
        {/if}
        <div class="tab-content">
            <div id="existingCardInfo" class="tab-pane {if count($existingCards) > 0 && $ccinfo neq "new"}active{/if}">
                {if count($existingCards) > 0}
                    <div class="cc-list">
                        {foreach $existingCards as $cardInfo}
                            {assign "payMethodExpired" 0}
                            {assign "expiryDate" ""}
                            {assign "payMethod" $cardInfo.payMethod nocache}
                            {if $payMethod->payment->isExpired()}
                                {assign "payMethodExpired" 1}
                            {/if}
                            {if $payMethod->payment->getExpiryDate()}
                                {assign "expiryDate" $payMethod->payment->getExpiryDate()->format('m/Y')}
                            {/if}

                            <div class="cc-item {if $payMethodExpired}disabled{/if}" data-paymethod-id="{$cardInfo.paymethodid}">
                                <div class="cc-item-checkbox">
                                    <input
                                        id="existingCard{$cardInfo.paymethodid}"
                                        type="radio"
                                        name="ccinfo"
                                        class="existing-card icheck-control"
                                        data-billing-contact-id="{$cardInfo.billingcontactid}"
                                        {if $cardOnFile && !$payMethodExpired && $payMethodId eq $cardInfo.paymethodid}
                                            {assign "preselectedBillingContactId" {$cardInfo.billingcontactid}}
                                            checked="checked" data-loaded-paymethod="true"
                                        {elseif ($cardOnFile && $payMethodExpired) || !$cardOnFile}
                                            disabled="disabled"
                                        {/if}
                                        onclick="{if $remotecode}hideRemoteInputForm(){else}hideNewCardInputFields(){/if};"
                                        value="{$cardInfo.paymethodid}"
                                    >
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

                                <div class="cc-item-name">
                                    {$payMethod->payment->getDisplayName()}
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
            </div>    
            {if !$hasRemoteInput}
                {include file="$template/payment/$cardOrBank/inputs.tpl"}
            {/if}
        </div>
    </div>   
{/if}