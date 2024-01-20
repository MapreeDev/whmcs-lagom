{extends file="adminarea/includes/layout.tpl"}
{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/extensions/promobanners/includes/tabs.tpl"}
{/block}

{block name="template-content"}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/basic.css">
    <style>
        #rs-module .widget__media .widget__overlay:before, #rs-module .widget__media:before{
            border: none;
        }
        .brand-logo-preview > img {
            max-height: unset;
            height: auto;
        }

        #rs-module .tabs--media .nav--tabs.nav--h .nav__item.is-active:after, #rs-module .nav--tabs.nav--h .nav__link.is-active > .nav__link:after {
            padding-left: 0;
            padding-right: 0;
            left: 0;
            right: 0;
            bottom: 2px;
        }

        #rs-module .tabs--media .tabs__nav > .nav.nav--tabs .nav__item {
            margin-right: 16px;
        }

        #rs-module .col--media {
            flex: 0 0 20%;
            max-width: 20%;
        }

        #rs-module .col--img .widget.widget--media-manager .widget__media img{
            max-width: 100%;
        }

        #rs-module .col--media .widget__actions .btn:hover {
            color: #e53e3e;
        }

        /*#rs-module .dz-preview.dz-image-preview {
            display: flex;
            border: 1px solid rgba(0,0,0,.1);
            padding: 24px;
            box-shadow: 0 2px 10px -1px rgba(30,45,70,.05);
            margin-top: 16px;
            width: 100%;
        }
        #rs-module .dz-preview.dz-image-preview .dz-image{
            margin-right: 24px;
        }
        #rs-module .dz-default.dz-message {
            min-height: 200px;
            padding: 56px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px dashed rgba(0,0,0,.1);
        }
        .dropzone .dz-preview .dz-error-mark, .dropzone .dz-preview .dz-success-mark {
            left: 80px;
            right: auto;
            width: 54px;
            height: 54px;
            background: #62ca5f;
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
        }
        .dropzone .dz-preview .dz-progress {
            width: 75%;
            border-radius: 10px;
            border-color: #62ca5f;
        }
        .dropzone .dz-preview .dz-progress .dz-upload {
            border-radius: 10px;
            background: #62ca5f;
        }*/

        #rs-module .flex-between {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <div class="flex-between m-b-2x">
                <h3 class="m-b-0x">Media library
                    {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                </h3>

                <form id="mediaForm" enctype="multipart/form-data" action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}" method="post">
                    <div class="d-flex">
                        <span class="label label--warning m-r-2x">Max upload file: {$extension->max_upload()}</span>
                        <label class="btn btn--primary uploadStatus" for="images">
                            <span class="btn__icon lm lm-plus"></span>
                            <span class="btn__text">Upload media</span>
                            <span class="btn__preloader preloader"></span>

                            <input style="display: none;" onchange="$('#mediaForm').submit(); $('.uploadStatus').addClass('is-disabled is-loading')" multiple name="images[]" id="images" type="file" accept="image/*">
                            <input style="display: none;" type="text" name="crud_action" value="upload_images">
                        </label>
                    </div>
                </form>
            </div>
            <div class="row">
                {foreach from=$extension->getDirContents() key=k item=defaultMedia}
                    <div class="col-md-2 col-10p col--img">
                        <div data-icon="{$defaultMedia['filename']}" data-type="default"
                             class="widget widget--media-manager widget--inactive">
                            <div class="widget__media widget__media--lg">
                                    {if file_exists("{$extension->assets_path()}/svg-illustrations/products/{$defaultMedia['filename']}.tpl")}
                                        {include file="{$extension->assets_path()}/svg-illustrations/products/{$defaultMedia['filename']}.tpl"}
                                    {/if}
                            </div>
                            <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                <span class="truncate">{$defaultMedia['filename']}.{$defaultMedia['ext']}</span>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>

            <div class="row">
                {foreach from=$extension->getDirContents('custom') key=k item=defaultMedia}
                    <div class="col-md-2 col-10p col--img" id="image{$k}">
                        <div data-src="{$defaultMedia['filename']}.{$defaultMedia['ext']}"
                             class="widget widget--media-manager widget--inactive">
                            <div class="widget__media widget__media--lg p-2x">
                                <img style="max-height: 130px;object-fit:cover;object-position:top center;width:100%;"
                                        src="{$whmcsURL}/templates/{$themeName}/core/extensions/PromoBanners/uploads/{$defaultMedia['filename']}.{$defaultMedia['ext']}"
                                        alt="{$defaultMedia['filename']}">
                            </div>
                            <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                <span class="truncate">{$defaultMedia['filename']}</span>
                                <a style="width: 24px; min-width: 24px;"href="#confirmDelete" data-toggle="lu-modal"
                                   class="btn btn--icon btn--default btn--link p-r-0x btn--confirm m-l-1x" data-id="{$k}"
                                   data-fullname="{$defaultMedia['filename']}.{$defaultMedia['ext']}">
                                    <i data-promo-slide-close data-toggle="tooltip" data-title="Delete image" data-container="body" class="btn__icon lm lm-trash"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
    <div id="confirmDelete" class="modal modal--sm">
        <div class="modal__dialog">
            <div class="modal__content">
                <div class="modal__top top">
                    <div class="top__title text-danger">Remove
                        Item
                    </div>
                    <div class="top__toolbar">
                        <button class="close btn btn--xs btn--icon" data-dismiss="lu-modal"
                                aria-label="Close">
                            <i class="btn__icon lm lm-close"></i>
                        </button>
                    </div>
                </div>
                <div class="modal__body">
                    <p>Are you sure you want to remove this picture?</p>
                </div>
                <div class="modal__actions">
                    <button data-image-id="" data-dismiss="lu-modal" data-image="" type="button" class="btn btn--danger"
                            id="confirmDeleteImage"><span class="btn__text">Yes</span></button>
                    <button data-dismiss="lu-modal" aria-label="Close" type="button"
                            class="btn btn--default btn--outline"><span class="btn__text">No</span></button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.js"></script>
    <script>
        {literal}

        $('.btn--confirm').on('click', function () {
            $image = $(this).attr("data-fullname");
            $imageId = $(this).attr("data-id");

            $('#confirmDeleteImage').data('image', $image);
            $('#confirmDeleteImage').data('image-id', $imageId);
        });

        $('#confirmDeleteImage').on('click', function () {
            $.post("{/literal}{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}{literal}", {
                crud_action: "delete_image",
                name: $(this).data('image')
            });
            $('#image' + $(this).data('image-id')).fadeOut(500);
        });

        //Disabling autoDiscover
        //Dropzone.autoDiscover = false;

        $(function () {
            //Dropzone class
            /*var myDropzone = new Dropzone(".dropzone", {
                url: '{/literal}{$helper->url('Template@extension',[
                'templateName'=>$template->getMainName(),
                'extension'=>$extension->getLinkName()
                ])}{literal}',
                params: {
                    crud_action: 'upload_images'
                },
                paramName: "file",
                maxFiles: 10,
                acceptedFiles: ".jpeg,.jpg,.png,.gif",
                autoProcessQueue: true,
                dictDefaultMessage: "Upload media",
                init: function () {
                    this.on("success", function (file, responseText) {
                        console.log(responseText);
                    });
                }
            });*/



            /*$('#startUpload').click(function(){
                myDropzone.processQueue();
            });*/
        });


    </script>
{/literal}
{/block}
