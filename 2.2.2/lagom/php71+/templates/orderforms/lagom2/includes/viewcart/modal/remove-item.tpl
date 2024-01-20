<form method="post" action="{$WEB_ROOT}/cart.php">
    <input type="hidden" name="a" value="remove" />
    <input type="hidden" name="r" value="" id="inputRemoveItemType" />
    <input type="hidden" name="i" value="" id="inputRemoveItemRef" />
    <input type="hidden" name="rt" value="" id="inputRemoveItemRenewalType">
    <div class="modal fade modal-remove-item" id="modalRemoveItem" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$LANG.orderForm.close}">
                        <span aria-hidden="true"><i class="lm lm-close"></i></span>
                    </button>
                    <h3 class="modal-title">
                        <span>{$LANG.orderForm.removeItem}</span>
                    </h3>
                </div>
                <div class="modal-body">
                    {$LANG.cartremoveitemconfirm}
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" data-btn-loader>
                        <span>{$LANG.yes}</span>
                        <div class="loader loader-button hidden" >
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                        </div>
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.no}</button>
                </div>
            </div>
        </div>
    </div>
</form>