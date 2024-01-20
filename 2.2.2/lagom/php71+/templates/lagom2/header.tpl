{if file_exists("templates/$template/overwrites/header.tpl")}
    {include file="{$template}/overwrites/header.tpl"}
{else}
    <!DOCTYPE html>
    <html lang="{$activeLocale.languageCode}" {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi') && file_exists("templates/{$template}/assets/css/theme-rtl.css")}dir="rtl"{/if}>
    <head>
        <meta charset="{$charset}" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        {include file="$template/includes/common/seo.tpl"}
        {include file="$template/includes/head.tpl"}
        {$headoutput}

        {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}
            <link rel="preload" href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        {else}
            <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
        {/if}
    </head>
    
    <body class="lagom{if $bodyClasses} {$bodyClasses}{if $bodyClasses|strstr:'page-login' && $RSThemes.pages[$templatefile].name != 'sidebar'} page-login-{$loginBgStyle}{/if}{/if}{if !$loggedin} lagom-not-portal{/if}{if $RSThemes.layouts.vars.bodyClass} {$RSThemes.layouts.vars.bodyClass}{/if}{if $RSThemes.styles.vars.bodyClass} {$RSThemes.styles.vars.bodyClass}{/if}{if $inShoppingCart} page-order{/if}{if !$templatefile|strstr:"/"} page-{$templatefile}{/if}{if $pageModuleName} page-{$pageModuleName}{/if}{if $module} page-{$module|lower|replace:" ":""}{/if}{if $mgCaResult['vars']['mainName']} page-{$mgCaResult['vars']['mainName']|lower|replace:" ":""}{/if}{if $loggedin} page-user-logged{/if}{if $RSThemes['pages'][$templatefile]['config']['isFullPage'] == "1" || $RSThemes['pages'][$templatefile]['optionvars']['isFullPage'] == "true" || $templatefile=="oauth/layout"} page-type-full{/if}{if $pageType == "website" && $activeDisplay == "CMS"} page-lagom-cms{/if}{if $RSThemes.addonSettings.mobile_menu_style == 'dropdown'} nav-mobile-dropdown{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">

    {if isset($lagomClientAlerts) && $lagomClientAlerts->header} 
        {$lagomClientAlerts->header}
    {/if}
    {$headeroutput}

    {if isset($RSThemes.layouts)}
        {include file=$RSThemes['layouts']['mediumPath']}
    {else}
        {include file="templates/{$template}/core/layouts/main-menu/default/default.tpl"}
    {/if}
{/if}