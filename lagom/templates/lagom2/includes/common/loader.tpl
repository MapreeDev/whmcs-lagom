{if file_exists("templates/$template/includes/common/overwrites/loader.tpl")}
    {include file="{$template}/includes/common/overwrites/loader.tpl"}  
{else} 
    <div class="spinner {$classes}">
        <div class="rect1"></div>
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
        <div class="rect5"></div>
    </div>
{/if}     