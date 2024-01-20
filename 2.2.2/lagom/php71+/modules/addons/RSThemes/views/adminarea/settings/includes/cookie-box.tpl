<div class="panel panel--collapse" data-cookiebox>
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.cookie_box.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.cookie_box}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#cookie-config" aria-expanded="true">
                <input type="hidden" name="settings[show_cookie_box]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_cookie_box]" value="displayed"
                        type="checkbox" {if $settings['show_cookie_box'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_cookie_box'] == "displayed"} show {/if}" id="cookie-config">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">
                {$lang.settings.section.general.cookie_box.label_position}
            </label>
            <select class="form-control selectized opacity-1" name="settings[cookie_box_position]" tabindex="-1">
                <option value="bottom-left" {if $settings['cookie_box_position'] == 'bottom-left'} selected {/if}>{$lang.settings.section.general.cookie_box.position.bottom_left}</option>
                <option value="bottom-right" {if $settings['cookie_box_position'] == 'bottom-right'} selected {/if}>{$lang.settings.section.general.cookie_box.position.bottom_right}</option>
                <option value="bottom" {if $settings['cookie_box_position'] == 'bottom'} selected {/if}>{$lang.settings.section.general.cookie_box.position.bottom}</option>
            </select>
        </div>
        <div class="form-group m-b-0x p-l-3x p-r-3x p-b-3x p-t-0x" >
            <label class="form-label">
                {$lang.settings.section.general.cookie_box.label_message}
                <a href="#cookieBoxTranslationsModal" data-toggle="lu-modal" class="form-label__translate">
                    <span>{$lang.general.translate}</span>
                </a>
            </label>
            <textarea 
                id="cookie_box_message_textarea" 
                class="form-control" 
                type="text" 
                data-cookiebox-message 
                data-cookiebox-system-language="{$systemLanguage}"
                data-form-counter-input
            >{$cookiebox_settings[$systemLanguage]}</textarea>
            <input 
                id="cookie_box_message_json" 
                type="hidden" 
                name="settings[cookie_box_message]" 
                value='{json_encode($cookiebox_settings)}'
                data-cookiebox-json
            >
        </div>
    </div>
</div>