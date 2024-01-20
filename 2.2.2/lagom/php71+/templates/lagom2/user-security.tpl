{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/flashmessage.tpl"}
    {if $linkableProviders || $securityQuestions->count() > 0 || $twoFactorAuthAvailable}
        <div class="panel panel-default">
            <ul class="panel-tabs nav nav-tabs">
                {if $linkableProviders}
                    <li>
                        <a class="active" href="#linked-accounts" data-toggle="tab" aria-expanded="false">
                            <i class="ls ls-chain"></i> {lang key='remoteAuthn.titleLinkedAccounts'} 
                        </a>
                    </li>
                {/if}
                {if $securityQuestions->count() > 0}
                    <li>
                        <a {if !$linkableProviders}class="active"{/if} href="#change-security-question"  data-toggle="tab" aria-expanded="false">
                            <i class="ls ls-chain"></i> {$LANG.clientareanavsecurityquestions} 
                        </a>
                    </li>
                {/if}
                {if $twoFactorAuthAvailable}
                    <li>
                        <a {if !$linkableProviders && !$securityQuestions->count() > 0}class="active"{/if} href="#twofa" data-toggle="tab" aria-expanded="false">
                        <i class="ls ls-security-code"></i>{$LANG.twofactorauth} </a>
                    </li>
                {/if}
            </ul>
            <div class="panel-body tab-content">
                {if $linkableProviders}
                    <div class="tab-pane active" id="linked-accounts">
                        {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }
                        <div class="table-container table-responsive">
                            {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
                        </div>
                    </div>
                {/if}
                {if $securityQuestions->count() > 0}
                    <div class="tab-pane {if !$linkableProviders}active{/if}" id="change-security-question">
                        <form method="post" action="{routePath('user-security-question')}">
                            {if $user->hasSecurityQuestion()}
                                <div class="form-group">
                                    <label for="inputCurrentAns" class="control-label">{$user->getSecurityQuestion()}</label>
                                    <input type="password" name="currentsecurityqans" id="inputCurrentAns" class="form-control" autocomplete="off" />
                                </div>
                            {/if}
                            <div class="form-group">
                                <label for="inputSecurityQid" class="control-label">{$LANG.clientareasecurityquestion}</label>
                                <select name="securityqid" id="inputSecurityQid" class="form-control">
                                    {foreach $securityQuestions as $question}
                                        <option value="{$question->id}">
                                            {$question->question}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="inputSecurityAns1" class="control-label">{$LANG.clientareasecurityanswer}</label>
                                        <input type="password" name="securityqans" id="inputSecurityAns1" class="form-control" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="inputSecurityAns2" class="control-label">{$LANG.clientareasecurityconfanswer}</label>
                                        <input type="password" name="securityqans2" id="inputSecurityAns2" class="form-control" autocomplete="off" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions m-t-6">
                                <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
                                <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
                            </div>
                        </form>
                    </div>
                {/if}
                {if $twoFactorAuthAvailable}
                    <div class="tab-pane {if !$linkableProviders && !$securityQuestions->count() > 0}active{/if}" id="twofa">
                        <p class="twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if}">
                            {$LANG.twofacurrently} <strong class="text-success">{$LANG.enabled|strtolower}</strong>
                        </p>
                        <p class="twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if}">
                            {$LANG.twofacurrently} <strong class="text-danger">{$LANG.disabled|strtolower}</strong>
                        </p>
                        {if $twoFactorAuthRequired}
                            {include file="$template/includes/alert.tpl" type="info" icon="ls-info-circle" msg="{lang key="clientAreaSecurityTwoFactorAuthRequired"}"}
                        {else}
                            {include file="$template/includes/alert.tpl" type="info" icon="ls-info-circle" msg="{lang key="clientAreaSecurityTwoFactorAuthRecommendation"}"}
                        {/if}
                        <a href="{routePath('account-security-two-factor-disable')}" class="btn btn-default open-modal twofa-config-link disable{if !$twoFactorAuthEnabled} hidden{/if}" data-modal-title="{$LANG.twofadisable}" data-modal-class="twofa-setup" data-btn-submit-label="{lang key='twofadisable'}" data-btn-submit-color="danger" data-btn-submit-id="btnDisable2FA">
                            {$LANG.twofadisableclickhere}
                        </a>
                        <a href="{routePath('account-security-two-factor-enable')}" class="btn btn-lg btn-primary open-modal twofa-config-link enable{if $twoFactorAuthEnabled} hidden{/if}" data-modal-title="{$LANG.twofaenable}" data-modal-class="twofa-setup" data-btn-submit-id="btnEnable2FA">
                            {$LANG.twofaenableclickhere}
                        </a>
                    </div>
                {/if}
            </div>
        </div>    
    {else}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="protect-user-privacy"}       
            </div>
            <h6 class="message-title">{$LANG.norecordsfound}</h6>
        </div>
    {/if}    
{/if}