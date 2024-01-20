{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
{if empty($approvalMethods)}
        {assign var="approvalMethods" value=[]}
    {/if}
    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    <form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">
        <div class="section">
            <div class="section-header">
                <h3>{lang key='ssl.selectValidation'}</h3>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="m-b-2x">
                    {if empty($approvalMethods) || (!empty($approvalMethods) && in_array('email', $approvalMethods))}
                        <label class="d-flex align-center">
                            <input type="radio" class="icheck-button" name="approval_method" value="email" checked>
                            <span class="name">{lang key='ssl.emailMethod'}</span>
                        </label>
                    {/if}
                    {if in_array('dns-txt-token', $approvalMethods)}
                        <label class="d-flex align-center">
                            <input type="radio" class="icheck-button" name="approval_method" value="dns-txt-token">
                            <span class="name">{lang key='ssl.dnsMethod'}</span>
                        </label>
                    {/if}
                    {if in_array('file', $approvalMethods)}
                        <label class="d-flex align-center">
                            <input type="radio" class="icheck-button" name="approval_method" value="file">
                            <span class="name">{lang key='ssl.fileMethod'}</span>
                        </label>
                    {/if}
                </div>
                <div class="tab-content">
                    <div id="containerApprovalMethodEmail">
                        <div class="well m-b-0">{lang key='ssl.emailMethodDescription'}</div>
                        <p class="m-t-2x m-b-2x">{lang key='ssl.selectEmail'}</p>
                        <div class="row">
                            <div class="col-md-12">
                                {foreach from=$approveremails item=approveremail key=num}
                                    <label class="d-flex align-center">
                                        <input class="icheck-button" type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if}>
                                        {$approveremail}
                                    </label>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    <div id="containerApprovalMethodDns" style="display: none">
                        <div class="well m-b-0">{lang key='ssl.dnsMethodDescription'}</div>
                    </div>
                    <div id="containerApprovalMethodFile" style="display: none">
                        <div class="well m-b-0">{lang key='ssl.fileMethodDescription'}</div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        
        <p class="text-left m-t-2x">
            <button type="submit" class="btn btn-primary" id="btnOrderContinue"><i class="ls ls-share"></i>{$LANG.continue}</button
        </p>
    </form>
{/if}