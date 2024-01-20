{if $taxenabled && !$loggedin}
    <form method="post" action="{$WEB_ROOT}/cart.php?a=setstateandcountry">
        <div class="modal modal-lg fade" id="estimate-taxes">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="lm lm-close"></i></span>
                        </button>
                        <h3 class="modal-title">{$LANG.orderForm.estimateTaxes}</h3>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="inputCountry2" class="control-label">{$LANG.orderForm.country}</label>
                                    <select name="country" id="inputCountry2" class="form-control">
                                        {foreach $countries as $countrycode => $countrylabel}
                                            <option value="{$countrycode}" {if (!$country && $countrycode==$defaultcountry) || $countrycode eq $country} selected{/if}>
                                                {$countrylabel}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="inputState2" class="control-label">{$LANG.orderForm.state}</label>
                                    <input type="text" name="state" id="inputState2" value="{$clientsdetails.state}" class="form-control" {if $loggedin} disabled="disabled" {/if} />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-btn-loader>
                            <span>{$LANG.orderForm.updateTotals}</span>
                            <div class="loader loader-button hidden" >
                                {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                            </div>
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.orderForm.cancel}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
{/if}