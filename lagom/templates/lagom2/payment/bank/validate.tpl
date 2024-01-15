{if file_exists("templates/$template/payment/bank/overwrites/validate.tpl")}
    {include file="{$template}/payment/bank/overwrites/validate.tpl"}  
{else} 
    {if !$hasRemoteInput}
        <script>
            var stateNotRequired = true,
                paymentForm = '';

            function validateBankAccountInput(e)
            {
                var newOrExisting = jQuery('input[name="paymethod"]:checked').val(),
                    submitButton = jQuery('#btnSubmit'),
                    submit = true,
                    accountNumber = jQuery('#inputBankAcctNum');

                submitButton.prop('disabled', true).addClass('disabled').find('span').toggle();

                paymentForm.find('.form-group').removeClass('has-error');
                paymentForm.find('.field-error-msg').hide();

                if (newOrExisting === 'new') {
                    var accountHolderName = jQuery('#inputBankAcctHolderName'),
                        bankName = jQuery('#inputBankName'),
                        routingNumber = jQuery('#inputBankRoutingNum');
                    if (!accountHolderName.val()) {
                        accountHolderName.showInputError();
                        submit = false;
                    }
                    if (!bankName.val()) {
                        bankName.showInputError();
                        submit = false;
                    }
                    if (!routingNumber.val()) {
                        routingNumber.showInputError();
                        submit = false;
                    }
                    if (!accountNumber.val()) {
                        accountNumber.showInputError();
                        submit = false;
                    }
                }
                if (!submit) {
                    setTimeout(function(){ 
                        submitButton.prop('disabled', false).removeClass('disabled');
                        submitButton.find('span').removeClass('invisible hidden').css('display','block');
                        submitButton.find('.loader').css('display','none');
                    }, 500);            
                    e.preventDefault();
                }
            }

            jQuery(document).ready(function() {
                paymentForm = jQuery('#frmPayment');
                paymentForm.off('submit');
                paymentForm.on('submit', validateBankAccountInput);
                jQuery('.paymethod-info input[name="paymethod"]').on('ifChecked', function() {
                    if (jQuery(this).val() === 'new') {
                        showNewAccountInputFields();
                    } else {
                        hideNewAccountInputFields();
                    }
                });

                jQuery('#billingAddressChoice input[name="billingcontact"]').on('ifChecked', function() {
                    if (jQuery(this).val() === 'new') {
                        showNewBillingAddressFields();
                    } else {
                        hideNewBillingAddressFields();
                    }
                });

                paymentForm.find('#inputBankRoutingNum').payment('restrictNumeric');
                paymentForm.find('#inputBankAcctNum').payment('restrictNumeric');
            });
        </script>
        <script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
        <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
    {else}
        <script>
            jQuery(document).ready(function() {
                jQuery('.paymethod-info input[name="paymethod"]').on('ifChecked', function() {
                    if (jQuery(this).val() === 'new') {
                        jQuery('#newCardInfoTab .loader').removeClass('hidden');
                        if (window.location.toString().match(/\?/)) {
                            window.location = window.location + '&ccinfo=new';
                        } else {
                            window.location = window.location + '?ccinfo=new';
                        }
                        return true;
                    }
                });
            });
        </script>
    {/if}
{/if}    
