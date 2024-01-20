{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    {if $showRemoteInput}
        <div id="frmRemoteCardProcess" class="text-center" align="center">
            {$remoteInput}
            <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
        </div>

        <script language="javascript">
            jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
            setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
        </script>
    {else}
        {include file="$template/payment/$cardOrBank/validate.tpl"}
        <form id="frmPayment" method="post" action="{$submitLocation}" class="main-content w-100 {if $mainContentClasses}{$mainContentClasses}{/if}" role="form">
            <input type="hidden" name="invoiceid" value="{$invoiceid}" />
            <div class="main-content  main-content-m-w">
                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}
                <div class="alert alert-lagom alert-danger text-center gateway-errors w-hidden"></div>
                <div class="section">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.paymentmethod}</h2>
                    </div>
                    <div class="section-body cc-input-container">
                        <div class="panel panel-form paymethod-info">
                            {include file="$template/payment/$cardOrBank/select.tpl"}
                        </div> 
                    </div>    
                </div>
                {if $servedOverSsl}
                    <div class="section">
                        <div class="section-body">
                            <div class="alert alert-lagom alert-warning checkout-security-msg">
                                <div class="alert-body">
                                    <i class="ls ls-lock"></i>
                                    {lang key='creditcardsecuritynotice'}
                                </div>
                            </div>
                        </div>
                    </div> 
                {/if}   
            </div>
            {include file="$template/payment/invoice-summary.tpl"}
        </form>            
        {literal}
            <script type="text/javascript">
                jQuery(document).ready(function() {
                    jQuery('#inputCardCvv, #inputCardNumber').filter(':visible').first().focus();
                    jQuery('[data-simple-radio-tab]').on('click', function(){
                        $(this).find('input[type="radio"]').iCheck('check');
                        if ($(this).attr('href') == "#existingCardInfo"){
                            $('#existingCardInfo').find('.cc-item.active').removeClass('active');
                            $('#existingCardInfo').find('input[type="radio"]').not(':disabled').first().iCheck('check').closest('.cc-item').addClass('active');
                        }
                    });
                    $('.cc-item').on('click', function(){
                        $('.cc-item').removeClass('active');
                        $(this).addClass('active');
                        $(this).find('input[type=radio]').iCheck('check');
                    });
                    let creditCards = $('#existingCardInfo').find('input[type="radio"]');
                    if (creditCards.length > 0){
                        setTimeout(function(){
                            $(creditCards).each(function(){
                                if ($(this)[0].checked == true){
                                    $(this).closest('.cc-item').addClass('active');
                                }
                            });
                        }, 0) 
                    }
                });
                if ($('.gateway-errors').length > 0) {
                    function mutate(mutations) {
                        mutations.forEach(function(mutation) {
                            if ((!$(mutation.target).hasClass('w-hidden') || $(mutation.target).attr('style').includes("display: block;")) && ($(mutation.target)[0].innerText != "") || $(mutation.target).not(':empty')){
                                $('#btnSubmit .loader').addClass('hidden');
                                $('#btnSubmit span').removeClass('invisible hidden');
                                $('#btnSubmitMob .loader').addClass('hidden');
                                $('#btnSubmitMob span').removeClass('invisible hidden');
                            }
                           
                        });
                    }
               
                    var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;
                    var target = document.querySelector('.gateway-errors');
                    var observer = new MutationObserver( mutate );
                    var config = { characterData: false, attributes: false, childList: true, subtree: true };

                    observer.observe(target, config);
                }
            </script>
        {/literal}
    {/if}    
{/if}    