<form action="#" id="frmGeneratePassword" class="form-horizontal">
    <div class="modal fade" id="modalGeneratePassword" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                    <h5 class="modal-title">
                        {$LANG.generatePassword.title}
                    </h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-lagom alert-danger hidden" id="generatePwLengthError">
                        {$LANG.generatePassword.lengthValidationError}
                    </div>
                    <div class="form-group row align-items-center">
                        <label for="generatePwLength" class="col-md-4 control-label">{$LANG.generatePassword.pwLength}</label>
                        <div class="col-md-8">
                            <input type="number" min="8" max="64" value="12" step="1" class="form-control input-inline input-inline-100" id="inputGeneratePasswordLength">
                        </div>
                    </div>
                    <div class="form-group row align-items-center">
                        <label for="generatePwOutput" class="col-md-4 control-label">{$LANG.generatePassword.generatedPw}</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="inputGeneratePasswordOutput">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 offset-md-4">
                            <button type="submit" class="btn btn-default btn-sm">
                                <i class="ls ls-plus"></i>
                                {$LANG.generatePassword.generateNew}
                            </button>
                            <button type="button" class="btn btn-default btn-sm copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput">
                                <i class="ls ls-copy"></i>
                                {$LANG.copy}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {$LANG.close}
                    </button>
                    <button type="button" class="btn btn-primary" id="btnGeneratePasswordInsert" data-clipboard-target="#inputGeneratePasswordOutput">
                        {$LANG.generatePassword.copyAndInsert}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
