{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $createSuccess}
        {include file="$template/includes/alert.tpl" type="success" msg="{$LANG.paymentMethods.addedSuccess}"}
    {elseif $createFailed}
        {include file="$template/includes/alert.tpl" type="warning" msg="{$LANG.paymentMethods.addFailed}"}
    {elseif $saveSuccess}
        {include file="$template/includes/alert.tpl" type="success" msg="{$LANG.paymentMethods.updateSuccess}"}
    {elseif $saveFailed}
        {include file="$template/includes/alert.tpl" type="warning" msg="{$LANG.paymentMethods.saveFailed}"}
    {elseif $setDefaultResult === true}
        {include file="$template/includes/alert.tpl" type="success" msg="{$LANG.paymentMethods.defaultUpdateSuccess}"}
    {elseif $setDefaultResult === false}
        {include file="$template/includes/alert.tpl" type="warning" msg="{$LANG.paymentMethods.defaultUpdateFailed}"}
    {elseif $deleteResult === true}
        {include file="$template/includes/alert.tpl" type="success" msg="{$LANG.paymentMethods.deleteSuccess}"}
    {elseif $deleteResult === false}
        {include file="$template/includes/alert.tpl" type="warning" msg="{$LANG.paymentMethods.deleteFailed}"}
    {/if}
    {if $client->payMethods->validateGateways()|@count != 0}
        <div class="panel panel-cc" id="payMethodList">
            <div class="panel-body">
                <div class="cc-list">
                    {foreach $client->payMethods->validateGateways() as $payMethod}
                        <div class="cc-item">
                            <div class="cc-item-icon">
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
                            <div class="cc-item-name">{$payMethod->payment->getDisplayName()}</div>
                            {if $payMethod->description}
                                <div class="cc-item-desc">{$payMethod->description}</div>
                            {else}
                                <div class="cc-item-desc empty">-</div>
                            {/if}                            
                            <div class="cc-item-status"><span class="status status-{$payMethod->getStatus()|lower}">{$payMethod->getStatus()}</span></div>
                            <div class="cc-item-actions">
                                {if $payMethod->isDefaultPayMethod()}
                                    <span class="label label-success">{$LANG.paymentMethods.default}</span>
                                {elseif !$payMethod->isExpired()}
                                    <a href="{routePath('account-paymentmethods-setdefault', $payMethod->id)}" class="btn btn-sm btn-default btn-set-default">
                                        {$LANG.paymentMethods.setAsDefault}
                                    </a>
                                {/if}
                                <a href="{routePath('account-paymentmethods-view', $payMethod->id)}" data-toggle="tooltip" title="{$LANG.paymentMethods.edit}" class="btn btn-sm btn-icon{if $payMethod->getType() == 'RemoteBankAccount'} disabled{/if}" data-role="edit-payment-method">
                                    <i class="lm lm-edit"></i>
                                </a>
                                {if $allowDelete}
                                    <a href="{routePath('account-paymentmethods-delete', $payMethod->id)}" class="btn btn-sm btn-icon btn-delete" data-toggle="tooltip" title="{$LANG.paymentMethods.delete}">
                                        <i class="lm lm-trash"></i>
                                    </a>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
            <div class="panel-footer">
                {if $allowCreditCard}
                    <a href="{routePath('account-paymentmethods-add')}" class="btn btn-primary" data-role="add-new-credit-card">
                        {$LANG.paymentMethods.addNewCC}
                    </a>
                {/if}
                {if $allowBankDetails}
                    <a href="{routePathWithQuery('account-paymentmethods-add', null, 'type=bankacct')}" class="btn btn-default">
                        {$LANG.paymentMethods.addNewBank}
                    </a>
                {/if}
            </div>   
        </div>
    {else}
        <div class="message message-sm message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="credit-card"}         
            </div>
            <h6 class="message-title">{$LANG.paymentMethods.noPaymentMethodsCreated}</h6>
            <div class="message-actions"> 
                {if $allowCreditCard}
                <a href="{routePath('account-paymentmethods-add')}" class="btn btn-primary" data-role="add-new-credit-card">
                    {$LANG.paymentMethods.addNewCC}
                </a>
                {/if}
                {if $allowBankDetails}
                    <a href="{routePathWithQuery('account-paymentmethods-add', null, 'type=bankacct')}" class="btn btn-default">
                        {$LANG.paymentMethods.addNewBank}
                    </a>
                {/if}
            </div>
        </div>   
    {/if}
    <form method="post" action="" id="frmDeletePaymentMethod">
        <div class="modal fade" id="modalPaymentMethodDeleteConfirmation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">{$LANG.paymentMethods.areYouSure}</h4>
            </div>
            <div class="modal-body">
                <p>{$LANG.paymentMethods.deletePaymentMethodConfirm}</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger">{$LANG.yes}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.no}</button>
            </div>
            </div>
        </div>
        </div>
    </form>
    <form method="post" action="" id="frmSetDefaultPaymentMethod"></form>
    <script>
        jQuery(document).ready(function() {
            jQuery('.btn-set-default').click(function(e) {
                e.preventDefault();
                jQuery('#frmSetDefaultPaymentMethod')
                    .attr('action', jQuery(this).attr('href'))
                    .submit();
            });
            jQuery('.btn-delete').click(function(e) {
                e.preventDefault();
                jQuery('#frmDeletePaymentMethod')
                    .attr('action', jQuery(this).attr('href'));
                jQuery('#modalPaymentMethodDeleteConfirmation').modal('show');
            });
        });
    </script>
{/if}