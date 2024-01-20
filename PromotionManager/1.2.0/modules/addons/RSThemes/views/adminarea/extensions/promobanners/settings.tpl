{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/promobanners/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <style>
        #rs-module .img-thumb {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            object-fit: cover;
            object-position: center;
        }

        #rs-module .table.table-list {
            border-spacing: 0 24px;
            border-collapse: separate;
        }

        #rs-module .table.table-list tr {
            box-shadow: 0 3px 10px rgba(0,0,0,.1);
        }

        #rs-module .table.table-list tr td{
            height: 159px;
            border: none;
        }

        #rs-module .table .ui-sortable-helper,#rs-module .table .sortable-chosen {
            box-shadow: 0 0 2px 0 rgba(244, 6, 36, 0.76) !important;
            background: #ffffd7 !important;
            opacity: .7;
        }
    </style>

{if $extension->checkStructureUpdateNeeded()}
<div class="alert alert--outline has-icon alert--border-left alert--license alert--warning">
    <div class="alert__body">
        <p>Please update Database Structure in PromotionBanner Extension</p>
    </div>
    <div class="alert__actions">
        <form method="post" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'update'])}">
            <input type="hidden" name="crud_action" value="update_extension">
            <button type="submit" class="btn btn--warning">Update now</button>
            <button class="btn btn--default" data-dismiss="alert" aria-label="Close" type="button">Dismiss</button>
        </form>
    </div>
</div>
{/if}

    <div class="t-c mob-t-c--full" data-table-container data-table-check-container>
        <div class="t-c__top top m-b-3x" data-top-search data-toggler-options="toggleClass: is-open;">
            <div class="top__toolbar">
                <h3 class="section__title">
                    Promotions
                    {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                </h3>
            </div>
            <div class="top__toolbar is-right">
                <div class="top__search input-group">
                    <span class="input-group__icon lm lm-search"></span>
                    <input class="form-control input-group__form-control table-search" data-toggler-options="toggleFocus: true; clearOnBlur: true;" value="" placeholder="Search..." id="table-search" placeholder="Search">
                </div>
            </div>
            <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'add'])}" class="btn btn--primary"><span class="btn__icon lm lm-plus"></span> <span class="btn__text">Add Promo</span></a>
            <form action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}" method="post">
                <input type="hidden" name="crud_action" value="refresh">
                <button data-toggle="tooltip" data-title="Click this button to refresh the MarketConnect banners. It's necessary after the MarketConenct settings changes"
                         type="submit" class="btn btn--icon btn--default btn--outline"><span class="btn__icon ls ls-refresh"></span></button>
            </form>
        </div>
        <div class="t-c__body t-c__body--boxed">
            <table class="t-c__table table mob-table--block" id="promotion-table" data-services-table data-search-input="#table-search" data-order='[0, "asc"]' data-clickable-rows="true" data-responsive="false">
                <colgroup>
                    <col class="table__col-9">
                    <col class="table__col-5">
                    <col class="table__col-5">
                    <col class="table__col-5">
                    <col class="table__col-0">
                    <col class="table__col-0">
                </colgroup>
                <thead>
                <tr>
                    <th class="cell-name">
                        <span>Name</span>
                    </th>
                    <th class="cell-type">
                        <span>Type</span>
                    </th>
                    <th class="cell-start-date" style="white-space: nowrap">
                        <span>Start Date</span>
                    </th>
                    <th class="cell-due-date" style="white-space: nowrap">
                        <span>Due Date</span>
                    </th>
                    <th class="cell-status">
                        <span>Status</span>
                    </th>
                    <th class="cell-actions no-sort"></th>
                </tr>
                </thead>
                <tbody id="rs_drag_items">
                {foreach $extension->getSlides() as $slide}
                    <tr style="cursor:move;" id="item_{$slide->id}">
                        <td class="cell-name" data-order="{$slide->slide_order}">
                            <div class="rail"> 
                                <div class="content-extension">
                                    <strong>{$slide->getField('slide_name')}</strong>
                                    <p class="extensions-description truncate" style="max-width: 464px;">{$slide->getField('slide_description')}</p>
                                </div>
                            </div>
                        </td>
                        <td class="cell-type">
                            {if $slide->slide_type eq '1'}
                                <strong>Banner</strong>
                            {elseif $slide->slide_type eq '2'}
                                <strong>Modal</strong>
                            {/if}
                        </td>
                        <td class="cell-start-date">
                            {if $slide->slide_begin_time eq 0}
                                -
                            {else}
                                {date("Y-m-d" , $slide->slide_begin_time)}
                            {/if}
                        </td>
                        <td class="cell-due-date">
                            {if $slide->slide_end_time eq 0}
                                -
                            {else}
                                {date("Y-m-d" , $slide->slide_end_time)}
                            {/if}
                        </td>
                        <td class="cell-status">
                            <div class="status">
                                {if $slide->slide_show eq 1}
                                    <label class="label label--success label--outline">Published</label>
                                {else}
                                    <label class="label label--outline is-disabled">Disabled</label>
                                {/if}
                            </div>
                        </td>
                        <td class="cell-actions">
                            <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'edit' , 'slide_id'=>$slide->id])}" class="btn btn--sm btn--default btn--outline"><span class="btn__text">Manage</span></a>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
            <div class="preloader-container is-hidden" data-table-preloader>
                <div class="preloader"></div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sortable/0.8.0/js/sortable.min.js"></script>
    <script>
        {literal}
        $(function() {
            $('.t-c__top.top.m-b-3x *[title]').tooltip('disable');
            $("#rs_drag_items").sortable({
                update: function (event, ui){
                    console.log('sample');
                    var order = $(this).sortable('serialize',{key:'string'});
                    // order var gives something like string=3&string=2&string=1
                    var ar = order.split('&');
                    var i = 0;
                    var str = '';
                    for(i;i<ar.length;i++){
                        if(str !== "") { str += ','; }
                        // slice is used to remove 'sting=' from every value of var ar
                        str += ar[i].slice(7);
                    }
                    $.post('{/literal}{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}{literal}', {
                        'crud_action': 'sortable_new',
                        'sorting': str
                    }).done(function (response) {
                        console.log(response);
                    })
                },
            });
        });
        {/literal}
    </script>
{/block}






















