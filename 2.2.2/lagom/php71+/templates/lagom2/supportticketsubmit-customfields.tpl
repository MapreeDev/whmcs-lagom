{if file_exists("templates/$template/overwrites/supportticketsubmit-customfields.tpl")}
    {include file="{$template}/overwrites/supportticketsubmit-customfields.tpl"}  
{else}
    {if $customfields}
        <div class="panel panel-default panel-form">
            <div class="panel-body">
                {foreach from=$customfields item=customfield}
                    <div class="form-group">
                        {if $customfield.type eq 'tickbox'}
                            <label class="checkbox" for="customfield{$customfield.id}">
                                {$customfield.input|replace:'type="checkbox"':'class="form-checkbox icheck-control" type="checkbox"'}
                                {$customfield.name}{if $customfield.required}&nbsp;{$customfield.required}{/if}
                            </label>
                            {if $customfield.description}
                                <p class="help-block">{$customfield.description}</p>
                            {/if}
                        {else}
                        <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}{if $customfield.required}&nbsp;{$customfield.required}{/if}</label>
                            {if $customfield.type == "link"}
                                <div class="input-group">
                                    {$customfield.input|replace:"<a":"<a class='input-group-addon'"|replace:"www":"<i class='ls ls-chain'></i>"}
                                </div>
                            {else}
                                {$customfield.input}
                            {/if}
                            {if $customfield.description}<span class="help-block">{$customfield.description}</span>{/if}
                        {/if}
                    </div>
                {/foreach}
            </div>
        </div>
    {/if}
{/if}