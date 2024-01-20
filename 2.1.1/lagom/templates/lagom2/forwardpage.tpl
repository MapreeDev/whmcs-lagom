{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="message message-lg message-no-data">
        <div class="loader" >
            {include file="$template/includes/common/loader.tpl"}  
        </div>
        <h2 class="message-title">{$message}</h2>
        <div id="frmPayment" align="center">
            {$code}
            <form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
            </form>
        </div>
    </div>
    
    <script language="javascript">
        setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
    </script>
    <style>
        #frmPayment table{
            margin: 0
        }
        #frmPayment table tr td{
            padding: 0;
            border: 0;
            height: 0;
        }
    </style>
{/if}