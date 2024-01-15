{if file_exists("templates/$template/store/ssl/shared/overwrites/features.tpl")}
    {include file="{$template}/store/ssl/shared/overwrites/features.tpl"}  
{else}
    <div class="site-section">
        <div class="container">
            <div class="features features-boxes row row-eq-height">
                {if $type == 'ev'}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="blogging"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ev.visualVerification'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.ev.visualVerificationDescription'}</p>
                        </div>
                    </div>
                {elseif $type == 'ov'}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="blogging"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ov.ov'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.ov.ovDescription'}</p>
                        </div>
                    </div>
                {else}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="icon-automatic-daily-backup"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.delivery'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.deliveryDescription'}</p>
                        </div>
                    </div>
                {/if}
                <div class="col-sm-4">
                    <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="strongest-fastest-SSL"}
                            </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.siteSeal'}</h4>
                        <p class="feature-desc">{lang key='store.ssl.shared.siteSealDescription'}</p>
                    </div>
                </div>
                {if $type == 'ev'}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ev.warranty'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.ev.warrantyDescription'}</p>
                        </div>
                    </div>
                {elseif $type == 'ov'}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="organization-validation"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ov.warranty'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.ov.warrantyDescription'}</p>
                        </div>
                    </div>
                {else}
                    <div class="col-sm-4">
                        <div class="feature feature-lg feature-boxed">
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.googleRanking'}</h4>
                            <p class="feature-desc">{lang key='store.ssl.shared.googleRankingDescription'}</p>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    <div class="site-section">
        <div class="container">
            <h2 class="section-title">{lang key='store.ssl.shared.features'}</h2>
            <div class="features row">
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="encryp-sensitive-data"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.encryptData'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="secure-online-transactions"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.secureTransactions'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="prove-legitimacy"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.legitimacy'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="strongest-fastest-SSL"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.fastestSsl'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="99.9-browser-compatibility"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.browserCompatability'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="increase-SEO-rank"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.seoRank'}</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        {if $type == 'ev'}
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="issued-in-1-2-days"}  
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ev.issuance'}</h4>
                        {elseif $type == 'ov'}
                            <div class="feature-icon">
                                {include file="$template/includes/common/svg-icon.tpl" icon="issued-in-1-2-days"}  
                            </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.ov.issuance'}</h4>
                        {else}
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="instant-issuance"}  
                        </div>
                            <h4 class="feature-title">{lang key='store.ssl.shared.issuance'}</h4>
                        {/if}
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="feature mob-feature-left">
                        <div class="feature-icon">
                            {include file="$template/includes/common/svg-icon.tpl" icon="free-reissues"}  
                        </div>
                        <h4 class="feature-title">{lang key='store.ssl.shared.freeReissues'}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}    