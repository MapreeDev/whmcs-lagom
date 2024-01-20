{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/flashmessage.tpl"}
    <p class="text-light">{lang key="userManagement.managePermissions"}:</p>  
    <ul class="list-group list-group-bordered">
        <li class="list-group-item">
            <i class="ls ls-check checkbox-style"></i><span>{$user->email}</span>
        </li>
    </ul>
    <form class="section" method="post" action="{routePath('account-users-permissions-save', $user->id)}">    
        <div class="section-header">
            <h2 class="section-title">{lang key="userManagement.permissions"}</h2>
        </div>
        <div class="section-body">
            <div class="panel panel-default panel-form">
                <div class="panel-body">
                    {foreach $permissions as $permission}
                        <div class="checkbox">
                            <label>
                                <input class="icheck-control" type="checkbox" name="perms[{$permission.key}]" value="1"{if $userPermissions->hasPermission($permission.key)} checked{/if}>
                                
                                {$permission.title} - {$permission.description}
                            </label>
                        </div>
                    {/foreach}
                </div>
            </div>    
        </div>
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">
                {lang key="clientareasavechanges"}
            </button>
            <a href="{routePath('account-users')}" class="btn btn-default">
                {lang key="clientareacancel"}
            </a>
        </div>
    </form>
{/if}    