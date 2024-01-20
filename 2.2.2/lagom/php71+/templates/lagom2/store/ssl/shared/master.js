jQuery(document).ready(function(){
    jQuery('.cycle-change').on('click', function() {
        var newCycle = jQuery(this).data('cycle');
        jQuery('.pricing-text').not('.free').hide();
        jQuery('.' + newCycle).removeClass('hidden').show();
        jQuery('.cycle-change').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.section-pricing input[name="billingcycle"]').val(newCycle);
        jQuery('.section-pricing div.package-price').each(function(index) {
            var free = jQuery(this).find('div.free');
            if (jQuery(this).find('div.' + newCycle).length <= 0 && !free.length) {
                jQuery(this).find('div.not-available').removeClass('hidden').show();
                jQuery(this).closest('.package').find('button[type="submit"]').prop('disabled', true);
            } else {
                jQuery(this).find('div.not-available').hide();
                jQuery(this).closest('.package').find('button[type="submit"]').prop('disabled', false);
            }
        });
    });

    var startCycle = jQuery('.btn.cycle-change.active').data('cycle');
    jQuery('.section-pricing input[name="billingcycle"]').val(startCycle);

    $(".product-billing-switcher .dropdown-item").click(function() {
        $(this).closest(".dropdown").prev().dropdown("toggle");
    });

});

$(".product-billing-switcher .dropdown-item").on( "click", function() {
    var cycleText = $(this).text();
    $("#cycle-text").html(cycleText);
});