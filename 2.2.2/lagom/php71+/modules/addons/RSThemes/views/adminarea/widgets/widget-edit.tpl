{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="widget"}
{/block}

{block name="template-content"}
    {if $widget->getWidgetOptions()}
        <h6>Choose Widget</h6>
        <form action="{$helper->url('Template@modifyWidget',['position'=>$smarty.get.position,'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'widgetMainName' => $widget->getMainName()])}" method="POST">
            <input type="hidden" name="pageName" value="{$page->getMainName()}" />
            <div class="row">
                {foreach from=$widget->getWidgetOptions() item=widgetOption}
                    <div class="col-md-4 col-lg-3">
                        <div class="widget widget--checkbox {if $widgetOption->getMainName()==$settings.widgetOption}is-active{else}is-disabled{/if}">
                            <div class="widget__header">
                                <div class="widget__media widget__media--lg">
                                    {if $widgetOption->getPreview()}
                                        <img src="{$widgetOption->getPreview()}" alt=""/>
                                    {else}                                
                                        <img src="{$helper->img('widgets/services.png')}" alt="">
                                    {/if}   
                                </div>
                                <div class="widget__checkbox">
                                    <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                                </div>
                            </div>
                            <div class="widget__actions widget__actions--md flex align-items-center flex-items-xs-between p-h-xxs">
                                <div>
                                    <strong>
                                        {$widgetOption->getName()}
                                        {*not used now {$widgetOption->getVersion()}*}
                                    </strong>
                                    <div>
                                        {$widgetOption->getDescription()}
                                    </div>
                                    <div>
                                        {$widgetOption->getTextSize()}
                                    </div>
                                </div>
                            </div>  
                        </div>    
                    </div>                    
                {/foreach}
                <input type="hidden" name="widgetOptionName" value="{$settings.widgetOption}"/>
                <input type="hidden" name="widget" value="{$settings.widget}"/>
            </div>
            <h6>Widget Settings</h6>
            <div class="m-w-480">
                <div class="form-section form-inline form-inline--half">
                    {$widget->renderWidgetSettings($settings)}
                </div>
            </div>
        </form>
    {else}
        <div class="alert alert-danger">
            <div class="alert__body">No widget options found</div>
        </div>
    {/if}
</div>
{/block}


{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <a class="btn" href="#" data-form="submit">
                <span class="btn__text">Choose</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}