{* temporary hidden 
<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            Display mode switcher
            <i class="ls ls-info-circle m-l-1x"
                data-toggle="lu-tooltip"
                data-title="Displays switcher which is used to change website to dark or light theme.">
            </i>
        </h6>
        <label>
            <div class="switch collapsed" data-toggle="lu-collapse" data-target="#mode-switcher" aria-expanded="true">
                <input type="hidden" name="settings[display_mode_switcher]" value="0"/>
                <input class="switch__checkbox mode-display"
                        name="settings[display_mode_switcher]" value="1"
                        type="checkbox" {if $settings['display_mode_switcher']} checked {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['display_mode_switcher']} show {/if}" id="mode-switcher">
        <div class="theme-selectors d-flex">
            <div class="col-sm-6 p-0x">
                <div class="form-group m-b-0x p-3x">
                    <label class="form-text ">Light Mode</label>
                    <select class="form-control" name="settings[light_mode_theme]" data-mode-switcher>
                        {foreach $template->getStyles() as $style}
                            <option value="{$style->getMainName()}" {if $settings['light_mode_theme'] == $style->getMainName()} selected {/if}>{$style->getName()}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="col-sm-6 p-0x">
                <div class="form-group m-b-0x p-3x">
                    <label class="form-text">Dark Mode</label>
                    <select class="form-control"
                            name="settings[dark_mode_theme]" data-mode-switcher>
                        {foreach $template->getStyles() as $style}
                            <option value="{$style->getMainName()}" {if $settings['dark_mode_theme'] == $style->getMainName()} selected {/if}>{$style->getName()}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        </div>
    </div>
</div> 
*}