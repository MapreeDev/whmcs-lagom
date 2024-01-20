{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else} 
	<div class="section">
		<div class="section-header">
			<h2 class="section-title">{$LANG.domainregisterns}</h2>
		</div>
		<div class="section-body">
			<p class="text-light">{$LANG.domainregisternsexplanation}</p>
			{if $result}
				{include file="$template/includes/alert.tpl" type="warning" msg=$result textcenter=true}
			{/if}
		</div>
	</div>
	<div class="section">
		<div class="section-header">
			<h2 class="section-title">{$LANG.domainregisternsreg}</h2>
		</div>
		<div class="section-body">
			<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
				<div class="panel panel-default panel-form">
					<div class="panel-body">
						<input type="hidden" name="sub" value="register" />
						<input type="hidden" name="domainid" value="{$domainid}" />
						<div class="form-group">
							<label for="inputNs1" class="control-label">{$LANG.domainregisternsns}</label>
							<div class="row row-eq-height row-eq-height-sm">
								<div class="col-6">
									<input type="text" class="form-control" id="inputNs1" name="ns" />
								</div>
								<div class="col-6 align-center">
									. {$domain}
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputIp1" class="control-label">{$LANG.domainregisternsip}</label>
									<input type="text" class="form-control" id="inputIp1" name="ipaddress"/>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary"/>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="section">
		<div class="section-header">
			<h2 class="section-title">{$LANG.domainregisternsmod}</h2>
		</div>
		<div class="section-body">
			<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
				<div class="panel panel-default panel-form">
					<div class="panel-body">
						<input type="hidden" name="sub" value="modify" />
						<input type="hidden" name="domainid" value="{$domainid}" />
						<div class="form-group">
							<label for="inputNs2" class="control-label">{$LANG.domainregisternsns}</label>
							<div class="row row-eq-height row-eq-height-sm">
								<div class="col-6">
									<input type="text" class="form-control" id="inputNs2" name="ns" />
								</div>
								<div class="col-6 align-center">
									. {$domain}
								</div>
							</div>    
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputIp2" class="control-label">{$LANG.domainregisternscurrentip}</label>
									<input type="text" class="form-control" id="inputIp2" name="currentipaddress" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputIp3" class="control-label">{$LANG.domainregisternsnewip}</label>
									<input type="text" class="form-control" id="inputIp3" name="newipaddress" />
								</div>
							</div>
						</div> 
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="section">
		<div class="section-header">
			<h2 class="section-title">{$LANG.domainregisternsdel}</h2>
		</div>
		<div class="section-body">
			<form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
				<div class="panel panel-default panel-form">
					<div class="panel-body">
						<input type="hidden" name="sub" value="delete" />
						<input type="hidden" name="domainid" value="{$domainid}" />
						<div class="form-group">
							<label for="inputNs3" class="control-label">{$LANG.domainregisternsns}</label>
							<div class="row row-eq-height row-eq-height-sm">
								<div class="col-md-6">           
									<input type="text" class="form-control" id="inputNs3" name="ns" />
								</div>
								<div class="col-md-6 align-center">
									. {$domain}
								</div>
							</div>    
						</div>
					</div>
					<div class="panel-footer">
						<input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
					</div>
				</div>
			</form>
		</div>
	</div>
{/if}	