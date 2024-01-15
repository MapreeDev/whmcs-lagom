<div class="container">
<div class="message message-lg message-no-data">
    <div class="message-image">
        {include file="$template/includes/common/svg-icon.tpl" icon="notification"} 
    </div>
    <h2 class="message-title">{lang key='store.addon.notFound.productUnavailable'}</h2>
    <div class="message-desc">
        <p>{lang key='store.addon.notFound.productUnavailableText'}</p>
        <p><em>{lang key='store.addon.notFound.ref'}: {$productName}</em></p>
    </div>
    <div class="message-actions">
        <a href="{$WEB_ROOT}/contact.php" class="btn btn-lg btn-primary">{lang key='store.addon.notFound.contactSupport'}</a>
    </div>
</div>
</div>