<div class="main-body main-body-has-sidebar{if $RSThemes['pages'][$templatefile]['config']['sidebarOnRightSide'] == '1'} main-body-has-sidebar-right {else} main-body-has-sidebar-left{/if}">
    <div class="main-body-sidebar main-body-sidebar-{$loginSidebarStyle}">
        <div class="sidebar-logo logo-container">
            {include file="$template/includes/login/logo.tpl" sidebarLogo=true}
        </div>
        <div class="sidebar-content">
            {if isset($publishedAnnouncements) && !empty($publishedAnnouncements)}
                <h2 class="sidebar-title">{$rslang->trans('generals.what_new')}</h2>
                <div class="sidebar-swiper swiper-container">
                    <div class="swiper-wrapper">
                        {foreach $publishedAnnouncements as $announcement}
                            <div class="sidebar-news swiper-slide">
                                <span class="sidebar-news-date">{$announcement['date']}</span>
                                <a class="sidebar-news-title h3" href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">{$announcement['title']}</a>
                                <div class="sidebar-news-desc">
                                    {$announcement['announcement']}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            {/if}
        </div>
    </div>
    <div class="main-body-content">
        {block name="content"}{/block}
    </div>
</div>
{block name="scripts"}{/block}