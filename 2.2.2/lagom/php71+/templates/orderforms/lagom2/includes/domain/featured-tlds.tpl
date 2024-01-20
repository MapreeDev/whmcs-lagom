{if file_exists("templates/orderforms/$carttpl/includes/domain/overwrites/featured-tlds.tpl")}
    {include file="templates/orderforms/$carttpl/includes/domain/overwrites/featured-tlds.tpl"}
{else}
    {if $featuredTlds}
        <div class="section domain-pricing">
            <div class="featured-tlds swiper-tld swiper-container">
                <div class="row swiper-wrapper">
                    {foreach $featuredTlds as $num => $tldinfo}
                    <div class="{if $featuredTlds|@count == 3}col-md-4{else if $featuredTlds|@count >= 4}col-md-3{/if} col-sm-6 swiper-slide">
                            <div class="featured-tld">
                                <div class="img-container">
                                    <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
                                </div>
                                <div class="featured-tld-price {$tldinfo.tldNoDots}">
                                    {if $domainTransfer}
                                        {if is_object($tldinfo.transfer)}
                                                {$tldinfo.transfer}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
                                        {else}
                                            {lang key="domainregnotavailable"}
                                        {/if}
                                    {else}
                                        {if is_object($tldinfo.register)}
                                            {$tldinfo.register}{if $tldinfo.period > 1}{lang key="orderForm.shortPerYears" years={$tldinfo.period}}{else}{lang key="orderForm.shortPerYear" years=''}{/if}
                                        {else}
                                            {lang key="domainregnotavailable"}
                                        {/if}
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    {/if}
{/if}