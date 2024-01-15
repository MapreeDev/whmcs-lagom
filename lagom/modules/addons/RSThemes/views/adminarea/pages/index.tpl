{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="section">
        <div class="d-flex">
            <div class="app-main__sidebar">
                <div class="tabs tabs--block m-w-200"> {*too narrow tabs is-active*}
                    <div class="tabs__nav" data-options="navStorage:localStorage; localStorageId:custom-slider-23; slideToClickedSlide: true;">
                        <ul class="nav nav--tabs custom-nav-styles">
                            <div class="nav__header p-0x text-faded p-4">
                                {$lang.general.categories}
                            </div>
                            {if $template->getActiveDisplay()->name == 'CMS'}
                                <li class="nav__item {if ($template->getActiveDisplay()->name == 'CMS' && !$smarty.get.tab) || ($template->getActiveDisplay()->name == 'CMS' && $smarty.get.tab == 'website')} is-active {/if}">
                                    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#pages-website">
                                        <span class="nav__link-text">{$lang.breadcrumb.website}</span>
                                    </a>
                                </li>
                            {/if}
                            {foreach $categories as $key => $category}
                                <li class="nav__item {if ($template->getActiveDisplay()->name !== 'CMS' && $key == 0 && !$smarty.get.tab) || $smarty.get.tab == $category}is-active{/if}">
                                    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#pages-{$key}">
                                        <span class="nav__link-text">{$category}</span>
                                    </a>
                                </li>
                            {/foreach}
                            {if $template->getActiveDisplay()->name == 'CMS'}
                                <div class="nav__header p-0x text-faded p-4">
                                    {$lang.general.settings}
                                </div>
                                <li class="nav__item {if $smarty.get.tab == 'section'} is-active {/if}">
                                    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-sections">
                                        <span class="nav__link-text">{$lang.breadcrumb.sections}</span>
                                    </a>
                                </li>
                                <li class="nav__item {if $smarty.get.tab == 'media'} is-active {/if}">
                                    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-media">
                                        <span class="nav__link-text">{$lang.breadcrumb.media}</span>
                                    </a>
                                </li>
                                <li class="nav__item {if $smarty.get.tab == 'sitemap'} is-active {/if}">
                                    <a class="nav__link" data-toggle="lu-tab" data-change-hash="true" href="#settings-sitemap">
                                        <span class="nav__link-text">{$lang.breadcrumb.sitemap}</span>
                                    </a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </div>
            </div>
            <div class="app-main__content">
                <div class="tabs__body">
                    <div class="tab-content">
                        {foreach $categories as $key => $category}
                            <div class="tab-pane {if ($template->getActiveDisplay()->name !== 'CMS' && $key == 0 && !$smarty.get.tab) || $smarty.get.tab == $category}is-active{/if}" id="pages-{$key}">
                                <div class="t-c__top top m-b-3x" data-top-search data-toggler-options="toggleClass: is-open;">
                                    <div class="top__toolbar">
                                        <h3 class="section__title">{ucfirst($category)} {$lang.breadcrumb.pages}</h3>
                                        {assign var="doc_category" value="{ucfirst($category)|replace:" ":"_"|lower}_pages"}
                                        {include file="adminarea/includes/helpers/docs.tpl" link=$docs.pages.$doc_category}
                                    </div>
                                    <div class="top__toolbar is-right">
                                        <span>{$lang.general.show}:</span>
                                        <div class="input-group">
                                            {*TODO zapamiętywanie wartości filtrow - "with templates/all"*}
                                            <select class="form-control filter-pages" data-table="pages-table{$key}">
                                                <option value="all">{$lang.general.all}</option>
                                                <option value="templates" selected>{$lang.pages.with_templates}</option>
                                            </select>
                                        </div>
                                        <div class="top__search input-group">
                                            <span class="input-group__icon lm lm-search"></span>
                                            <input 
                                                class="form-control input-group__form-control table-search" 
                                                data-toggler-options="toggleFocus: true; clearOnBlur: true;" 
                                                value="" 
                                                placeholder="{$lang.general.search}..." 
                                                id="table-search{$key}"
                                            >
                                        </div>
                                    </div>
                                </div>
                                <div class="t-c__body t-c__body--boxed">
                                    <table 
                                        class="t-c__table table mob-table--block" 
                                        id="pages-table{$key}" 
                                        data-pages-table 
                                        data-services-table
                                        data-search-input="#table-search{$key}" 
                                        data-order='[0, "asc"]' 
                                        data-clickable-rows="true" 
                                        data-responsive="false"
                                    >
                                        <colgroup>
                                            <col class="table__col-13">
                                            <col class="table__col-3">
                                            <col class="table__col-5">
                                            <col class="table__col-1">
                                            <col class="table__col-0">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th class="cell-name">
                                                    <span>{$lang.general.name}</span>
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                                {*TODO filtrowanie seo ???*}
                                                <th class="cell-seo" >
                                                    <span>{$lang.page.seo.header}</span>
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                                <th class="cell-group filter">
                                                    <span>{$lang.general.template}</span>
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                                <th class="cell-has-templates is-hidden"></th>
                                                <th class="cell-actions no-sort">
                                                    <span class="sorting-icons-box">
                                                        {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                                    </span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {foreach $pages[$category] as $pageName => $page}
                                                {if !$page['settings']['hide_in_table ']}
                                                    <tr>
                                                        <td class="cell-name">
                                                            <div class="content-name">
                                                                <a href="{$helper->url('Page@show',['templateName'=>$template->getMainName(), 'pageName' => $pageName])}"><strong>{$page['settings']['name']}</strong></a>
                                                            </div>
                                                        </td>
                                                        <td class="cell-seo">
                                                            <div class="status">
                                                                {if $page['settings']['seo_enabled']}
                                                                    <span class="status__seo-dial status__seo-dial--on"></span>
                                                                    <span class="is-hidden">1</span>
                                                                {else}
                                                                    <span class="status__seo-dial"></span>
                                                                    <span class="is-hidden">0</span>
                                                                {/if}
                                                            </div>
                                                        </td>
                                                        <td class="cell-layout">
                                                            <strong>{$page['active_layout']}</strong>
                                                        </td>
                                                        <td class="cell-has-templates is-hidden"> {*hidden column used for filtering pages by their templates*}
                                                            <strong>{if $page['settings']['has_templates']}Yes{else}No{/if}</strong>
                                                        </td>
                                                        <td class="cell-actions">
                                                            <a class="btn btn--xs btn--default btn--outline" href="{$helper->url('Page@show',['templateName'=>$template->getMainName(), 'pageName' => $pageName])}">
                                                                <span class="btn__text">Manage</span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                {/if}    
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        {/foreach}
                        {if $template->getActiveDisplay()->name == 'CMS' && \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
                            {include file="adminarea/cms/cms_pages_tabs.tpl"}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name="template-modals"}
    {if $template->getActiveDisplay()->name == 'CMS'}
        {include file='adminarea/pages/includes/modal/add-new-page-requirements.tpl'}
    {/if}

    <div class="modal" id="selectType">
        <div class="modal__dialog">
            <div class="modal__content">
                <div class="modal__top top">
                    <div class="top__title text-danger">Choose section type</div>
                    <div class="top__toolbar">
                        <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                            <i class="btn__icon lm lm-close"></i>
                        </button>
                    </div>
                </div>
                <form action="{$helper->url('Section@create',['templateName' => $template->getMainName()])}" method="POST">
                    <div class="modal__body">
                        <div class="form-group">
                            <label for="type">Type</label>
                            <select class="form-control opacity-1" name="type">
                                {foreach $sectionTypes as $sectionType}
                                    {if $sectionType['default_type']}  {*exclude predefined section type from creating new section*}
                                        <option value="{$sectionType['slug']}">{$sectionType['name']}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="modal__actions">
                        <button class="btn btn--primary" type="submit">
                            <span class="btn__text">Select</span>
                        </button>
                        <a class="btn btn--default btn--outline" data-dismiss="lu-modal">
                            <span class="btn__text">Cancel</span>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal" id="deleteImgModal" data-media-remove-modal>
        <div class="modal__dialog">
            <div class="modal__content">
                <div class="modal__top top">
                    <div class="top__title text-danger">Delete media image</div>
                    <div class="top__toolbar">
                        <button class="close btn btn--xs btn--icon btn--link cancel__item" data-dismiss="lu-modal" aria-label="Close">
                            <i class="btn__icon lm lm-close"></i>
                        </button>
                    </div>
                </div>
                <div class="modal__body">
                    <p>Are you sure you want to delete this item?</p>
                    <div class="form-group">
                        <input type="hidden" name="filename" id="media-filename" value="">
                    </div>
                </div>
                <div class="modal__actions">
                    <button class="btn btn--danger" type="button" data-media-remove data-ajax-url="{$helper->apiUrl("MediaApi@deleteMediaImage", ["templateName"=>$template->getMainName()])}">
                        <span class="btn__text">Delete</span>
                    </button>
                    <a class="btn btn--default btn--outline cancel__item" data-dismiss="lu-modal">
                        <span class="btn__text">Cancel</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name="template-scripts"}

{/block}