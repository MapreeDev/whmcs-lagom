<div id="homepageSettings" class="section" {if $extension->getSlideConfig()->slide_options.promotion['homepage'] != '1' && $smarty.get.exaction neq 'add'}style="display: none;"{/if}>
    <h3 class="section__title">
        Homepage Settings
        {include file="adminarea/includes/helpers/docs.tpl" link='https://lagom.rsstudio.net/docs/v2/settings.html#general'}
    </h3>
    <div class="section__body panel">
        <div class="row">
            <div class="col-md-8">
                <label class="form-label">Homepage title</label>
                <div class="form-group">
                    <input id="titleHome" type="text" class="form-control" name="title_home" placeholder="Homepage title" value="{$extension->getSlideContent()->slide_title_home}">
                </div>
                <label class="form-label">Homepage sub-title</label>
                <div class="form-group">
                    <textarea class="form-control" name="description_home" id="homeSubtitle">{$extension->getSlideContent()->slide_description_home}</textarea>
                </div>
                <label class="form-label">Homepage main button text</label>
                <div class="form-group">
                    <input id="homeButton" value="{$extension->getSlideContent()->slide_text_btn_home}" placeholder="Homepage additional button" type="text" class="form-control" name="text_btn_home">
                </div>
                <label class="form-label">Homepage main button url</label>
                <div class="form-group">
                    <input id="homeURL" value="{$extension->getSlideConfig()->slide_product_url_home}" placeholder="Homepage additional button URL" type="text" class="form-control" name="product_url_home">
                </div>

                <label class="form-label">Homepage secondary button text</label>
                <div class="form-group">
                    <input id="homeButtonSecondary" value="{$extension->getSlideContent()->slide_secondary_button_text}" placeholder="Homepage secondary button text" type="text" class="form-control" name="secondary_button_text">
                </div>

                <div class="form-group m-b-0x">
                    <label class="form-label">Homepage secondary button url</label>
                    <input id="homeButtonSecondaryUrl" value="{$extension->getSlideConfig()->slide_secondary_button_url}" placeholder="Homepage secondary button url" type="text" class="form-control" name="secondary_button_url">
                </div>
            </div>
            <div class="col-md-4">
                <input style="display: none;" type="text" id="tmpPaginationIcon" name="config[paginationIcon]" value="{$extension->getSlideConfig()->slide_options.config['paginationIcon']}">
                <input style="display: none;" type="text" id="tmpDefaultIcon" name="pagination_icon" value="{$extension->getSlideConfig()->slide_pagination_icon}">
                <label class="form-label">Pagination icon</label>
                <div class="widget widget--image widget--image-homepage">
                    <div class="widget__body">
                        <div class="widget__content text-center">
                            {if $extension->getSlideConfig()->slide_pagination_icon}
                                <img style="max-width: 64px;" id="paginationIcon"
                                    class="img-fluid"
                                    src="{$extension->extensoin_path()}/images/thumb-{$extension->getSlideConfig()->slide_pagination_icon}.svg"
                                    alt="">
                            {else}
                                <img id="paginationIcon" class="img-fluid"
                                    src="{$whmcsURL}/templates/{$extension->template->license->templateName}/core/extensions/PromoBanners/uploads/{$extension->getSlideConfig()->slide_options.config['paginationIcon']}" style="max-width: 64px;"
                                    alt="">
                            {/if}
                        </div>
                    </div>
                    <div class="widget__actions justify-content-between">
                        <span style="max-width: 45%;" class="truncate" id="tmpPaginationIconText">{if $extension->getSlideConfig()->slide_pagination_icon}{$extension->getSlideConfig()->slide_pagination_icon}{else}{$extension->getSlideConfig()->slide_options.config['paginationIcon']}{/if}</span>
                        <span class="btn btn--icon btn--link btn--xs m-r-1x" data-toggle="lu-modal" data-target="#mediaGalleryIcon" data-menu-item-icon-button>
                            <i class="btn__icon lm lm-pen"data-toggle="lu-tooltip" data-title="Click to change"></i>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Pagination title</label>
                    <input id="paginationTitle"
                        value="{$extension->getSlideContent()->slide_pagination_title_home}"
                        placeholder="Homepage pagination title" type="text"
                        class="form-control" name="pagination_title_home">
                </div>
            </div>
        </div>
    </div>
</div>

