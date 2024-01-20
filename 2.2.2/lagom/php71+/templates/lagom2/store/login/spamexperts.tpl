

{if file_exists("templates/$template/store/login/overwrites/spamexperts.tpl")}
    {include file="{$template}/store/login/overwrites/spamexperts.tpl"}  
{else}    
    <div id="seLogin" class="panel panel-default panel-mc-sso panel-accent-silver">
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-4 text-center">
                    <div class="icon-container">
                        <img src="assets/img/marketconnect/spamexperts/logo.png">
                    </div>
                </div>
                <div class="col-sm-8">

                    <h5>Spam Experts</h5>
                    <h4>Manage your Spam Experts Service</h4>
                    <form action="{routePath('upgrade')}" method="post">
                        <input type="hidden" name="action" value="manage-service" />
                        <p>
                            {if count($accounts) > 1}
                                <select id="spamExpertId" name="service-id" class="form-control select-inline">
                                    {foreach $accounts as $account}
                                        <option value="{if $account.type == 'addon'}a{/if}{$account.id}">{$account.domain}</option>
                                    {/foreach}
                                </select>
                            {else}
                                <input type="hidden" name="service-id" value="{if $accounts[0].type == 'addon'}a{/if}{$accounts[0].id}">
                            {/if}
                        </p>
                        <button class="btn btn-lg btn-default btn-service-sso">
                            <span class="loading hidden">
                                <i class="fas fa-spinner fa-spin"></i>
                            </span>
                            <span class="text">{lang key="manage"}</span>
                        </button>
                        {if count($accounts) == 1}
                            <input type="hidden" name="isproduct" value="{if $accounts[0].type == 'addon'}0{else}1{/if}">
                            <input type="hidden" name="serviceid" value="{$accounts[0].id}">
                            <button type="submit" class="btn btn-lg btn-default">
                                {lang key="upgrade"}
                            </button>
                        {/if}
                        <span class="login-feedback"></span>
                    </form>

                </div>
            </div>

        </div>
    </div>
{/if}