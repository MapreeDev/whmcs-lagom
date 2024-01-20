{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/flashmessage.tpl"}
    <div class="section">
        <div class="section-header d-flex align-center m-b-24">
            <h3 class="section-title m-b-0">{lang key="userManagement.usersFound" count=$users->count()}</h3>
            <a href="#inviteNewUser" class="btn btn-primary invite-users-btn" data-toggle="modal">{lang key="userManagement.inviteNewUser"}</a>
        </div>
        <div class="section-body">
            <div class="panel panel-users">
                <div class="panel-body">
                    <ul class="user-list">
                        {foreach $users as $user}
                            <li class="user-list-item">
                                <div class="user-list-item-avatar">
                                    <img src="https://www.gravatar.com/avatar/{$user->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                </div>
                                <div class="user-list-item-body">
                                    <div class="user-list-item-info">
                                        <div class="user-list-item-name">
                                            {$user->first_name} {$user->last_name}
                                            {if $user->hasTwoFactorAuthEnabled()}
                                                <i class="ls ls-shield text-success" data-toggle="tooltip" data-title="{lang key='twoFactor.enabled'}"></i>
                                            {else}
                                                <i class="ls ls-shield text-warning" data-toggle="tooltip" data-title="{lang key='twoFactor.disabled'}"></i>
                                            {/if}
                                        </div>
                                        <div class="user-list-item-email">{$user->email}</div>
                                    </div>
                                    <div class="user-list-item-date">
                                        <div class="text-small text-light">{lang key="userManagement.lastLogin"}:</div>
                                        <div>{if $user->pivot->hasLastLogin()}
                                            {$user->pivot->getLastLogin()->diffForHumans()}
                                        {else}
                                            {$LANG.never}
                                        {/if}
                                        </div>
                                    </div>
                                </div>
                                <div class="user-list-item-actions">
                                    {if $user->pivot->owner}
                                        <div class="label label-info">{lang key="clientOwner"}</div>
                                    {else}
                                        <a href="{routePath('account-users-permissions', $user->id)}" class="btn btn-sm btn-icon btn-manage-permissions"{if $user->pivot->owner} disabled="disabled"{/if} data-toggle="tooltip" data-title="{lang key="userManagement.managePermissions"}">
                                            <i class="lm lm-edit"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-icon btn-remove-user" data-id="{$user->id}" {if $user->pivot->owner}disabled="disabled"{/if} data-toggle="tooltip" data-title="{lang key="userManagement.removeAccess"}">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    {/if}
                                </div>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
            <p class="text-small">* {lang key="userManagement.accountOwnerPermissionsInfo"}</p> 
        </div>
    </div>    
    {if $invites->count() > 0}
    <div class="section">
        <div class="sction-header">
            <h3 class="section-title">{lang key="userManagement.pendingInvites"}</h3>
        </div>
        <div class="section-body">
            <div class="panel panel-users">
                <div class="panel-body">
                    <ul class="user-list user-list-invites">
                        {foreach $invites as $invite}
                            <li class="user-list-item">
                                <span class="user-list-item-avatar">
                                    <img src="https://www.gravatar.com/avatar/{$invite->email|md5}{if $RSThemes.addonSettings.gravatar_placeholder && $RSThemes.addonSettings.gravatar_placeholder != "default"}?d={$RSThemes.addonSettings.gravatar_placeholder}{/if}" alt="Avatar">
                                </span>
                                <span class="user-list-item-info">
                                    <span class="user-list-item-name">{$invite->email}</span>
                                </span>
                                <span class="user-list-item-date">
                                    <span class="text-small text-light">{lang key="userManagement.inviteSent"}:</span>
                                    <span>{$invite->created_at->diffForHumans()}</span>
                                </span>
                                <form class="user-list-item-actions" method="post" action="{routePath('account-users-invite-resend')}">
                                    <input type="hidden" name="inviteid" value="{$invite->id}">
                                    <button type="submit" class="btn btn-sm btn-icon" data-toggle="tooltip" data-title="{lang key="userManagement.resendInvite"}">
                                        <i class="ls ls-refresh"></i>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-icon btn-cancel-invite" data-id="{$invite->id}" data-toggle="tooltip" data-title="{lang key="userManagement.cancelInvite"}">
                                        <i class="ls ls-close"></i>
                                    </button>
                                </form>
                            </li>
                        {/foreach}    
                    </ul>
                </div>
            </div>     
        </div>
    </div>       
    {/if}
    <form method="post" action="{routePath('account-users-invite')}">
        <div class="modal modal-lg fade" id="inviteNewUser">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h3 class="modal-title">
                            {lang key="userManagement.inviteNewUser"}
                        </h3>
                    </div>
                    <div class="modal-body has-scroll">
                        <p>{lang key="userManagement.inviteNewUserDescription"}</p>
                        <div class="form-group">
                            <input type="email" name="inviteemail" placeholder="name@example.com" class="form-control" value="{$formdata.inviteemail}">
                        </div>
                        <div class="form-group">
                            <div class="radio">
                                <label>
                                    <input class="icheck-control" type="radio" name="permissions" value="all" checked="checked">
                                    {lang key="userManagement.allPermissions"}
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input class="icheck-control" type="radio" name="permissions" value="choose">
                                    {lang key="userManagement.choosePermissions"}
                                </label>
                            </div>
                        </div>
                        <div class="hidden" id="invitePermissions">
                            {foreach $permissions as $permission}
                                <div class="checkbox">
                                    <label>
                                        <input class="icheck-control" type="checkbox" name="perms[{$permission.key}]" value="1">
                                        {$permission.title}
                                        -
                                        {$permission.description}
                                    </label>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">
                            {lang key="userManagement.sendInvite"}
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            {lang key="cancel"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form method="post" action="{routePath('user-accounts')}">
        <input type="hidden" name="id" value="" id="inputSwitchAcctId">
    </form>

    <form method="post" action="{routePath('account-users-remove')}">
        <input type="hidden" name="userid" id="inputRemoveUserId">
        <div class="modal fade" id="modalRemoveUser">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h3 class="modal-title">
                            {lang key="userManagement.removeAccess"}
                        </h3>
                    </div>
                    <div class="modal-body">
                        <p>{lang key="userManagement.removeAccessSure"}</p>
                        <p>{lang key="userManagement.removeAccessInfo"}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="btnRemoveUserConfirm">
                            {lang key="confirm"}
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            {lang key="cancel"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <form method="post" action="{routePath('account-users-invite-cancel')}">
        <input type="hidden" name="inviteid" id="inputCancelInviteId">
        <div class="modal fade" id="modalCancelInvite">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                        <h3 class="modal-title">
                            {lang key="userManagement.cancelInvite"}
                        </h3>
                    </div>
                    <div class="modal-body">
                        <p>{lang key="userManagement.cancelInviteSure"}</p>
                        <p>{lang key="userManagement.cancelInviteInfo"}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" id="btnCancelInviteConfirm">
                            {lang key="confirm"}
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            {lang key="cancel"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        jQuery(document).ready(function() {
            jQuery('input:radio[name=permissions]').on('ifChecked', function () {
                if ($(this).val() === 'choose') {
                    jQuery('#invitePermissions').removeClass('hidden');
                } else {
                    jQuery('#invitePermissions').addClass('hidden');
                }
            });
            jQuery('.btn-manage-permissions').click(function(e) {
                if (jQuery(this).attr('disabled')) {
                    e.preventDefault();
                }
            });
            jQuery('.btn-remove-user').click(function(e) {
                e.preventDefault();
                if (jQuery(this).attr('disabled')) {
                    return;
                }
                jQuery('#inputRemoveUserId').val(jQuery(this).data('id'));
                jQuery('#modalRemoveUser').modal('show');
            });
            jQuery('.btn-cancel-invite').click(function(e) {
                e.preventDefault();
                jQuery('#inputCancelInviteId').val(jQuery(this).data('id'));
                jQuery('#modalCancelInvite').modal('show');
            });
        });
    </script>
{/if}