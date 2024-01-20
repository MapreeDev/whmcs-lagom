{if file_exists("templates/$template/payment/card/overwrites/inputs.tpl")}
    {include file="{$template}/payment/card/overwrites/inputs.tpl"}  
{else}   
    <div id="newCardInfoTab" class="tab-pane {if $ccinfo eq " new" || !$cardOnFile}active{/if}"> 
        <div class="loader hidden justify-center"> 
            {include file="$template/includes/common/loader.tpl"} 
        </div> 
        {if !$hasRemoteInput} 
            <div class="fieldgroup-creditcard">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group cc-details">
                            <label for="inputCardNumber" class="control-label">{$LANG.creditcardcardnumber}</label>
                            <input type="tel" name="ccnumber" id="inputCardNumber" size="30" value="{if $ccnumber}{$ccnumber}{/if}" autocomplete="off" class="form-control newccinfo cc-number-field" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}" />
                            <span class="field-error-msg">{lang key="paymentMethodsManage.cardNumberNotValid"}</span>
                        </div>
                        <div class="form-group cc-details">
                            <label for="inputCardExpiry" class="control-label">{$LANG.creditcardcardexpires}</label>
                            <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="form-control field input-inline" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
                            <span class="field-error-msg help-block">{lang key="paymentMethodsManage.expiryDateNotValid"}</span>
                        </div> 
                        {if $showccissuestart || $showccissuestart}<div class="row">{/if} 
                            {if $showccissuestart} 
                                <div class="col-xs-6">
                                    <div class="form-group cc-details">
                                        <label for="inputIssueNum" class="control-label">{$LANG.creditcardcardissuenum}</label>
                                        <input type="number" name="ccissuenum" id="inputIssueNum" value="{$ccissuenum}" class="form-control  input-inline" />
                                    </div>
                                </div> 
                            {/if} 
                            {if $showccissuestart} 
                                <div class="col-xs-6">
                                    <div class="form-group cc-details">
                                        <label for="inputCardStart" class="control-label">{$LANG.creditcardcardstart}</label>
                                        <input type="tel" name="ccstartdate" id="inputCardStart" class="form-control field input-inline0" placeholder="MM / YY ({$LANG.creditcardcardstart})">
                                    </div>
                                </div> 
                            {/if} 
                        {if $showccissuestart || $showccissuestart}</div>{/if} 
                        <div id="inputDescriptionContainer" class="form-group cc-details">
                            <label for="inputDescription" class="control-label">{$LANG.paymentMethods.cardDescription}</label>
                            <input type="text" class="form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" placeholder="{lang key='paymentMethods.descriptionInput'} {$LANG.paymentMethodsManage.optional}" />
                        </div>
                    </div>
                </div> 
                {include file="$template/payment/billing-address.tpl"} 
                {if $allowClientsToRemoveCards} 
                    <div class="form-group cc-details">
                        <input type="hidden" name="nostore" value="1">
                        <div class="checkbox">
                            <label class="checkbox-inline no-padding" for="inputNoStore">
                            <input type="checkbox" checked="checked" name="nostore" value="0" class="icheck-control"> {$LANG.creditCardStore} </label>
                        </div>
                    </div> 
                {/if}
            </div> 
        {/if} 
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <label for="cctype" class="control-label">{$LANG.creditcardcvvnumber}</label>
                <input type="tel" name="cccvv" id="inputCardCvv" value="{$cccvv}" autocomplete="off" class="form-control input-inline " />
                <button id="cvvWhereLink" type="button" class="btn btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210'>"> {$LANG.creditcardcvvwhere} </button>
                <span class="field-error-msg help-block">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
            </div>
        </div>
    </div>
{/if}