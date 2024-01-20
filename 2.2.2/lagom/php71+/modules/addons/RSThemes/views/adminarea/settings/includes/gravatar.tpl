<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.gravatar.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.gravatar}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#gravatar-settings">
                <input type="hidden"  name="settings[show_gravatar_image]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[show_gravatar_image]" value="displayed"
                        type="checkbox" {if $settings['show_gravatar_image'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['show_gravatar_image'] == "displayed"} show {/if}" id="gravatar-settings">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">
                {$lang.settings.section.general.gravatar.placeholder.label}
                {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.gravatar_placeholder}
            </label>
            <select class="form-control" name="settings[gravatar_placeholder]">
                <option value="default" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'default'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.default}</option>
                <option value="404" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == '404'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.404}</option>
                <option value="mp" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'mp'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.mp}</option>
                <option value="identicon" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'identicon'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.identicon}</option>
                <option value="monsterid" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'monsterid'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.monsterid}</option>
                <option value="wavatar" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'wavatar'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.wavatar}</option>
                <option value="retro" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'retro'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.retro}</option>
                <option value="robohash" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'robohash'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.robohash}</option>
                <option value="blank" {if isset($settings['gravatar_placeholder']) && $settings['gravatar_placeholder'] == 'blank'}selected{/if}>{$lang.settings.section.general.gravatar.placeholder.options.blank}</option>
            </select>
        </div>
    </div>
</div>