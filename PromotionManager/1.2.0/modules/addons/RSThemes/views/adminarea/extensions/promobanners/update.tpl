{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/promobanners/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="block">
        <div class="block__body max-w-sm">
            <div class="section">
                <h3 class="section__title">
                    Extension Update
                    {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                </h3>
                <div class="alert alert--danger">
                    <div class="alert__body">
                        Promotion manager require update. Click bellow button.
                    </div>
                </div>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum facere mollitia neque odio possimus quidem reiciendis rem tenetur totam voluptatibus. Aliquam eveniet fugit incidunt ipsam officiis, quod saepe velit. Dolore!</p>
            </div>
        </div>
        <div class="block__sidebar block__sidebar--lg">
            <form method="post" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'update'])}">
                <input type="hidden" name="crud_action" value="update_extension">
                <button typeof="submit" class="btn btn--warning">
                    <span class="btn__text">Start Update</span>
                </button>
            </form>
        </div>
    </div>
{/block}






















