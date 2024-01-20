{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="main-content {if $mainContentClasses}{$mainContentClasses}{/if}"> 
        <div class="message message-danger message-lg message-no-data">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h2 class="message-text">{$errortitle}</h2>
            {if !$userValidation.submittedAt && $userValidation.token eq true}
                <p class="message-desc">{lang key='fraud.furtherVal'}</p>
                <div class="message-actions">
                    <a href="#" class="btn btn-default" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;">
                        {lang key='fraud.submitDocs'}
                        &nbsp;<i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                <div id="validationSubmitModal" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-body top-margin-10">
                                <iframe id="validationContent" allow="camera {$userValidationHost}" width="100%" height="700" frameborder="0" src=""></iframe>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='close'}</button>
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                <p class="message-desc">{$error}</p>
                <a href="{$WEB_ROOT}/submitticket.php" class="btn btn-default">
                    {$LANG.orderForm.submitTicket}
                </a>
            {/if}
        </div>
    </div>
{/if}   
