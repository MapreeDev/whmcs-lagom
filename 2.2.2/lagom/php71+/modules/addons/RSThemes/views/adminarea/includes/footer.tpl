{* Modal Preview *}
{if isset($extension) && $extension}
    <div class="modal modal--xlg" id="emailPrev">
        <div class="modal__dialog">
            <div class="modal__content">
                <div class="modal__top top">
                    <h4 class="top__title h6 m-b-0x">{$lang.modal.email_preview.title}</h4>
                    <div class="top__toolbar">
                        <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                            <i class="btn__icon lm lm-close"></i>
                        </button>
                    </div>
                </div>
                <div class="modal__body p-0x">
                    <iframe id="emailPreviewIframe" width="100%" height="100%" src="{$extension->getPreviewLink()}" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
{/if}

{* Modal Change Display Rule *}
{if \RSThemes\Helpers\ContentChecker::checkCmsInstalled()}
    {include file="adminarea/includes/modals/change-display-rule.tpl"}
{/if}

{* Floating Alerts *}
{foreach from=$flash item=message}
    {if $message['message']}
        <span class="hidden" data-message data-title="{if $message['type'] == "success"}Success{elseif $message['type'] == "danger"}Error{elseif $message['type'] == "info"}Info{elseif $message['type'] == "warning"}Warning{/if}" data-status="{$message['type']}" data-body="{$message['message']}"></span>
    {/if}
{/foreach}

<div class="alert alert--success alert--outline alert--float alert--border-left has-icon alert--successfully-top-fixed" id="ajaxAlert">
    <div class="alert__body">{$lang.general.changes_saved}</div>
</div>

{* Template Scripts *}
<script type="text/javascript" src="{$helper->script('vendor.js')}"></script>
<script type="text/javascript" src="{$helper->script('core.js')}"></script>
<script type="text/javascript" src="{$helper->script('rsthemes.js')}"></script>