<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.custom_logo_url.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.custom_logo_url}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#logo-url" aria-expanded="true">
                <input type="hidden" name="settings[show_logo_url]" value="0">
                <input class="switch__checkbox" name="settings[show_logo_url]" value="1" type="checkbox" {if $settings['show_logo_url']} checked {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_logo_url']} show {/if}" id="logo-url">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">{$lang.settings.section.general.custom_logo_url.label}</label>
            <input value="{$settings['logo_url']}" class="form-control " type="text" name="settings[logo_url]">
        </div>
    </div>
</div>