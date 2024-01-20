<input type="hidden" name="tmp_direction" value="h" id="bannerTmpDirection">
<div class="graphic-tab__container" data-tabs-container>
    <div class="graphic_type--tab {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'background'} is-active{/if}"
         data-graphic-tab="background">
        <h5>Graphic Settings</h5>
        <div class="widget widget--accordion panel ">
            <div class="widget__body">
                <div class="accordion" id="accordionGraphic">
                        <label class="widget__top top" data-toggle="lu-collapse" data-target="#banner-horizontal">
                            <h6 class="top__title">Banner Horizontal</h6>
                            <span class="accordion-arrow">
                                <i class="ls ls-caret"></i>
                            </span>
                        </label>
                        <div
                                id="banner-horizontal"
                                data-settings-box
                                class="collapse show"
                                data-parent="#accordionGraphic"
                                data-type="background"
                                data-direction="h"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input
                                                    class="form-control form-control--xs bannerConfigProp"
                                                    type="text"
                                                    name="config[graphic][h][margin-top]"
                                                    data-style-margin-top
                                                    value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-top']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-top']}{else}0{/if}"
                                            >
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-right']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-right']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-left']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-left']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-bottom']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['margin-bottom']}{else}0{/if}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['height']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['height']}{else}100%{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['width']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['width']}{else}100%{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][h][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['align-items'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['align-items'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['align-items'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">bottom
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][h][justify-content]"
                                                    data-style-justify-content
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['justify-content'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['justify-content'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x">
                                            <label class="form-label">Opacity</label>
                                            <input value="{if $extension->getSlideConfig()->slide_options.config['graphic']['h']['opacity']}{$extension->getSlideConfig()->slide_options.config['graphic']['h']['opacity']}{else}100{/if}"
                                                   placeholder="Opacity"
                                                   class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][h][opacity]"
                                                   data-style-opacity
                                            >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x">
                                            <label class="form-label">Background size</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][h][object-fit]"
                                                    data-style-size
                                                    id="bg_size"
                                            >
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['object-fit'] eq 'contain'} selected="selected" {/if}
                                                        value="contain">contain
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['object-fit'] eq 'cover' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="cover">cover
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['object-fit'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['h']['object-fit'] eq 'scale-down'} selected="selected" {/if}
                                                        value="scale-down">scale-down
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <label class="widget__top top collapsed" data-toggle="lu-collapse" data-target="#banner-vertical" aria-expanded="false" aria-controls="banner-vertical">
                            <h6 class="top__title">Banner Vertical</h6>
                            <span class="accordion-arrow">
                                <i class="ls ls-caret"></i>
                            </span>
                        </label>
                        <div
                                id="banner-vertical"
                                class="collapse"
                                data-settings-box
                                data-direction="v"
                                data-type="background"
                                data-parent="#accordionGraphic"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][margin-top]"
                                                   data-style-margin-top
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-top']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-top']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-right']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-right']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-left']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-left']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-bottom']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['margin-bottom']}{else}0{/if}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['height']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['height']}{else}100%{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['width']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['width']}{else}auto{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs"
                                                    name="config[graphic][v][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['align-items'] eq 'top'} selected="selected" {/if}
                                                        value="top">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['align-items'] eq 'bottom'} selected="selected" {/if}
                                                        value="bottom">bottom
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['align-items'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs"
                                                    name="config[graphic][v][justify-content]"
                                                    data-style-justify-content
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['justify-content'] eq 'center'} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['justify-content'] eq 'flex-end' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Opacity</label>
                                            <input value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['opacity']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['opacity']}{else}100{/if}"
                                                   placeholder="Opacity"
                                                   class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][v][opacity]"
                                                   data-style-opacity
                                            >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background size</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][v][object-fit]"
                                                    data-style-size
                                                    id="bg_size_v">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['object-fit'] eq 'contain'} selected="selected" {/if}
                                                        value="contain">contain
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['object-fit'] eq 'cover' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="cover">cover
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['object-fit'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['v']['object-fit'] eq 'scale-down'} selected="selected" {/if}
                                                        value="scale-down">scale-down
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x">
                                            <label class="form-label">Top spacing</label>
                                            <input data-style-top-spacing name="config[graphic][v][top-spacing]"
                                                   type="text" class="form-control form-control--xs"
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['v']['top-spacing']}{$extension->getSlideConfig()->slide_options.config['graphic']['v']['top-spacing']}{else}200px{/if}"
                                                   placeholder="Top spacing">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label class="widget__top top collapsed" data-toggle="lu-collapse" data-target="#homepage-baner" {if $extension->getSlideConfig()->slide_options.promotion['homepage'] != '1' && $smarty.get.exaction neq 'add'}style="display: none;"{/if} id="headingThree">
                            <h6 class="top__title">Homepage Banner</h6> 
                            <span class="accordion-arrow">
                            <i class="ls ls-caret"></i>
                            </span>
                        </label>
                        <div
                                id="homepage-baner"
                                data-settings-box
                                data-direction="index"
                                class="collapse"
                                data-type="background"
                                data-parent="#accordionGraphic"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][margin-top]"
                                                   data-style-margin-top
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-top']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-top']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-right']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-right']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-left']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-left']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-bottom']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['margin-bottom']}{else}0{/if}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['height']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['height']}{else}auto{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Background width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['width']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['width']}{else}100%{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][index][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align_index">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['align-items'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['align-items'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['align-items'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">bottom
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][index][justify-content]"
                                                    data-style-justify-content
                                                    id="vertical_align_index">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['justify-content'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['justify-content'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x">
                                            <label class="form-label">Opacity</label>
                                            <input value="{if $extension->getSlideConfig()->slide_options.config['graphic']['index']['opacity']}{$extension->getSlideConfig()->slide_options.config['graphic']['index']['opacity']}{else}100{/if}"
                                                   placeholder="Opacity"
                                                   class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[graphic][index][opacity]"
                                                   data-style-opacity
                                            >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x">
                                            <label class="form-label">Background size</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[graphic][index][object-fit]"
                                                    data-style-size
                                                    id="bg_size_index">
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['object-fit'] eq 'contain'} selected="selected" {/if}
                                                        value="contain">contain
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['object-fit'] eq 'cover' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="cover">cover
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['object-fit'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['graphic']['index']['object-fit'] eq 'scale-down'} selected="selected" {/if}
                                                        value="scale-down">scale-down
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
    <div class="graphic_type--tab {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'custom_icon'} is-active{/if}"
         data-graphic-tab="custom_icon">
        <h5>Graphic Settings</h5>
        <div class="widget widget--accordion panel">
            <div class="widget__body">
                <div class="accordion" id="customIcon">
                        <label class="widget__top top" data-toggle="lu-collapse" data-target="#collapseOneCustomIcon">
                            <h6 class="top__title">Banner Horizontal</h6> 
                                <span class="accordion-arrow">
                                    <i class="ls ls-caret"></i>
                                </span>
                        </label>
                        <div
                                data-settings-box
                                id="collapseOneCustomIcon"
                                class="collapse show"
                                data-parent="#customIcon"
                                data-direction="h"
                                data-type="custom_icon"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][margin-top]"
                                                   data-style-margin-top
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['margin-top']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['margin-top']}{else}48px{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['margin-right']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['margin-right']}{else}{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['margin-left']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['margin-left']}{else}{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['margin-bottom']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['margin-bottom']}{else}24px{/if}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['height']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['height']}{else}240px{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][h][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['h']['width']}{$extension->getSlideConfig()->slide_options.config['icon']['h']['width']}{else}auto{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][h][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['align-items'] eq 'center'} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['align-items'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['align-items'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">bottom
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][h][justify-content]"
                                                    data-style-justify-content
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['justify-content'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['h']['justify-content'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label class="widget__top top collapsed" data-toggle="lu-collapse" data-target="#collapseTwoCustomIcon">
                               <h6 class="top__title">Banner Vertical</h6>
                                <span class="accordion-arrow">
                                    <i class="ls ls-caret"></i>
                                </span>
                        </label>
                        <div
                                data-settings-box
                                id="collapseTwoCustomIcon"
                                class="collapse"
                                data-parent="#customIcon"
                                data-index="1"
                                data-direction="v"
                                data-type="custom_icon"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][margin-top]"
                                                   data-style-margin-top
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['margin-top']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['margin-top']}{else}16px{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['margin-right']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['margin-right']}{else}24px{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['margin-left']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['margin-left']}{else}24px{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['margin-bottom']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['margin-bottom']}{else}0{/if}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['height']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['height']}{else}auto{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][v][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['v']['width']}{$extension->getSlideConfig()->slide_options.config['icon']['v']['width']}{else}calc(100% - 48px){/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][v][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align">

                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['align-items'] eq 'center'} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['align-items'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['align-items'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">bottom
                                                </option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][v][justify-content]"
                                                    data-style-justify-content
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['justify-content'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['justify-content'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['v']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <label id="threeCustomIcon" class="widget__top top collapsed" data-toggle="lu-collapse" data-target="#collapseThreeCustomIcon" {if $extension->getSlideConfig()->slide_options.promotion['homepage'] != '1' && $smarty.get.exaction neq 'add'}style="display: none;"{/if}>
                            <h6 class="top__title">Homepage Banner</h6> 
                                <span class="accordion-arrow">
                                    <i class="ls ls-caret"></i>
                                </span>
                            </a>
                        </label>
                        <div
                                id="collapseThreeCustomIcon"
                                data-settings-box
                                class="collapse"
                                data-parent="#customIcon"
                                data-index="2"
                                data-direction="index"
                                data-type="custom_icon"
                        >
                            <div class="widget__content">
                                <div class="row row--xs">
                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">top</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][margin-top]"
                                                   data-style-margin-top
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['top']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['top']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">right</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][margin-right]"
                                                   data-style-margin-right
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['right']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['right']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">left</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][margin-left]"
                                                   data-style-margin-left
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['left']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['left']}{else}0{/if}">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">bottom</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][margin-bottom]"
                                                   data-style-margin-bottom
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['bottom']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['bottom']}{else}0{/if}">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row--xs">
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon height</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][height]"
                                                   data-style-height
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['height']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['height']}{else}360px{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group p-0x p-b-2x">
                                            <label class="form-label">Icon width</label>
                                            <input class="form-control form-control--xs bannerConfigProp" type="text"
                                                   name="config[icon][index][width]"
                                                   data-style-width
                                                   value="{if $extension->getSlideConfig()->slide_options.config['icon']['index']['width']}{$extension->getSlideConfig()->slide_options.config['icon']['index']['width']}{else}auto{/if}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Vertical align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][index][align-items]"
                                                    data-style-align-items
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['align-items'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['align-items'] eq 'center' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['align-items'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">top
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['align-items'] eq 'flex-end'} selected="selected" {/if}
                                                        value="flex-end">bottom
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="form-label">Horizontal align</label>
                                            <select class="form-control form-control--xs bannerConfigProp"
                                                    name="config[icon][index][justify-content]"
                                                    data-style-justify-content
                                                    id="horizontal_align">
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['justify-content'] eq 'center'} selected="selected" {/if}
                                                        value="center">center
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['justify-content'] eq 'flex-start'} selected="selected" {/if}
                                                        value="flex-start">left
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['justify-content'] eq 'flex-end' || !$extension->getSlideContent()->id} selected="selected" {/if}
                                                        value="flex-end">right
                                                </option>
                                                <option {if $extension->getSlideConfig()->slide_options.config['icon']['index']['justify-content'] eq 'unset'} selected="selected" {/if}
                                                        value="unset">unset
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
</div>

<div id="graphicTypeRadioContainer" {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'pre_lagom_icon'} style="display: none {/if}">
    <div class="panel panel--collapse">
        <div class="collapse-toggle">
            <h6 class="top__title">Graphic Type</h6>
        </div>
            <div class="collapse show">
                <div class="form-group">
                    <div class="form-check">
                        <label>
                            <input data-index="0"
                                id="customGraphicRadio"
                                data-graphic-type
                                value="background" {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'background'} checked="checked" {/if}
                                type="radio" name="config[graphic_type]" class="form-radio graphic_type">
                            &nbsp;<span class="form-indicator"></span>
                            <span class="form-text">Background image</span>
                        </label>
                    </div>
                    <br>
                    <div class="form-check m-b-0x">
                        <label class="m-b-0x">
                            <input data-index="0"
                                id="customIconRadio"
                                data-graphic-type
                                value="custom_icon" {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'custom_icon'} checked="checked" {/if}
                                type="radio" name="config[graphic_type]" class="form-radio graphic_type">
                            &nbsp;<span class="form-indicator"></span>
                            <span class="form-text">Custom icon</span>
                        </label>
                    </div>
                    <br>
                    <div class="form-check m-b-0x" style="display: none;">
                        <label>
                            <input id="predefinedLagomIcon"
                                data-graphic-type
                                value="pre_lagom_icon" {if $extension->getSlideConfig()->slide_options.config['graphic_type'] eq 'pre_lagom_icon'} checked="checked" {/if}
                                type="radio" name="config[graphic_type]" class="form-radio graphic_type">
                            &nbsp;<span class="form-indicator"></span>
                            <span class="form-text">Predefined Lagom icon</span>
                        </label>
                    </div>
                </div>
            </div>
    </div>
</div>

<div class="widget panel">
    <div class="widget__top">
        <div class="top__title">Graphic</div>
    </div>
    <div class="widget__body">
        <div class="widget__content">
            <div class="widget widget--image widget--image-advanced m-b-0x">
                <div class="widget__body">
                    <div class="widget__content text-center p-2x" style="min-height: 200px;">
                        {if strlen($extension->getSlideConfig()->slide_icon_custom) > 1}
                            <img style="max-height: 200px;" id="editPrev" class="img-fluid"
                                src="{$whmcsURL}/templates/{$extension->template->license->templateName}/core/extensions/PromoBanners/uploads/{$extension->getSlideConfig()->slide_icon_custom}"
                                alt="">
                        {else}
                            {include file="{$extension->assets_path()}/svg-illustrations/products/{$extension->getSlideConfig()->slide_icon}.tpl"}
                            
                        {/if}
                    </div>
                </div>
                <div class="widget__actions justify-content-between">
                    <span style="max-width: 45%;" class="truncate">{if strlen($extension->getSlideConfig()->slide_icon_custom) > 1}{$extension->getSlideConfig()->slide_icon_custom}{else}{$extension->getSlideConfig()->slide_icon}.tpl{/if}</span>
                    <span class="btn btn--icon btn--link btn--xs m-r-1x" data-toggle="lu-modal" data-target="#mediaGallery" data-menu-item-icon-button>
                        <i class="btn__icon lm lm-pen"data-toggle="lu-tooltip" data-title="Click to change"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="widget panel of-visible">
    <div class="widget__top">
        <div class="top__title">Graphic Animation</div>
    </div>
    <div class="widget__body">
        <div class="widget__content">
            <div class="form-group p-0x m-b-0x">
                <select class="form-control form-control--sm" name="config[animation]" id="animation">
                    <option {if $extension->getSlideConfig()->slide_options.config['animation'] eq 'slideLeft'}selected="selected"{/if} value="slideLeft">Slide left</option>
                    <option {if $extension->getSlideConfig()->slide_options.config['animation'] eq 'fadeIn'}selected="selected"{/if} value="fadeIn">Fade In</option>
                </select>
            </div>
        </div>
    </div>
</div>

<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">Banner Style</h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#banner-style" aria-expanded="true">
                <input type="hidden" name="config[banner_style_active]" value="0">
                <input class="switch__checkbox" type="checkbox" name="config[banner_style_active]" {if $extension->getSlideConfig()->slide_options.config['banner_style_active'] == '1'}checked{/if} value="1">
                <span class="switch__container"><span class="switch__handle"></span></span>
            </div>
        </label>
    </div>
        <div class="collapse {if $extension->getSlideConfig()->slide_options.config['banner_style_active'] == '1'} show{/if} p-3x" id="banner-style">
            <div class="form-group p-0x">
                <div class="row row--xs" id="pickerParent">
                    <div class="col-md-6" style="position: relative;">
                        <label class="form-label">Gradient start</label>
                        <input data-color-picker="start" autocomplete="off"
                                class="form-control form-control--xs color-picker"
                                type="text" name="config[color]"
                                value="{if $extension->getSlideConfig()->slide_options.config['color']}{$extension->getSlideConfig()->slide_options.config['color']}{else}#011a62{/if}">
                    </div>
                    <div class="col-md-6" style="position: relative;">
                        <label class="form-label">Gradient end</label>
                        <input data-color-picker="stop" autocomplete="off"
                                class="form-control form-control--xs color-picker"
                                type="text" name="config[color2]"
                                value="{if $extension->getSlideConfig()->slide_options.config['color2']}{$extension->getSlideConfig()->slide_options.config['color2']}{else}#0940b3{/if}">
                    </div>
                </div>
                <div class="row row--xs m-t-2x">
                    <div class="col-md-6">
                        <label class="form-label">Title Color</label>
                        <input
                                class="form-control form-control--xs"
                                type="text" name="config[color_title]"
                                value="{if $extension->getSlideConfig()->slide_options.config['color_title']}{$extension->getSlideConfig()->slide_options.config['color_title']}{else}{/if}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Desc Color</label>
                        <input
                                class="form-control form-control--xs"
                                type="text" name="config[color_desc]"
                                value="{if $extension->getSlideConfig()->slide_options.config['color_desc']}{$extension->getSlideConfig()->slide_options.config['color_desc']}{else}{/if}">
                    </div>
                </div>
            </div>
        </div>
    </div>