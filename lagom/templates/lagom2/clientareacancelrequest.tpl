{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}	
	{if $invalid}
		{include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareacancelinvalid textcenter=true}
		<p class="text-center">
			<a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{$LANG.clientareabacklink}</a>
		</p>
	{elseif $requested}
		{include file="$template/includes/alert.tpl" type="success" msg=$LANG.clientareacancelconfirmation textcenter=true}
		<p class="text-center">
			<a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{$LANG.clientareabacklink}</a>
		</p>
	{else}
		{if $error}
			{include file="$template/includes/alert.tpl" type="error" errorshtml="<li>{$LANG.clientareacancelreasonrequired}</li>"}
		{/if}
		<label>{$LANG.clientareacancelproduct}</label>
		<div class="well">
			<h4 class="m-b-0">{$groupname} - {$productname}</h4>
			{if $domain}<a href="{$domain}" class="text-small">{$domain}</a>{/if}
		</div>
		<form method="post" action="{$smarty.server.PHP_SELF}?action=cancel&amp;id={$id}" class="form-stacked">
			<input type="hidden" name="sub" value="submit" />
			<div class="panel panel-default panel-form">
				<div class="panel-body">
					<div class="form-group">
						<label for="cancellationreason">{$LANG.clientareacancelreason}</label>
						<textarea name="cancellationreason" id="cancellationreason" class="form-control" rows="6"></textarea>
					</div>
					{if $domainid}
						<label>{$LANG.cancelrequestdomain}</label>
						<div class="well">
							<p>{$LANG.cancelrequestdomaindesc|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}</p>
							<label class="checkbox">
								<input class="icheck-control" type="checkbox" name="canceldomain" id="canceldomain" /> {$LANG.cancelrequestdomainconfirm}
							</label>
						</div>
					{/if}
					<div class="form-group">
						<label class="control-label" for="type">{$LANG.clientareacancellationtype}</label>
						<select name="type" id="type" class="form-control">
							<option value="Immediate">{$LANG.clientareacancellationimmediate}</option>
							<option value="End of Billing Period">{$LANG.clientareacancellationendofbillingperiod}</option>
						</select>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" value="{$LANG.clientareacancelrequestbutton}" class="btn btn-danger"><i class="ls ls-denial"></i>{$LANG.clientareacancelrequestbutton}</button>
					<a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">{$LANG.cancel}</a>
				</div>
			</div>
		</form>
	{/if}
{/if}