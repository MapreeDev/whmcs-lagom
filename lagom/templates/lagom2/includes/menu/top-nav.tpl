{if file_exists("templates/$template/includes/menu/overwrites/top-nav.tpl")}
    {include file="{$template}/includes/menu/overwrites/top-nav.tpl"}
{else}
    <ul class="top-nav">
        {if $adminMasqueradingAsClient || $adminLoggedIn}
            <li>
                <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
                    <i class="lm lm-arrow-fat-right"></i>
                </a>
            </li>
        {/if}
        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar}
    </ul>
{/if}    