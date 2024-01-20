<div class="modal" id="deleteSidebarModal">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>Delete sidebar</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Are you sure to this sidebar?<strong> This action cannot be undone!</strong></p>
            </div>
            <div class="modal__actions">
                <a class="btn btn--danger" data-btn-loader href="{$helper->url('Sidebar@delete',['templateName'=>$template->getMainName(), 'sidebarId' => $sidebar->id])}">
                    <span class="btn__preloader preloader preloader--light"></span>
                    <span class="btn__text">Yes, delete.</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No.</span></button>
            </div>
        </div>
    </div>
</div>
