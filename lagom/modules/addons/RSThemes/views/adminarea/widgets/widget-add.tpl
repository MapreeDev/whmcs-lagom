{extends file="adminarea/includes/layout.tpl"} 

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="widget"} 
{/block}

{block name="template-content"}
    <form action="{$helper->url('Template@addWidget',['position'=>$smarty.get.position,'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$gridName])}" method="POST">
        <h6>Choose Widget</h6>
        <div class="row">
            {foreach from=$template->getSupportedWidgets() item=widget}
                <div class="col-md-4 col-lg-3">
                    <div class="widget widget--checkbox" data-toggle="radio">
                        <input type="radio" class="hidden" name="widgetMainName" value="{$widget->getMainName()}" />
                        <div class="widget__header">
                            <div class="widget__media widget__media--lg">
                                {if $widget->getPreview()}
                                    <img src="{$widget->getPreview()}" alt=""/>
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
                                    {$widget->getName()}
                                </strong>
                                <div>
                                    {$widget->getDescription()}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </form>
{/block}

{block name="template-actions"}
    <div class="app-main__actions app-main__actions--fixed">
        <div class="container">
            <a class="btn" href="#" data-form="submit">
                <span class="btn__text">Choose</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Layout@dashboard',['templateName'=>$themeName])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}
