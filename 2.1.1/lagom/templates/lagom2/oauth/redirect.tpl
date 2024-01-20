{if file_exists("templates/$template/oauth/overwrites/redirect.tpl")}
    {include file="{$template}/oauth/overwrites/redirect.tpl"}  
{else} 
    <div class="main-body">
        <div class="container">
            <div class="message message-no-data check">
                <div class="message-image">
                    {include file="$template/includes/common/loader.tpl"}            
                </div>
                <h6 class="message-title">{lang key='oauth.redirectDescriptionOne'}  {lang key='oauth.redirectDescriptionTwo'} <a href="#"{lang key='oauth.redirectDescriptionThree'}</a></h6>
            </div>   
        </div>
    </div>    
{/if}
