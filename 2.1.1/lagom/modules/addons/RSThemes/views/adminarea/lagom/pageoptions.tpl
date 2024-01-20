{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="page"}
{/block}

{block name="template-content"}
    <h6>Page Layout</h6>
    {foreach from=$page->getPageOptions() item=pageOption}
        {if $pageOption->isActive()}
            {assign var="noDefaultActive" value=true}
        {/if}
        {if $pageOption->getMainName() == "default"}
            {assign var="hasDefaultOption" value=true}
        {/if}
    {/foreach}

    {if $page->getPageOptions()}
        <form action="{$helper->url('Template@pages',['templateName'=>$template->getMainName(), 'pageName' => $page->getMainName()])}" method="POST" id="pageOptionsForm" data-ajax-url="{$helper->url('Template@pageOptionOptions',['templateName'=>$template->getMainName(), 'pageName' => $page->getMainName()])}" data-page-name="{$page->getMainName()}">
            <input type="hidden" name="pageName" value="{$page->getMainName()}" />
            <div class="row">
                {if !$hasDefaultOption}
                <div class="col-md-4 col-lg-3">
                    <div class="widget widget--checkbox {if !$noDefaultActive}is-active{/if}" data-toggle="radio" >
                        <input class="hidden" type="radio" name="page[{$page->getMainName()}][option]" value="default" {if !$noDefaultActive}checked{/if}/>
                        <div class="widget__header">
                            <div class="widget__media widget__media--lg">
                                <img src="{$helper->img('placeholders/placeholder.png')}" alt=""/>
                            </div>
                            <div class="widget__checkbox">
                                <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                            </div>
                        </div>
                        <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                            <div>
                                <strong>Default</strong>
                            </div>
                            {if !$noDefaultActive}
                                <label class="label label--success label--outline">Active</label>
                            {/if}
                        </div>
                    </div>
                </div>
                {/if}
                {foreach from=$page->getPageOptions() item=pageOption}
                    <div class="col-md-4 col-lg-3">
                        <div class="widget widget--checkbox {if $pageOption->isActive()}is-active{/if}" data-toggle="radio">
                            <input class="hidden" type="radio" name="page[{$page->getMainName()}][option]" value="{$pageOption->getMainName()}"{if $pageOption->isActive()} checked="checked"{/if}  />
                            <div class="widget__header">
                                <div class="widget__media widget__media--lg">
                                    {if $pageOption->getPreview()}
                                        <img src="{$pageOption->getPreview()}" alt=""/>
                                    {else}
                                        <img src="{$helper->img('placeholders/placeholder.png')}" alt=""/>
                                    {/if}    
                                </div>
                                <div class="widget__checkbox">
                                    <img src="{$helper->img('widgets/checkbox.svg')}" alt="">
                                </div>
                            </div>
                            <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                <div>
                                    <strong>
                                        {$pageOption->getName()}
                                    </strong>
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
            <div id="pageOptionSettings"></div>
        </form>
    {else}
        <div class="alert alert-danger">
            <div class="alert__body">No page options found</div>
        </div>
    {/if}
    <style type="text/css">
        body.dragging, body.dragging * {
            cursor: move !important;
        }

        .dragged {
            position: absolute;
            opacity: 0.5;
            z-index: 2000;
        }

        ol.example li.placeholder {
            position: relative;
            /** More li styles **/
        }
        ol.example li.placeholder:before {
            position: absolute;
            /** Define arrowhead **/
        }
        #pageOptionSettings h6{
            margin-top: 24px;
        }
    </style>
    <script type="text/javascript">
        
       
    </script>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <a class="btn btn btn--primary" href="#" data-form="submit">
                <span class="btn__text">Save</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}



















