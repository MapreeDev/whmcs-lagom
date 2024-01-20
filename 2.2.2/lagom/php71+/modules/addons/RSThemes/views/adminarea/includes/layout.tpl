<div id="rs-module">
    <div class="app app--navbar-top app--navbar-h-simple">
        {* Header *}
        {include file="adminarea/includes/header.tpl"}
        {* Navbar *}
        {include file="adminarea/includes/navbar.tpl"}
        <div class="app-main">
		    <div class="app-main__header">
                {* Block - Template Heading *}
                {block name="template-heading"}{/block}
                {* Block - Template Tabs *}
                {block name="template-tabs"}{/block}
            </div>
            <div class="app-main__body" id="themesConfig">    
                <div class="container">
                    {* Block - Template Content *}
                    {block name="template-content"}
                    {/block}
                </div>
            </div>
            {* Block - Template Sidebar *}
            {block name="template-sidebar"}{/block}
            {* Block - Template Actions *}
            {block name="template-actions"}{/block}
        </div>
        {* Block - Template Modals *}
        {block name="template-modals"}{/block}
        {* Footer *}
        {include file="adminarea/includes/footer.tpl"}
        {* Block - Template Scripts *}
        {block name="template-scripts"}{/block}
    </div>
</div>
