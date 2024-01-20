{include file="adminarea/includes/modals/delete-menu-item.tpl"}
{include file="adminarea/includes/modals/translation.tpl"}
{include file="adminarea/includes/modals/translation-desc.tpl"}
{include file="adminarea/includes/modals/common-translations.tpl"}
{include file="adminarea/includes/modals/unsaved-changes.tpl"}
{include file="adminarea/includes/modals/save-confirmation.tpl"}
{include file="adminarea/menu/includes/modals/delete-menu.tpl"}
{include file="adminarea/menu/includes/modals/overwrite-display-menu.tpl"}
{include file="adminarea/menu/includes/modals/icon-modal.tpl"}
{include file="adminarea/menu/includes/modals/icon-remove.tpl"}
{include file="adminarea/menu/includes/modals/change-type.tpl"}

{if isset($menu)}
    {include file="adminarea/includes/modals/export.tpl" itemId=$menu->id itemType='menu'}
{/if}