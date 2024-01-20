<div class="modal" id="exportConfirmation">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger">Export Warning</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Please save your changes before export. Unsaved changes won't be exported.</p>
            </div>
            <div class="modal__actions">
                {if $itemType == 'menu'}
                    <a href="{$helper->url('Data@exportMenu',['templateName'=>$template->getMainName(), 'menuId' => $itemId])}" class="btn btn--danger" data-btn-loader>
                        <span class="btn__preloader preloader preloader--light"></span>
                        <span class="btn__text export__btn">Export anyway</span>
                    </a>
                {elseif $itemType == 'sidebar'}
                    <a href="{$helper->url('Data@exportSidebar',['templateName'=>$template->getMainName(), 'sidebarId' => $itemId])}" class="btn btn--danger" data-btn-loader>
                        <span class="btn__preloader preloader preloader--light"></span>
                        <span class="btn__text export__btn">Export anyway</span>
                    </a>
                {/if}
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">Back</span></button>
            </div>
        </div>
    </div>
</div>
