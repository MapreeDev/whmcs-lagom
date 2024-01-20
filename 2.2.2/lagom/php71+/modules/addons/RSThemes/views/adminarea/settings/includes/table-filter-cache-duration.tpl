<div class="panel panel--collapse">
    <div class="collapse-toggle">
        <h6 class="top__title">
            {$lang.settings.section.general.table_cache.title}
            {include file="adminarea/includes/helpers/tooltip.tpl" tooltip=$tooltips.settings.general.table_cache}
        </h6>
        <label>
            <div class="switch" data-toggle="lu-collapse" data-target="#table_cache_config" aria-expanded="true">
                <input type="hidden" name="settings[enable_table_cache]" value="hidden"/>
                <input class="switch__checkbox"
                        name="settings[enable_table_cache]" value="displayed"
                        type="checkbox" {if $settings['enable_table_cache'] == "displayed"} checked="checked" {/if}>
                <span class="switch__container">
                    <span class="switch__handle"></span>
                </span>
            </div>
        </label>
    </div>
    <div class="collapse {if $settings['enable_table_cache'] == "displayed"} show {/if}" id="table_cache_config">
        <div class="form-group m-b-0x p-3x">
            <label class="form-label text-default">
                {$lang.settings.section.general.table_cache.label}
            </label>
            <select class="form-control selectized opacity-1" name="settings[table_cache_duration]" tabindex="-1">
                <option value="disabled" {if $settings['table_cache_duration'] == 'disabled'} selected {/if}>{$lang.settings.section.general.table_cache.duration.disabled}</option>
                <option value="86400" {if $settings['table_cache_duration'] == '86400'} selected {/if}>{$lang.settings.section.general.table_cache.duration.one_day}</option>
                <option value="604800" {if $settings['table_cache_duration'] == '604800'} selected {/if}>{$lang.settings.section.general.table_cache.duration.one_week}</option>
                <option value="1209600" {if $settings['table_cache_duration'] == '1209600'} selected {/if}>{$lang.settings.section.general.table_cache.duration.two_weeks}</option>
                <option value="2629743" {if $settings['table_cache_duration'] == '2629743'} selected {/if}>{$lang.settings.section.general.table_cache.duration.one_month}</option>
                <option value="31556926" {if $settings['table_cache_duration'] == '31556926'} selected {/if}>{$lang.settings.section.general.table_cache.duration.one_year}</option>
            </select>
        </div>
    </div>
</div>