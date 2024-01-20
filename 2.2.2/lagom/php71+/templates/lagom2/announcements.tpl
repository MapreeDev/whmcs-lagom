{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $announcementsFbRecommend}
        <script>
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/{$LANG.locale}/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
    {/if}
    {if $announcements}
        <div class="announcements-list list-group list-group-lg">
        {foreach from=$announcements item=announcement}
            <div class="list-group-item list-group-item-link" data-lagom-href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
                <span class="announcement-date"><i class="ls ls-calendar"></i>{$carbon->createFromTimestamp($announcement.timestamp)->format('jS M Y')}</span>
                <h3 class="list-group-item-heading">{$announcement.title}</h3>
                {if $announcement.text|strip_tags|strlen < 350}
                    <div class="list-group-item-text">{$announcement.text}</div>
                {else}
                    {$imgSrc = false}
                    {if isset($RSThemes['pages'][$templatefile]['config']['displayImages']) && $RSThemes['pages'][$templatefile]['config']['displayImages'] == '1'}
                        {$imgCheck = $announcement.text|truncate:"10"}
                        {if $imgCheck|strstr:"<img"}
                            {$imgArray = "<img"|explode:$announcement.text}
                            {$imgArray = "/>"|explode:$imgArray[1]}
                            {$imgSrc = $imgArray[0]}
                        {/if}
                    {/if}
                    <div class="list-group-item-text">
                        {if $imgSrc}
                            <img {$imgSrc} />
                        {/if}
                        {$announcement.summary}
                    </div>
                {/if}
                <div class="list-group-item-footer">
                    <span class="btn btn-sm btn-primary-faded">{$LANG.readmore}</span>
                    {if $announcement.editLink}
                        <button data-lagom-href="{$announcement.editLink}" class="btn btn-primary-faded btn-sm">                    
                            {$LANG.edit}
                        </button>
                    {/if}
                    <div class="announcement-details">
                        {if $announcementsFbRecommend}
                            <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-lagom-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                            <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-lagom-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                        {/if}
                    </div>
                </div>
            </div>
        {/foreach}
        
        <ul class="pagination">
            {foreach $pagination as $item}
            <li {if $item.active}class="active"{/if}>
                <a href="{$item.link}" {if $item.disabled} disabled="disabled"{/if}>{$item.text}</a>
            </li>
            {/foreach}
        </ul>
       
    </div>
    {else}
        <div class="message message-no-data">
            <div class="message-image">
                {include file="$template/includes/common/svg-icon.tpl" icon="article"}
            </div>
            <h6 class="message-title">{$LANG.noannouncements}</h6>
        </div>
    {/if}
{/if}    