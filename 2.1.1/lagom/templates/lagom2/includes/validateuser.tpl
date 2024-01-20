{if file_exists("templates/$template/includes/overwrites/validateuser.tpl")}
    {include file="{$template}/includes/overwrites/validateuser.tpl"}
{else}
    {if $showUserValidationBanner}
        <div class="alert alert-lagom alert-warning verification-banner user-validation">
            <div class="container">
                <div class="alert-body">
                    <div>
                        <i class="ls ls-exclamation-circle"></i>{lang key='fraud.furtherValShort'}
                    </div>
                    <button class="btn btn-warning btn-sm btn-action" data-url="{$userValidationUrl}" onclick="openValidationSubmitModal(this);return false;">
                        <span>{lang key='fraud.submitDocs'}</span>
                        <span class="loader loader-button">
                            {include file="$template/includes/common/loader.tpl" classes="spinner-sm"}  
                        </span>
                    </button>
                </div>
                <div class="alert-actions">
                    <button id="btnUserValidationClose" type="button" class="btn btn-sm btn-icon close" data-uri="{routePath('dismiss-user-validation')}"><i class="ls ls-close"></i></button>
                </div>
            </div>
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
    {/if}
{/if}