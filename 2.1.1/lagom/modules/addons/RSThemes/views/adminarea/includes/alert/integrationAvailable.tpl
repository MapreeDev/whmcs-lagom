<form 
    class="alert alert--info alert--outline has-icon alert--border-left" 
    data-new-version-menu-import method="POST" 
    action="{$helper->url('Template@loadSettings',['templateName'=>$template->getMainName()])}"
    {* data-cookie-alert
    data-cookie-alert-exp="2147483647"
    data-cookie-alert-name="LagomCheckMenu-{$template->getVersion()}" *}
>
    <div class="alert__body">
        <h6>{$lang.alert.integration_available.title}</h6>
        <p>{$lang.alert.integration_available.desc}</p>
    </div>
    <div class="alert__actions">
        <button type="submit" class="btn btn--secondary btn--sm">{$lang.general.import}</button>
        {* <button class="btn btn--default btn--outline btn--sm" data-dismiss="alert" aria-label="Close" type="button">{$lang.general.dismiss}</button> *}
    </div>
</form>