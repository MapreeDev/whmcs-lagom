{if file_exists("templates/$template/includes/login/overwrites/language-chooser.tpl")}
    {include file="{$template}/includes/login/overwrites/language-chooser.tpl"}  
{else}
    {if $languagechangeenabled && count($locales) > 1 && ($RSThemes['pages'][$templatefile]['config']['isFullPage'] == '1' || $RSThemes['pages'][$templatefile]['optionvars']['isFullPage'] == '1')}
        {if $type == "login" || $templatefile == "two-factor-new-backup-code"}
            <div class="login-language dropdown dropup language" data-language-select>
                <span>{$LANG.language}:&nbsp;</span>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    {$activeLocale.localisedName}
                    <b class="ls ls-caret"></b>
                </a>
                {include file="$template/includes/common/language-chooser-dropdown.tpl"}
            </div>
        {else}
            <li class="dropdown language" data-language-select>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    {$activeLocale.localisedName}
                    <b class="ls ls-caret"></b>
                </a>
                {include file="$template/includes/common/language-chooser-dropdown.tpl"}                
            </li>
        {/if}
    {/if}
{/if}