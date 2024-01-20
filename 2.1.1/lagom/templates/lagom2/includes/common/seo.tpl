{if file_exists("templates/$template/includes/common/overwrites/seo.tpl")}
     {include file="{$template}/includes/common/overwrites/seo.tpl"}  
{else}
    <title>
        {if isset($pageSeo['title'][$language]) && $pageSeo['enabled']}
            {$pageSeo['title'][$language]}
        {elseif $kbarticle.title}
            {$kbarticle.title}    
        {elseif $templatefile == "viewinvoice" || $templatefile == "viewquote" || $templatefile == "clientareahome"}
            {$pagetitle}
        {else}
            {$displayTitle}
        {/if} - {$companyname}
    </title>
    {if $pageSeo['enabled']}
        {if isset($pageSeo['description'][$language])}<meta name="description" content="{$pageSeo['description'][$language]}">{/if}
        {if isset($activeDisplay) && $activeDisplay == 'CMS'}
            <meta name="robots" content="{if $pageSeo['robots'] == 0}noindex nofollow{else}index follow{/if}">
        {/if}
        <meta name="og:type" content="{if $templatefile == 'homepage'}website{else}article{/if}">
        <meta name="og:title" content="{if isset($pageSeo['title'][$language])}{$pageSeo['title'][$language]}{else}{$displayTitle}{/if}">
        {if isset($pageSeo['description'][$language])}<meta name="og:description" content="{$pageSeo['description'][$language]}">{/if}
        {if isset($pageSeo['image'])}<meta property="og:image" content="{$systemurl}templates/{$template}/assets/img/page-manager/{$pageSeo['image']}">{/if}
        <meta name="og:url" content="{$systemurl}{$smarty.server.REQUEST_URI|ltrim:'/'}">
        <meta name="twitter:title" content="{if isset($pageSeo['title'][$language])}{$pageSeo['title'][$language]}{else}{$displayTitle}{/if}">
        {if isset($pageSeo['description'][$language])}<meta name="twitter:description" content="{$pageSeo['description'][$language]}">{/if}
        {if isset($pageSeo['image'])}<meta property="twitter:image" content="{$systemurl}templates/{$template}/assets/img/page-manager/{$pageSeo['image']}">{/if}
    {/if}
{/if}    