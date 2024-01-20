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
        if (isset($this->productGroupCache[$groupId])) {
            return $this->productGroupCache[$groupId];
        }
        $products = Group::find($groupId)->products;
        $cheapest = null;
        $cheapestPrice = PHP_INT_MAX;
        $cheapestBilling = '';
        $cheapestCycle = 'monthly';
        $cheapestProductPrices = '';
        $discountApplied = false;
        $discountPercentage = 0;
        $discountPriceBefore = 0;
        $billing = 'monthly';

        $currentCurrency = getCurrency($_SESSION['uid'], $_SESSION['currency']);
        $pricingCycles = [
            ['name' => 'monthly', 'months' => 1],
            ['name' => 'quarterly', 'months' => 3],
            ['name' => 'semiannually', 'months' => 6],
            ['name' => 'annually', 'months' => 12],
            ['name' => 'biennially', 'months' => 24],
            ['name' => 'triennially', 'months' => 36],
        ];

        $checkLongestBillingMonthlyPriceAvailability = $this->checkLongestBillingMonthlyPriceAvailability();
        $ifCount = 0;
        if ($checkLongestBillingMonthlyPriceAvailability) {
            foreach ($products as $product) {
                     if ($product->hidden == 0) {
                        $productPrices = Capsule::table('tblpricing')
                            ->where('type', 'product')
                            ->where('relid', $product['id'])
                            ->where('currency', $currentCurrency['id'])
                            ->first(); //show prices without configurable options
                         if (!is_null($productPrices)) {
                             foreach ($pricingCycles as $pricingCycle) {
                                 $productCurrentCyclePrice = $productPrices->{$pricingCycle['name']};
                                 if ($productCurrentCyclePrice >= 0) {
                                     $productCurrentMonthlyPrice = $productCurrentCyclePrice / $pricingCycle['months'];
                                     if ($productCurrentMonthlyPrice < $cheapestPrice) {
                                         $cheapestPrice = $productCurrentMonthlyPrice;
                                 
                                         $cheapest = $product;
                                         $cheapestCycle = $pricingCycle;
                                         $cheapestProductPrices = $productPrices;
                                     }
                                 }
                             }
                         }
                     }
            }
        } else {
            $cycles = [
            'monthly' => 1,
            'quarterly' => 3,
            'semiannually' => 6,
            'annually' => 12,
            'biennially' => 24,
            'triennially' => 36
            ];
            
            $freeProduct = WHMCS\Product\Product::where('gid', $groupId)->where('paytype', 'free')->where('hidden', 0)->where('retired', 0)->first();
            if ($freeProduct) {
                $cheapestPrice = 0;
                $cheapest = $freeProduct;
            } else {
                //Monthly breakdown
                $productMonthlyPricingBreakdown = Capsule::table('tblconfiguration')->where('setting', 'ProductMonthlyPricingBreakdown')->value('value');
                if($productMonthlyPricingBreakdown != 'on')
                {
                    $pid = 0;
                    foreach ($cycles as $key => $v) {
                        $lowestPerCycle = Capsule::table('tblpricing')
                            ->leftJoin('tblproducts', 'tblpricing.relid', '=', 'tblproducts.id')
                            ->where('tblproducts.gid', $groupId)
                            ->where('tblpricing.type', 'product')->where($key, '>', -1)->where('tblpricing.currency', $currentCurrency['id'])
                            ->where('tblproducts.hidden', 0)
                            ->where('tblproducts.retired', 0)
                            ->orderBy('tblpricing.'.$key, 'ASC')
                            ->first();
                        
                        if ($lowestPerCycle && $lowestPerCycle->{$key} > 0) {
                            $cheapestCycle = $key;
                            $cheapestPrice = $lowestPerCycle->{$key};
                            $pid = $lowestPerCycle->relid;
                            $cheapest = WHMCS\Product\Product::where('id', $pid)->first();
                            $newPrice = $cheapestPrice;
                            $newCycle = $key;
                            break;
                        }
                    }  
                }else
                {
                    $pid = 0;
                    foreach ($cycles as $key => $v) {
                        $lowestPerCycle = Capsule::table('tblpricing')
                            ->leftJoin('tblproducts', 'tblpricing.relid', '=', 'tblproducts.id')
                            ->where('tblproducts.gid', $groupId)
                            ->where('tblpricing.type', 'product')->where($key, '>', -1)->where('tblpricing.currency', $currentCurrency['id'])
                            ->where('tblproducts.hidden', 0)
                            ->where('tblproducts.retired', 0)
                            ->orderBy('tblpricing.'.$key, 'ASC')
                            ->first();
                        if ($lowestPerCycle && $lowestPerCycle->{$key} / $v < $cheapestPrice) {
                            $cheapestCycle = $key;
                            $cheapestPrice = $lowestPerCycle->{$key} / $v;
                            $pid = $lowestPerCycle->relid;
                        }
                    }
                    $product = WHMCS\Product\Product::where('id', $pid)->first();
                    $cheapestPrice = $cheapestPrice;
                    $cheapest = $product;
                    $cheapestCycle = $cheapestCycle;
                }
            }
        }

        if ($checkLongestBillingMonthlyPriceAvailability) {
            $worstMonthlyPriceBefore = 0;
            foreach ($pricingCycles as $pricingCycle) {
                $cheapestProductCurrentCyclePrice = $cheapestProductPrices->{$pricingCycle['name']};
                if ($cheapestProductCurrentCyclePrice >= 0) {
                    $cheapestProductCurrentMonthlyPrice = $cheapestProductCurrentCyclePrice / $pricingCycle['months'];
                    if ($cheapestProductCurrentMonthlyPrice > $worstMonthlyPriceBefore) {
                        $worstMonthlyPriceBefore = round($cheapestProductCurrentMonthlyPrice, 2);
                    }
                }
            }
            if ($worstMonthlyPriceBefore !== $cheapestPrice) {
                $discountPriceBefore = new Price($worstMonthlyPriceBefore, $currentCurrency);
                $discountValue = $worstMonthlyPriceBefore - round($cheapestPrice, 2);
                $discountPercentage = round($discountValue / $worstMonthlyPriceBefore * 100);
                $discountApplied = true;
            }
        }
        $formattedPrice = round($cheapestPrice, 2);
        $formattedPrice = new Price($formattedPrice, $currentCurrency);

        if($newCycle && $newPrice)
        {
            $billing = $newCycle;
            $formattedPrice = round($newPrice, 2);
            $formattedPrice = new Price($formattedPrice, $currentCurrency);
        }

        $this->productGroupCache[$groupId] = (object)[
            'product' => $cheapest,
            'price' => $formattedPrice,
            'billing' => $billing,
            'cycle' => $cheapestCycle,
            'discount' => $discountApplied,
            'discount_percentage' => $discountPercentage,
            'discount_price_before' => $discountPriceBefore
        ];
 
        return $this->productGroupCache[$groupId];
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

        $extensionId = Capsule::table('tbldomainpricing')->select('id')->where('extension', $ext)->first()->id;
        $price = Capsule::table('tblpricing')
            ->where('relid', $extensionId)
            ->where('type', 'domainregister')
            ->where('currency', $_SESSION['currency'] ?? getCurrency($_SESSION['uid'], $_SESSION['currency'])['id'] ?? 1)
            ->first();

        $price = (($price->msetupfee > 0) ? $price->msetupfee : $price->qsetupfee);
        $formatedPrice = new Price($price, getCurrency($_SESSION['uid'], $_SESSION['currency']));

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