
{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='sslconfigcomplete'}" textcenter=true}
        
        <div class="form-horizontal">
            {if is_null($authData) || (!is_null($authData) && $authData->methodNameConstant() == 'emailauth')}
                {if !is_null($authData)}
                <div class="section">
                    <div class="section-header">
                        <h3>{lang key='ssl.emailInformation'}</h3>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.emailSteps'}"}
                            <div class="row">
                                <div class="form-group col-md-6 m-b-0">
                                    <label for="emailApprover" class="col-md-12">{lang key='email'}</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="emailApprover" value="{$authData->email}" readonly/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
            {elseif !is_null($authData) && $authData->methodNameConstant() == 'dnsauth'}
                <div class="section">
                    <div class="section-header">
                        <h3>{lang key='ssl.dnsRecordInformation'}</h3>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.dnsSteps'}"}
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="recordType" class="col-md-12">{lang key='ssl.type'}</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="recordType" value="{$authData->type}" readonly/>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="host" class="col-md-12">{lang key='ssl.host'}</label>
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="host" value="{$authData->host}" readonly/>
                                            <div class="input-group-btn input-group-append">
                                                <button type="button" class="btn btn-default copy-to-clipboard" data-clipboard-target="#host">
                                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-6 m-b-0">
                                    <label for="dnsContents" class="col-md-12">{lang key='ssl.value'}</label>
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="dnsContents" value="{$authData->value}" readonly/>
                                            <div class="input-group-btn input-group-append">
                                                <button type="button" class="btn btn-default copy-to-clipboard" data-clipboard-target="#dnsContents">
                                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {elseif !is_null($authData) && $authData->methodNameConstant() == 'fileauth'}
                <div class="section">
                    <div class="section-header">
                        <h3>{lang key='ssl.fileInformation'}</h3>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.fileSteps'}"}
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="fileName" class="col-md-12">{lang key='ssl.url'}</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="fileName"
                                            value="http://{$domain}/{$authData->filePath()}" readonly/>
                                    </div>
                                </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="fileContents" class="col-md-12">{lang key='ssl.value'}</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="fileContents" value="{$authData->contents}" readonly/>
                                            <div class="input-group-btn input-group-append">
                                                <button type="button" class="btn btn-default copy-to-clipboard" data-clipboard-target="#fileContents">
                                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                                </button>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
    {/if}
{/if}
