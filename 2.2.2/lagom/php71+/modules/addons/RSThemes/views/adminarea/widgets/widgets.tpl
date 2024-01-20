{extends file="adminarea/includes/layout.tpl"} 
{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="page"} 

    {*removed*}
    {* <link href="{$helper->style('gridstack.css')}" rel="stylesheet" type="text/css"/>
    <link href="{$helper->style('gridstack-extra.css')}" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="{$helper->script('gridstack.js')}"></script>
    <script type="text/javascript" src="{$helper->script('gridstack.jQueryUI.js')}"></script>
    <script type="text/javascript" src="{$helper->script('jquery-sortable.js')}"></script> *}
{/block}

{block name="template-content"}
    <form action="{$helper->url('Template@widgets',['templateName'=>$template->getMainName(), 'pageName' => $page->getMainName()])}" method="POST" name="gridForm">
        <input type="hidden" name="pageName" value="{$page->getMainName()}" />
        <input type="hidden" name="widgetsTemplate" value="{$template->getActiveWidgetTemplateKey()}" />
        <div class="top m-b-4x">
            <div class="top__content">
                <h6 class="m-b-0x"><span class="text-faded">Page Layout:</span> {$template->getActiveWidgetTemplateName()}</h6>
            </div>       
            <div class="top__toolbar">
                <div class="has-dropdown">
                    <div class="btn btn--default btn--outline dropdown-toggle" data-toggle="lu-dropdown" data-open="click" data-placement="bottom right">
                        <span class="btn__text">
                            Load From template
                        </span>
                        <span class="btn__icon btn__icon--right">
                            <i class="ls ls-caret"></i>
                        </span>
                    </div>
                    <div class="dropdown dropdown--sm drop-nav" data-dropdown-menu>
                        <div class="dropdown__arrow" data-arrow>
                        </div>
                        <ul class="dropdown__menu">
                            {foreach from=$template->getWidgetTemplates() key=$templateKey item=templateName}
                                <li class="dropdown__item">
                                    <a class="dropdown__link" href="{$helper->url('Template@widgets',['templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$templateKey])}">
                                        <span class="dropdown__link--text">{$templateName}</span>
                                    </a>
                                </li>
                            {/foreach}                       
                        </ul>
                    </div>      
                </div>
            </div>    
        </div>
        <div class="row grid-stack grid-stack-3">    
            {foreach from=$template->getWidgets()->getGrid() key=$widthPosition item=positionY}
                {foreach from=$positionY key=$heightPosition item=position}
                    <div class="grid-stack-item" id="{$widthPosition}_{$heightPosition}" data-grid-x="{$widthPosition}" data-grid-y="{$heightPosition}" data-gs-x="{$heightPosition}" data-gs-y="{$widthPosition*6}" data-gs-height="6" data-gs-no-resize>
                        <div class="grid-stack-item-content">
                            {if $position->hasWidgets()}
                                {foreach from=$position->getWidgets() key=order item=widget}
                                    <div class="widget widget--configure {if $widget->getSize()=='0.5'}widget--half{else}widget--full{/if}">
                                         <div class="widget__media widget__media--widget-preview">
                                           <img src="{$widget->getPreview()}" alt=""/>
                                        </div>
                                        <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                            <div><b>{$widget->getWidget()->getName()}</b></div>
                                            <div class="p-0x">
                                                <a class="btn btn--sm btn--icon btn--link" href="{$helper->url('Template@removeWidget',['position'=>$position->getPosition($order),'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$template->getActiveWidgetTemplateKey()])}">
                                                    <i class="btn__icon lm lm-trash"></i>
                                                </a>
                                                <a class="btn btn--sm btn--default btn--outline" href="{$helper->url('Template@modifyWidget',['position'=>$position->getPosition($order),'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$template->getActiveWidgetTemplateKey()])}">
                                                    <span class="btn__text">Configure</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    {*
                                    <li class="list__item">
                                        <span class="list__item-title">Type: </span>
                                        <span class="list__value">
                                            {$widget->getWidget()->getType()}
                                        </span>
                                    </li>
                                    <li class="list__item">
                                        <span class="list__item-title">Options:</span>
                                        <span class="list__value">
                                            {$widget->getName()}
                                        </span>
                                    </li>
                                    <li class="list__item">
                                        <span class="list__item-title">Version:</span>
                                        <span class="list__value">
                                            {$widget->getVersion()}
                                        </span>
                                    </li>    
                                    *}   
                                {/foreach}
                                {if $position->hasSpace()}
                                    <a class="widget {if $position->getEmptySpace()=='0.5'}widget--half{else}widget--full{/if} widget--dashed" href="{$helper->url('Template@addWidget',['position'=>$position->getPosition(),'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$template->getActiveWidgetTemplateKey()])}">
                                        <div class="widget__body">
                                            <div class="widget__content flex flex-items-xs-middle flex-items-xs-center">
                                                <div class="msg">
                                                    <div class="msg__icon icon">
                                                        <img src="{$helper->img('plus-outline.png')}" alt=""/>  
                                                    </div>
                                                    <h5 class="msg__title">
                                                        Add Widget
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                {/if}
                            {else}
                                <a class="widget widget--full widget--dashed" href="{$helper->url('Template@addWidget',['position'=>$position->getPosition(),'templateName'=>$template->getMainName(), 'pageName' => $page->getMainName(),'gridName'=>$template->getActiveWidgetTemplateKey()])}">
                                    <div class="widget__body">
                                        <div class="widget__content flex flex-items-xs-middle flex-items-xs-center">
                                            <div class="msg">
                                                <div class="msg__icon icon">
                                                    <img src="{$helper->img('plus-outline.png')}" alt=""/>  
                                                </div>
                                                <h5 class="msg__title">
                                                    Add Widget
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        </div>
                    </div>
                {/foreach}
            {/foreach}
        </div>
    </form>
    <form action="{$helper->url('Template@widgets',['templateName'=>$template->getMainName(), 'pageName' => $page->getMainName()])}" method="POST" name="gridCopyForm">
        <div class="modal fade" id="saveWidgetsTemplate">
            <div class="modal__dialog">
                <div class="modal__content">
                    <div class="modal__top top">
                        <h4 class="top__title h6">Save Page Layout</h4>
                        <div class="top__toolbar">
                            <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                                <i class="btn__icon lm lm-close"></i>
                            </button>
                        </div>
                    </div>
                    <div class="modal__body">
                        <div class="form-group">
                            <label class="form-label">Type to add new template or overwrite existing</label>
                            <input type="hidden" name="sourceTemplateName" value="{$template->getActiveWidgetTemplateKey()}" />
                            <select class="form-control" name="newTemplateName" id="widgetsTemplates"> <!--Supplement an id here instead of using 'name'-->
                                {foreach from=$template->getWidgetTemplates() key=$templateKey item=templateName}
                                    <option value="{$templateKey}">{$templateName}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="modal__actions">
                        <button class="btn btn--primary" type="submit" data-btn-loader>
                            <span class="btn__preloader preloader preloader--light"></span>
                            <span class="btn__text">Save</span>
                        </button>
                        <a class="btn btn--default btn--outline" data-dismiss="lu-modal">
                            <span class="btn__text">Cancel</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('.grid-stack').gridstack({
                width: 3,
                height: {($widthPosition+2)*6},
                disableResize: true,
                disableOneColumnMode: true,
                animate: true
            });
            $('.grid-stack').on('change', function (e, items) {
                $('form[name="gridForm"] div.grid-stack-item').each(function (index, element) {
                    var inputName = 'position[' + $(this).attr('id') + ']';
                    var inputValue = ($(this).attr('data-gs-y') / 6) + '_' + $(this).attr('data-gs-x');
                    if ($('form[name="gridForm"] input[name="' + inputName + '"]').length > 0) {
                        $('form[name="gridForm"] input[name="' + inputName + '"]').val(inputValue);
                    } else {
                        $('<input />').attr('type', 'hidden')
                                .attr('name', inputName)
                                .attr('value', inputValue)
                                .appendTo('form[name="gridForm"]');
                    }
                });
            });
            $('.grid-stack').trigger('change');
        });
    </script>
{/block}

{block name="template-actions"}
    <div class="app-main__actions app-main__actions--fixed">
        <div class="container">
            <a class="btn" href="#" data-form="submit">
                <span class="btn__text">Save</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
            {if $template->getActiveWidgetTemplateKey()==$template->model->active_widgets_layout}
                <a class="btn btn--default btn--outline " href="#">
                    <span class="btn__text">Is active</span>
                    <span class="btn__preloader preloader"></span>
                </a>                
            {else}
                <a class="btn btn--default btn--outline " href="{$helper->url('Template@setActiveWidgetLayout',['templateName'=>$template->getMainName(),'gridName'=>$template->getActiveWidgetTemplateKey()])}">
                    <span class="btn__text">Set as active</span>
                    <span class="btn__preloader preloader"></span>
                </a>
            {/if}
            <a class="btn pull-right" href="#saveWidgetsTemplate" data-toggle="lu-modal">
                <span class="btn__text">Save As</span>
                <span class="btn__preloader preloader"></span>
            </a>

        </div>
    </div>
{/block}




{*
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
{/block}*}
