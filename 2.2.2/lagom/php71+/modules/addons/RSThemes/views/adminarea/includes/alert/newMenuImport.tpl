<form 
    class="alert alert--info alert--outline has-icon alert--border-left is-hidden" 
    data-new-version-menu-import method="POST" 
    action="{$helper->url('Menu@importChangedMenu',['templateName'=>$template->getMainName()])}"
    data-cookie-alert
    data-cookie-alert-exp="2147483647"
    data-cookie-alert-name="LagomCheckMenu-{$template->getVersion()}"
>
    <div class="alert__body">
        <h6>{$lang.alert.new_menu_version.title}</h6>
        <p>{$lang.alert.new_menu_version.desc}</p>
    </div>
    <div class="alert__actions">
        <button type="submit" class="btn btn--secondary btn--sm">{$lang.general.import}</button>
        <button class="btn btn--default btn--outline btn--sm" data-dismiss="alert" aria-label="Close" type="button">{$lang.general.dismiss}</button>
    </div>
</form>