{if file_exists("templates/$template/includes/overwrites/pageheader.tpl")}
    {include file="{$template}/includes/overwrites/pageheader.tpl"}  
{else}      
    {if $RSheadercenter}
        <div class="main-header-top">
            <h1 class="main-header-title">
            {if $desc}
                <span class="text-lighter text-small">{$desc}</span>
                <br />
            {/if}
                {$title}
            </h1>
            {if $showbreadcrumb}{include file="$template/includes/breadcrumb.tpl"}{/if}
        </div>
    {else}
        {if $RSheadersearch}
            <div class="main-header-top">
                <h1 class="main-header-title">{$title}</h1>
                <div class="search-group">
                    <div class="search-field">                
                        <i class="search-field-icon lm lm-search"></i>
                        <input type="text" id="table-search" class="form-control" placeholder="{$LANG.tableentersearchterm}">  
                    </div>
                    {if $templatefile == 'clientareaproducts'}
                        <a class="btn btn-primary-faded" href="{$WEB_ROOT}/cart.php"><i class="ls ls-plus"></i>{$rslang->trans('generals.add_new')}</a>
                    {/if}
                    {if $templatefile == "clientareadomains"}
                        <a class="btn btn-primary-faded" href="{$WEB_ROOT}/cart.php?a=add&domain=register.php"><i class="ls ls-plus"></i>{$rslang->trans('generals.add_new')}</a>
                    {/if}  
                </div>
            </div>
        {elseif $RSheaderRenewalSearch}
            <div class="main-header-top">
                <h1 class="main-header-title">{$title}</h1>
                <div class="search-group">
                    <div class="search-field">                
                        <i class="search-field-icon lm lm-search"></i>
                        <input type="text" id="domainRenewalFilter" class="form-control" placeholder="{$LANG.tableentersearchterm}">
                    </div>
                </div>
            </div>
        {elseif $templatefile == "products"}
            <h1 class="main-header-title">
                {$title}
            </h1>
            {if $productGroup.tagline}
                <p>{$productGroup.tagline}</p>
            {/if}
        {elseif $templatefile == "knowledgebasearticle"}
            <h1 class="main-header-title">
                {$kbarticle.title}
            </h1>
        {else}
            <h1 class="main-header-title">
                {$title}
            </h1>
        {/if}
        {if $showbreadcrumb || $desc}
            <div class="main-header-bottom">
                {if $showbreadcrumb}{include file="$template/includes/breadcrumb.tpl"}{/if}
            </div>
        {/if}
    {/if}
{/if}    