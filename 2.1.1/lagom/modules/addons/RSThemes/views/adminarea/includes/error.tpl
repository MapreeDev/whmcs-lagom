<div class="row">
    {foreach from=$flash item=message}
        <div class="alert alert-{$message['type']}" role="alert"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>{$message['message']}</div>
    {/foreach}
</div>