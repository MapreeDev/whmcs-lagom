<?php

use WHMCS\Database\Capsule;
use RSThemes\Service\WhmcsHelper;
use \RSThemes\Extensions\PromoBannersExtension as Banner;



add_hook('ClientAreaPage', -1, function ($vars) {
    if (Capsule::schema()->hasTable("rsextension_promobanners_slides") && Capsule::schema()->hasTable("rsextension_translation_content")) {
        return [
            'promoBannerStatus' => Capsule::table('tblconfiguration')->where('setting', 'lagom2_promobanners_exstatus')->select('value')->first()->value,
            'promoSliderExtension' => Banner::getSlides(),
            'promotionClose' => Capsule::table('tblconfiguration')->where('setting', 'lagom2_promobanners_banner_close')->select('value')->first()->value,
            'promotionCloseTime' => Capsule::table('tblconfiguration')->where('setting', 'lagom2_promobanners_banner_close_time')->select('value')->first()->value,
        ];
    }
});


add_hook('ClientAreaHeadOutput', 1, function($vars) {
    if (Capsule::schema()->hasTable("rsextension_promobanners_slides") && Capsule::schema()->hasTable("rsextension_translation_content")) {
        if($vars['templatefile'] === 'clientareaproducts' || $vars['templatefile'] === 'clientareaproductdetails'){
            return '<style>'. Banner::renderPromotionStyles('v').'</style>';
        }elseif ($vars['templatefile'] === 'clientareahome' || $vars['templatefile'] === 'viewcart' || $vars['isOnePageOrder']) {
            return '<style>' . Banner::renderPromotionStyles('h').'</style>';
        }elseif ($vars['templatefile'] === 'homepage') {
            return '<style>' . Banner::renderPromotionStyles('index').'</style>';
        }
    }
});
