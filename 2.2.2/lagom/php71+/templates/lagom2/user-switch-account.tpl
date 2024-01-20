{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/flashmessage.tpl"}
    {if $accounts->count() == 0}
        <p>{lang key="switchAccount.noneFound"}</p>
        <p>{lang key="switchAccount.createInstructions"}</p>
        <p>
            <a href="{routePath('cart-index')}" class="btn btn-default">
                {lang key="shopNow"}
            </a>
        </p>
        <br><br>
    {else}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{lang key="switchAccount.choose"}</h2>
            </div>
            <div class="section-body">
                <div class="panel panel-users">
                    <div class="panel-body">
                        <div class="user-list user-list-switch">
                            {foreach $accounts as $account}
                                <a href="#" class="user-list-item {if $account->status == 'Closed'}disabled{/if}" data-id="{$account->id}">
                                    <span class="user-list-item-avatar">
                                        <img src="https://www.gravatar.com/avatar/{$account->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                    </span>
                                    <span class="user-list-item-info">
                                        <span class="user-list-item-name">{$account->displayName}</span>
                                        <span class="user-list-item-email text-small text-light">{$account->email}</span>
                                    </span>
                                    <span class="user-list-item-date">
                                        {if $account->authedUserIsOwner() && $account->status != 'Closed'}
                                            <span class="label label-info">{lang key="clientOwner"}</span>
                                        {/if}
                                        {if $account->status == 'Closed'}
                                            <span class="label label-danger">{$account->status}</span>
                                        {/if}
                                        {if $account->status == 'Active'}
                                            <span class="label label-active">{$account->status}</span>
                                        {/if}
                                    </span>
                                    <span class="user-list-item-actions m-r-0">
                                        <span class="btn btn-primary btn-sm {if $account->status == 'Closed'}disabled{/if}">{$LANG.navSwitchAccount}</span>
                                    </span>
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    {/if}
{/if}
 
<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<script>
    $(document).ready(function() {
        $('.user-list a:not(.disabled)').click(function(e) {
            e.preventDefault();
            $('#inputSwitchAcctId').val($(this).data('id'))
                .parent('form').submit();
        });
    });
</script>