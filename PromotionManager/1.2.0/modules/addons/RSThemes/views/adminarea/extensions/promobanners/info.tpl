{extends file="adminarea/includes/layout.tpl"}

{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/promobanners/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <div class="block">
        <div class="block__body">
            <div class="section">
                <h3 class="section__title">
                    Extension Information
                </h3>
                <div class="section__body panel">
                    <ul class="list list--info list--p-1x">
                        <li class="list__item">
                            <span class="list__label">Extension Version:</span>
                            <span class="list__value"><b>{$extension->getVersion()}</b></span>
                        </li>
                        <li class="list__item">
                            <span class="list__label">Extension Name:</span>
                            <span class="list__value"><b>{$extension->getName()}</b></span>
                        </li>
                        <li class="list__item">
                            <span class="list__label">Extension Description:</span>
                            <span class="list__value"><b>{$extension->getDescription()}</b></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="block__sidebar block__sidebar--lg">
        </div>
    </div>
{/block}






















