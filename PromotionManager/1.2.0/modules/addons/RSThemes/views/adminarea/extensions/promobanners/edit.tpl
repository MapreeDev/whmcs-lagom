{extends file="adminarea/includes/layout.tpl"}
{block name="template-heading"}
    {include file="adminarea/extensions/promobanners/includes/breadcrumb.tpl" name=$extension->getSlideContent()->slide_name  disableActions=true}
{/block}
{block name="template-content"}
    <div class="block" id="vueApp">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/css/datepicker.min.css">
        <!-- One of the following themes -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/classic.min.css"/>
        <!-- 'classic' theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/monolith.min.css"/>
        <!-- 'monolith' theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/nano.min.css"/>
        
        <link rel="stylesheet" href="{$extension->extensoin_path()}/css/slide.css">
        <div class="block__body">
            {*zwykły modal*}
            {include file="adminarea/extensions/promobanners/includes/mediaModal.tpl"}
            {*icon modal*}
            {include file="adminarea/extensions/promobanners/includes/mediaModalIcon.tpl"}
            <form id="promotionBanners" enctype="multipart/form-data" method="POST"
                  action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}">
                <input type="hidden" name="slide_id" value="{$extension->getSlideConfig()->id}">
                <input type="hidden" name="crud_action" value="update">
                <div class="section">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="section">
                                <h3 class="section__title">
                                    Promotion Settings
                                    {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                </h3>
                                <div class="section__body panel">

                                    <h5>Promotion Preview</h5>
                                    {* Banner Preview *}
                                        {include file="adminarea/extensions/promobanners/includes/promotion-prev.tpl"}
                                    {* Banner Preview *}

                                    <div class="form-group m-t-2x">
                                        <label class="form-label">Choose Language To Edit</label>
                                        <select onchange="changeLanguage()" class="form-control" name="language"
                                                id="language_select">
                                            {foreach $extension->getLanguages() as $language}
                                                <option {if $language eq $extension->getSlideContent()->language_name || $language eq $extension->getDefaultLang()} selected {/if}
                                                        value="{$language}">{ucfirst($language)}</option>
                                            {/foreach}
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Promotion Name</label>
                                        <input required="required" onkeyup="updateContent(this, 'full-name')" id="slideTitle"
                                            class="form-control" type="text" name="name"
                                            value="{$extension->getSlideContent()->slide_name}">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Promotion Title</label>
                                        <input required="required" onkeyup="updateContent(this, 'promo-slider-title')"
                                            value="{$extension->getSlideContent()->slide_description}" id="slideDescription"
                                            name="description" class="form-control">
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Promotion button URL</label>
                                        <input value="{$extension->getSlideConfig()->slide_product_url}" type="text"
                                            name="product_url" id="lorem" class="form-control">

                                        {*<select class="form-control" name="product_url" id="lorem">
                                            {foreach from=$extension->getProducts() key=keyk item=product}
                                                <option {if $extension->getSlideConfig()->slide_product_url eq "p`$product->id`"}selected="selected"{/if} value="p{$product->id}">{$product->productGroup->name} - {$product->name}</option>
                                            {/foreach}

                                            {foreach from=$extension->getProductGroup() key=key2 item=group}
                                                <option {if $extension->getSlideConfig()->slide_product_url eq "g`$group->id`"}selected="selected"{/if} value="g{$group->id}">Group - {$group->name}</option>
                                            {/foreach}
                                        </select>*}
                                    </div>

                                    <div class="form-group m-b-0x">
                                        <label class="form-label">Promotion button title</label>
                                        <input onkeyup="updateContent(this,'promo-slider-more')"
                                            value="{$extension->getSlideContent()->slide_text_btn}" id="slideTextBtn"
                                            placeholder="Promotion button title" type="text" class="form-control"
                                            name="text_btn">
                                    </div>
                                </div>
                            </div>
                            <div class="section">
                                {include file="adminarea/extensions/promobanners/includes/homepage-settings.tpl"}

                                <input id="tmpImage" value="{$extension->getSlideConfig()->slide_icon_custom}"
                                    name="icon_custom_tmp" type='hidden'/>
                                <input id="tmpIcon" value="{$extension->getSlideConfig()->slide_icon}" name="icon"
                                    type='hidden'/>
                            </div>
                            
                        </div>
                        <div class="col-md-4 p-l-4x">
                            <div class="section">
                                <h3 class="section__title">
                                    Display Settings
                                    {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
                                </h3>
                                <div class="section-body">
                                    {include file="adminarea/extensions/promobanners/includes/slide-advanced-settings.tpl"}

                                    <div class="panel panel--collapse" style="display: none;">
                                        <div class="collapse-toggle">
                                            <h6 class="top__title">Promotion Types</h6>
                                        </div>
                                        <div class="collapse show">
                                            <div class="form-group">
                                                <select disabled="disabled" class="form-control" name="promotion_type"
                                                        id="promotion_type">
                                                    <option {if $extension->getSlideConfig()->slide_type eq '1'} selected {/if}
                                                            value="1">Banner
                                                    </option>
                                                    <option {if $extension->getSlideConfig()->slide_type eq '2'} selected {/if}
                                                            value="2">Modal
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="widget panel">
                                        <div class="widget__top">
                                            <div class="top__title">Promotion Placement</div>
                                        </div>
                                        <div class="widget__body">
                                            <div class="widget__content">
                                                <div class="form-group">
                                                    <label class="justify-content-between">
                                                        <span>Client Home</span>
                                                        <div class="switch">
                                                            <input class="switch__checkbox" type="checkbox"
                                                                name="promotion[client-home]"
                                                                {if {$extension->getSlideConfig()->slide_options.promotion['client-home']} == '1' || !$extension->getSlideConfig()->id}checked{/if}
                                                                value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>

                                                    <label class="justify-content-between">
                                                        <span>Product Details</span>
                                                        <div class="switch">
                                                            <input class="switch__checkbox" type="checkbox"
                                                                name="promotion[product-details]"
                                                                {if {$extension->getSlideConfig()->slide_options.promotion['product-details']} == '1' || !$extension->getSlideConfig()->id}checked{/if}
                                                                value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>

                                                    <label class="justify-content-between">
                                                        <span>Product List</span>
                                                        <div class="switch">
                                                            <input class="switch__checkbox" type="checkbox"
                                                                name="promotion[product-list]"
                                                                {if {$extension->getSlideConfig()->slide_options.promotion['product-list'] || !$extension->getSlideConfig()->id} == '1'}checked{/if}
                                                                value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>

                                                    {*<label class="justify-content-between">
                                                        <span>Cart View</span>
                                                        <div class="switch">
                                                            <input class="switch__checkbox" type="checkbox" name="promotion[cart-view]" {if {$extension->getSlideConfig()->slide_options.promotion['cart-view']} == '1'}checked{/if} value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>*}

                                                    <label class="justify-content-between">
                                                        <span>Cart checkout</span>
                                                        <div class="switch">
                                                            <input class="switch__checkbox" type="checkbox"
                                                                name="promotion[cart-view]"
                                                                {if {$extension->getSlideConfig()->slide_options.promotion['cart-view']} == '1' || !$extension->getSlideConfig()->id}checked{/if}
                                                                value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>

                                                    <label class="justify-content-between">
                                                        <span>Homepage</span>
                                                        <div class="switch">
                                                            <input onchange="toggleHome(this)" class="switch__checkbox"
                                                                type="checkbox" name="promotion[homepage]"
                                                                {if {$extension->getSlideConfig()->slide_options.promotion['homepage']} == '1' || !$extension->getSlideConfig()->id}checked{/if}
                                                                value="1">
                                                            <span class="switch__container"><span class="switch__handle"></span></span>
                                                        </div>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="widget panel of-visible">
                                        <div class="widget__top">
                                            <div class="top__title">Publish</div>
                                        </div>
                                        <div class="widget__body">
                                            <div class="widget__content">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="form-label">Start Date</label>
                                                            <input id="startDate"
                                                                {if $extension->getSlideConfig()->slide_begin_time}
                                                                    value="{date("Y-m-d",$extension->getSlideConfig()->slide_begin_time)}"
                                                                    {else}
                                                                    value=""
                                                                    {/if}
                                                                name="begin_time" type='text'
                                                                class='datepicker-here form-control form-control--sm'
                                                                data-language='en' autocomplete="off"/>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="form-label">Due Date</label>
                                                            <input id="dueDate"
                                                                {if $extension->getSlideConfig()->slide_end_time}
                                                                    value="{date("Y-m-d",$extension->getSlideConfig()->slide_end_time)}"
                                                                {else}
                                                                    value=" "
                                                                {/if}
                                                                name="end_time" type='text'
                                                                class='datepicker-here form-control form-control--sm'
                                                                data-language='en' autocomplete="off"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-group p-t-0x">
                                                            <div class="status-select">
                                                                <label class="form-label">Status</label>
                                                                <select class="form-control form-control--sm" name="show"
                                                                        id="slide_show">
                                                                    <option class="status--published" {if $extension->getSlideConfig()->slide_show eq '1'} selected="selected" {/if}
                                                                            value="1">Published
                                                                    </option>
                                                                    <option class="status--hidden" {if $extension->getSlideConfig()->slide_show eq '0'} selected="selected" {/if}
                                                                            value="0">Disabled
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {* test *}

                        </div>
                    </div>
                </div>
            </form>

            <div id="confirmDelete" class="modal modal--sm">
                <div class="modal__dialog">
                    <form method="post"
                          action="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}">
                        <input type="hidden" name="crud_action" value="delete">
                        <input type="hidden" name="id" value="{$extension->getSlideConfig()->id}">
                        <div class="modal__content">
                            <div class="modal__top top">
                                <h4 class="top__title text-danger">
                                    Remove Item
                                </h4>
                                <div class="top__toolbar">
                                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal"
                                            aria-label="Close">
                                        <i class="btn__icon lm lm-close"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="modal__body">
                                <p>Are you sure you want to remove this promotion?</p>
                            </div>
                            <div class="modal__actions">
                                <button type="submit" class="btn btn--danger"><span class="btn__text">Yes</span>
                                </button>
                                <button data-dismiss="lu-modal" aria-label="Close" type="button"
                                        class="btn btn--default btn--outline"><span class="btn__text">No</span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name="template-actions"}
    <script>
        function validateForm(event) {
            if (!$('#slideDescription').val() || !$('#slideTitle').val()) {
                alert('Please fill fields Promotion Title and Promotion Name');
            } else {
                $('#promotionBanners').submit();
                $(event.currentTarget).addClass('is-loading is-disabled')
            }
        };
    </script>
        <div class="app-main__actions" style="position: sticky;bottom:0;">
            <div class="container">
                <button onclick="validateForm(event)" id="saveChangesButton" class="btn btn--primary" type="submit">
                    <span class="btn__text">Save Changes</span>
                    <span class="btn__preloader preloader"></span>
                </button>
                <a href="{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName(),'exaction'=>'settings'])}"
                   class="btn btn--default btn--outline">Cancel</a>

                {if $extension->getSlideContent()->id}
                    <a href="#confirmDelete" data-toggle="lu-modal" class="btn btn--default btn--outline m-l-a">
                        <span class="btn__text">Delete Promotion</span>
                    </a>
                {/if}
            </div>
        </div>
{/block}

{block name="template-scripts"}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/pickr.es5.min.js"></script>

     <script>
        {literal}
        $("#imgInp").change(function () {
            readURL(this);
        });

        function changeLanguage(e) {
            console.log($('#language_select :selected').val());
            $.post('{/literal}{$helper->url('Template@extension',['templateName'=>$template->getMainName(),'extension'=>$extension->getLinkName()])}{literal}', {
                'crud_action': 'languageUpdate',
                'language': $('#language_select :selected').val(),
                'langId': {/literal} {if isset($extension->getSlideConfig()->id)}{$extension->getSlideConfig()->id}{else}''{/if} {literal}
            }).done(function (content) {
                if (content.content) {
                    jQuery('#slideTitle').val(htmldecode(content.content.slide_name));
                    jQuery('.full-name').html(content.content.slide_name);
                    jQuery('#slideDescription').val(htmldecode(content.content.slide_description));
                    jQuery('.promo-slider-title').html(content.content.slide_description);
                    jQuery('#slideTextBtn').val(content.content.slide_text_btn);
                    jQuery('.promo-slider-more').html(content.content.slide_text_btn);
                    jQuery('#homeButton').val(content.content.slide_text_btn_home);
                    jQuery('#homeSubtitle').val(htmldecode(content.content.slide_description_home));
                    jQuery('#homeButtonSecondary').val(content.content.slide_secondary_button_text);
                    jQuery('#titleHome').val(htmldecode(content.content.slide_title_home));
                    jQuery('#paginationTitle').val(htmldecode(content.content.slide_pagination_title_home));
                } else {
                    jQuery('#slideTitle , #slideDescription , #slideTextBtn, #homeButton , #homeSubtitle , #homeButtonSecondary , #titleHome , #paginationTitle').val(' ');
                }
            });
        }

        function htmldecode (str){

            var txt = document.createElement('textarea');
            txt.innerHTML = str;
            return txt.value;
        }




        // Simple example, see optional options for more configuration.
        function initColorPickers(element) {
            var $element = $(element);
            var picker = Pickr.create({
                el: element,
                useAsButton: true,
                container: '#pickerParent',
                theme: 'nano',
                swatches: [
                    'rgba(244, 67, 54, 1)',
                    'rgba(233, 30, 99, 0.95)',
                    'rgba(156, 39, 176, 0.9)',
                    'rgba(103, 58, 183, 0.85)',
                    'rgba(63, 81, 181, 0.8)',
                    'rgba(33, 150, 243, 0.75)',
                    'rgba(3, 169, 244, 0.7)',
                    'rgba(0, 188, 212, 0.7)',
                    'rgba(0, 150, 136, 0.75)',
                    'rgba(76, 175, 80, 0.8)',
                    'rgba(139, 195, 74, 0.85)',
                    'rgba(205, 220, 57, 0.9)',
                    'rgba(255, 235, 59, 0.95)',
                    'rgba(255, 193, 7, 1)'
                ],

                components: {

                    // Main components
                    preview: true,
                    opacity: true,
                    hue: true,

                    // Input / output Options
                    interaction: {
                        hex: false,
                        rgba: false,
                        hsla: false,
                        hsva: false,
                        cmyk: false,
                        input: false,
                        clear: false,
                        save: false
                    }
                }
            });
            picker.on('swatchselect', (color, instance) => {
                element.value = instance.getColor().toHEXA().toString();
                $element.trigger('change');
            });

            picker.on('changestop', (color, instance) => {
                element.value = instance.getColor().toHEXA().toString();
                $element.trigger('change');
            });
        }

        $('.color-picker').each(function () {
            initColorPickers(this);
        });

        function updateContent(el, className) {
            $('.'+ className).html(el.value);
        }

        function changeMask(el) {
            if ($(el).is(':checked')) {
                $('#bannerIcon').css({
                    '-webkit-mask': 'url("{/literal}{$whmcsURL}{literal}/modules/addons/RSThemes/views/adminarea/extensions/promobanners/images/mask.png")',
                    '-webkit-mask-size': 'contain',
                    '-webkit-mask-position': 'center center',
                    '-webkit-mask-repeat': 'no-repeat',
                })
            } else {
                $('#bannerIcon').css({
                    '-webkit-mask': 'none',
                    '-webkit-mask-size': 'contain',
                    '-webkit-mask-position': 'center center',
                    '-webkit-mask-repeat': 'no-repeat',
                })
            }
        }

        function setFullIcon(el) {
            if ($(el).is(':checked')) {
                console.log('zaznaczam');
                //$('#mask').closest('.form-check').addClass('is-disabled');
                $('#configImageProp').show();
                $('.promo-slider-icons').css({
                    'position': 'static'
                });
                $('#bannerIcon').css({
                    'opacity': '0.{/literal}{$extension->getSlideConfig()->slide_options.config['imageOpacity']}' {literal},
                    'right': {/literal}{if $extension->getSlideConfig()->slide_options.config['right']}{$extension->getSlideConfig()->slide_options.config['right']}{else}0{/if}{literal},
                    'bottom': {/literal}{if $extension->getSlideConfig()->slide_options.config['bottom']}{$extension->getSlideConfig()->slide_options.config['bottom']}{else}0{/if}{literal},
                });

                $('.promo-slider-icons img').css({
                    'width': {/literal}{if $extension->getSlideConfig()->slide_options.config['imgWidth']}'{$extension->getSlideConfig()->slide_options.config['imgWidth']}%'
                    {else}'auto'{/if}{literal},
                    'height': {/literal}{if $extension->getSlideConfig()->slide_options.config['imgHeight']}'{$extension->getSlideConfig()->slide_options.config['imgHeight']}%'
                    {else}'auto'{/if}{literal},
                    'object-fit': 'inherit'
                });
            } else {
                //$('#mask').closest('.form-check').removeClass('is-disabled');
                $('#configImageProp').hide();
                $('.promo-slider-icons').css({
                    'position': 'relative',
                    'width': '50%'
                });

                $('.promo-slider-icons img').css({
                    'width': 'auto',
                    'height': '100%',
                    'object-fit': 'cover'
                });
                $('#bannerIcon').css({
                    'opacity': 1
                })
            }
        }

        function opacityImage(el) {
            var elOpacity = el.value;
            if (el.value < 10) {
                elOpacity = '0.0' + el.value
            } else if (el.value >= 10 && el.value < 100) {
                elOpacity = '0.' + el.value
            } else {
                elOpacity = el.value
            }
            $('#bannerIcon').css({
                'opacity': elOpacity
            })
        }

        var startDate = $('#startDate').datepicker({
            language: 'en',
            dateFormat: 'yyyy-mm-dd',
            autoClose: true,
            minDate: new Date(),
        }).data('datepicker');

        var dueDate = $('#dueDate').datepicker({
            language: 'en',
            dateFormat: 'yyyy-mm-dd',
            autoClose: true,
            minDate: new Date(),
            position: "bottom right"
        }).data('datepicker');

        //TODO: sprwadzić czy działa poprawnie w szablonie
        //if ($('#startDate').val() !== '1970-01-01') {
        //    startDate.selectDate(new Date($('#startDate').val()));
        //}

        //if ($('#dueDate').val() !== '1970-01-01') {
        //    dueDate.selectDate(new Date($('#dueDate').val()));
        //}

        function toggleHome(el) {
            console.log(el);
            if ($(el).is(':checked')) {
                $('#homepageSettings').fadeIn(230);
                $('#threeCustomIcon , #headingThree').slideDown(230);
            } else {
                $('#homepageSettings').fadeOut(230);
                $('#threeCustomIcon , #headingThree').slideUp(230);
            }
        }
        {/literal}
    </script>


    <script>
        {literal}
        (function () {
            const refs = {};
            const sliderRefs = {};
            const GLOBAL = {
                graphicType: '',
                activeBox: null,
                activeInputs: null,
                direction: 'v'
            };
            const sliderBackground = {
                start: '', stop: ''
            };
            function cacheDOM() {
                // general
                refs.graphicTypes = $('[data-graphic-type]');
                refs.settingsBox = $('[data-settings-box]');
                refs.colorPicker = $('[data-color-picker]');
                refs.promoSlider = $('.promo-slider');
                refs.direction = $('#bannerTmpDirection');

                // slider items refs
                sliderRefs.container = refs.promoSlider;
                sliderRefs.iconContainer = $('#rs-module #promotionIconPrev');
                sliderRefs.bg = $('#rs-module [data-promo-slider="background"] #promo-slide-1-bg');
                sliderRefs.gradientBg = $('[data-promo-slider-bg]');
                sliderRefs.bgImage = $("#rs-module #promo-slide-1-bg-image");
                sliderRefs.icon = refs.promoSlider;
                sliderRefs.graphic = refs.promoSlider;
            }

            function bindEvents() {
                console.log(refs.settingsBox = $('[data-settings-box]'));
                refs.graphicTypes.on('change', (event) => {
                    changeGraphicType(event)
                });

                refs.colorPicker.on('change', (event) => {
                    const type = $(event.currentTarget).data('color-picker')
                    const color = $(event.currentTarget).val()
                    changeBackground(color, type)
                });

                refs.settingsBox.on('show.bs.collapse', (event) => {
                    console.log('dsads');
                    GLOBAL.activeBox = $(event.currentTarget)
                    changeGraphicSettings(GLOBAL.activeBox)
                });
                refs.direction.on('change', (event) => {
                    GLOBAL.direction = event.target.value
                })
            }

            function setStarterPromoBannerStyles() {
                // background
                refs.colorPicker.each((index, item) => {
                    const type = $(item).data('color-picker');
                    const color = $(item).val();
                    sliderBackground[type] = color;
                })

            }

            function changeBackground(color, type) {
                sliderBackground[type] = color;
                sliderRefs.gradientBg.css({
                    "background": 'linear-gradient(90deg,' + sliderBackground.start + ' 0%,' + sliderBackground.stop + ' 100%)'
                })
            }

            function changeGraphicType(event) {
                enableSettings()
                let value = event.target.value
                if (!value) {
                    value = 'custom_icon'
                }
                if(value !== 'pre_lagom_icon') {
                    $('#graphicTypeRadioContainer').show()
                }else{
                    $('#graphicTypeRadioContainer').hide()
                }
                GLOBAL.graphicType = value;
                const newGraphicType = $(`[data-graphic-tab="${value}"]`)
                if(newGraphicType.length){
                    $('[data-graphic-tab]').removeClass('is-active')
                    newGraphicType.addClass('is-active')
                }else{
                    disableSettings()
                }
                if(!GLOBAL.direction){
                    GLOBAL.direction = 'h'
                }
                GLOBAL.activeBox = $($(`[data-type="${GLOBAL.graphicType}"][data-direction="${GLOBAL.direction}"]`));
                setActivePromoSlider(value);
                changeGraphicSettings();
                GLOBAL.activeBox.collapse('show')
            }
            function disableSettings() {
                $('.graphic-tab__container .collapse').addClass('is-disabled')
                $('[data-graphic-tab]').removeClass('is-active')
                $('[data-graphic-tab]').first().addClass('is-active')
            }
            function enableSettings() {
                $('.graphic-tab__container .collapse').removeClass('is-disabled')
            }
            function changeGraphicSettings() {
                const type = GLOBAL.activeBox.data('type');
                const direction = GLOBAL.activeBox.data('direction');

                unRegisterEventsOptionsEvents();
                const inputs = GLOBAL.activeBox.find('input, select');
                GLOBAL.activeInputs = inputs;
                registerEventsOptionsEvents();

                refs.direction.val(direction).trigger('change');

                const styles = getStylesFromForm(inputs);
                applyStylesToBanner(styles);
            }

            function getCSSOpacity(value) {
                let elOpacity = value;
                if (value < 10) {
                    elOpacity = '0.0' + value
                } else if (value >= 10 && value < 100) {
                    elOpacity = '0.' + value
                } else {
                    elOpacity = value
                }
                return elOpacity;
            }

            function getStylesFromForm(inputs) {
                const marginTop = inputs.filter('[data-style-margin-top]').val();
                const opacity = inputs.filter('[data-style-opacity]').val();
                const styles = {
                    marginTop: marginTop ? marginTop : 0,
                    topSpacing: inputs.filter('[data-style-top-spacing]').val(),
                    marginRight: inputs.filter('[data-style-margin-right]').val(),
                    marginLeft: inputs.filter('[data-style-margin-left]').val(),
                    marginBottom: inputs.filter('[data-style-margin-bottom]').val(),
                    height: inputs.filter('[data-style-height]').val(),
                    width: inputs.filter('[data-style-width]').val(),
                    alignItems: inputs.filter('[data-style-align-items]').val(),
                    justifyContent: inputs.filter('[data-style-justify-content]').val(),
                    size: inputs.filter('[data-style-size]').val(),
                    opacity: opacity ? getCSSOpacity(opacity) : 100,
                    animation: inputs.filter('[data-animation-type]').val(),

                };
                if(GLOBAL.graphicType === 'pre_lagom_icon' && GLOBAL.direction === 'v'){
                    styles.height = '342px'
                }
                if(GLOBAL.direction === 'h') {
                    styles.topSpacing = 0;
                }

                if(GLOBAL.graphicType === 'background'){
                    $('#animation').closest('.widget').hide();
                }else{
                    $('#animation').closest('.widget').show();
                }
                return styles
            }

            function applyStylesToBanner(styles) {
                
            //console.log('------');
            //console.log('------');
            //console.log(styles);
            //console.log(GLOBAL.graphicType);
            //console.log(GLOBAL.direction);
            //console.log(GLOBAL.activeBox);
            //console.log('------');
            //console.log('------');
                
                // reststyles
                sliderRefs.iconContainer.css({

                });
                
                if (GLOBAL.graphicType === 'background') {
                    sliderRefs.bg.css({
                        'align-items': styles.alignItems,
                        'justify-content': styles.justifyContent,
                    });
                    $('#promo-slide-1-bg-image').css({
                        'object-fit': styles.size,
                        'height': styles.height,
                        'width': styles.width,
                        'opacity': styles.opacity,
                        'margin-top': styles.marginTop,
                        'margin-bottom': styles.marginBottom,
                        'margin-left': styles.marginLeft,
                        'margin-right': styles.marginRight,
                    });
                    $('#promo-slide-1 .promo-slider-content').css({
                        'margin-top': styles.topSpacing
                    });
                } else {
                    sliderRefs.iconContainer.css({
                        'opacity': styles.opacity,
                        'align-items': styles.alignItems,
                        'justify-content': styles.justifyContent
                    });

                    sliderRefs.iconContainer.find('.promo-slider-custom-icon').css({
                        'height': styles.height,
                        'width': styles.width,
                        'margin-top': styles.marginTop,
                        'margin-bottom': styles.marginBottom,
                        'margin-left': styles.marginLeft,
                        'margin-right': styles.marginRight,
                    });
                }
                if (GLOBAL.graphicType === 'pre_lagom_icon') {
                    if (GLOBAL.direction === 'v') {
                        sliderRefs.iconContainer.css({
                            'height': styles.height,
                        });
                        $('#promo-slide-2').css({
                            'padding-top': '0'
                        });
                    }else{
                        sliderRefs.iconContainer.css({
                            'height': '',
                        })
                    }
                }else {
                    if(GLOBAL.direction === 'v'){
                        $('#promo-slide-2').css({
                            'padding-top': '40px'
                        });
                    }else {
                        $('#promo-slide-2').css({
                            'padding-top': '0'
                        });
                    }
                }


                if (GLOBAL.direction === 'v') {
                    refs.promoSlider.addClass('promo-slider-xs');
                    $('.promo-preview').slideDown();
                    $('#alertDisplay').slideUp();
                } else if (GLOBAL.direction === 'index'){
                    $('.promo-preview').slideUp();
                    $('#alertDisplay').slideDown();
                } else {
                    refs.promoSlider.removeClass('promo-slider-xs');
                    $('#alertDisplay').slideUp();
                    $('.promo-preview').slideDown();
                }

            }

            function registerEventsOptionsEvents() {
                GLOBAL.activeInputs.on('keyup.bannerStyles keypress.bannerStyles change.bannerStyles', (event) => {
                    changeGraphicSettings()
                })
            }

            function unRegisterEventsOptionsEvents() {
                if (GLOBAL.activeInputs) {
                    GLOBAL.activeInputs.off('keyup.bannerStyles keypress.bannerStyles change.bannerStyles')
                }
            }

            function oneAccordionAlwaysOpen() {
                $('[data-toggle="lu-collapse"]').on('click', function (event) {
                    console.log('collapse click');
                    let target = $(this).data('target');
                    if ($(target).hasClass('show')) {
                        event.stopPropagation()
                    }
                })
            }

            function setActivePromoSlider(name) {
                if(name == 'pre_lagom_icon'){
                    name = "custom_icon"
                }
                refs.promoSlider.removeClass('is-active');
                refs.promoSlider.filter(`[data-promo-slider="${name}"]`).addClass('is-active')
            }

            function setStarterPromoSlider() {
                let checkedPromoSlider = refs.graphicTypes.filter(':checked').val()

                if (!checkedPromoSlider) {
                    checkedPromoSlider = 'custom_icon'
                }

                refs.promoSlider.removeClass('is-active');
                refs.promoSlider.filter(`[data-promo-slider="${checkedPromoSlider}"]`).addClass('is-active')

                if(checkedPromoSlider == 'pre_lagom_icon'){
                    refs.promoSlider.filter(`[data-promo-slider="custom_icon"]`).addClass('is-active')
                }

                GLOBAL.graphicType = checkedPromoSlider;
                GLOBAL.activeBox = $(`[data-type="${GLOBAL.graphicType}"][data-direction="h"]`)
                if(!GLOBAL.activeBox.length){
                    disableSettings()
                }
            }

            function init() {
                cacheDOM();
                setStarterPromoBannerStyles();
                bindEvents();
                oneAccordionAlwaysOpen();
                setStarterPromoSlider();
                changeGraphicSettings();
            }

            init()
        })();
        {/literal}
    </script>
{/block}