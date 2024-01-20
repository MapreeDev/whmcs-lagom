{include file="adminarea/includes/modals/delete-menu-item.tpl"}
{include file="adminarea/includes/modals/translation.tpl"}
{include file="adminarea/sidebar/includes/modals/delete-sidebar.tpl"}
{include file="adminarea/menu/includes/modals/icon-modal.tpl"}
{if isset($sidebar)}
    {include file="adminarea/includes/modals/export.tpl" itemid=$sidebar->id itemType='sidebar'}
{/if}