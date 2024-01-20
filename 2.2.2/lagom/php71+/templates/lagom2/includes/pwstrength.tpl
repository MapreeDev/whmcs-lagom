{if file_exists("templates/$template/includes/overwrites/pwstrength.tpl")}
    {include file="{$template}/includes/overwrites/pwstrength.tpl"}  
{else}   
    <div class="password-content password-content-group">
         <button type="button" class="btn btn-default btn-sm generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
            <i class="ls ls-refresh"></i>{$LANG.generatePassword.btnLabel}
        </button>
    </div>
   
    <script type="text/javascript">
    jQuery("#inputNewPassword1").keyup(function() {


    if(typeof window.langPasswordWeak === 'undefined'){
        window.langPasswordWeak = "{$LANG.pwstrengthweak}";
    }
    if(typeof window.langPasswordModerate === 'undefined'){
        window.langPasswordModerate = "{$LANG.pwstrengthmoderate}";
    }
    if(typeof window.langPasswordStrong === 'undefined'){
        window.langPasswordStrong = "{$LANG.pwstrengthstrong}";
    }
    if(typeof window.tooShort === 'undefined'){
        window.langPasswordTooShort = "at least 5 characters";
    }

    {if isset($pwStrengthErrorThreshold)}
        var pwStrengthErrorThreshold = {$pwStrengthErrorThreshold};
    {else}
        var pwStrengthErrorThreshold = 50;
    {/if}
    {if isset($pwStrengthWarningThreshold)}
        var pwStrengthWarningThreshold = {$pwStrengthWarningThreshold};
    {else}
        var pwStrengthWarningThreshold = 75;
    {/if}

        var $newPassword1 = jQuery("#newPassword1");
        var pw = jQuery("#inputNewPassword1").val();
        var pwlength=(pw.length);
        if(pwlength > 4){
            $('#passwordStrengthBar').show();
            if(pwlength>5)pwlength=5;
            var numnumeric=pw.replace(/[0-9]/g,"");
            var numeric=(pw.length-numnumeric.length);
            if(numeric>3)numeric=3;
            var symbols=pw.replace(/\W/g,"");
            var numsymbols=(pw.length-symbols.length);
            if(numsymbols>3)numsymbols=3;
            var numupper=pw.replace(/[A-Z]/g,"");
            var upper=(pw.length-numupper.length);
            if(upper>3)upper=3;
            var pwstrength=((pwlength*10)-20)+(numeric*10)+(numsymbols*15)+(upper*10);
            if (pwstrength < 0) pwstrength = 0;
            if (pwstrength > 100) pwstrength = 100;
            
            $newPassword1.removeClass('has-error has-warning has-success');
            jQuery("#passwordStrengthBar .progress-bar").removeClass("progress-bar-danger progress-bar-warning progress-bar-success").css("width", pwstrength + "%").attr('aria-valuenow', pwstrength);

            if (pwstrength < pwStrengthErrorThreshold) {
                $newPassword1.addClass('has-error');
                jQuery("#passwordStrengthTextLabel").html(langPasswordWeak).css("color", "#be0f1a");
                jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-danger");
            } else if (pwstrength < pwStrengthWarningThreshold) {
                $newPassword1.addClass('has-warning');
                jQuery("#passwordStrengthTextLabel").html(langPasswordModerate).css("color", "#c59301");
                jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-warning");
            } else {
                $newPassword1.addClass('has-success');
                jQuery("#passwordStrengthTextLabel").html(langPasswordStrong).css("color", "#198810");
                jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-success");
            }
        }
        else{
            $('#passwordStrengthBar').hide();
            jQuery("#passwordStrengthTextLabel").html(langPasswordTooShort);
            jQuery("#passwordStrengthBar .progress-bar").removeClass("progress-bar-danger progress-bar-warning progress-bar-success").removeAttr('style');
        }
        validatePassword2();
    });

    function validatePassword2() {
        var password1 = jQuery("#inputNewPassword1").val();
        var password2 = jQuery("#inputNewPassword2").val();
        var $newPassword2 = jQuery("#newPassword2");

        if (password2 && password1 !== password2) {
            $newPassword2.removeClass('has-success').addClass('has-error');
            jQuery("#inputNewPassword2Msg").html('<p class="help-block" id="nonMatchingPasswordResult">{$LANG.pwdoesnotmatch|escape}</p>');
            {if !isset($noDisable)}jQuery('input[type="submit"]').attr('disabled', 'disabled');{/if}
        } else {
            if (password2) {
                $newPassword2.removeClass('has-error').addClass('has-success');
                {if !isset($noDisable)}jQuery('input[type="submit"]').removeAttr('disabled');{/if}
            } else {
                $newPassword2.removeClass('has-error has-success');
            }
            jQuery("#inputNewPassword2Msg").html('');
        }
    }

    jQuery(document).ready(function(){
        {if !isset($noDisable)}jQuery('.using-password-strength input[type="submit"]').attr('disabled', 'disabled');{/if}
        jQuery("#inputNewPassword2").keyup(function() {
            validatePassword2();
        });
    });

    </script>
{/if}