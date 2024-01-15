    
    {include file="$template/includes/common/layouts-vars.tpl"}
    
    {if !$skipMainBody && !$isOnePageOrder}
        {if !$inShoppingCart}</div></div>{/if}
            </div>
        </div>
    {/if}

    {if file_exists("templates/$template/core/layouts/footer/{$RSThemes['footer-layouts'].name}/footer.tpl")}
        {include file="{$template}/core/layouts/footer/{$RSThemes['footer-layouts'].name}/footer.tpl"}
    {/if}

    {if !$skipMainFooter}
        <div class="main-footer{if $RSThemes['footer-layouts']['vars']['type'] == 'extended'} main-footer-extended{/if}{if $RSThemes['footer-layouts']['vars']['footerClass']} {$RSThemes['footer-layouts']['vars']['footerClass']}{/if}">
            {if $RSThemes['footer-layouts']['vars']['type'] == 'extended'}
            <div class="footer-top">
                <div class="container">
                    <div class="footer-company">
                        <div class="footer-company-intro">
                            {include file="$template/includes/common/logo.tpl" customClass="footer-company-logo" ignoreMobileVersion="true" footerLogo=true}  
                            <p class="footer-company-desc">{$rslang->trans('footer_extended.footer_desc')}</p>
                        </div>
                        {if $rsFooter.social}
                            <ul class="footer-company-socials footer-nav footer-nav-h">
                                {foreach from=$rsFooter.social item=$footerLink}
                                    <li class="{if $footerLink.style != "icon"}footer-social-wide{/if}">
                                        <a class="{$footerLink.custom_classes}" href="{$footerLink.url}" {if $footerLink.target_blank}target="_blank"{/if}>
                                            {if $footerLink.icon}
                                                <i class="{$footerLink.icon}"></i>
                                            {elseif $footerLink.predefined_icon}  
                                                {$footerLink.predefined_icon}
                                            {/if}
                                            {if $footerLink.name}
                                                <span>{$footerLink.name}</span>
                                            {/if}
                                        </a>
                                    </li>
                                {/foreach}
                            </ul>
                        {/if}
                    </div>
                    {if $rsFooter.primary}
                        <div class="footer-site-map">
                            <div class="row">
                                {foreach from=$rsFooter.primary item=$footerLink}
                                    <div class="footer-col {$footerLink.custom_classes} col-md-{$footerPrimaryCol}">
                                        {if $footerLink.children && $footerLink.children|count > 0}
                                            <h3 class="footer-title collapsed" data-toggle="collapse" data-target="#footer-nav-{$footerLink@index}" aria-expanded="false" aria-controls="footer-nav-{$footerLink@index}">
                                                {if $footerLink.icon}
                                                    <i class="{$footerLink.icon}"></i>
                                                {elseif $footerLink.predefined_icon}  
                                                    <span>{$footerLink.predefined_icon}</span>
                                                {/if}
                                                {if $footerLink.name}{$footerLink.name}{/if}
                                                <i class="footer-icon">
                                                    <svg width="18" height="11" viewBox="0 0 18 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M9.21 10.01H8.79C8.66 10.01 8.53 9.96 8.44 9.86L0.14 1.57C0.04 1.48 0 1.34 0 1.22C0 1.1 0.05 0.97 0.15 0.87L0.86 0.16C1.06 -0.0400002 1.37 -0.0400002 1.57 0.16L9 7.6L16.43 0.15C16.63 -0.05 16.94 -0.05 17.14 0.15L17.85 0.86C18.05 1.06 18.05 1.37 17.85 1.57L9.56 9.86C9.47 9.95 9.34 10.01 9.21 10.01Z" fill="#B9BDC5"/>
                                                    </svg>
                                                </i>
                                            </h3>
                                            <ul class="footer-nav collapse" id="footer-nav-{$footerLink@index}">
                                                {foreach from=$footerLink.children item=$footerChild}
                                                    <li>
                                                        <a href="{$footerChild.url}" class="nav-link {$footerChild.custom_classes}" {if $footerChild.target_blank}target="_blank"{/if}>
                                                            {if $footerChild.icon}
                                                                <i class="{$footerChild.icon}"></i>
                                                            {elseif $footerChild.predefined_icon}  
                                                                {$footerChild.predefined_icon}
                                                            {/if}
                                                            {if $footerChild.name}<span>{$footerChild.name}</span>{/if}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        {else}
                                            <a class="footer-title {$footerLink.custom_classes}" href="{$footerLink.url}" {if $footerLink.target_blank}target="_blank"{/if}>
                                                {if $footerLink.icon}
                                                    <i class="{$footerLink.icon}"></i>
                                                {elseif $footerLink.predefined_icon}  
                                                    {$footerLink.predefined_icon}
                                                {/if}
                                                {if $footerLink.name}<span>{$footerLink.name}</span>{/if}
                                            </a> 
                                        {/if}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}  
                </div>
            </div>
            {/if}
            <div class="footer-bottom">
                <div class="container">
                    <div class="footer-copyright">{lang key="copyrightFooterNotice" year=$date_year company=$companyname}</div>
                    {if $rsFooter.secondary}
                        <ul class="footer-nav footer-nav-h">
                            {foreach from=$rsFooter.secondary item=$footerLink}
                                <li {if $footerLink.type == "language" || $footerLink.type == "currencies"} class="dropdown dropup"{/if} {if $footerLink.type == "language"}data-language-select{/if}>
                                    <a {if $footerLink.custom_classes}class="{$footerLink.custom_classes}"{/if} {if $footerLink.type == "language" || $footerLink.type == "currencies"}data-toggle="dropdown"{/if} href="{$footerLink.url}" {if $footerLink.target_blank}target="_blank"{/if}>
                                        {if $footerLink.icon}
                                            <i class="{$footerLink.icon}"></i>
                                        {elseif $footerLink.predefined_icon}  
                                            {$footerLink.predefined_icon}
                                        {/if}
                                        {if $footerLink.type == "language" && $footerLink.name}
                                            {$footerLink.name}
                                        {elseif $footerLink.name}   
                                            <span>{$footerLink.name}</span>
                                        {/if}
                                        {if $footerLink.type == "language" || $footerLink.type == "currencies"}
                                            <b class="ls ls-caret"></b>
                                        {/if}
                                    </a>
                                    {if $footerLink.type == "language"}
                                        {include file="$template/includes/common/language-chooser-dropdown.tpl"}
                                    {/if}
                                    {if $footerLink.type == "currencies"}
                                        {include file="$template/includes/common/currency-dropdown.tpl"}
                                    {/if}
                                </li>
                            {/foreach}
                        </ul>
                    {/if}
                </div>
            </div>
        </div>
    {/if}
</div> {* close app main *}    
    {if $RSThemes.addonSettings.show_cookie_box == 'displayed'} 
        <div class="cookie-bar cookie-bar--{$RSThemes.addonSettings.cookie_box_position} {if $RSThemes.addonSettings.cookie_box_position == 'bottom'}container{/if}" data-cookie data-cookie-name="cookie_bar" data-cookie-exp-time="365" data-delay="2000">
            <div class="cookie-bar__content">
                <div class="cookie-bar__icon">
                    {include file="$template/includes/common/svg-icon.tpl" icon="cookie_bites"}  
                </div>
                <div class="cookie-bar__desc">
                    {if empty($RSThemes.addonSettings.cookie_box_message[$activeLocale.language])}
                        {$RSThemes.addonSettings.cookie_box_message[\WHMCS\Config\Setting::getValue("Language")]|unescape:"html"}
                    {else}
                        {$RSThemes.addonSettings.cookie_box_message[$activeLocale.language]|unescape:"html"}
                    {/if}
                </div>
                <div class="cookie-bar__action">
                    <button class="btn btn-primary" data-close>{$LANG.continue}</button>
                </div>
            </div>
        </div>
    {/if}
    <div id="fullpage-overlay" class="hidden">
        <div class="outer-wrapper">
            <div class="inner-wrapper">
                <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
                <br>
                <span class="msg"></span>
            </div>
        </div>
    </div>
    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                    <h5 class="modal-title"></h5>
                </div>
                <div class="modal-body">
                    <div class="loader">
                        {include file="$template/includes/common/loader.tpl"}
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary modal-submit">
                        {$LANG.submit}
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                    {$LANG.close}
                    </button>
                </div>
            </div>
        </div>
    </div>

    {if $lagomClientAlerts->footer}
        {$lagomClientAlerts->footer}
    {/if}
    {include file="$template/includes/generate-password.tpl"}

    {$footeroutput}
    <div class="overlay"></div>
    <script src="{$WEB_ROOT}/templates/{$template}/assets/js/vendor.js?v={$RSThemes['templateVersion']}"></script>
    <script src="{$WEB_ROOT}/templates/{$template}/assets/js/lagom-app.js?v={$RSThemes['templateVersion']}"></script>
    <script src="{$WEB_ROOT}/templates/{$template}/assets/js/whmcs-custom.min.js?v={$RSThemes['templateVersion']}"></script>
</body>
</html>