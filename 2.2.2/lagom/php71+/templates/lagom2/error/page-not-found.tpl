{if $activeDisplay == "CMS" && $pageType == "website" && file_exists("templates/$template/lagompage.tpl")}
    {include file="{$template}/lagompage.tpl"}
{elseif file_exists("templates/$template/error/overwrites/page-not-found.tpl")}
    {include file="{$template}/error/overwrites/page-not-found.tpl"}  
{else} 
    <div class="container">
        <span class="error-page-title"> 404  {*lang key="errorPage.404.title"*}</span>
        <h2>{lang key="errorPage.404.subtitle"}</h2> 
        <p>{lang key="errorPage.404.description"}</p>
        <div class="error-page-actions"> 
            <a href="{$systemurl}" class="btn btn-primary btn-lg">
                {lang key="errorPage.404.home"}
            </a>
            <a href="{$systemurl}submitticket.php" class="btn btn-primary btn-lg">
                {lang key="errorPage.404.submitTicket"}
            </a> 
        </div>
        {include file="{$template}/footer.tpl"}
    </div>
{/if}