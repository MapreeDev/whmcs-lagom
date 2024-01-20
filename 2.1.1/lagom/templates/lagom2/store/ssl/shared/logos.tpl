{if file_exists("templates/$template/store/ssl/shared/overwrites/logos.tpl")}
    {include file="{$template}/store/ssl/shared/overwrites/logos.tpl"}  
{else}
    <div class="site-section">
        <div class="container">
            <div class="m-w-lg m-h-a">
                <h5 class="section-title">{lang key='store.ssl.shared.trusted'}</h5>
                <div class="logos">
                    <div class="logo">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/rapidssl-logo.png">
                    </div>
                    <div class="logo">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/geotrust-logo.png">
                    </div>
                    <div class="logo">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/symantec-logo.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}