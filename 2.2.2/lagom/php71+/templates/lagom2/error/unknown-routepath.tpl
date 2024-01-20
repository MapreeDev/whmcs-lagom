{if file_exists("templates/$template/error/overwrites/unknown-routepath.tpl")}
    {include file="{$template}/error/overwrites/unknown-routepath.tpl"}  
{else}
    <div class="container">
        <span class="error-page-title"> 404  {*lang key="errorPage.404.title"*}</span>
        <h2>Sorry, but the previous page (<a href="{$referrer|escape}">{$referrer|escape}</a>) provided an invalid page link.</h2> 
        <p>{lang key="errorPage.404.description"}</p>
        <div class="error-page-actions"> 
            <a href="{$systemurl}" class="btn btn-primary btn-lg">
                {lang key="errorPage.404.home"}
            </a>
            <a href="{$systemurl}submitticket.php" class="btn btn-primary btn-lg">
                {lang key="errorPage.404.submitTicket"}
            </a> 
        </div>
    </div>
{/if}