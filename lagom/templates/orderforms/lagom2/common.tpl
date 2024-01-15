{if file_exists("templates/orderforms/$carttpl/overwrites/common.tpl")}
    {include file="templates/orderforms/$carttpl/overwrites/common.tpl"}  
{else} 
    <script type="text/javascript" src="{$WEB_ROOT}/templates/orderforms/{$carttpl}/js/order.min.js?v={$RSThemes['templateVersion']}"></script>
{/if}