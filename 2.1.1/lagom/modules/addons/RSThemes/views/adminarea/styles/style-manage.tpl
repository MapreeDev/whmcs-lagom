{extends file="adminarea/includes/layout.tpl"}
{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl" type="style_manage"}
{/block}

{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl" type="style"}
{/block}

{block name="template-content"}
    {literal}
        <head>
            <meta charset="utf-8">
            <title>RSThemes - Style Manager</title>
            <base href="{/literal}{$whmcsURL}/{$adminPath}/{literal}">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="icon" type="image/x-icon" href="favicon.ico">
        </head>
        <body>
        <app-root></app-root>
        </body>
    {/literal}
{/block}
{block name="template-actions"}
    <div class="app-main__actions">
        <div class="container"> 
            <button class="btn btn--primary" data-save-changes data-toggle="lu-modal" data-target="#saveConfirmationModal">
                <span class="btn__text">{$lang.general.save_changes}</span>
                <span class="btn__preloader preloader"></span>
            </button>
            <a class="btn btn--default btn--outline " href="{$helper->url('Template@pages',['templateName'=>$template->getMainName()])}">
                <span class="btn__text">{$lang.general.cancel}</span>
                <span class="btn__preloader preloader"></span>
            </a>
            <button class="btn btn--default btn--outline m-l-a" type="button" data-toggle="lu-modal" data-target="#restoreDefaultModal">
                <span class="btn__text">{$lang.general.restore_defaults}</span>
                <span class="btn__preloader preloader"></span>
            </button>
        </div>
    </div>
{/block}
{block name="template-modals"}
    {include file="adminarea/includes/modals/unsaved-changes.tpl"}
    {include file="adminarea/includes/modals/restore-defaults.tpl"}
    {include file="adminarea/includes/modals/save-confirmation.tpl"}
{/block}

{block name="template-scripts"}

    <script>window.whmcsURL = '{$whmcsURL}'</script>
    
    {foreach from=$angularDistJs item=dist} 
        <script src="{$dist}"></script> 
    {/foreach}

    <script> 

        let confirmRestoreModal = $('#restoreDefaultModal');
        let confirmRestoreCheckbox = $("input[name='restore-confirm-checkbox']");
        let confirmRestoreRadio = $("input[name='restore-confirm-radio']");
        let confirmRestoreButton  = $('[data-restore-default-modal-btn]');

        confirmRestoreCheckbox.change(function(){
            if(this.checked && confirmRestoreButton.is(":disabled")){
                confirmRestoreButton.prop("disabled", false)
            }else if (!this.checked && !confirmRestoreButton.is(":disabled")){
                confirmRestoreButton.prop("disabled", true)
            }
        })

        confirmRestoreModal.on('hidden.bs.modal', function (){
            if(confirmRestoreCheckbox.is(':checked') && !confirmRestoreButton.is(":disabled")){
                confirmRestoreButton.prop("disabled", true)
                confirmRestoreCheckbox.prop('checked', false)
            }
            confirmRestoreRadio.val(['activeTab'])
        })
    </script>
{/block}
