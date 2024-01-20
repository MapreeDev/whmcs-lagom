$(document).ready(function() {
    $('#inputDomainChooser').multiselect({
        buttonWidth: '250px',
        dropRight: true,
        nonSelectedText: 'Choose domain(s)'
    });

    $('.package-get-started .choose-product button').click(function(e) {
        var product = $(this).data('product');
        $('.package-get-started .choose-product button').removeClass('active');
        $(this).addClass('active');
        $('.package-get-started .additional-options .option').hide();
        $('.package-get-started .additional-options .options-' + product).show();
        $('.package-get-started .price').hide();
        $('.package-get-started .price-' + product).show();
        $('#productKey').val('spamexperts_' + product);
    });

    $('.package-get-started .additional-options input[type="checkbox"]').on('ifChecked',function(e) {
        $('.package-get-started .additional-options input[type="checkbox"]').not($(this)).prop('checked', false).iCheck('update');
        $('.package-get-started .price').hide();
        $('.package-get-started .price-' + $(this).val()).show();
        $('#productKey').val('spamexperts_' + $(this).val());
    });
    $('.package-get-started .additional-options input[type="checkbox"]').on('ifUnchecked',function(e) {
        var product = $('.package-get-started .choose-product button.active').data('product');
        $('.package-get-started .price').hide();
        $('.package-get-started .price-' + product).show();
        $('#productKey').val('spamexperts_' + product);
    });

    $('.btn-buy').click(function(e) {
        e.preventDefault();
        var target = $(this).data('target'),
            pricing = $('#pricing');
        if (target === 'incomingoutgoingarchiving') {
            if (pricing.find('button[data-product="incoming"]').length) {
                pricing.find('button[data-product="incoming"]').click();
            } else {
                pricing.find('button[data-product="outgoing"]').click();
            }
            var option = $('input[name="options"][value="incomingoutgoingarchiving"]').first();
            if (option.is(':checked')) {   
                option.click();
                option.iCheck('uncheck');
            }
            option.click();
            option.iCheck('check');
        } else {
            pricing.find('button[data-product="' + $(this).data('target') + '"]').click();
        }
        smoothScroll('#pricing');
    });
});
