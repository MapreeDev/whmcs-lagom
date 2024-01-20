{if file_exists("templates/$template/includes/overwrites/head.tpl")}
    {include file="{$template}/includes/overwrites/head.tpl"}
{else}
    {* Favicon *}
    {if isset($RSThemes.faviconDir) && $RSThemes.faviconDir}
        <link rel="shortcut icon" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon.ico">
        <link rel="icon" sizes="16x16 32x32 64x64" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon.ico">
        <link rel="icon" type="image/png" sizes="196x196" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-192.png">
        <link rel="icon" type="image/png" sizes="160x160" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-160.png">
        <link rel="icon" type="image/png" sizes="96x96" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-96.png">
        <link rel="icon" type="image/png" sizes="64x64" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-64.png">
        <link rel="icon" type="image/png" sizes="32x32" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-16.png">
        <link rel="apple-touch-icon" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-57.png">
        <link rel="apple-touch-icon" sizes="114x114" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-114.png">
        <link rel="apple-touch-icon" sizes="72x72" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-72.png">
        <link rel="apple-touch-icon" sizes="144x144" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-144.png">
        <link rel="apple-touch-icon" sizes="60x60" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-60.png">
        <link rel="apple-touch-icon" sizes="120x120" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-120.png">
        <link rel="apple-touch-icon" sizes="76x76" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-76.png">
        <link rel="apple-touch-icon" sizes="152x152" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-180.png">
        <meta name="msapplication-TileColor" content="#FFFFFF">
        <meta name="msapplication-TileImage" content="{$WEB_ROOT}{$RSThemes.faviconDir}/favicon-144.png">
        <meta name="msapplication-config" content="{$WEB_ROOT}{$RSThemes.faviconDir}/browserconfig.xml">
    {/if}
    
    {* CSS Vars *}
    {$RSThemes['styles']['colors']->cssInjector(!$adminLoggedIn)}
    
    {* Main Styles *}
    {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi') && file_exists("templates/{$template}/assets/css/theme-rtl.css")}
        <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/theme-rtl.css?v={$RSThemes['templateVersion']}">
        {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}
        {else}
            {if ($isSite || isset($custompage)) && file_exists("templates/{$template}/assets/css/site-rtl.css")}
                <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/site-rtl.css?v={$RSThemes['templateVersion']}">
            {/if}
        {/if}    
    {else}
        <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/theme.css?v={$RSThemes['templateVersion']}">
        {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}
        {else}
             {if ($isSite || isset($custompage))}
                <link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/assets/css/site.css?v={$RSThemes['templateVersion']}">
            {/if}
        {/if}
    {/if}
    
    {* Custom *}
    {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi') && file_exists("templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/custom-rtl.css")} 
        <link href="{$WEB_ROOT}/templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/custom-rtl.css?v={$RSThemes['templateVersion']}" rel="stylesheet">
    {elseif file_exists("templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/custom.css")}
        <link href="{$WEB_ROOT}/templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/custom.css?v={$RSThemes['templateVersion']}" rel="stylesheet">
    {/if}

    {* Theme Custom *}
    {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi') && file_exists("templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/theme-custom-rtl.css")} 
        <link href="{$WEB_ROOT}/templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/theme-custom-rtl.css?v={$RSThemes['templateVersion']}" rel="stylesheet">
    {elseif file_exists("templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/theme-custom.css")}
        <link href="{$WEB_ROOT}/templates/{$template}/core/styles/{$RSThemes['styles']['name']}/assets/css/theme-custom.css?v={$RSThemes['templateVersion']}" rel="stylesheet">
    {/if}

    {if isset($isOnePageOrder) && $isOnePageOrder}
        <link href="{$WEB_ROOT}/modules/addons/LagomOrderForm/app/UI/Client/Templates/assets/css/order/lagom2/index.css?v={$RSThemes['templateVersion']}" rel="stylesheet">
    {/if}
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    {* WHMCS Script Vars *}
    <script>
        var csrfToken = '{$token}',
            markdownGuide = '{lang|addslashes key="markdown.title"}',
            locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
            saved = '{lang|addslashes key="markdown.saved"}',
            saving = '{lang|addslashes key="markdown.saving"}',
            whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
            requiredText = '{lang|addslashes key="orderForm.required"}',
            recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
    </script>
    {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}
        <script>disableInternalTabSelection = true</script>
    {/if}
    {* Main Scripts *}
    <script {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}defer{/if} src="{$WEB_ROOT}/templates/{$template}/assets/js/scripts.min.js?v={$RSThemes['templateVersion']}"></script>
    <script {if isset($activeDisplay) && $activeDisplay == 'CMS' && $pageType == "website"}defer{/if} src="{$WEB_ROOT}/templates/{$template}/assets/js/core.min.js?v={$RSThemes['templateVersion']}"></script>

    {* Custom Head *}
    {if file_exists("templates/$template/core/layouts/{$RSThemes.layouts.name}/head.tpl")}
        {include file="{$template}/core/layouts/{$RSThemes.layouts.name}/head.tpl"}
    {/if}

    {* Robots *}
    {if $templatefile == "viewticket" && !$loggedin}
        <meta name="robots" content="noindex" />
    {/if}
{/if}