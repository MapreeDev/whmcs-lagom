<div class="app-main__nav">
    <div class="container">
        <ul class="nav nav--md nav--h nav--tabs">
            <li class="nav__item {if $smarty.get.exaction=='settings' || !$smarty.get.exaction} is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}">
                    <span class="nav__link-text">Promotions</span>
                </a>
            </li>
            <li class="nav__item {if $smarty.get.exaction=='media'} is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'media'])}">
                    <span class="nav__link-text">Media Library</span>
                </a>
            </li>
            <li class="nav__item {if $smarty.get.exaction=='options'}is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'options'])}">
                    <span class="nav__link-text">Settings</span>
                </a>
            </li>
            <li class="nav__item {if $smarty.get.exaction=='info'} is-active{/if}">
                <a class="nav__link" href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'info'])}">
                    <span class="nav__link-text">Info</span>
                </a>
            </li>
        </ul>
    </div>
</div>