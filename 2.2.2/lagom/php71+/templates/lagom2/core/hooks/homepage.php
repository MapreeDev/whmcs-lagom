<?php

use WHMCS\Database\Capsule;
use \RSThemes\Extensions\PromoBannersExtension as Banner;
use \WHMCS\Product\Group;
use \Punic\Currency;
use \WHMCS\Domains\Domain;
use WHMCS\Session;
use WHMCS\View\Formatter\Price as Price;

class GetHomeVars
{
    private $table = 'tbldomainpricing';
    private $lang = 'english';
    private $productGroupCache = [];
    private $tldPricingCache = [];
    private $marketConnectCount;
    private $promotionExtensionStatus;
    private $promotionBanner;
    private $currentCurrency;

    public function __construct($vars)
    {
        $this->lang = $vars['activeLocale']['language'];
    }

    public function getMarketConnectCount()
    {
        if (isset($this->marketConnectCount)) {
            return $this->marketConnectCount;
        } else {
            $this->marketConnectCount = Capsule::table('tblmarketconnect_services')->where('settings', 'like', '%client-home":true%')->where('status', 1)->count();
            return $this->marketConnectCount;
        }
    }

    public function getMarketConnect()
    {
        $pdo = Capsule::connection()->getPdo();
        $pdo->beginTransaction();
        try {
            $statement = $pdo->prepare(
                'SELECT `tblmarketconnect_services`.`id`, 
                    `tblproductgroups`.`id` as `gid`, 
                    `tblproducts`.`id` as `pid`,
                    `tblmarketconnect_services`.`name`, 
                    `tblmarketconnect_services`.`settings`,
                    `tblproductgroups`.`slug`, 
                    `tblproductgroups`.`tagline`, 
                    `tblproductgroups`.`headline`, 
                    `tblproductgroups`.`name` as `tabname`
                FROM `tblproductgroups` 
                INNER JOIN `tblproducts` ON `tblproducts`.`gid` = `tblproductgroups`.`id` 
                INNER JOIN `tblmarketconnect_services` ON `tblmarketconnect_services`.`product_ids`
                COLLATE utf8_bin LIKE CONCAT(\'%\',`tblproducts`.`configoption1`, \'%\') 
                WHERE `tblproductgroups`.`tagline` != \'\' 
                AND `tblmarketconnect_services`.`status` = 1 
                AND `tblproducts`.`configoption1` != \'\' 
                AND `tblproducts`.`configoption1` != \'weebly_free\' 
                AND `tblproducts`.`configoption1` != \'weebly_lite\' 
                GROUP BY `tblmarketconnect_services`.`id`'
            );
            $statement->execute();
        } catch (PDOException $e) {
            //echo $e->getMessage();
        }
        if (!is_null($statement)) {
            $list = $statement->fetchAll();
            $pdo->commit();
            $items = [];
            foreach ($list as $item) {
                //translations for tabname, headline, tagline
                $tabNameResult = Capsule::table('tbldynamic_translations')
                    ->select('tbldynamic_translations.translation')
                    ->where('related_id', $item['gid'])
                    ->where('language', $this->lang)
                    ->where('related_type', 'product_group.{id}.name')
                    ->first();
                if ($tabNameResult !== null) {
                    $item['tabname'] = $tabNameResult->translation;
                }
                $headlineResult = Capsule::table('tbldynamic_translations')
                    ->select('tbldynamic_translations.translation')
                    ->where('related_id', $item['gid'])
                    ->where('language', $this->lang)
                    ->where('related_type', 'product_group.{id}.headline')
                    ->first();
                if ($headlineResult !== null) {
                    $item['headline'] = $headlineResult->translation;
                }
                $taglineResult = Capsule::table('tbldynamic_translations')
                    ->select('tbldynamic_translations.translation')
                    ->where('related_id', $item['gid'])
                    ->where('language', $this->lang)
                    ->where('related_type', 'product_group.{id}.tagline')
                    ->first();
                if ($taglineResult !== null) {
                    $item['tagline'] = $taglineResult->translation;
                }
                $items[] = $item;
            }
            return $items;
        }
        return [];
    }

    public function getCurrentCurrency()
    {
        if (isset($this->currentCurrency)) {
            return $this->currentCurrency;
        } else {
            $currencyId = $_SESSION['currency'] ?? getCurrency($_SESSION['uid'], $_SESSION['currency'])['id'] ?? 1;
            return WHMCS\Database\Capsule::table("tblcurrencies")->where('id', $currencyId)->first();
        }
    }

    public function productGroup($groupId = 1)
    {
        GLOBAL $smarty;
        $vars = $smarty->getTemplateVars();
        $specific = false;
        if (isset($vars['RSThemes']['pages'][$vars['templatefile']]['config']['productGroupPriceDisplay']) && $vars['RSThemes']['pages'][$vars['templatefile']]['config']['productGroupPriceDisplay'] != "Cheapest billing cycle"){
            $specific = strtolower($vars['RSThemes']['pages'][$vars['templatefile']]['config']['productGroupPriceDisplay']).'_price';
        }

        $currency = null;
        if(isset($_SESSION['currency']))
            $currency = $_SESSION['currency'];
        $uid=null;
        if(isset($_SESSION['uid']))
            $uid = $_SESSION['uid'];
        $currentCurrency = getCurrency($uid, $currency);
        if ($specific){
            $cheapPricing = \RSThemes\Models\ProductCalculatedPricing::where("gid",$groupId)->where("currency",$currentCurrency['id'])->where($specific, "!=", -1)->orderBy($specific,"ASC")->first();
            if ($cheapPricing == NULL){
                $cheapPricing = \RSThemes\Models\ProductCalculatedPricing::where("gid",$groupId)->where("currency",$currentCurrency['id'])->orderBy("price","ASC")->first();
            }
        }
        else{
            $cheapPricing = \RSThemes\Models\ProductCalculatedPricing::where("gid",$groupId)->where("currency",$currentCurrency['id'])->orderBy("price","ASC")->first();
        }
        $product = WHMCS\Product\Product::where('id', $cheapPricing->pid)->first();
        return self::returnParsedPricing($cheapPricing, $currentCurrency, $product);
    }

    static public function returnParsedPricing($item, $currentCurrency = false, $product=NULL){
        if(!$currentCurrency)
        {
            $currency = null;
            if(isset($_SESSION['currency']))
                $currency = $_SESSION['currency'];
            $uid=null;
            if(isset($_SESSION['uid']))
                $uid = $_SESSION['uid'];
            $currentCurrency = getCurrency($uid, $currency);
        }
        $cheapPricingData = json_decode($item->data,true);
        /*$formattedPrice = round($cheapPricingData['single']['best'], 2);
        $formattedPrice = new Price($formattedPrice, $currentCurrency);*/
        /*$realCyclePrice = 0;
        if(isset($cheapPricingData['single']['realPrices'][$cheapPricingData['single']['bestCycle']]))
            $realCyclePrice = $cheapPricingData['single']['realPrices'][$cheapPricingData['single']['bestCycle']];*/
        return (object)[
            'product' => $product,
            //'type' => $cheapPricingData['paymentType']??"",
            //'price' => $formattedPrice,
            'billing' => $cheapPricingData['type'],
            'tabs' => $cheapPricingData['tabs'],
            'cycle' => $cheapPricingData['bestCycle']
            //'real_prices' => $cheapPricingData['single']['realPrices'],
            //'real_price' => $realCyclePrice,
            //'discount' => $cheapPricingData['single']['discount']['applied'],
            //'discount_percentage' => $cheapPricingData['single']['discount']['percentage'],
            //'discount_price_before' => $cheapPricingData['single']['discount']['discountValue'] ?? "0.00"
        ];
    }

    private function checkLongestBillingMonthlyPriceAvailability()
    {
        $enabled = true;
        $discountModules = ['DiscountCenter']; // name of discount modules
        foreach ($discountModules as $discountModule) {
            $module = Capsule::table('tbladdonmodules')->where('module', $discountModule)->where('setting', 'version')->first();
            if (!is_null($module)) {
                $enabled = false;
                break;
            }
        }
        //rsThemes setting which is responsible to display prices
        $rsThemeSettingEnabled = \RSThemes\Models\Settings::where('setting', 'display_longest_billing_cycle_monthly_price')->first()->value;
        if (!$rsThemeSettingEnabled) {
            $enabled = false;
        }
        //returns true when no discount modules are installed and when rsThemes setting is enabled
        return $enabled;
    }

    public function getSpotlight()
    {
        $domainsTLD = [];
        $spotlightTLD = explode(',', \WHMCS\Config\Setting::getValue("SpotlightTLDs"));
        foreach ($spotlightTLD as $k => $item) {
            if ($this->spotlightPrice($item)) {
                $domainsTLD[$k]['ext'] = $item;
                $domainsTLD[$k]['price'] = $this->spotlightPrice($item);
            }
        }
        return $domainsTLD;
    }

    public function spotlightPrice($ext = null)
    {
        if (isset($this->tldPricingCache[$ext])) {
            return $this->tldPricingCache[$ext];
        }

        $currency = null;
        if(isset($_SESSION['currency']))
            $currency = $_SESSION['currency'];
        $uid=null;
        if(isset($_SESSION['uid']))
            $uid = $_SESSION['uid'];
        $extensionId = Capsule::table('tbldomainpricing')->select('id')->where('extension', $ext)->first()->id;
        $price = Capsule::table('tblpricing')
            ->where('relid', $extensionId)
            ->where('type', 'domainregister')
            ->where('currency', ((!is_null($currency))?$currency:getCurrency($uid, $currency)['id'] ?? 1))
            ->first();

        $price = (($price)?(($price->msetupfee > 0) ? $price->msetupfee : $price->qsetupfee):0);
        $formatedPrice = new Price($price, getCurrency($uid, $currency));

        if ($ext !== null && intval($price) >= 0) {
            $this->tldPricingCache[$ext] = $formatedPrice;
            return $formatedPrice;
        }
    }

    public function getPromotionExtensionStatus()
    {
        if (Capsule::schema()->hasTable("rsextension_promobanners_slides") && Capsule::schema()->hasTable("rsextension_translation_content") && Capsule::table('tblconfiguration')->where('setting', 'lagom2_promobanners_exstatus')->select('value')->first()->value == 1) {
            $this->promotionExtensionStatus = true;
        } else {
            $this->promotionExtensionStatus = false;
        }
        return $this->promotionExtensionStatus;
    }

    public function getPromotionBanner()
    {
        if (isset($this->promotionBanner)) {
            return $this->promotionBanner;
        }

        if ($this->getPromotionExtensionStatus()) {
            $this->promotionBanner = Banner::getHomepageSlides();
        } else {
            $this->promotionBanner = $this->getMarketConnect();
        }

        return $this->promotionBanner;
    }
}

add_hook('ClientAreaPage', 22, function ($v) {
    if (Capsule::schema()->hasTable("rstheme_themes")) {
        $pageConfig = Capsule::table('rstheme_themes')->select('pages_configuration')->whereName('lagom2')->first()->pages_configuration;
        if ($v['templatefile'] == 'homepage') {
            return [
                'homepage' => new GetHomeVars($v)
            ];
        }
    }
});

add_hook('ClientAreaPageCart', 1, function($vars) {
    $return = ['productsPricing'=>[]];
    $currency = null;
    if(isset($_SESSION['currency']))
        $currency = $_SESSION['currency'];
    $uid=null;
    if(isset($_SESSION['uid']))
        $uid = $_SESSION['uid'];
    $currentCurrency = getCurrency($uid, $currency);
    $products = \RSThemes\Models\ProductCalculatedPricing::where("gid",$vars['gid'])->where("currency",$currentCurrency['id'])->get();
    foreach($products as $item){
        $return['productsPricing'][$item->pid] = GetHomeVars::returnParsedPricing($item, $currentCurrency);
    }
    return $return;
});