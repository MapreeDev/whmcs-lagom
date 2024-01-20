{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="style_manage"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl" type="style"} 
{/block}

{block name="template-content"}
	{$styleColorLoader}
	<div class="row">
		<div class="col-md-12">
			<h1>Style Settings 
				<span class="label-docs">
					<a href="https://lagom.rsstudio.net/docs/style-manager.html#custom-css" class="btn--doc btn btn--link btn--xs" target="_blank" rel="noopener noreferrer">docs</a>
				</span>
			</h1> 
			<form id="cssStyleCustomSettingsForm" action="{$helper->url('Template@styleCustomSettingsSave',['templateName'=>$template->getMainName(), 'styleName'=>$styleName])}" method="POST">
				{foreach $styleSettings['group'] as $groupIndex => $groupValue}
				<div class="panel panel--collapse {if !$groupValue@last}m-b-4x{/if}">
					<div class="collapse-toggle">
						<h6 class="top__title">
							{$groupValue['name']}
						</h6>
					</div>
					<div class="collapse show p-3x">
						{foreach $groupValue['styles'] as $styleIndex => $value}
							<div class="form-group--horizontal form-group--style-select {if !$value@last}m-b-2x{/if} p-0x {if $styleIndex == "navigationTop"}is-hidden{/if}">
								<label class="form-label text-default">
									{$value['name']}
									{include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$value['tooltip']}
								</label> 
								<select id="style-settings" class="selectized--style-settings" name="settings[{$groupIndex}][{$styleIndex}]">
									<option value="default"><span class="style-select-preview"></span>Default</option>
									{foreach $styleSettings['schemes'] as $schemeIndex => $schemeValue}
										<option value="{$schemeIndex}" data-data='{literal}{"color": "{/literal}{$schemeValue['color']}{literal}"}{/literal}' {if (isset($value['value'])&&$value['value']==$schemeIndex) || (!isset($value['value'])&&$value['default']==$schemeIndex)}selected{/if}>
											  {$schemeValue['name']}
										</option>
									{/foreach}
									{if $value['name'] == "Extended Footer Style"}
										<option value="{$styleSettings['additionalFooterSchemes']['gray']['type']}" data-data='{literal}{"color": "{/literal}{{$styleSettings['additionalFooterSchemes']['gray']['color']}}{literal}"}{/literal}' {if (isset($value['value'])&&$value['value']==$styleSettings['additionalFooterSchemes']['gray']['type']) || (!isset($value['value'])&&$value['default']=='gray')}selected{/if}>
											  {$styleSettings['additionalFooterSchemes']['gray']['name']}
										</option>
									{/if}
								</select>
							</div>
						{/foreach}
					</div>
				</div>
				{/foreach}
			</form>
		</div>
	</div>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <button class="btn btn btn--primary" onclick="submitForm()" >
                <span class="btn__text">Save Changes</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}

{block name="template-scripts"}
<script>
	function submitForm() {
		$('#cssStyleCustomSettingsForm').submit()
	};

	let $select = $('.selectized--style-settings').selectize({
		render:{
			option: function(data, escape){
				let previewTemplate;
				if(data.color){
					previewTemplate = "<div class='option selected'><div class='style-select-preview' style='background:var(" + escape(data.color) + ")'></div>" + escape(data.text) + "</div>"
				} else {
					previewTemplate = "<div class='option selected'><div class='style-select-preview' style='background-color:#FFF'></div>" + escape(data.text) + "</div>"
				}
				return previewTemplate
			},
			item: function(data, escape){
				let previewTemplate;
				if(data.color){
					previewTemplate = "<div class='option selected'><div class='style-select-preview' style='background:var(" + escape(data.color) + ")'></div>" + escape(data.text) + "</div>"
				} else {
					previewTemplate = "<div class='option selected'><div class='style-select-preview' style='background-color:#FFF'></div>" + escape(data.text) + "</div>"
				}
				return previewTemplate
			},
		}
	})
	$select.each(function (index, item){
		item.selectize.refreshOptions(false);
	})
	$('.selectize-input.selectized--style-settings input').each(function(){
		$(this).attr('disabled', true);
	});

</script>
{/block}