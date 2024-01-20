{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {include file="$template/includes/flashmessage.tpl"}
    <div class="section"> 
        <div class="section-header">   
            <h3 class="section-title">{$LANG.userProfile.profile}</h3>
        </div>
        <div class="section-body">
            <form method="post" action="{routePath('user-profile-save')}">   
                <div class="panel panel-default panel-form">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputFirstName" class="control-label">
                                        {$LANG.clientareafirstname}
                                    </label>
                                    <input
                                        type="text"
                                        name="firstname"
                                        id="inputFirstName"
                                        value="{$user->firstName}"
                                        class="form-control"
                                        {if in_array('firstname', $uneditableFields)}readonly="readonly"{/if}
                                    >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputLastName" class="control-label">
                                        {$LANG.clientarealastname}
                                    </label>
                                    <input
                                        type="text"
                                        name="lastname"
                                        id="inputLastName"
                                        value="{$user->lastName}"
                                        class="form-control"
                                        {if in_array('lastname', $uneditableFields)}readonly="readonly"{/if}
                                    >
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>     
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
                    <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
                </div>
            </form>
        </div>
    </div>
    <div class="section">    
        <h3 class="section-title d-flex align-center">
            {$LANG.userProfile.changeEmail}
            {if $user->needsToCompleteEmailVerification()}
                <span class="m-l-1x label label-warning">{$LANG.userProfile.notVerified}</span>
            {elseif $user->emailVerified()}
                <span class="m-l-1x label label-success">{$LANG.userProfile.verified}</span>
            {/if}
        </h3>
        <div class="section-body">
            <form method="post" action="{routePath('user-profile-email-save')}">
                <div class="panel panel-default panel-form">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="inputEmail" class="control-label">
                                        {$LANG.clientareaemail}
                                    </label>
                                    <input
                                        type="email"
                                        name="email"
                                        id="inputEmail"
                                        value="{$user->email}"
                                        class="form-control"
                                        {if in_array('email', $uneditableFields)}readonly="readonly"{/if}
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>        
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
                    <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
                </div>
            </form>
        </div>
    </div>    
{/if}


