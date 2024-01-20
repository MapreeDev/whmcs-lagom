<div id="mediaGallery" class="modal modal--lg">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h6 class="top__title text-default">Media Manager</h6>

                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body has-scroll p-t-1x">
                <ul class="nav nav--h nav--tabs m-b-2x">
                    <li class="nav__item is-active">
                        <a class="nav__link" data-toggle="lu-tab" href="#lagom-default-icons" data-media-predefined data-media-load>
                            <span>Default Lagom Icons</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a class="nav__link" data-toggle="lu-tab" href="#custom-icons" data-media-predefined data-media-load>
                            <span>Custom Icons</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane is-active" id="lagom-default-icons">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="media__search input-group">
                                    <i class="input-group__addon lm lm-search"></i>
                                    <input type="text" class="form-control" placeholder="Search" data-media-search>
                                </div>
                                <div class="media">
                                    <div class="media__list has-scroll">
                                    {if !empty($extension->getDirContents())}
                                        <div class="row">
                                            {foreach from=$extension->getDirContents() key=k item=defaultMedia}
                                                <div class="col-sm-4">
                                                    <div data-icon="{$defaultMedia['filename']}" data-type="default" class="widget widget--media-manager {if $extension->getSlideConfig()->slide_icon eq $defaultMedia['filename'] && strlen($extension->getSlideConfig()->slide_icon_custom) < 1}is-active{/if}" style="cursor:pointer;">
                                                        <div class="widget__media widget__media--lg widget__media--promo">
                                                            {* <img class="widget__img--lg" src="{$extension->extensoin_path()}/images/thumb-{$defaultMedia['filename']}.png" alt="{$defaultMedia['filename']}"> *}
                                                            {if file_exists("{$extension->assets_path()}/svg-illustrations/products/{$defaultMedia['filename']}.tpl")}
                                                                {include file="{$extension->assets_path()}/svg-illustrations/products/{$defaultMedia['filename']}.tpl"}
                                                                <img class="is-hidden" src="{$whmcsURL}/templates/lagom2/assets/svg-illustrations/products/{$defaultMedia['filename']}.tpl">
                                                            {/if}
                                                            <span class="widget__label"></span>
                                                        </div>
                                                        <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                                            <span class="truncate">{$defaultMedia['filename']}.{$defaultMedia['ext']}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    {else}
                                        <div class="media__no-data msg p-3x" data-media-no-data>
                                            <div class="msg__icon i-c-6x">
                                                <svg class="svg-icon" viewBox="0 0 63.31 63.5" x="0px" y="0px" width="64px" height="64px">
                                                    <line class="svg-icon-outline-s" x1="24.81" y1="41.63" x2="37.75" y2="34.55"></line>
                                                    <line class="svg-icon-outline-s" x1="20.39" y1="44.04" x2="21.61" y2="43.37"></line>
                                                    <line class="svg-icon-outline-s" x1="24.79" y1="35.83" x2="37.75" y2="28.72"></line>
                                                    <line class="svg-icon-outline-s" x1="20.39" y1="38.24" x2="21.6" y2="37.57"></line>
                                                    <line class="svg-icon-outline-s" x1="24.79" y1="29.89" x2="37.75" y2="22.79"></line>
                                                    <line class="svg-icon-outline-s" x1="20.39" y1="32.3" x2="21.6" y2="31.64"></line>
                                                    <path class="svg-icon-outline-s" d="M41.61,12.91l0,.09V40.08a6.71,6.71,0,0,1-2.91,5.4l-22,12.34c-1.61.91-3.06-.15-3.06-2.23v-35a7,7,0,0,1,3.06-5.48L32.16,6.48,33,6a.09.09,0,0,1,.12,0Z"></path>
                                                    <path class="svg-icon-outline-s dashed-1" d="M13.65,46.75l-5,2.78C3.58,52.78,1,50.42,1,48.37V15.72c0-2.05-.07-3.91,1.49-4.8L10,6.46,19.53,1s0,0,0,0l9.12,6.73"></path>
                                                    <path class="svg-icon-outline-p-l svg-icon-prime-l" d="M62.27,16.17,60.66,42.25a6.94,6.94,0,0,1-2.89,5.54L40.36,61.14a23.44,23.44,0,0,1-2.54,1.36,19.2,19.2,0,0,1-4.57-1.67c-.54-.26-1.94-.91-1.94-1.85l.08-36.73c0-2.13,2.84-4.77,4.44-5.69L50.94,8.33l1.28-.68s0,0,0,0l2.27,1.12,6,5.7S62.27,16.13,62.27,16.17Z"></path>
                                                    <path class="svg-icon-outline-p svg-icon-prime" d="M62.27,16.17l0,28.45c0,2.1.23,4.06-1.65,5.29L39,62.12a2.36,2.36,0,0,1-3.72-1.94V24.79a7.35,7.35,0,0,1,3.35-5.44L53.1,11l1.14-.64s0,0,0,0l8.07,5.13S62.27,16.13,62.27,16.17Z"></path>
                                                    <path class="svg-icon-outline-p-l svg-icon-prime-l" d="M62.31,15.5,57.8,20.35c-1.74.41-3.58-1.14-3.57-2.28V8.66Z"></path>
                                                    <line class="svg-icon-outline-i" x1="44.5" y1="45.7" x2="57.43" y2="38.61"></line>
                                                    <line class="svg-icon-outline-i" x1="40.08" y1="48.1" x2="41.29" y2="47.44"></line>
                                                    <line class="svg-icon-outline-i" x1="44.47" y1="39.89" x2="57.43" y2="32.79"></line>
                                                    <line class="svg-icon-outline-i" x1="39.81" y1="42.67" x2="41.07" y2="41.99"></line>
                                                    <line class="svg-icon-outline-i" x1="44.37" y1="34.02" x2="57.8" y2="26.66"></line>
                                                    <line class="svg-icon-outline-i" x1="39.81" y1="36.52" x2="41.07" y2="35.83"></line>
                                                </svg>
                                            </div>
                                            <div class="msg__body">
                                                <span class="msg__title">No icons found</span>
                                            </div>
                                        </div>
                                    {/if}
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="custom-icons">
                        <div class="media__search input-group">
                            <i class="input-group__addon lm lm-search"></i>
                            <input type="text" class="form-control" placeholder="Search" data-media-search>
                        </div>
                        <div class="media">
                            <div class="media__list has-scroll d-block">
                            {if !empty($extension->getDirContents('custom'))}
                                <div class="row">
                                    {foreach from=$extension->getDirContents('custom') key=k item=defaultMedia}
                                        <div class="col-sm-4">
                                            <div data-src="{$defaultMedia['filename']}.{$defaultMedia['ext']}" data-type="custom" class="widget widget--media-manager {if $extension->getSlideConfig()->slide_icon_custom eq $defaultMedia['fullName']}is-active{/if}" style="cursor:pointer;">
                                                <div class="widget__media widget__media--lg widget__media--promo p-2x">
                                                    <img style="max-height: 130px;max-width: 130px;object-fit:cover;object-position:center;" src="{$whmcsURL}/templates/{$extension->template->getMainName()}/core/extensions/PromoBanners/uploads/{$defaultMedia['filename']}.{$defaultMedia['ext']}" alt="{$defaultMedia['filename']}">
                                                </div>
                                                <div class="widget__actions widget__actions--raised flex flex-items-xs-between">
                                                    <span class="truncate">{$defaultMedia['filename']}</span>
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            {else}
                                <div class="media__no-data msg p-3x" data-media-no-data>
                                    <div class="msg__icon i-c-6x">
                                        <svg class="svg-icon" viewBox="0 0 63.31 63.5" x="0px" y="0px" width="64px" height="64px">
                                            <line class="svg-icon-outline-s" x1="24.81" y1="41.63" x2="37.75" y2="34.55"></line>
                                            <line class="svg-icon-outline-s" x1="20.39" y1="44.04" x2="21.61" y2="43.37"></line>
                                            <line class="svg-icon-outline-s" x1="24.79" y1="35.83" x2="37.75" y2="28.72"></line>
                                            <line class="svg-icon-outline-s" x1="20.39" y1="38.24" x2="21.6" y2="37.57"></line>
                                            <line class="svg-icon-outline-s" x1="24.79" y1="29.89" x2="37.75" y2="22.79"></line>
                                            <line class="svg-icon-outline-s" x1="20.39" y1="32.3" x2="21.6" y2="31.64"></line>
                                            <path class="svg-icon-outline-s" d="M41.61,12.91l0,.09V40.08a6.71,6.71,0,0,1-2.91,5.4l-22,12.34c-1.61.91-3.06-.15-3.06-2.23v-35a7,7,0,0,1,3.06-5.48L32.16,6.48,33,6a.09.09,0,0,1,.12,0Z"></path>
                                            <path class="svg-icon-outline-s dashed-1" d="M13.65,46.75l-5,2.78C3.58,52.78,1,50.42,1,48.37V15.72c0-2.05-.07-3.91,1.49-4.8L10,6.46,19.53,1s0,0,0,0l9.12,6.73"></path>
                                            <path class="svg-icon-outline-p-l svg-icon-prime-l" d="M62.27,16.17,60.66,42.25a6.94,6.94,0,0,1-2.89,5.54L40.36,61.14a23.44,23.44,0,0,1-2.54,1.36,19.2,19.2,0,0,1-4.57-1.67c-.54-.26-1.94-.91-1.94-1.85l.08-36.73c0-2.13,2.84-4.77,4.44-5.69L50.94,8.33l1.28-.68s0,0,0,0l2.27,1.12,6,5.7S62.27,16.13,62.27,16.17Z"></path>
                                            <path class="svg-icon-outline-p svg-icon-prime" d="M62.27,16.17l0,28.45c0,2.1.23,4.06-1.65,5.29L39,62.12a2.36,2.36,0,0,1-3.72-1.94V24.79a7.35,7.35,0,0,1,3.35-5.44L53.1,11l1.14-.64s0,0,0,0l8.07,5.13S62.27,16.13,62.27,16.17Z"></path>
                                            <path class="svg-icon-outline-p-l svg-icon-prime-l" d="M62.31,15.5,57.8,20.35c-1.74.41-3.58-1.14-3.57-2.28V8.66Z"></path>
                                            <line class="svg-icon-outline-i" x1="44.5" y1="45.7" x2="57.43" y2="38.61"></line>
                                            <line class="svg-icon-outline-i" x1="40.08" y1="48.1" x2="41.29" y2="47.44"></line>
                                            <line class="svg-icon-outline-i" x1="44.47" y1="39.89" x2="57.43" y2="32.79"></line>
                                            <line class="svg-icon-outline-i" x1="39.81" y1="42.67" x2="41.07" y2="41.99"></line>
                                            <line class="svg-icon-outline-i" x1="44.37" y1="34.02" x2="57.8" y2="26.66"></line>
                                            <line class="svg-icon-outline-i" x1="39.81" y1="36.52" x2="41.07" y2="35.83"></line>
                                        </svg>
                                    </div>
                                    <div class="msg__body">
                                        <span class="msg__title">No icons found</span>
                                    </div>
                                </div>
                            {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal__actions">
                <button data-image="" id="mediaButton" class="btn btn--primary" onclick="changeImageMedia(this)">
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <button data-dismiss="lu-modal" aria-label="Close" class="btn btn--outline btn--default">
                    <span class="btn__text">Cancel</span>
                </button>
            </div>
        </div>
    </div>
</div>

{literal}
    <script>
        var objectImage = {
            imageName: '',
            imageFullPath: '',
            imageType: '',
            imageContent: '',
            imageFileName: ''
        };

        $('#mediaGallery .widget--media-manager').on('click', function(e) {
            $('#mediaGallery').find('.widget--media-manager').removeClass('is-active');
            $(this).addClass('is-active');
            objectImage.imageFullPath = $(this).find('img').attr('src');
            objectImage.imageContent = $(this).find('.widget__media--promo').html();
            objectImage.imageFileName = $(this).find('.widget__actions .truncate').html();
            if($(this).data('type') === 'default'){
                objectImage.imageName = $(this).data('icon');
            }else{
                objectImage.imageName = $(this).data('src');
            }
            objectImage.imageType = $(this).data('type');
            console.log(objectImage.imageType);
        });

        function changeImageMedia(el){;
            $(el).addClass('is-loading is-disabled');
            $('.widget--image-advanced .widget__content').html(objectImage.imageContent);
            $('.widget--image-advanced .widget__actions .truncate').html(objectImage.imageFileName);
            if(objectImage.imageType  !== 'default'){
                $('#promotionIconPrev').html("<img class='promo-slider-custom-icon' src='"+objectImage.imageFullPath+"'>");
                $('#tmpImage').val(objectImage.imageName);
                $('#customGraphicRadio').prop('checked' , true).trigger('change')
            }else{
                $.ajax({
                url: '../templates/lagom2/assets/svg-illustrations/products/'+objectImage.imageName+'.tpl',
                }).done(function(data){
                    $('#promotionIconPrev').html(data);
                });
                $('#tmpIcon').val(objectImage.imageName);
                $('#tmpImage').val('');
                $('#predefinedLagomIcon').prop('checked',true).trigger('change')
            }
            setTimeout(function(){
                $('#promo-slide-1-bg-image,.promo-slider-custom-icon,#editPrev').attr('src', objectImage.imageFullPath);
                $(el).removeClass('is-loading is-disabled');
                $('#mediaGallery').modal('hide');
            }, 300);
        }
    </script>
{/literal}
