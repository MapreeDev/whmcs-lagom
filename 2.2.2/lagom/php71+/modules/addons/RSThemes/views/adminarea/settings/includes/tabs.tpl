<ul class="nav nav--tabs custom-nav-styles" data-form-tabs="settings_tab">
    <div class="nav__header p-0x">
    {$lang.settings.sidebar.categories}
    </div>
    {if \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
        <li class="nav__item {if $smarty.get.settingsTab == 'settings-display' || !isset($smarty.get.settingsTab)} is-active {/if}">
            <a class="nav__link" data-toggle="lu-tab" data-change-hash="true"
                href="#settings-display">
                <span class="nav__link-text">{$lang.settings.sidebar.display}</span>
            </a>
        </li>
    {/if}
    <li class="nav__item {if $smarty.get.settingsTab == 'settings-general' || (!\RSThemes\Helpers\ContentChecker::checkCmsInstalled() && !isset($smarty.get.settingsTab))} is-active {/if}">
        <a class="nav__link" data-toggle="lu-tab" data-change-hash="true"
            href="#settings-general">
            <span class="nav__link-text">{$lang.settings.sidebar.general}</span>
        </a>
    </li>
    <li class="nav__item {if $smarty.get.settingsTab == 'settings-order'} is-active {/if}">
        <a class="nav__link" data-toggle="lu-tab" data-change-hash="true"
            href="#settings-order">
            <span class="nav__link-text">{$lang.settings.sidebar.order_process}</span>
        </a>
    </li>
</ul>