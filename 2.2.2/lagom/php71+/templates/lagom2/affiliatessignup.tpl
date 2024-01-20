
{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $affiliatesystemenabled}
        <div class="main-banner banner-{$siteBannerStyle} banner-home banner-center">
            <div class="container">
                <div class="banner-content">
                    <h1 class="banner-title">{$LANG.affiliatesignuptitle}!</h1>
                    <p class="banner-desc">{$LANG.affiliatesignupintro|replace:"..":""}</p>
                    <div class="banner-actions">
                        <form method="post" action="affiliates.php">
                            <input type="hidden" name="activate" value="true"/>
                            <input id="activateAffiliate" type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-lg btn-primary{if $siteBannerStyle == 'primary'}-faded{/if}">
                        </form>
                    </div>
                </div>
            </div>
            {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-bg"} 
        </div>
        <div class="main-body">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="feature feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="track"}  
                            </div>
                            <h2 class="feature-title">{$rslang->trans('affiliates.visitors.title')}</h2>
                            <p class="feature-desc">{$rslang->trans('affiliates.visitors.desc')}</p>
                            <small class="text-faded">{$rslang->trans('affiliates.visitors.info')}</small>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="feature feature-boxed">
                            <div class="feature-icon">    
                                {include file="$template/includes/common/svg-icon.tpl" icon="comissions"}
                            </div>
                            <h2 class="feature-title">{$rslang->trans('affiliates.pay_commissions.title')}</h2>
                            <p class="feature-desc">{$rslang->trans('affiliates.pay_commissions.desc')}</p>
                            <small class="text-faded">{$rslang->trans('affiliates.pay_commissions.info')} <a href="{$systemurl}contact.php">{$LANG.contactus|lower}</a> .</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {else}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textcenter=true}
    {/if}
{/if}