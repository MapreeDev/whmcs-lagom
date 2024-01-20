
{if file_exists("templates/$template/store/ssl/shared/overwrites/ssl-filters.tpl")}
    {include file="{$template}/store/ssl/shared/overwrites/ssl-filters.tpl"}  
{else}
    <ul class="nav nav-tabs tabs-filters m-a" role="tablist" data-filter-nav ssl-filters>
        <li role="presentation" class="active"><a href="#all" data-filter="all">{$LANG.store.ssl.landingPage.viewAll}</a></li>
        <li role="presentation"><a href="#dv" data-filter="dv">{lang key='store.ssl.shared.dvSsl'}</a></li>
        <li role="presentation"><a href="#ov" data-filter="ov">{lang key='store.ssl.shared.ovSsl'}</a></li>
        <li role="presentation"><a href="#ev" data-filter="ev">{lang key='store.ssl.shared.evSsl'}</a></li>
        <li role="presentation"><a href="#wildcard" data-filter="wildcard">{lang key='store.ssl.shared.wildcardSsl'}</a></li>
    </ul>
{/if}    