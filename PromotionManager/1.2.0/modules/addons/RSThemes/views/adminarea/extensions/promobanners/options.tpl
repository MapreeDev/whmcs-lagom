
{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/promobanners/includes/tabs.tpl"}
{/block}

{block name="template-content"}

    <h3 class="section__title">
        General Settings
        {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
    </h3>
    <h5> Promotion type: <strong>Banner</strong></h5>
    <div class="panel panel--collapse">
        <form id="saveConfig" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=> $extension->getLinkName()])}" name="saveGlobalConfig" method="post">
            <input type="hidden" name="crud_action" value="saveGlobalConfig">
            <div class="collapse-toggle">
                <h6 class="top__title">
                    Allow promotion closing
                    {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='Will show up a close button, which add posibility close specific promotion type for x days.'}
                </h6>
                <label>
                    <div class="switch" data-toggle="lu-collapse" data-target="#count-days-url" aria-expanded="true">
                        <input type="hidden" name="banner_close" value="0">
                        <input class="switch__checkbox" type="checkbox" name="banner_close" {if $extension->getConfig('banner_close') == '1'}checked{/if} value="1">
                        <span class="switch__container"><span class="switch__handle"></span></span>
                    </div>
                </label>
            </div>
            <div class="collapse p-3x {if $extension->getConfig('banner_close') == '1'} show {/if}" id="count-days-url">
                <div class="">
                    <div class="row">
                        <div class="col-md-3">
                            <label class="form-label">
                                Close for amount of days
                                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip='Enter amount of days to close specific promotion type. Enter 0 to close it for lifetime.'}
                            </label>
                            <input value="{$extension->getConfig('banner_close_time')}" class="form-control" type="number" name="banner_close_time">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
{/block}


{block name="template-actions"}
        <div class="app-main__actions" style="position: sticky;bottom:0;">
            <div class="container">
                <button id="saveChangesButton" onclick="$('#saveConfig').submit(); $(this).addClass('is-loading is-disabled')" class="btn btn--primary" type="submit">
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}" class="btn btn--default btn--outline">Cancel</a>
            </div>
        </div>
{/block}