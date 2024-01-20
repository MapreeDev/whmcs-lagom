{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="main-banner banner-center banner-home banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
            {if $registerdomainenabled || $transferdomainenabled}
                <h1 class="banner-title">{$LANG.findyourdomain}</h1>
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <input type="hidden" name="transfer">
                    <div class="domain-search-input search-group search-group-lg search-group-combined has-shadow">
                        <div class="search-field">
                            <div class="search-field-icon"><i class="lm lm-search"></i></div>
                            <input class="form-control" type="text" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" data-toggle="tooltip" {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')} data-placement="right" {else} data-placement="left" {/if} data-trigger="manual" title="{lang key='orderForm.required'}"/>
                        </div>
                        <div class="search-group-btn">
                            {if $transferdomainenabled}
                                <button type="submit" class="btn btn-primary-faded transfer {$captcha->getButtonClass($captchaForm)}" data-domain-action="transfer">
                                    {$LANG.domainstransfer}
                                </button>
                            {/if}
                            {if $registerdomainenabled}
                                <button type="submit" class="btn btn-primary search {$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">
                                    {$LANG.search}
                                </button>
                            {/if}
                        </div>
                    </div>
                    {include file="$template/includes/captcha.tpl"}
                </form>
            {else}
                <h1 class="banner-title">{$LANG.doToday}</h1>
            {/if}
            </div>
        </div>
        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-bg"} 
    </div>
	<div class="main-body">
        <div class="container">
            <div class="m-w-lg m-h-a">
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.howcanwehelp}</h2>
                    </div>
                    <div class="section-body">
                        <div class="tiles row">
                            {if $registerdomainenabled || $transferdomainenabled}
                                <div class="col-md-3">
                                    <a class="tile tile-home" href="domainchecker.php">
                                        <div class="tile-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="domain"}                                            
                                        </div>
                                        <div class="tile-title">{$LANG.buyadomain}</div>
                                    </a>
                                </div>
                            {/if}
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnOrderHosting" href="{$WEB_ROOT}/cart.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="web-hosting"} 
                                    </div>
                                    <div class="tile-title">{$LANG.orderhosting}</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnMakePayment" href="clientarea.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="comissions"} 
                                    </div>
                                    <div class="tile-title">{$LANG.makepayment}</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="comments"}                                         
                                    </div>
                                    <div class="tile-title">{$LANG.getsupport}</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                {if $twitterusername}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title">{$LANG.twitterlatesttweets}</h2>
                        </div>
                        <div class="section-body">
                            <div class="panel" id="twitterFeedOutput">
                                <div class="loader d-flex justify-center">
                                    {include file="$template/includes/common/loader.tpl"}
                                </div>
                            </div>
                            <script type="text/javascript" src="templates/{$template}/assets/js/twitter.js"></script>
                        </div>
                    </div>
                {elseif $announcements}
                    <div class="section">
                        <div class="section-header">
                            <h2 class="section-title d-flex space-between">{$LANG.news}<i class="lm lm-info-text text-lighter"></i></h2>
                        </div>
                        <div class="section-body">
                            <div class="announcements-list list-group list-group-lg">
                                {foreach $announcements as $announcement}
                                    {if $announcement@index < 2}
                                        <div class="list-group-item list-group-item-link" data-lagom-href="{routePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}">
                                            <span class="announcement-date">
                                                <i class="ls ls-calendar"></i>
                                                {$carbon->translatePassedToFormat($announcement.rawDate, 'M jS')}
                                            </span>
                                            <div class="list-group-item-heading">{$announcement.title}</div>
                                            <div class="list-group-item-text">
                                                <p>
                                                    {if $announcement.text|strip_tags|strlen < 350}
                                                        {$announcement.text}
                                                    {else}
                                                        {$announcement.summary}
                                                    {/if}
                                                </p>
                                            </div>
                                            <div class="list-group-item-footer">
                                                {if $announcement.text|strip_tags|strlen >= 350}
                                                    <span class="btn btn-sm btn-primary-faded">{$LANG.readmore}</span>
                                                {/if}
                                                <div class="announcement-details">
                                                    {if $announcementsFbRecommend}
                                                        <script>
                                                            (function(d, s, id) {
                                                                var js, fjs = d.getElementsByTagName(s)[0];
                                                                if (d.getElementById(id)) {
                                                                    return;
                                                                }
                                                                js = d.createElement(s); js.id = id;
                                                                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                                                                fjs.parentNode.insertBefore(js, fjs);
                                                            }(document, 'script', 'facebook-jssdk'));
                                                        </script>
                                                        <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-lagom-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                                                        <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-lagom-href="{fqdnRoutePath('announcement-view', $announcement.id, $announcement.urlfriendlytitle)}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}
                            </div>
                        </div>
                    </div>
                {/if}
            </div> 
        </div>
    </div>
{/if}
