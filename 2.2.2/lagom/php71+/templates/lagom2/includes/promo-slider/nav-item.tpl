{if file_exists("templates/$template/includes/promo-slider/overwrites/nav-item.tpl")}
    {include file="{$template}/includes/promo-slider/overwrites/nav-item.tpl"}  
{else}
    {if $name == "symantec"}
        {assign var="fullName" value="SSL"}
        {assign var="shortName" value="SSL"}
    {elseif $name == "weebly"}
        {assign var="fullName" value="Weebly"}
        {assign var="shortName" value="W"}
    {elseif $name == "spamexperts"}
        {assign var="fullName" value="Email Security"}
        {assign var="shortName" value="ES"}
    {elseif $name == "sitelock"}
        {assign var="fullName" value="SiteLock"}
        {assign var="shortName" value="SL"}
    {elseif $name == "codeguard"}
        {assign var="fullName" value="CodeGuard"}
        {assign var="shortName" value="CG"}
    {elseif $name == "sitelockvpn"} 
        {assign var="fullName" value="SiteLock VPN"}
        {assign var="shortName" value="VPN"}
    {elseif $name == "marketgoo"}     
        {assign var="fullName" value="Marketgoo"}
        {assign var="shortName" value="MG"}
    {elseif $name == "ox"}        
        {assign var="fullName" value="OX App Suite"}
        {assign var="shortName" value="OX"}
    {elseif $name == "sitebuilder"}
        {assign var="fullName" value="Site Builder"}
        {assign var="shortName" value="SB"}
    {elseif $name == "cpanelseo"}
        {assign var="fullName" value="cPanel SEO"}
        {assign var="shortName" value="cPS"}
    {elseif $name == "nordvpn"}
        {assign var="fullName" value="Nord VPN"}
        {assign var="shortName" value="NVPN"}
    {elseif $name == "xovinow"}
        {assign var="fullName" value="Xovi NOW"}
        {assign var="shortName" value="XNOW"}
    {elseif $name == "threesixtymonitoring"}
        {assign var="fullName" value="360 Monintoring"}
        {assign var="shortName" value="360M"}
    {/if}

    <li data-promo-slider-pagination-item>
        <span class="short-name">
            {$shortName}
        </span>
        <span class="full-name">
            {$fullName}
        </span>
    </li>
{/if}