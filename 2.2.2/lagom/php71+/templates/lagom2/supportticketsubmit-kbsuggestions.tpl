{if file_exists("templates/$template/overwrites/supportticketsubmit-kbsuggestions.tpl")}
    {include file="{$template}/overwrites/supportticketsubmit-kbsuggestions.tpl"}  
{else} 
    <div class="section">
        <h3 class="section-title">{$LANG.kbsuggestions}</h3>
        <p class="section-desc">{$LANG.kbsuggestionsexplanation}</p>

        <div class="section-body">
            <div class="list-group">
                <div class="kb-articles">
                    {foreach from=$kbarticles item=kbarticle}
                        <a class="list-group-item has-icon" href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">
                            <i class="list-group-item-icon ls ls-document"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">
                                    {$kbarticle.title}
                                </div>
                                <p class="list-group-item-text">
                                    {$kbarticle.article}
                                </p>
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/if}
