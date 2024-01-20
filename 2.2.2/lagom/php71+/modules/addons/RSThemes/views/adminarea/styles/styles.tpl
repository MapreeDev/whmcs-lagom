{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}
{block name="template-content"}
     <div class="section">
        <div class="t-c mob-t-c--full" data-table-container data-table-check-container>
            <div class="t-c__top top" data-top-search data-toggler-options="toggleClass: is-open;">
                <div class="top__toolbar">
                    <h3 class="section__title">{$lang.styles.title} {include file="adminarea/includes/helpers/docs.tpl" link=$docs.styles.theme_style}</h3>
                   
                </div>
                <div class="top__toolbar is-right">
                    <div class="top__search input-group">
                        <span class="input-group__icon lm lm-search"></span>
                        <input 
                            class="form-control input-group__form-control table-search" 
                            data-toggler-options="toggleFocus: true; clearOnBlur: true;" 
                            value="" 
                            placeholder="{$lang.general.search}..." 
                            id="table-search"
                        >
                    </div>
                </div>
            </div>
        </div>
        <div class="t-c__body t-c__body--boxed">
            <table 
                class="t-c__table table mob-table--block" 
                id="styles-table" 
                data-services-table 
                data-search-input="#table-search" 
                data-clickable-rows="true" 
                data-responsive="false"
            >
                <colgroup>
                    <col class="table__col-14">
                    <col class="table__col-4">
                    <col class="table__col-4">
                    <col class="table__col-5">
                </colgroup>
                <thead>
                    <tr>
                        <th class="cell-name">
                            <span>{$lang.general.name}</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        {if $template->getVersion()|intval >= 2}
                            <th class="cell-scheme">
                                <span>{$lang.styles.table.color_scheme}</span>
                                <span class="sorting-icons-box">
                                    {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                                </span>
                            </th>
                        {/if}
                        <th class="cell-status">
                            <span>{$lang.general.status}</span>
                            <span class="sorting-icons-box">
                                {include file="adminarea/includes/svg-icons/sorting-arrows.tpl"}
                            </span>
                        </th>
                        <th class="cell-actions no-sort"></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $template->getStyles() as $style}
                        <tr>
                            <td class="cell-name">
                                <div class="rail">
                                    <div class="content-extension">
                                        <a href="{$helper->url('Template@manageStyle',['templateName'=>$template->getMainName(), 'styleName' => $style->getMainName()])}">
                                            <strong>{$style->getName()}</strong>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            {if $template->getVersion()|intval >= 2}
                                <td class="cell-scheme">
                                    <div class="scheme-colors">
                                        <div class="scheme-color" style="background: {$style->getPreviewColors("primary")}"></div>
                                        <div class="scheme-color" style="background: {$style->getPreviewColors("secondary")}"></div>
                                    </div>
                                </td>
                            {/if}
                            <td class="cell-status">
                                {if $style->isActiveFromConfig()}
                                    <span class="label label--outline label--success">{$lang.general.active}</span>
                                {else}
                                    <span class="label label--outline  is-disabled">{$lang.general.disabled}</span>
                                {/if}
                            </td>
                            <td class="cell-actions">
                                <div class="has-dropdown">
                                    <a class="btn btn--default btn--outline btn--xs" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                                        <span class="btn__text is-hidden-mob-down">{$lang.general.actions}</span>
                                        <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-down" data-arrow-target></span>
                                        <span class="btn__icon btn__icon-arrow ls ls-caret is-hidden-mob-up" data-arrow-target></span>
                                    </a>
                                    <div class="dropdown" data-dropdown-menu >
                                        <div class="dropdown__arrow" data-arrow></div>
                                        <div class="dropdown__menu">
                                            <ul class="nav">
                                                <li class="nav__item">
                                                    <a class="nav__link" href="{$helper->url('Template@manageStyle',['templateName'=>$template->getMainName(), 'styleName' => $style->getMainName()])}">
                                                        <span class="nav__link-icon ls ls-edit"></span>
                                                        <span class="nav__link-text">{$lang.general.manage}</span>
                                                    </a>
                                                </li>
                                                {*<li class="nav__item">
                                                    <a class="nav__link" href="">
                                                        <span class="nav__link-icon ls ls-refresh"></span>
                                                        <span class="nav__link-text">{$lang.styles.table.force_style_refresh}</span>
                                                    </a>
                                                </li>*}
                                                <li class="nav__item">
                                                    <a class="nav__link" href="{$style->getLivePreviewLink()}" target="__blank">
                                                        <span class="nav__link-icon lm lm-search"></span>
                                                        <span class="nav__link-text">{$lang.general.live_preview}</span>
                                                    </a>
                                                </li>
                                                {if !$style->isActiveFromConfig()}
                                                    <li class="nav__divider"></li>
                                                    <li class="nav__item">
                                                        <a 
                                                            class="nav__link" 
                                                            href="{$helper->url('Template@setStyle',['templateName'=>$template->getMainName(), 'styleName' => $style->getMainName()])}" 
                                                            data-toggle="lu-notification" 
                                                            data-status="success" 
                                                            data-timeout="5000" 
                                                            data-title="Success" 
                                                            data-body="{$lang.general.changes_saved}"
                                                        >
                                                            <span class="nav__link-icon ls ls-check"></span>
                                                            <span class="nav__link-text">{$lang.general.activate}</span>
                                                        </a>
                                                    </li>
                                                {/if}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
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
{/block}