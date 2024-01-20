{if file_exists("templates/$template/overwrites/viewemail.tpl")}
    {include file="{$template}/overwrites/viewemail.tpl"}  
{else} 
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>{$LANG.clientareaemails} - {$companyname}</title>
    </head>
    <body id="popup-backdrop">
        <div class="panel panel-default m-b-0">
            <div class="panel-body main-content d-flex justify-center">
                {$message}
            </div>
             {if is_array($attachments) && count($attachments) > 0}
                <div class="panel-footer" style="padding: 20px; margin-top:-20px">
                    {foreach $attachments as $attachedFile}
                        <i class="fal fa-paperclip"></i> {$attachedFile}{if !$attachedFile@last}<br>{/if}
                    {/foreach}
                </div>
            {/if}
        </div>
    </body>
    </html>
{/if}