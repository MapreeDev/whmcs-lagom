<link rel="stylesheet" href="{$WEB_ROOT}/modules/addons/RSThemes/assets/css/live-editor.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/classic.min.css"/> <!-- 'classic' theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/monolith.min.css"/> <!-- 'monolith' theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/nano.min.css"/> <!-- 'nano' theme -->

{assign var="iconLocation" value="./../../../../assets/svg-icons"}

<div class="is-open" id="lagom-live-editor" data-active-color="{$RSThemes['styles']['colors']->getActiveColorScheme()|ucfirst}">
    <div class="editor has-actions">
        <div class="editor__top top">
            <div class="top__title">Lagom Live Editor</div>
            <div class="top__actions">
                <button type="button" class="btn btn--icon" data-toggle="tooltip" data-placement="bottom" data-html="true" data-title="Restore Default <br /> Settings">
                    {include file="$iconLocation/restore.tpl"}
                </button>
                <button id="closeLiveEdit" type="button" class="btn btn--icon" aria-label="Close" data-toggle="tooltip" data-placement="bottom" title="Close">
                    {include file="$iconLocation/close.tpl"}
                </button>
            </div>
        </div>
        <div class="editor__body">
            <div class="editor__sidebar">
                <ul class="nav nav-tabs nav-live-edit" role="tablist">
                    <li role="presentation" class="active" data-toggle="tooltip" data-placement="right" title="Color Schemes"><a href="#style" data-title="Color Schemes" data-toggle="tab">{include file="$iconLocation/colors.tpl"}</a></li>

                    {foreach $RSThemes['styles']['colors']->getCssFilesScheme() as $file}
                        <li role="presentation" data-toggle="tooltip" data-placement="right" title="{$file.args.name}"><a href="#{$file.args.name|lower}" data-toggle="tab" data-title="Typography">{include file="$iconLocation/typography.tpl"}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="editor__content">
                <div class="editor__top top">
                    <div class="top__title" data-content-title-container><span data-content-title class="is-active">Color Schemes</span> <i class="fas fa-chevron-right d-none"></i> <span id="themeName" class="themeName"></span></div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="style">
                        <div class="editor__scroll" id="radioStyles">
                            {foreach $RSThemes['styles']['colors']->getColorScheme() as $name => $color}
                                <div class="radio radio--color">
                                    <label class="radio__label">
                                        <input data-value="{$name}" {if $RSThemes['styles']['colors']->getActiveColorScheme() eq $name|strtolower}checked="checked"{/if}class="icheck-control" type="radio" name="colorScheme" value="{$name|strtolower}">
                                        <span class="radio__name">{$name|ucfirst}</span>
                                        <div class="radio__colors">
                                            <span style="background:{$color['args']['display_colors'][0]};" class="color"></span>
                                            <span style="background:{$color['args']['display_colors'][1]};" class="color"></span>
                                        </div>
                                    </label>
                                    <div class="radio__actions">
                                        <a class="btn btn--icon" href="#" data-toggle="tooltip" data-placement="left" title="Customize">{include file="$iconLocation/settings.tpl"}</a>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        <div id="schemaData"></div>
                    </div>
                    {foreach $RSThemes['styles']['colors']->getCssFilesScheme() as $file}
                        <div role="tabpanel" class="tab-pane" id="{$file.args.name|lower}">
                            {include file="./theme-configurator-include.tpl" dataSectionList=$RSThemes['styles']['colors']->getCssParse($file.args.name|lower) type=$file.args.name|lower}
                        </div>
                    {/foreach}
                </div>
                <div id="loadData"></div>
            </div>
        </div>
        <div class="editor__actions">
            <button class="btn btn--info btn--block">Save Changes</button>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/pickr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/pickr.es5.min.js"></script>

<script src="{$WEB_ROOT}/modules/addons/RSThemes/assets/js/live-editor.js"></script>
<script src="{$WEB_ROOT}/modules/addons/RSThemes/assets/js/colors/colorpicker-rs.js"></script>
