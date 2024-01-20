{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}	
	<div class="article panel panel-default">
        <div class="panel-body">
            <ul class="article-details">
                <li>
                    <i class="ls ls-calendar"></i>
                    <span>{$carbon->createFromTimestamp($timestamp)->format('l, F j, Y')}</span>
                </li>
            </ul>
            <div class="article-content">
                {$text}
            </div>
            <div class="article-footer">
                <div class="article-actions">
                    <a href="{routePath('announcement-index')}" class="btn btn-default">{$LANG.clientareabacklink|replace:"&laquo;":""}</a>
                    {if $editLink}
                    <a href="{$editLink}" class="btn btn-default btn-article-edit">
                        {$LANG.edit}
                    </a>
                    {/if}
                </div>
                <div class="article-share">
                    {if $twittertweet}
                    <span>
                        <a href="https://twitter.com/share" class="twitter-share-button" data-count="vertical" data-via="{$twitterusername}">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                    </span>
                    {/if}                
                    {if $facebookrecommend}
                    <span>
                        {literal}
                        <div id="fb-root">
                        </div>
                        <script>(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) {return;}
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                            fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));</script>
                        {/literal}
                        <div class="fb-like" data-lagom-href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend">
                        </div>
                    </span>
                    {/if}
                </div>
            </div>
        </div>
	</div>
	{if $facebookcomments}
    <div class="article-comments panel panel-default panel-form">
        <div class="panel-body">
            {literal}
            <div id="fb-root">
            </div>
            <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
            {/literal}
            <fb:comments href="{fqdnRoutePath('announcement-view', $id, $urlfriendlytitle)}" num_posts="5" width="500"></fb:comments>
        </div>
    </div>
	{/if}
{/if}	