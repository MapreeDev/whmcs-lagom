{extends file="adminarea/includes/layout.tpl"}
{block name="template-heading"}
    {include file="adminarea/includes/breadcrumb.tpl"}
{/block}
{block name="template-tabs"}
    {include file="adminarea/includes/tabs.tpl"} 
{/block}
{block name="template-content"}
    <form id="#themeExport" action="{$helper->url('Template@export',['templateName'=>$template->getMainName()])}" method="POST" enctype="multipart/form-data">
        <button name="action" value="export">Export</button>
        <input type="file" name="importFile" />
        <button name="action" value="import">Import</button>
    </form>
{/block}
