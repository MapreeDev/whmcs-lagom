{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="search-box search-box-{$searchBoxStyle}">
        <form role="form" method="post" action="{routePath('knowledgebase-search')}">
            <div class="search-group search-group-lg">
                <div class="search-field">
                    <input class="form-control" type="text" id="inputKnowledgebaseSearch" name="search" placeholder="{$LANG.howcanwehelp}" />
                    <div class="search-field-icon"><i class="lm lm-search"></i></div>
                </div>
                <button class="btn btn-lg btn-primary{if $searchBoxStyle == 'primary'}-faded{/if}" type="submit" id="btnKnowledgebaseSearch">{$LANG.search}</button>
            </div>
        </form>
    </div>
    <div class="section kb-categories">
        <div class="section-header">
            <h2 class="section-title">{$LANG.knowledgebasecategories}</h2>
        </div>
        <div class="section-body">
            {if $kbcats}
                <div class="list-group">
                    {foreach from=$kbcats name=kbcats item=kbcat}  
                        <a class="list-group-item has-icon" href="{routePath('knowledgebase-category-view', {$kbcat.id}, {$kbcat.urlfriendlyname})}">
                            <i class="list-group-item-icon lm lm-folder"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$kbcat.name} ({$kbcat.numarticles}){if $kbcat.editLink} <button data-lagom-href="{$kbcat.editLink}" class="btn btn-xs btn-default">{$LANG.edit}</button>{/if}</div> 
                                {if $kbcat.description}<p class="list-group-item-text">{$kbcat.description}</p>{/if}
                            </div>
                        </a>
                    {/foreach}
                </div>
            {else}
                <div class="message message-no-data">
                    <div class="message-image">
                        {include file="$template/includes/common/svg-icon.tpl" icon="article"}
                    </div>
                    <h6 class="message-title">{$LANG.knowledgebasenoarticles}</h6>
                </div>
            {/if}
        </div>
    </div>
    {if $kbmostviews}
        <div class="section kb-articles">
            <div class="section-header">
                <h2 class="section-title">{$LANG.knowledgebasepopular}</h2>
            </div>
            <div class="section-body">
                <div class="list-group">
                    {foreach from=$kbmostviews item=kbarticle}
                        <a class="list-group-item has-icon" href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
                            <i class="list-group-item-icon ls ls-document"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$kbarticle.title}{if $kbarticle.editLink} <button data-lagom-href="{$kbarticle.editLink}" class="btn btn-default btn-xs">{$LANG.edit}</button>{/if}</div>
                                {if $kbarticle.article}<p class="list-group-item-text">{$kbarticle.article|truncate:100:"..."}</p>{/if}
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
    {literal}
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            if (localStorage.getItem("remoteSearchPhrase")) {
                var searchPhrase = localStorage.getItem("remoteSearchPhrase");
                var searchInput = document.querySelector('#inputKnowledgebaseSearch');
                var searchBtn = document.querySelector('#btnKnowledgebaseSearch');
                setTimeout(function(){
                    searchInput.value = searchPhrase;
                    searchBtn.click();
                    localStorage.removeItem("remoteSearchPhrase");
                }, 500);
            }
        });

    </script>
    {/literal}
{/if}    