{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="section">
        <div class="section-header">
            <h2 class="section-title">{$LANG.domaincontactinfo}</h2>
            <p class="section-desc">{$LANG.whoisContactWarning}</p>
        </div>
        <div class="section-body">
            {if $successful}
            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully}
            {/if}
            {if $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$error}
            {/if}
        </div>
    </div>

    {if $domainInformation && !$pending && $domainInformation->getIsIrtpEnabled() && $domainInformation->isContactChangePending()}
        {if $domainInformation->getPendingSuspension()}
            {include file="$template/includes/alert.tpl" type="warning" msg="<strong>{$LANG.domains.verificationRequired}</strong><br>{$LANG.domains.newRegistration}" textcenter=true}
        {else}
            {include file="$template/includes/alert.tpl" type="info" msg="<strong>{$LANG.domains.contactChangePending}</strong><br>{$LANG.domains.contactsChanged}" textcenter=true}
        {/if}
    {/if}

    <form class="section" method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts" id="frmDomainContactModification">
        <input type="hidden" name="sub" value="save" />
        <input type="hidden" name="domainid" value="{$domainid}" />

        {foreach from=$contactdetails name=contactdetails key=contactdetail item=values}
            <div class="section">
                <div class="section-header">
                    <h2 class="section-title">{$contactdetail}</h2>  
                </div>
                <div class="section-body">
                    <div class="panel-group panel-group-condensed" data-inputs-container>
                        <div class="panel panel-check" data-virtual-input>
                            <div class="panel-heading check">
                                <label>
                                    <input type="radio" class="icheck-control" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
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
                                    <input type="radio" class="icheck-control" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                                    <div class="check-content">
                                        <span>{$LANG.domaincontactusecustom}</span>
                                    </div>
                                </label>
                            </div>
                            <div class="panel-collapse collapse show" data-input-collapse>
                                <div class="panel-body"> 
                                    <div class="row">
                                        {foreach key=name item=value from=$values}
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>{$contactdetailstranslations[$name]}</label>
                                                    <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if array_key_exists($contactdetail, $irtpFields) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
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
            {if $domainInformation && $irtpFields}
                <input id="irtpOptOut" type="hidden" name="irtpOptOut" value="0">
                <input id="irtpOptOutReason" type="hidden" name="irtpOptOutReason" value="">
            {/if}
            <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
            <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
        </div>
    </form>
    {if $domainInformation && $irtpFields}
        <script type="text/javascript">
            var allowSubmit = 0;
        </script>
        <div class="modal fade" id="modalIRTPConfirmation" role="dialog" aria-labelledby="IRTPConfirmationLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div id="modalIRTPConfirmationHeading" class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">{lang key='orderForm.close'}</span>
                        </button>
                        <h4 class="modal-title" id="IRTPConfirmationLabel">{lang key='domains.importantReminder'}</h4>
                    </div>
                    <div id="modalIRTPConfirmationBody" class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                {lang key='domains.irtpNotice'}
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="checkbox">
                                    <label for="modalIrtpOptOut">
                                        <input id="modalIrtpOptOut" class="checkbox icheck-control" type="checkbox" value="1">
                                        {lang key='domains.optOut'}
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="modalReason">{lang key='domains.optOutReason'}:</label>
                                <input id="modalReason" type="text" class="form-control" autocomplete="off">  
                            </div>
                        </div>
                    </div>
                    <div id="modalIRTPConfirmationFooter" class="modal-footer">
                        <button type="button" id="IRTPConfirmation-Submit" class="btn btn-primary" onclick="irtpSubmit();return false;">
                            {lang key='supportticketsticketsubmit'}
                        </button>
                        <button type="button" id="IRTPConfirmation-Cancel" class="btn btn-default" data-dismiss="modal">
                            {lang key='cancel'}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    {/if}
{/if}
