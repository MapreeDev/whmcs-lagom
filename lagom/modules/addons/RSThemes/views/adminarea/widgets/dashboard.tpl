{extends file="adminarea/layout/tabs.tpl"} 
{block name="tab-content"}
    <div class="row">
        {foreach from=$widgets item=widgetsRow}
            <div class="row">
                {foreach from=$widgetsRow item=widget}
                    <div class="col-sm-4">
                        {if $widget.name=='false'}
                            <a href="{$helper->url('Layout@addWidget',['position'=>$widget.position,'templateName'=>$themeName])}">+ Add widget</a>
                        {else}
                            <div class="thumbnail">
                                {if true}
                                    <img src="{$widget.preview.image_url}">
                                {else}
                                    <img src="data: {$widget.preview.image_type};base64,{$widget.preview.image}">
                                {/if}
                                <div class="caption">
                                    <h3>Widget: <b>{$widget.display_name}</b></h3>
                                    <p>Type: {if isset($widget.option.details.display_name)}{$widget.option.details.display_name}{else}{$widget.option.details.name}{/if}</p>
                                    <a href="{$helper->url('Layout@modifyWidget',['position'=>$widget.position,'templateName'=>$themeName])}">Configure</a>
                                    <a href="{$helper->url('Layout@deleteWidget',['position'=>$widget.position,'templateName'=>$themeName])}">Remove</a>
                                </div>
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div>
        {/foreach}
    </div>
{/block}