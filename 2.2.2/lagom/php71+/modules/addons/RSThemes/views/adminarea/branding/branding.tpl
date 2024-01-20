{extends file="adminarea/includes/layout.tpl"}
{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}
{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"}
{/block}
{block name="template-content"}
    <form 
        id="#themesConfig" 
        action="{$helper->url('Template@branding',['templateName'=>$template->getMainName()])}" 
        method="POST" 
        enctype="multipart/form-data" 
        data-check-unsaved-changes
    >
        <div class="section">
            <div class="section__header">
                <h3 class="section__title">
                    Full Logo
                    {include file="adminarea/includes/helpers/docs.tpl" link=$docs.branding.full_logo}
                </h3>
            </div>
            <div class="section__body section--branding">
                <div class="row row--eq-height">
                    <div class="col-sm-5 logo-box logo-box--light">
                        {if $images.logo_big}
                            <input class="is-hidden" type="file" name="logo_big" data-logo-input>
                            <div class="widget widget--branding branding-overlay" href="#" data-input-trigger='logo_big'>
                                <div class="widget__media">
                                    <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                        <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="logo_big">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    </div>
                                    <a class="widget__overlay " >
                                        <div class="widget__content">
                                            <div class="msg">
                                                <div class="upload__icon upload__icon--hover i-circled">
                                                    <span class="lm lm-edit"></span>
                                                </div>
                                                <div class="widget__text-box">
                                                    <div class="change__text type-7">Click to change graphic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="widget__content text-center">
                                        <div class="brand-logo-preview">
                                            <img  name="logo_bigImage" src="{$images.logo_big}" alt="" height="100%"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on light and white background</p>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <input class="is-hidden" type="file" name="logo_big" data-logo-input>
                            <a class="widget widget--branding widget--link" href="#" data-input-trigger='logo_big'>
                                <div class="widget__body">
                                    <div class="msg">
                                        <div class="upload__icon i-circled">
                                            <span class="lm lm-upload"></span>
                                        </div>
                                        <div class="widget__text-box">
                                            <div class="msg__title type-7">Click to upload a file.</div>
                                            <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on light and white background</p>
                                    </div>
                                </div>
                            </a>
                        {/if}
                    </div>
                    <div class="col-sm-5 logo-box logo-box--dark">
                        {if $images.logo_big_inverse}
                            <input class="is-hidden" type="file" name="logo_big_inverse" data-logo-input>
                            <div class="widget  widget--branding branding-overlay" href="#" data-input-trigger='logo_big_inverse'>
                                <div class="widget__media">
                                    <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                        <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="logo_big_inverse">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    </div>
                                    <a class="widget__overlay ">
                                        <div class="widget__content">
                                            <div class="msg">
                                                <div class="upload__icon upload__icon--hover i-circled">
                                                    <span class="lm lm-edit"></span>
                                                </div>
                                                <div class="widget__text-box">
                                                    <div class="change__text type-7">Click to change graphic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="widget__content text-center">
                                        <div class="brand-logo-preview">
                                            <img  name="logo_big_inverseImage"  src="{$images.logo_big_inverse}" alt="" height="100%"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on dark background</p>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <input class="is-hidden" type="file" name="logo_big_inverse" data-logo-input>
                            <a class="widget widget--branding widget--link" href="#" data-input-trigger='logo_big_inverse' >
                                <div class="widget__body">
                                    <div class="msg">
                                        <div class="upload__icon i-circled">
                                            <span class="lm lm-upload"></span>
                                        </div>
                                        <div class="widget__text-box">
                                            <div class="msg__title type-7">Click to upload a file.</div>
                                            <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on dark background</p>
                                    </div>
                                </div>
                            </a>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <h3 class="section__title">
                Square Logo
                {include file="adminarea/includes/helpers/docs.tpl" link=$docs.branding.square_logo}
            </h3>
            <div class="section__body section--branding">
                <div class="row row--eq-height">
                    <div class="col-sm-5 logo-box logo-box--light">
                        {if $images.logo_small}
                            <input class="is-hidden" type="file" name="logo_small" data-logo-input>
                            <div class="widget widget--branding branding-overlay">
                                <div class="widget__media">
                                    <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                        <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="logo_small">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    </div>
                                    <a class="widget__overlay " href="#" data-input-trigger='logo_small' >
                                        <div class="widget__content">
                                            <div class="msg">
                                                <div class="upload__icon upload__icon--hover i-circled">
                                                    <span class="lm lm-upload"></span>
                                                </div>
                                                <div class="widget__text-box">
                                                    <div class="change__text type-7">Click to change graphic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="widget__content text-center">
                                        <div class="brand-logo-preview p-5x">
                                            <img name="logo_smallImage" src="{$images.logo_small}" alt=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Square logo displayed on light background</p>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <input class="is-hidden" type="file" name="logo_small" data-logo-input>
                            <a class="widget widget--branding widget--link" href="#" data-input-trigger='logo_small' >
                                <div class="widget__body">
                                    <div class="msg">
                                        <div class="upload__icon i-circled">
                                            <span class="lm lm-upload"></span>
                                        </div>
                                        <div class="widget__text-box">
                                            <div class="msg__title type-7">Click to upload a file.</div>
                                            <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Square logo displayed on light background</p>
                                    </div>
                                </div>
                            </a>
                        {/if}
                    </div>
                    <div class="col-sm-5 logo-box logo-box--dark">
                        {if $images.logo_small_inverse}
                            <input class="is-hidden" type="file" name="logo_small_inverse" data-logo-input>
                            <div class="widget widget--branding branding-overlay">
                                <div class="widget__media">
                                    <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                        <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="logo_small_inverse">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    </div>
                                    <a class="widget__overlay" href="#" data-input-trigger='logo_small_inverse'>
                                        <div class="widget__content">
                                            <div class="msg">
                                                <div class="upload__icon upload__icon--hover i-circled">
                                                    <span class="lm lm-upload"></span>
                                                </div>
                                                <div class="widget__text-box">
                                                    <div class="change__text type-7">Click to change graphic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="widget__content text-center">
                                        <div class="brand-logo-preview p-5x">
                                            <img name="logo_small_inverseImage"  src="{$images.logo_small_inverse}" alt="" />
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Square logo displayed on dark background</p>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <input class="is-hidden" type="file" name="logo_small_inverse" data-logo-input>
                            <a class="widget widget--branding widget--link" href="#" data-input-trigger='logo_small_inverse' >
                                <div class="widget__body">
                                    <div class="msg">
                                        <div class="upload__icon i-circled">
                                            <span class="lm lm-upload"></span>
                                        </div>
                                        <div class="widget__text-box">
                                            <div class="msg__title type-7">Click to upload a file.</div>
                                            <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Square logo displayed on dark background</p>
                                    </div>
                                </div>
                            </a>
                        {/if}
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <h3 class="section__title">
                Favicon
                {include file="adminarea/includes/helpers/docs.tpl" link=$docs.branding.favicon}
            </h3>
            <div class="section__body section--branding">
                <div class="row row--eq-height">
                    <div class="col-sm-5 logo-box logo-box--favicon">
                        {if $images.icon}
                            <input class="is-hidden" type="file" name="icon" data-logo-input>
                            <div class="widget widget--branding branding-overlay">
                                <div class="widget__media">
                                    <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                        <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="icon">
                                            <i class="lm lm-trash"></i>
                                        </a>
                                    </div>
                                    <a class="widget__overlay " href="#" data-input-trigger='icon' >
                                        <div class="widget__content">
                                            <div class="msg">
                                                <div class="upload__icon upload__icon--hover i-circled">
                                                    <span class="lm lm-upload"></span>
                                                </div>
                                                <div class="widget__text-box">
                                                    <div class="change__text type-7">Click to change graphic</div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="widget__content text-center">
                                        <div class="brand-logo-preview">
                                            <img name="iconImage" src="{$images.icon}" alt="" height="100%"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Favicon shown in browser tab</p>
                                    </div>
                                </div>
                            </div>
                        {else}
                            <input class="is-hidden" type="file" name="icon" data-logo-input>
                            <a class="widget widget--branding widget--link" href="#" data-input-trigger='icon' >
                                <div class="widget__body">
                                    <div class="msg">
                                        <div class="upload__icon i-circled">
                                            <span class="lm lm-upload"></span>
                                        </div>
                                        <div class="widget__text-box">
                                            <div class="msg__title type-7">Click to upload a file.</div>
                                            <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget__actions">
                                    <div class="widget__content">
                                        <p class="p-4 m-b-0x text-center flex-1">Favicon shown in browser tab</p>
                                    </div>
                                </div>
                            </a>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        {if $emailExtension}
            <div class="section">
                <div class="section__header">
                    <h3 class="section__title">
                        Email Logo
                        {include file="adminarea/includes/helpers/docs.tpl" link=$docs.branding.email_logo}
                    </h3>
                </div>
                <div class="section__body section--branding">
                    <div class="row row--eq-height">
                        <div class="col-sm-5 logo-box logo-box--light">
                            {if $images.email_light}
                                <input class="is-hidden" type="file" name="email_light" data-logo-input>
                                <div class="widget widget--branding branding-overlay" href="#" data-input-trigger='email_light'>
                                    <div class="widget__media">
                                        <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                            <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="email_light">
                                                <i class="lm lm-trash"></i>
                                            </a>
                                        </div>
                                        <a class="widget__overlay " >
                                            <div class="widget__content">
                                                <div class="msg">
                                                    <div class="upload__icon upload__icon--hover i-circled">
                                                        <span class="lm lm-edit"></span>
                                                    </div>
                                                    <div class="widget__text-box">
                                                        <div class="change__text type-7">Click to change graphic</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="widget__content text-center">
                                            <div class="brand-logo-preview">
                                                <img  name="logo_email_light" src="{$images.email_light}" alt="" height="100%"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget__actions">
                                        <div class="widget__content">
                                            <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on light and white background</p>
                                        </div>
                                    </div>
                                </div>
                            {else}
                                <input class="is-hidden" type="file" name="email_light" data-logo-input>
                                <a class="widget widget--branding widget--link" href="#" data-input-trigger='email_light'>
                                    <div class="widget__body">
                                        <div class="msg">
                                            <div class="upload__icon i-circled">
                                                <span class="lm lm-upload"></span>
                                            </div>
                                            <div class="widget__text-box">
                                                <div class="msg__title type-7">Click to upload a file.</div>
                                                <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget__actions">
                                        <div class="widget__content">
                                            <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on light and white background</p>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        </div>
                        <div class="col-sm-5 logo-box logo-box--dark">
                            {if $images.email_inverse}
                                <input class="is-hidden" type="file" name="email_inverse" data-logo-input>
                                <div class="widget  widget--branding branding-overlay" href="#" data-input-trigger='email_inverse'>
                                    <div class="widget__media">
                                        <div class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                            <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="email_inverse">
                                                <i class="lm lm-trash"></i>
                                            </a>
                                        </div>
                                        <a class="widget__overlay ">
                                            <div class="widget__content">
                                                <div class="msg">
                                                    <div class="upload__icon upload__icon--hover i-circled">
                                                        <span class="lm lm-edit"></span>
                                                    </div>
                                                    <div class="widget__text-box">
                                                        <div class="change__text type-7">Click to change graphic</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="widget__content text-center">
                                            <div class="brand-logo-preview">
                                                <img  name="email_inverseImage"  src="{$images.email_inverse}" alt="" height="100%"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget__actions">
                                        <div class="widget__content">
                                            <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on dark background</p>
                                        </div>
                                    </div>
                                </div>
                            {else}
                                <input class="is-hidden" type="file" name="email_inverse" data-logo-input>
                                <a class="widget widget--branding widget--link" href="#" data-input-trigger='email_inverse' >
                                    <div class="widget__body">
                                        <div class="msg">
                                            <div class="upload__icon i-circled">
                                                <span class="lm lm-upload"></span>
                                            </div>
                                            <div class="widget__text-box">
                                                <div class="msg__title type-7">Click to upload a file.</div>
                                                <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget__actions">
                                        <div class="widget__content">
                                            <p class="p-4 m-b-0x text-center flex-1">Full logo displayed on dark background</p>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    </form>
{/block}   

{block name="template-modals"}
    {include file="adminarea/includes/modals/unsaved-changes.tpl"}

    <div class="modal" id="deleteBrandingImgModal" data-delete-branding-modal>
        <div class="modal__dialog">
            <div class="modal__content">
                <div class="modal__top top">
                    <div class="top__title text-danger">Delete branding image</div>
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
                    <button id="deleteImageAjax" class="btn btn--danger" type="button" data-delete-branding-modal-submit data-img-name data-btn-loader>
                        <span class="btn__preloader preloader preloader--light"></span>
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
    <script id="image_template" type="text/template">
        <div class="widget widget--branding branding-overlay" href="#" data-trigger='newLogo'>
            <div class="widget__media">
                <div class="tooltip-toggle tooltip-toggle--added" data-toggle="lu-tooltip" data-title="Delete">
                    <a class="delete__icon" href="#deleteBrandingImgModal" data-toggle="lu-modal" data-backdrop="static" data-delete-branding data-img-name="">
                        <i class="lm lm-trash"></i>
                    </a>
                </div>
                <a class="widget__overlay ">
                    <div class="widget__content">
                        <div class="msg">
                            <div class="upload__icon upload__icon--hover i-circled">
                                <span class="lm lm-upload"></span>
                            </div>
                            <div class="widget__text-box">
                                <div class="change__text type-7">Click to change graphic</div>
                            </div>
                        </div>
                    </div>
                </a>
                <div class="widget__content text-center">
                    <div class="brand-logo-preview p-5x">
                        <img name="newLogoImage" src="" alt=""/>
                    </div>
                    
                </div>
            </div>
            <div class="widget__actions">
                <div class="widget__content">
                    <p class="p-4 m-b-0x text-center flex-1">
                        <span class="preview-light">Full logo displayed on light background</span>
                        <span class="preview-dark">Full logo displayed on dark background</span>
                        <span class="preview-favicon">Favicon shown in browser tab</span>
                    </p>
                </div>
            </div>
        </div>
    </script>

    <script id="non_image_template" type="text/template">
        <a class="widget widget--branding widget--link" href="#" data-input-trigger='newLogo' >
            <div class="widget__body">
                <div class="msg">
                    <div class="upload__icon i-circled">
                        <span class="lm lm-upload"></span>
                    </div>
                    <div class="widget__text-box">
                        <div class="msg__title type-7">Click to upload a file.</div>
                        <div class="widget__suggestion">Suggested to upload graphic with at least 40px height</div>
                    </div>
                </div>
            </div>
            <div class="widget__actions">
                <div class="widget__content">
                    <p class="p-4 m-b-0x text-center flex-1">Favicon shown in browser tab</p>
                </div>
            </div>
        </a>
    </script>

    {literal}
        <script type="text/javascript">
            $(document).on('mouseenter', '.widget--branding .delete__icon' , function(){
                $(this).closest('.widget--branding').removeClass('branding-overlay'); 
            });
            $(document).on('mouseout', '.widget--branding .delete__icon' , function(){
                $(this).closest('.widget--branding').addClass('branding-overlay'); 
            });
            $('.tooltip-toggle').on('click', function(e){
                e.stopPropagation();
            });
        </script>
        <script>
            $('#deleteImageAjax').on('click', function(){
                $.ajax({
                    url: {/literal}'{$helper->url('Template@brandingDelete',['templateName'=>$template->getMainName()])}{literal}&type='+$(this).data("img-name"),
                    success: function(response) {

                    }
                });
            });{/literal}
        </script>
{/block}

{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container">
            <a 
                class="btn btn--primary" 
                href="#" 
                data-form="submit" 
                data-check-unsaved-changes
            >
                <span class="btn__text">Save Settings</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <a 
                class="btn btn--default btn--outline" 
                href="{$helper->url('Template@branding',['templateName'=>$template->getMainName()])}"
            >
                <span class="btn__text">Cancel</span>
                <span class="btn__preloader preloader"></span>
            </a>
        </div>
    </div>
{/block}