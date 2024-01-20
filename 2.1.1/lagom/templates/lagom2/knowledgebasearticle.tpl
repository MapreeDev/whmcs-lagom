{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}   
    <div class="article panel panel-default">
        <div class="panel-body">
            {if $kbarticle.editLink}
                <div class="article-title">   
                    <a href="{$kbarticle.editLink}" class="btn btn-default m-l-a">
                        {$LANG.edit}
                    </a>
                </div>
            {/if}
            {if $kbarticle.voted}
                {include file="$template/includes/alert.tpl" type="success alert-bordered-left" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
            {/if}
            <div class="article-content">
                {$kbarticle.text}
            </div>
        </div>
    </div>
    <div class="article-rate panel panel-default">
        <div class="panel-body">
            <form action="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}" method="post">
                <input type="hidden" name="useful" value="vote">
                <div class="text">
                    {if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
                    <span><i class="ls ls-heart"></i> {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})</span>
                </div>
                <div>
                {if !$kbarticle.voted}
                    <button type="submit" name="vote" value="yes" class="btn btn-primary-faded"><i class="ls ls-like"></i> {$LANG.knowledgebaseyes}</button>
                    <button type="submit" name="vote" value="no" class="btn btn-primary-faded"><i class="ls ls-dislike"></i> {$LANG.knowledgebaseno}</button>
                {/if}
                </div>
            </form>
        </div>
    </div>
    {if $kbarticles}
        <div class="section">
            <div class="section-header">
                <h2 class="section-title">{$LANG.knowledgebasepopular}</h2>
            </div>
            <div class="section-body">
                <div class="list-group">
                    {foreach from=$kbarticles item=kbarticle}
                        <a class="list-group-item has-icon" href="{routePath('knowledgebase-article-view', {$kbarticle.id}, {$kbarticle.urlfriendlytitle})}">
                            <i class="list-group-item-icon lm lm-file"></i>
                            <div class="list-group-item-body">
                                <div class="list-group-item-heading">{$kbarticle.title}{if $kbarticle.editLink} <button data-lagom-href="{$kbarticle.editLink}" class="btn btn-xs btn-default">{$LANG.edit}</button>{/if}</div>
                                {if $kbarticle.article}<p class="list-group-item-text">{$kbarticle.article|truncate:100:"..."}</p>{/if}
                            </div>
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}
{/if}    