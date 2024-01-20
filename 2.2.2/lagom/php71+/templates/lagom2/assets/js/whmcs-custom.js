$(document).ready(function(){
    $('[data-lagom-href]').on('click', function(e){
        e.preventDefault();
        if (!$(e.currentTarget).is('form')){
            document.location.href=$(this).data('lagom-href');
        }
    })
    $('[submit-form]').on('click', function(){
        $(this).closest('form').submit();
    });

   

    $("#subaccountActivate input").on('ifToggled', function(event){
        $("#subacct-container").collapse('toggle');
    });

    $("#inputAllowSso").on('change', function() {
        var loader = $(this).closest('.panel-switch').find('.loader')
        loader.fadeIn(400);
        WHMCS.http.jqClient.post("clientarea.php", jQuery("#frmSingleSignOn").serialize()).promise().done(function(){
            loader.fadeOut(400);
        });
    });

    $(document).on('click', '[data-trigger-click]', function(e){
        e.preventDefault;
        var target = $(this).data('target');
        $('body').find(target).trigger('click');
    });

    $('[data-form]').on('click', function(e){
        e.preventDefault;
        var target = $(this).data('form');
        $('body').find(target).submit();
    });

    var context = $('.list-group-tab-nav, .page-clientareadomaindetails #Overview');
    var prefix = "#tab";

    var settings = $.extend({
        getHashCallback: function (hash) {
            return hash;
        }
    });
    $('a', context).on('click', function () {
		if ($(this).data('toggle') === 'tab') {
			var hash = this.hash;
            var selector = hash ? 'a[href*="' + hash + '"]' : 'li:first-child > a';
            var hashReplace = hash.replace('tab','');
			$(context).find('.active').removeClass('active');
            $('body').find(selector).addClass('active');            
            $('body').find(hashReplace).addClass('active').siblings('.tab-pane').removeClass('active');
			window.location.hash = settings.getHashCallback(hash);
        }
    });

    if(window.location.hash && context.length > 0) {
        var hash = window.location.hash;
        var selector = hash ? 'a[href*="' + hash + '"]' : 'li:first-child > a';
        $('body').find(selector).addClass('active');
        var hashReplace = hash.replace('tab','');
        $('body').find(hashReplace).addClass('active').siblings('.tab-pane').removeClass('active');
    }

	
    $(document).on('click', '[data-btn-loader]', function(){
        $(this).find('span').not('.loader').addClass('invisible');
        $(this).find('.loader').removeClass('hidden');
    });
    $(document).on('click', '.btn-checkout', function(){
        var id = $(this).prop('id');
        if($(this).attr('type') == "submit" && id != "btnCompleteProductConfig"){
            $(this).closest('form').submit();
            $('.btn-checkout').addClass('disabled').prop('disabled', true);
        }
    });

    $('[data-cc-popover-show]').on('mouseenter', function(){
        $(this).siblings('[data-cc-popover]').addClass('fade in').show();
    });
    $('[data-cc-popover-show]').on('mouseout', function(){
        $(this).siblings('[data-cc-popover]').removeClass('fade in').hide();
    });

    $('[data-radio-tab]').on('click', function(){
        if ($(this).data('radio-target') != "undefined" ){
            let target = $(this).data('radio-target');
            $(target).iCheck('check');
        }
        else{
            $(this).find('input[type="radio"]').iCheck('update');
        }
    });

    if($('.payment-form').length > 0){
        var iframe = $('.payment-form').find('iframe');
        if(iframe.length > 0){           
            $('.modal').on('show.bs.modal', function(){
                $('.main-content, .main-content .sidebar, .main-content .panel-payment, .main-content .sticky-sidebar-inner').css('position','static');
            });
            $('.modal').on('hide.bs.modal', function(){
                $('.main-content, .main-content .sidebar, .main-content .panel-payment, .main-content .sticky-sidebar-inner').removeAttr('style');
            });
            $('.page-viewinvoice .main-body .payment-form > .modal').each(function () {
                $('body').append(this);
                $(this).remove;
            });
        }
        else{
            $('.page-viewinvoice .main-body .modal').each(function () {
                $('body').append(this);
                $(this).remove;
            });
        }
        var displayButton = $('.payment-form').data('display-button');
        if (displayButton){
            var btntext = $('.payment-form').data('btntext');
            var btnsubscribetext = $('.payment-form').data('btnsubscribetext');
            $('.payment-form').find('input[type="image"]').attr('type','submit').attr('value', btntext);
            $('#paynow').html(btntext).attr('style','color: #fff').addClass('btn');

            var formCount = $('.payment-form').find('form').length;
            if (formCount == 2){
                let firstForm = $('.payment-form').find('form:first').html(),
                    secondForm = $('.payment-form').find('form').eq(1).html(),
                    firstResult = false,
                    secondResult = false;
                
                if (firstForm.length){
                    firstResult = firstForm.includes("subscr");
                }
                if (secondForm.length){
                    secondResult = secondForm.includes("subscr");   
                }
                if (firstResult){
                    $('.payment-form').find('form:first').find('input[type="submit"]').attr('value', btnsubscribetext);
                }
                if (secondResult){
                    $('.payment-form').find('form').eq(1).find('input[type="submit"]').attr('value', btnsubscribetext);
                }
            }
        }
    }

    var checkAll = $('.btn-check-all');
    var checkboxes = $('.check-all-container input[type="checkbox"]').not(':disabled');
    checkAll.on('click', function (e) {
        e.preventDefault();
        var checkalltext = $(this).data('checkalltext');
        var uncheckalltext = $(this).data('uncheckalltext');
        if ($(this).hasClass('checked')){
            checkboxes.iCheck('uncheck');
            $(this).removeClass('checked');
            $(this).text(checkalltext);
        } else {
            checkboxes.iCheck('check');
            $(this).addClass('checked');
            $(this).text(uncheckalltext);
        }
    });

    $('input[name="canchangepin"]').closest('div').addClass('checkbox').css('margin-top','-5px');
    $('input[name="canchangepin"]').iCheck({
        checkboxClass: 'checkbox-styled',
        radioClass: 'radio-styled',
        increaseArea: '40%'
    });

    jQuery('.ssl-status.ssl-sync').each(function () {
        var self = jQuery(this);       
        WHMCS.http.jqClient.post(
            WHMCS.utils.getRouteUrl('/domain/ssl-check'),
            {
                'type': self.closest('.ssl-info').data('type'),
                'domain': self.closest('.ssl-info').data('domain'),
                'token': csrfToken
            },
            function (data) {
                if (data.invalid) {
                    self.hide();
                } else {
                    var template = self.data('maintemplate');
                    if (template == 'undefined'){
                        template = "lagom"
                    }
                    var newDataImage = data.image.replace('assets/img/ssl/','templates/'+template+'/assets/img/ssl/12x12/');
                    newDataImage = newDataImage.replace('.png','.svg');
                   
                    self.replaceWith(
                         '<img src="' + newDataImage + '" data-toggle="tooltip" title="' + data.tooltip + '" class="' + data.class + '">'
                    );
                }
            }
        );
    });

    $('.alert-dismissible').on('close.bs.alert', function(){
        $('[data-toggle="tooltip"]').tooltip('hide');
    });

    $('#openTicketSubmit').on('click', function(){
        $(this).prop('disabled',true);
        $(this).closest('form').submit();
    })

    $('#frmDomainHomepage input[type="submit"]').on('click', function(e){
        e.preventDefault();
        var value = $('#frmDomainHomepage [name="domain"]').val();
        value = value.replace(/\s/g, '');
        $('#frmDomainHomepage [name="domain"]').val(value)
        $('#frmDomainHomepage').submit();
    });

   
    $('#modalAjax, #modalGeneratePassword').removeAttr('style');
    

    $('[data-fixed-actions]').luScrollTo({
        onScreen: function onScreen(element, target) {
            $(element).stop().removeClass('is-fixed');
        },
        outScreen: function outScreen(element, target) {
            $(element).stop().addClass('is-fixed');
        }
    });


    if ($('#domain-filter').length && $('#tableDomainPricing').length){
        let selectize = $('#domain-filter')[0].selectize;
        let table = jQuery('#tableDomainPricing').DataTable();
        selectize.refreshOptions(false);
        
        selectize.on('change', function(e){
            let values = selectize.getValue();
            
            var hasAll = false;
            var allSelected = false;
            var allKey = false;
            
            var last = Object.keys(values)[Object.keys(values).length-1];
            
            var size = Object.keys(values).length;

            if (size > 0){
                for (const [key, value] of Object.entries(values)) {
                    if (value == "All"){
                        hasAll  = true;
                    }
                    if (last == key && key != 0  && value == "All"){
                        allSelected = true;
                    }
                }
                if (allSelected === true){ 
                    selectize.setValue("All", 1);
                }
                else if(hasAll === true){
                    delete values[0];
                    selectize.setValue(values);
                }
            }
            else{
                selectize.setValue("All", 1);
            }
            
            var val = values.toString();
            var newVal = val.replace(/,/g, '|');
            if (newVal.charAt(0) === '|'){
                newVal = newVal.substring(1);
            }
            table.column(1).search(newVal, true, false).draw();
        });  
    }

    


    /* dashboard - active services panel actions */
    jQuery('.list-group-item-content').on('click', function (event) {
        var element = jQuery(event.target);
        if (element.is('.dropdown-toggle, .dropdown-toggle > span, .dropdown-toggle > i, .dropdown-menu')) {
            return true;
        }
        if (element.hasClass('btn-custom-action')) {
            event.stopPropagation();
            if (!element.data('active')) {
                return false;
            }
            return true;
        }
        window.location.href = element.closest('.list-group-item-content').data('href');
        return false;
    });

    jQuery('').on('click', function(event) {
        return customActionAjaxCall(event, jQuery(event.target))
    });


    jQuery('.div-service-item').on('click', function (event) {
        var element = jQuery(event.target);
        if (element.is('.dropdown-toggle, .dropdown-menu')) {
            return true;
        }
        if (element.hasClass('btn-custom-action')) {
            return customActionAjaxCall(event, element);
        }
        window.location.href = element.closest('.div-service-item').data('href');
        return false;
    });



    jQuery(document).on('click', '.dropdown-menu[data-service-id], div[menuitemname="Service Details Actions"] a[data-identifier][data-serviceid][data-active="1"]', function (event) {
        console.log(event)
        var element = jQuery(event.target);
        if (element.is('.dropdown-menu')) {
            return false;
        }
        if (!element.hasClass('disabled')){
            element.attr('disabled', 'disabled').addClass('disabled');
            jQuery('.loading', element).show();
            if (element.data('serviceid')){
                WHMCS.http.jqClient.jsonPost({
                    url: WHMCS.utils.getRouteUrl(
                        '/clientarea/service/' + element.data('serviceid') + '/custom-action/' + element.data('identifier')
                    ),
                    data: {
                        'token': csrfToken
                    },
                    success: function(data) {
                        if (data.success) {
                            window.open(data.redirectTo);
                        } else {
                            window.open('clientarea.php?action=productdetails&id=' + element.data('serviceid') + '&customaction_error=1');
                        }
                    },
                    fail: function () {
                        window.open('clientarea.php?action=productdetails&id=' + element.data('serviceid') + '&customaction_ajax_error=1');
                    },
                    always: function() {
                        jQuery('.loading', element).hide();
                        element.removeAttr('disabled').removeClass('disabled');
                        if (element.hasClass('dropdown-item')) {
                            element.closest('.dropdown-menu').removeClass('show');
                        }
                    },
                });
                return true;
            }
            else{
                window.location.href = element.closest('[data-service-id]').data('href');
            }
        }    
    });

    $('.page-clientareahome .list-group').on('scroll', function(){
        $('body').trigger('click');
    })

    $('.page-clientareahome .list-group-item-dropdown').on('show.bs.dropdown', function () {
        var dropdownmenu = $(this).find('.dropdown-menu');
        if (window.innerWidth > 619){
            var leftPosition = $(this).offset().left - 94;
        }
        else{
            var leftPosition = $(this).offset().left;
        }
        $('body').append(dropdownmenu.css({
            position:'absolute',
            left:leftPosition, 
            top:$(this).offset().top + 36
        }).detach());
    });

    $(window).on('load resize', function(){
        let servicesPanel = $('.panel-active-services');
        if (servicesPanel.length){
            let listGroup = servicesPanel.find('.list-group'),
                items = listGroup.find('.list-group-item');
            if (((items.innerHeight() * items.length) + (items.length - 1))  < 324){
                listGroup.removeClass('has-scroll');
            }
            else{
                listGroup.addClass('has-scroll');
            }
        }
    });
      
    $('.page-clientareahome .list-group-item-dropdown').on('hidden.bs.dropdown', function () {
        var dropdownmenu = $('body > [data-service-id]');
        var id = $('body > [data-service-id]').data('service-id');
        
        $('.list-group-item-dropdown[data-service-id="'+id+'"]').append(dropdownmenu.css({
            position:'absolute', left:'0', top:'100%'
        }).detach());
    });

    $(window).on('resize', function(){
        if ($('body').hasClass('page-clientareahome')){
            $('body').trigger('click');
        }
    })
      
    $('[data-auto-renew-switch]').on('click', function(e){  
        e.preventDefault();
        var label = $(this);
        var input = $(this).find('.switch__checkbox--domain');
        var domainUrl = input.data('action');

        input.prop('disabled', true).addClass('is-loading');
        label.addClass('is-loading');
        label.parent().parent().parent().addClass('prevent-click');
        setTimeout(function(){
            var renewData = {
                id: input.data('domainid'),
                sub: input.data('domainsub'),
                autorenew: input.attr('data-domainautorenew'),
                token: input.data('token'),
            };
    
            if(input.attr('data-domainautorenew') == 'disable'){
                input.attr('data-domainautorenew', 'enable');
    
            }else{
                input.attr('data-domainautorenew', 'disable');
            }
    
            $.ajax({
                type: "POST",
                url: domainUrl,
                data: renewData,
                success: function(data){
                    input.prop('disabled', false).removeClass('is-loading');
                    label.removeClass('is-loading').removeAttr('disabled');
                    label.parent().parent().parent().removeClass('prevent-click');
                    if(!input.is(':checked')){
                        input.prop('checked', true);
                    }else{
                        input.prop('checked', false);
                    }
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
                
            });
        }, 100);
    })
});