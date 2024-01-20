{if file_exists("templates/$template/includes/common/overwrites/logo.tpl")}
     {include file="{$template}/includes/common/overwrites/logo.tpl"}  
{else}
    {* Logo Color - Choose correct logo color, based on the page tempalte *}

    {* Left Nav *}
    {if $RSThemes.layouts.name == 'left-nav' && !$footerLogo}
        {if  $leftNavStyle == 'default' && !$RSThemes.styles.vars.futuristic}
            {if $RSThemes.logoSquare}
                {assign var=logoVersion value=$RSThemes.logoSquare}
            {else}
                {assign var=logoVersion value=$RSThemes.logo}
            {/if}
        {else}
            {if $RSThemes.logoSquareInverse}
                {assign var=logoVersion value=$RSThemes.logoSquareInverse}
            {elseif $RSThemes.logoSquare}
                {assign var=logoVersion value=$RSThemes.logoSquare}
            {elseif $RSThemes.logo_inverse}
                {assign var=logoVersion value=$RSThemes.logo_inverse}
            {elseif $RSThemes.logo}
                {assign var=logoVersion value=$RSThemes.logo}
            {/if}
        {/if}
    {* Left Nav Wide *}    
    {elseif $RSThemes.layouts.name == 'left-nav-wide' && !$footerLogo}
        {if $leftNavStyle == 'default' && !$RSThemes.styles.vars.futuristic}
            {assign var=logoVersion value=$RSThemes.logo}
        {else}   
            {if $RSThemes.logo_inverse}
                {assign var=logoVersion value=$RSThemes.logo_inverse}
            {else}
                {assign var=logoVersion value=$RSThemes.logo}     
            {/if}
        {/if}
    {* Top Nav *}    
    {else}
        {if $RSThemes.styles.vars.futuristic && $RSThemes.logo_inverse}
            {assign var=logoVersion value=$RSThemes.logo_inverse}
        {else}
            {assign var=logoVersion value=$RSThemes.logo}  
        {/if}
    {/if}
    {$RSThemes.logo_inverses}
    {* Mobile Logo *}
    {if $RSThemes.styles.vars.futuristic}
        {assign var=logoMobileVersion value=$RSThemes.logo_inverse}
    {else}
        {assign var=logoMobileVersion value=$RSThemes.logo}
    {/if}

    {if $RCLogo}
        <a class="{if $customClass}{$customClass} {/if}logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$RCLogo}" alt="{$companyname}"></a>
    {elseif $MBLogo}
        <a class="{if $customClass}{$customClass} {/if}logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$MBLogo}" alt="{$companyname}"></a>
    {elseif $logoVersion}
        <a class="{if $customClass}{$customClass} {/if}logo{if $logoMobileVersion && !$ignoreMobileVersion} hidden-sm hidden-xs hidden-md{/if}" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$WEB_ROOT}{$logoVersion}" title="{$companyname}" alt="{$companyname}"/></a>
        {if $logoMobileVersion && !$ignoreMobileVersion}
            <a class="logo visible-xs visible-sm visible-md" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$WEB_ROOT}{$logoMobileVersion}" title="{$companyname}" alt="{$companyname}"/></a>
        {/if}
    {elseif $assetLogoPath}
        <a class="{if $customClass}{$customClass} {/if}logo" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}"><img src="{$assetLogoPath}" title="{$companyname}" alt="{$companyname}"/></a>
    {else}
        <a class="{if $customClass}{$customClass} {/if}logo logo-text" href="{if $lagom_logo_url}{$lagom_logo_url}{else}{$WEB_ROOT}/index.php{/if}">{$companyname}</a>
    {/if}
{/if}    