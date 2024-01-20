{if file_exists("templates/$template/includes/common/overwrites/language-chooser-dropdown.tpl")}
     {include file="{$template}/includes/common/overwrites/language-chooser-dropdown.tpl"}  
{else}
    <div class="dropdown-menu dropdown-language-search dropdown-lazy{if ($RSThemes['pages'][$templatefile]['config']['isFullPage'] == "1" || $RSThemes['pages'][$templatefile]['name'] == "sidebar") && $type == "login"}dropdown-menu-center{else} dropdown-menu-right{/if}" {*id="languageChooserContent"*}>
        {if $currentUrl|strstr:"?"}
            {$currentpagelinkback = rtrim($currentpagelinkback, '&amp;')}
            {$divChar = "&amp;"}
        {else}
            {$currentpagelinkback = rtrim($currentpagelinkback, '?')}
            {$divChar = "?"}
        {/if}
        <input type="hidden" data-language-select-value value="{$activeLocale.localisedName}">
        <input type="hidden" data-language-select-backlink value="{$currentpagelinkback}{$divChar}">
        <input type="hidden" data-language-select-lang value="{$LANG['upgradeService']['select']}">
        <div class="dropdown-header input-group align-center">
            <i class="input-group-icon lm lm-search"></i>
            <input class="form-control" placeholder="{$LANG.search}..." type="text" data-language-select-search>
        </div>
        <div class="nav-divider"></div>
        <div class="dropdown-menu-items has-scroll" data-language-select-list>
        {foreach $locales as $locale}
            <div class="dropdown-menu-item {if $activeLocale.language == $locale.language}active{/if}" data-value="{$locale.language}" data-language="{$locale.localisedName}">
                {if $pageType == "website" && $currentpagelinkback|strstr:"cmsid"}
                    {$divChar = ""}
                    {$url = "?"|explode:$currentpagelinkback}
                    {$url2 = "&amp;"|explode:$url[1]}
                    {$stringToReplace = "`$url2[0]`"}
                {else}
                    {$stringToReplace = ""}
                {/if}
                <a href="{$currentpagelinkback|replace:$stringToReplace:""}{$divChar}language={$locale.language}">
                    <span class="language-flag">
                        <img class="lazyload hidden" data-src="{$WEB_ROOT}/templates/{$template}/assets/img/flags/{$locale.language}.svg"/>
                    </span>
                    <span class="language-text">{$locale.localisedName}</span>
                </a>
            </div>
        {/foreach}
        </div>
        <div class="dropdown-menu-item dropdown-menu-no-data">
            <span class="text-info text-large">
                {$LANG.norecordsfound}
            </span>
        </div>                  
    </div>
{/if}