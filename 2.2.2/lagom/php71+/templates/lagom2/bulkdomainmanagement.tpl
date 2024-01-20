{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <form method="post" action="{$smarty.server.PHP_SELF}?action=bulkdomain">
        <input type="hidden" name="update" value="{$update}">
        <input type="hidden" name="save" value="1">
        {foreach from=$domainids item=domainid}
        <input type="hidden" name="domids[]" value="{$domainid}" />
        {/foreach}
        {if $update eq "nameservers"}
            <div class="section">
                <div class="section-body">
                    {if $save}
                        {if $errors}
                        <div class="alert alert-lagom alert-danger">
                            <div class="alert-body">
                                {$LANG.clientareaerrors}
                                <ul>
                                    {foreach from=$errors item=error}
                                        <li>{$error}</li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                        {else}
                            <div class="alert alert-lagom alert-success">
                                <div class="alert-body">
                                    {$LANG.changessavedsuccessfully}
                                </div>
                            </div>
                        {/if}
                    {/if}        
                    <p class="text-light m-b-1x">{$LANG.domainbulkmanagementchangesaffect}:</p>  
                    <ul class="list-group list-group-bordered">
                        {foreach from=$domains item=domain}
                            <li class="list-group-item">
                                <i class="ls ls-check checkbox-style"></i><span>{$domain}</span>
                            </li>
                        {/foreach}
                    </ul> 
                </div>
            </div>
            <div class="section">
                <div class="section-body">
                    <div class="panel-group panel-group-condensed" data-inputs-container>
                        <div class="panel panel-check {if $defaultns}checked{/if}" data-virtual-input>
                            <div class="panel-heading check">
                                <label>
                                    <input type="radio" class="icheck-control" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)"{if $defaultns} checked{/if} />
                                    <div class="check-content">
                                        <span> {$LANG.nschoicedefault}</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="panel panel-check {if !$defaultns} checked{/if}" data-virtual-input>
                            <div class="panel-heading check">
                                <label>
                                    <input type="radio" class="icheck-control" name="nschoice" value="custom" onclick="disableFields('domnsinputs',false)"{if !$defaultns} checked{/if} />
                                    <div class="check-content">
                                        <span>{$LANG.nschoicecustom}</span>
                                    </div>
                                </label>
                            </div>
                            <div class="panel-collapse collapse {if !$defaultns}show{/if}" data-input-collapse>
                                <div class="panel-body">
                                    <div class="m-w-sm">
                                            {for $num=1 to 5}
                                            <div class="form-group">
                                                <label for="inputNs{$num}" class="control-label">{$LANG.clientareanameserver} {$num}</label>
                                                <input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" value="{$ns1}" /> 
                                            </div>
                                        {/for}
                                    </div>
                                </div>
                            </div>
                        </div>                
                    </div>
                    <div class="form-actions">
                        <input type="submit" class="btn btn-primary" value="{$LANG.changenameservers}" />
                    </div>
                </div>
            </div>
        {elseif $update eq "autorenew"}
            <div class="section">
                {if $save}
                    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
                {/if}
                <div class="section-header">
                    <h2 class="section-title">{$LANG.domainsautorenew}</h2>
                    <p class="section-dec">{$LANG.domainautorenewinfo}</p>
                </div>
                <div class="section-body">
                    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.domainautorenewrecommend}
                    <p class="text-light m-b-1x">{$LANG.domainbulkmanagementchangeaffect}</p>
                    <ul class="list-group list-group-bordered">
                        {foreach from=$domains item=domain}
                            <li class="list-group-item">
                                <i class="ls ls-check checkbox-style"></i><span>{$domain}</span>
                            </li>
                        {/foreach}
                    </ul>        
                </div>
            </div>    
            <div class="form-actions">
                <button type="submit" name="enable" value="{$LANG.domainsautorenewenable}" class="btn btn-primary">
                    <span class="hidden-xs">{$LANG.domainsautorenewenable}</span>
                    <span class="hidden-sm hidden-md hidden-lg hidden-xl">{$rslang->trans('generals.enable')}</span>
                </button>
                <span class="or">or</span>
                <button type="submit" name="disable" value="{$LANG.domainsautorenewdisable}" class="btn btn-default">
                    <span class="hidden-xs">{$LANG.domainsautorenewdisable}</span>
                    <span class="hidden-sm hidden-md hidden-lg hidden-xl">{$LANG.disable}</span>
                </button>
                <a href="clientarea.php?action=domains" class="btn btn-default m-l-a">{$LANG.cancel}</a>
            </div>

        {elseif $update eq "reglock"}
            <div class="section">
                {if $save}
                    {if $errors}
                    <div class="alert alert-lagom alert-danger">
                        <div class="alert-body">
                            <p class="bold">
                                {$LANG.clientareaerrors}
                            </p>
                            <ul>
                            {foreach from=$errors item=error}
                                <li>{$error}</li>
                            {/foreach}
                            </ul>
                        </div>
                    </div>
                    {else}
                        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
                    {/if}
                {/if}
                <div class="section-header">
                    <h2 class="section-title">{$LANG.domainregistrarlock}</h2>
                    <p class="section-desc">{$LANG.domainreglockinfo}</p>
                </div>
                <div class="section-body">
                    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.domainreglockrecommend}
                    <p class="text-light m-b-1x">
                        {$LANG.domainbulkmanagementchangesaffect}
                    </p>
                    <ul class="list-group list-group-bordered">
                        {foreach from=$domains item=domain}
                            <li class="list-group-item">
                                <i class="ls ls-check checkbox-style"></i><span>{$domain}</span>
                            </li>      
                        {/foreach}  
                    </ul>
                </div>
                <div class="form-actions">
                    <input type="submit" name="enable" value="{$LANG.domainreglockenable}" class="btn btn-primary" />
                    <span class="or">or</span>
                    <input type="submit" name="disable" value="{$LANG.domainreglockdisable}" class="btn btn-default" />
                    <a href="clientarea.php?action=domains" class="btn btn-default m-l-a">{$LANG.cancel}</a>
                </div>
            </div>   
            
        {elseif $update eq "contactinfo"}

            {literal}
                <script language="javascript">
                    function usedefaultwhois(id) {
                        jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", true);
                        jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", false);
                        jQuery('#'+id.substr(0,id.length-1)+'1').attr("checked", "checked");
                    }
                    function usecustomwhois(id) {
                        jQuery("."+id.substr(0,id.length-1)+"customwhois").attr("disabled", false);
                        jQuery("."+id.substr(0,id.length-1)+"defaultwhois").attr("disabled", true);
                        jQuery('#'+id.substr(0,id.length-1)+'2').attr("checked", "checked");
                    }
                </script>
            {/literal}

            <div class="section">
                <div class="section-body">
                    {if $save}
                        {if $errors}
                            <div class="alert alert-lagom alert-danger">
                                <div class="alert-body">
                                    {$LANG.clientareaerrors}
                                    <ul>
                                        {foreach from=$errors item=error}
                                        <li>{$error}</li>
                                    {/foreach}
                                    </ul>
                                </div>
                            </div>
                        {else}
                            <div class="alert alert-lagom alert-success">
                                <div class="alert-body">
                                    {$LANG.changessavedsuccessfully}
                                </div>
                            </div>
                        {/if}
                    {/if}
                    <p class="text-light m-b-1x">
                        {$LANG.domainbulkmanagementchangesaffect}
                    </p>
                    <ul class="list-group list-group-bordered">
                        {foreach from=$domains item=domain}
                            <li class="list-group-item">
                                <i class="ls ls-check checkbox-style"></i><span>{$domain}</span>
                            </li>      
                        {/foreach}  
                    </ul>
                </div>
            </div>

            {if $contactdetails}
                {foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title">{$contactdetail} {$LANG.supportticketscontact}</h2>  
                        </div>
                        <div class="section-body">
                            <div class="panel-group panel-group-condensed" data-inputs-container>
                                <div class="panel panel-check" data-virtual-input>
                                    <div class="panel-heading check">
                                        <label>
                                            <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
                                            <div class="check-content">
                                                <span>{$LANG.domaincontactusexisting}</span>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="panel-collapse collapse" data-input-collapse>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="{$contactdetail}3">{$LANG.domaincontactchoose}</label>
                                                        <select id="{$contactdetail}3" class="form-control {$contactdetail}defaultwhois" name="sel[{$contactdetail}]">
                                                            <option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
                                                            {foreach key=num item=contact from=$contacts}
                                                                <option value="c{$contact.id}">{$contact.name}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-check checked" data-virtual-input>
                                    <div class="panel-heading check">
                                        <label>
                                            <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                                            <div class="check-content">
                                                <span>{$LANG.domaincontactusecustom}</span>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="panel-collapse collapse show" data-input-collapse>
                                        <div class="panel-body"> 
                                            <div class="row m-b-neg-2x">
                                                {foreach key=name item=value from=$values}
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>{$contactdetailstranslations[$name]}</label>
                                                            <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" class="form-control {$contactdetail}customwhois" />
                                                        </div>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        </div>  
                                    </div>        
                                </div>
                            </div>
                        </div>        
                    </div>
                {/foreach}
                <div class="form-actions">
                    <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
                    <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
                </div>
            {else}
                <div class="section">
                    <div class="section-body">
                        {include file="$template/includes/common/message.tpl" type="danger" customClass="message-no-data"  msg=$LANG.domainbulkmanagementnotpossible}
                    </div>
                </div>
            {/if}
        {/if}
    </form>
{/if}