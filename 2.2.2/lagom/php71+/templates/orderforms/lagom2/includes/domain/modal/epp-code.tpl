{if file_exists("templates/orderforms/$carttpl/includes/domain/modal/overwrites/epp-code.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/modal/overwrites/epp-code.tpl"}
{else}
    <div class="modal modal-lg fade" id="modal-epp-code">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="lm lm-close"></i></span>
                    </button>
                    <h3 class="modal-title">{lang key='orderForm.authCode'}</h3>
                </div>
                <div class="modal-body">
                    <p>{lang key='orderForm.authCodeTooltip'}</p>
                    <div class="form-group">
                        <label for="inputAuthCode">{lang key='orderForm.authCode'}</label>
                        <div class="form-tooltip">
                            <input type="text" class="form-control" name="eppModal" data-trigger="manual" id="inputAuthCode" placeholder="{lang key='orderForm.authCodePlaceholder'}" data-toggle="tooltip" data-placement="left" title="{lang key='orderForm.required'}" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-btn-loader data-epp-submit>
                        <span>{$LANG.confirm}</span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                        </div>
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.orderForm.cancel}</button>
                </div>
            </div>
        </div>
    </div>
{/if}