{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else} 
    {if $linkableProviders || $showSsoSetting}
        <div class="tab tab-boxed">
            <ul class="nav nav-tabs">
                {if $linkableProviders }
                    <li class="active">
                        <a href="#linked-accounts" data-toggle="tab" aria-expanded="false">
                            <i class="ls ls-chain"></i> {lang key='remoteAuthn.titleLinkedAccounts'} 
                        </a>
                    </li>
                {/if}
                {if $showSsoSetting }
                    <li>
                        <a {if !$linkableProviders}class="active"{/if} href="#single-sign-on" data-toggle="tab" aria-expanded="true">
                            <i class="ls ls-sign-in"></i>{$LANG.sso.title}
                        </a>
                    </li>
                {/if}
            </ul>
            <div class="tab-content">
                {if $linkableProviders }
                    <div class="tab-pane active" id="linked-accounts">
                        {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }
                        <div class="table-container table-responsive">
                            {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
                        </div>
                    </div>
                {/if}
                {if $showSsoSetting}
                    <div class="tab-pane {if !$securityquestionsenabled && !$twoFactorAuthAvailable}active{/if}" id="single-sign-on">
                        {include file="$template/includes/alert.tpl" type="info" icon="ls-info-circle"  additionalClasses="alert-sm" msg=$LANG.sso.summary}
                        <form id="frmSingleSignOn">
                            <input type="hidden" name="token" value="{$token}" />
                            <input type="hidden" name="action" value="security" />
                            <input type="hidden" name="toggle_sso" value="1" />
                            <label class="panel panel-switch m-w-xs">
                                <div class="panel-body">
                                    <span class="switch-label">{$LANG.sso.title}</span>
                                    <span class="switch-loader loader" hidden>{include file="$template/includes/common/loader.tpl" classes="spinner-sm"}</span>
                                    <span class="switch switch--lg switch--text">
                                        <input type="checkbox" name="allow_sso" class="switch__checkbox" id="inputAllowSso"{if $isSsoEnabled} checked{/if}>
                                        <span class="switch__container"><span class="switch__handle"></span></span>
                                    </span> 
                                </div>
                            </label>
                        </form>
                        <p class="text-light m-b-0">{$LANG.sso.disablenotice}</p>
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