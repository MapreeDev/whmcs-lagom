{if ($linkableProviders || $hasLinkedProvidersEnabled) && $linkContext == 'linktable'}
    <table id="tableLinkedAccounts" class="table display w-100 data-driven m-b-0" data-ajax-url="{$linkedAccountsUrl}" data-on-draw-rebind-confirmation-modal="true" data-lang-empty-table="{lang key='remoteAuthn.noLinkedAccounts'}">
        <thead>
            <tr class="text-center">
                <th>{lang key='remoteAuthn.provider'}<span class="sorting-arrows"></span></th>
                <th>{lang key='remoteAuthn.name'}<span class="sorting-arrows"></span></th>
                <th>{lang key='remoteAuthn.emailAddress'}<span class="sorting-arrows"></span></th>
                <th>{lang key='remoteAuthn.actions'}<span class="sorting-arrows"></span></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="4" class="text-center">{lang key='remoteAuthn.noLinkedAccounts'}</td>
            </tr>
        </tbody>
    </table>
{elseif $linkableProviders}
    
    <div id="providerLinkingMessages" class="hidden">
        <p class="providerLinkingMsg-preLink-init_failed">
            <span class="provider-name"></span> {lang key='remoteAuthn.unavailable'}
        </p>
        <p class="providerLinkingMsg-preLink-connect_error">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
        <p class="providerLinkingMsg-preLink-complete_sign_in">
            {lang key='remoteAuthn.completeSignIn'}
        </p>
        <p class="providerLinkingMsg-preLink-2fa_needed">
            {lang key='remoteAuthn.redirecting'}
        </p>
        <p class="providerLinkingMsg-preLink-linking_complete">
            <strong>{lang key='remoteAuthn.success'}</strong> {lang key='remoteAuthn.accountNowLinked'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.oneTimeAuthRequired'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeRegistrationForm'}
        </p>
        <p class="providerLinkingMsg-preLink-checkout-new">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeNewAccountForm'}
        </p>
        <p class="providerLinkingMsg-preLink-other_user_exists">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.linkedToAnotherClient'}
        </p>
        <p class="providerLinkingMsg-preLink-already_linked">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.alreadyLinkedToYou'}
        </p>
        <p class="providerLinkingMsg-preLink-default">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
    </div>
    <div class="social-login social-wide{if $linkContext == 'checkout-new'} m-t-0{elseif $linkContext == 'checkout-existing'} m-t-32{/if}">
        {if $linkContext == 'registration'}
            <div class="text-light text-center">
                <span>{$LANG.socialnetworksingnup}</span>
            </div>
        {elseif $linkContext == 'login'}
            <div class="text-lighter text-center text-small">
                {$LANG.socialnetworkacc}
            </div>
        {elseif $linkContext == 'checkout-existing'}
            <div class="login-divider"><span></span><span>{lang key='remoteAuthn.titleOr'}</span><span></span></div>
            <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
        {elseif $linkContext == 'checkout-new'}
            {* <div class="text-lighter text-center text-small text-divider"> *}
                {* <span>{lang key='remoteAuthn.titleOr'}</span> *}
                {* </div> *}
            <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
        {elseif $linkContext == 'clientsecurity'}
            <p class="text-light m-t-neg-6 m-b-24 ">{lang key='remoteAuthn.mayHaveMultipleLinks'}</p>
        {/if}
        <div class="providerPreLinking" data-link-context="{$linkContext}" data-hide-on-prelink={if in_array($linkContext, ['clientsecurity','login'])}0{else}1{/if} data-disable-on-prelink=0>
            <div class="social-signin-btns {if $linkContext == 'clientsecurity'}justify-start m-b-24{/if}">
                {foreach $linkableProviders as $provider }
                    {if in_array($linkContext, ['checkout-existing'])}
                        {$provider.login_button}
                    {else}
                        {$provider.code}
                    {/if}
                {/foreach}
            </div>
        </div>
    
        {if !isset($customFeedback) || !$customFeedback}
            <div class="providerLinkingFeedback"></div>
        {/if}
    
        {if $linkContext == 'login'}
            <div class="text-lighter text-center text-small text-divider">
                <span>{$LANG.useyouraccount}</span>
            </div>
        {/if}
       
    </div>
    {if $linkContext == 'checkout-new'}
        <div class="login-divider"><span></span><span>{lang key='remoteAuthn.titleOr'}</span><span></span></div>
    {/if}
{/if}