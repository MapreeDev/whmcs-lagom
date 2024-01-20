{extends file="adminarea/layout/tabs.tpl"} 
{block name="tab-content"}
    {if !empty($widget.options)}
        <form action="{$helper->url('Layout@configureWidget',['templateName'=>$themeName, 'position'=>$smarty.get.position,'gridName'=>$gridName])}" method="POST">
            <input type="hidden" name="widgetName" value="{$widgetName}" />
            <div class="col-sm-12">
                <h1>Widget Type</h1>
                {foreach from=$widget.options item=widgetOption name=widgetOptionLoop}
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            {if true}
                                <img src="{$widgetOption.preview.image_url}">
                            {else}
                                <img src="data: {$widgetOption.preview.image_type};base64,{$page.preview.image}">
                            {/if}
                            <div class="caption">
                                <h2><b>{if isset($widgetOption.details.display_name)}{$widgetOption.details.display_name}{else}{$widgetOption.details.name}{/if}</b></h2>
                                <p>Widget Size: <b>{$widgetSizes[$widgetOption.details.size]|capitalize}</b></p>
                                <p><i>{$widgetOption.details.description}</i></p> 
                                <input class="pull-right" type="radio" {if $smarty.foreach.widgetOptionLoop.first}checked="checked"{/if} name="widgetOption" value="{$widgetOption.details.name}" />
                                <div class="clear clear-fix"></div>
                            </div>
                        </div>
                    </div>
                {/foreach}            
            </div>
            <div class="col-sm-12">
                <h1>Widget Settings</h1>
                {$widgetSettings}
            </div>
            <div class="col-sm-12">
                <button type="submit" type="button" class="btn btn-primary">SAVE</button>
                <a href="{$helper->url('Layout@dashboard',['templateName'=>$themeName])}" class="btn btn-default" role="button">CANCEL</a>
            </div>    
        </form>
    {else}
        Widget doesn`t have any option <a href="{$helper->url('Layout@addWidget',['templateName'=>$themeName, 'position' => $smarty.get.position,'gridName'=>$gridName])}" class="btn btn-default" role="button">RETURN</a>
    {/if}
{/block}
