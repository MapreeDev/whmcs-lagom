<?php

/*
 * ******************************************
   RS Studio Template Hook
   1. Namespaces
   2. Layout Helpers
   3. Template Classes
   4. Order Redirection
   5. Page Header Type
   6. Market Connect Banners
   7. Client Area Home Panels
   8. Module Classes Helper
   9. Site Helper
   10. Light/Dark Mode switcher
   11. Product Details - Get Product group ID
   12. Remove addon from cart + select product period
   13. Check if bundle
   14. Invoice - Show 0% Taxes
   15. Hide Inactive Services
   16. Dashboard Alerts Cookies
   17. Product Configure - Password Strenght - Show Errors
   18. SEO - Server HTTP Host
   18. ProductGroups in renewals
 * ******************************************
 */

/*
 * ******************************************
   1. Namespaces
 * ******************************************
 */

use RSThemes\Models\Icons;
use RSThemes\Models\Page;
use RSThemes\Processors\MenuProcessor;
use RSThemes\Processors\SidebarProcessor;
use WHMCS\Product\Group as ProductGroup;
use WHMCS\Database\Capsule;
use WHMCS\MarketConnect\Service;
use WHMCS\View\Menu\Item as MenuItem;

use WHMCS\CustomField;
use WHMCS\CustomField\CustomFieldValue;
use WHMCS\User\Client;
/*
 * ******************************************
   2. Layout Helpers
 * ******************************************
 */
if(basename($_SERVER['SCRIPT_NAME']) == 'cart.php' && isset($_GET['a']) && $_GET['a'] == 'add' && isset($_GET['billingcycle'])) {
    \WHMCS\Session::set("storeBillingCycle", $_GET['billingcycle']);
}

add_hook('ClientAreaPage', 2, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePath = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'layouthelpers.php';

    /* DEFAULT */
    if (file_exists($configFilePath)) {
        $config = require_once $configFilePath;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => false,
                    'forceSidebar' => false,
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => false,
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 3) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 4) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => $config[$actionFile][3],
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 5) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => $config[$actionFile][3],
                    'sidebarOnRight' => $config[$actionFile][4],
                ];
            }
            else{
                return [
                    'ignoreSidebars' => false,
                    'ignoreHeader' => false,
                    'forceSidebar' => false,
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            }
        } else {
            return [
                'ignoreSidebars' => false,
                'ignoreHeader' => false,
                'forceSidebar' => false,
                'ignoreMainBody' => false,
                'sidebarOnRight' => false,
            ];
        }
    }
});

add_hook('ClientAreaPage', 3, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePathCustom = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'layouthelpers-custom.php';
    
     /* CUSTOM */
     if (file_exists($configFilePathCustom)) {
        $config = require_once $configFilePathCustom;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => false,
                    'forceSidebar' => false,
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => false,
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 3) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => false,
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 4) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => $config[$actionFile][3],
                    'sidebarOnRight' => false,
                ];
            }
            else if (count($config[$actionFile]) == 5) {
                return [
                    'ignoreSidebars' => $config[$actionFile][0],
                    'ignoreHeader' => $config[$actionFile][1],
                    'forceSidebar' => $config[$actionFile][2],
                    'ignoreMainBody' => $config[$actionFile][3],
                    'sidebarOnRight' => $config[$actionFile][4],
                ];
            }
        }
    }
});

/*
 * ******************************************
   3. Template Classes
 * ******************************************
 */

add_hook('ClientAreaPage', 2, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePath = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'templateclasses.php';

    /* DEFAULT */
    if (file_exists($configFilePath)) {
        $config = require_once $configFilePath;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => false,
                    'mainContentClasses' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => $config[$actionFile][1],
                    'mainContentClasses' => false,
                ];
            }
            else if (count($config[$actionFile]) == 3) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => $config[$actionFile][1],
                    'mainContentClasses' => $config[$actionFile][2],
                ];
            }            
        }
    }
});

add_hook('ClientAreaPage', 3, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePathCustom = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'templateclasses-custom.php';
    
    /* CUSTOM */
    if (file_exists($configFilePathCustom)) {
        $config = require_once $configFilePathCustom;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => false,
                    'mainContentClasses' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => $config[$actionFile][1],
                    'mainContentClasses' => false,
                ];
            }
            else if (count($config[$actionFile]) == 3) {
                return [
                    'appMainBodyClasses' => $config[$actionFile][0],
                    'bodyClasses' => $config[$actionFile][1],
                    'mainContentClasses' => $config[$actionFile][2],
                ];
            }
        }
    }
});


/*
 * ****************************************************************
   4. Order Redirection - Don't show view cart page as separate
 * ****************************************************************
 */

add_hook('ClientAreaPage', -100000000, function($vars) {
    if (isset($vars['inShoppingCart'])) {
        if (isset($_GET['a']) && $_GET['a'] == 'view') {
            $url = 'cart.php?a=checkout';
            header("Location: $url");
            die();
        }
    }
});

/*
 * ******************************************
   5. Page Header Type
 * ******************************************
 */

add_hook('ClientAreaPage', 2, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePath = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'pageheader.php';

    /* DEFAULT */
    if (file_exists($configFilePath)) {
        $config = require_once $configFilePath;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'RSheadersearch' => $config[$actionFile][0],
                    'RSheadercenter' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'RSheadersearch' => $config[$actionFile][0],
                    'RSheadercenter' => $config[$actionFile][1],
                ];
            }
            else{
                return [
                    'RSheadersearch' => false,
                    'RSheadercenter' => false,
                ];
            }
        } else {
            return [
                'RSheadersearch' => false,
                'RSheadercenter' => false,
            ];
        }
    }
});

add_hook('ClientAreaPage', 3, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePathCustom = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'pageheader-custom.php';

    /* CUSTOM */
    if (file_exists($configFilePathCustom)) {
        $config = require_once $configFilePathCustom;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'RSheadersearch' => $config[$actionFile][0],
                    'RSheadercenter' => false,
                ];
            } else if (count($config[$actionFile]) == 2) {
                return [
                    'RSheadersearch' => $config[$actionFile][0],
                    'RSheadercenter' => $config[$actionFile][1],
                ];
            } 
        }
    }
});

/*
 * ******************************************
   6. Market Connect Banners
 * ******************************************
 */

if(isset($_SESSION['uid']) && basename($_SERVER['SCRIPT_NAME']) !== 'logout.php' && strpos($_SERVER['QUERY_STRING'], 'verificationId') === false){
    $rsServicesHooks = [
        'ClientAreaPage',
        'ClientAreaPageProductsServices',
        'ClientAreaHomepage',
        'ClientAreaPageProductDetails'
    ];
}
else{
    $rsServicesHooks = [
        'ClientAreaPageProductsServices',
        'ClientAreaHomepage',
        'ClientAreaPageProductDetails'
    ];
}

foreach ($rsServicesHooks as $rsServicesHook) {
    add_hook($rsServicesHook, -2, function($var = NULL) {
        return [
            'RSMarketConnectServices' => Service::active()->get()->toArray()
        ];
    });
}

/*
 * ******************************************
   7. Client Area Home Panels
 * ******************************************
 */

use WHMCS\View\Menu\Item;
add_hook('ClientAreaHomepagePanels', 1, function (Item $homePagePanels) {

    $recentTicketsPanel = $homePagePanels->getChild('Recent Support Tickets');
    $activeServicesPanel = $homePagePanels->getChild('Active Products/Services');
    $affiliatePanel = $homePagePanels->getChild('Affiliate Program');
    $recentNewsPanel = $homePagePanels->getChild('Recent News');

    if (!is_null($recentTicketsPanel)) {
        $recentTicketsPanel->setExtras(
            []
        );
    }
    if (!is_null($activeServicesPanel)) {
        $activeServicesPanel->setExtras(
            []
        )->setOrder(0);
        $activeServicesPanel->setFooterHtml('');
    }
    if (!is_null($affiliatePanel)) {
        $affiliatePanel->setExtras(
            []
        );
    }
    if (!is_null($recentNewsPanel)) {
        $recentNewsPanel->setExtras(
            []
        );
    }
});

/*
 * ******************************************
   8. Module Classes Helper
 * ******************************************
 */

add_hook('ClientAreaPage', 2, function($vars) {
    if (isset($_GET['m'])){
        if ($_GET['m'] == "DomainOrdersExtended"){
            return [
                'pageModuleName' => 'searchdomains'
            ];
        }
        else if ($_GET['m'] == "DNSManager2"){
            return [
                'pageModuleName' => 'dnsmanager'
            ];
        }
        else{
            $moduleName = strtolower($_GET['m']);
            $moduleName = str_replace(' ', '', $moduleName);
            return [
                'pageModuleName' => $moduleName
            ];
        }
    }
});

/*
 * ******************************************
   9. Site Helper
 * ******************************************
 */

add_hook('ClientAreaPage', 2, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePath = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'site.php';

    /* DEFAULT */
    if (file_exists($configFilePath)) {
        $config = require_once $configFilePath;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'isSite' => $config[$actionFile][0],
                    'siteSeoDesc' => false
                ];
            }
            else if (count($config[$actionFile]) == 2) {
                return [
                    'isSite' => $config[$actionFile][0],
                    'siteSeoDesc' => $config[$actionFile][1]
                ];
            }
            else{
                return [
                    'isSite' => false,
                    'siteSeoDesc' => false
                ];
            }
        } else {
            return [
                'isSite' => false,
                'siteSeoDesc' => false
            ];
        }
    }
});

add_hook('ClientAreaPage', 3, function($vars) {
    $actionFile = $vars['templatefile'];
    $configFilePathCustom = realpath(dirname(__FILE__)) . DS .'..'.DS. 'config' . DS . 'site-custom.php';

    /* CUSTOM */
    if (file_exists($configFilePathCustom)) {
        $config = require_once $configFilePathCustom;
        if (isset($config[$actionFile])) {
            if (count($config[$actionFile]) == 1) {
                return [
                    'isSite' => $config[$actionFile][0],
                    'siteSeoDesc' => false
                ];
            }
            else if (count($config[$actionFile]) == 2) {
                return [
                    'isSite' => $config[$actionFile][0],
                    'siteSeoDesc' => $config[$actionFile][1]
                ];
            }
        } 
    }
});

/*
 * ******************************************
   10. Light/Dark Mode switcher
 * ******************************************
 */

add_hook('ClientAreaPage', 1, function($vars) {
    $displayModeSwitcher = \RSThemes\Models\Settings::where('setting', 'display_mode_switcher')->first();
    $displayModeSwitcherEnabled = (bool) $displayModeSwitcher->value;
    $darkModeEnabledValue = false; //default value
    if ($displayModeSwitcherEnabled) {
        if (!$vars['loggedin']) {  //unlogged user
            if (isset($_COOKIE['dark_mode_enabled'])) { //get cookie value
                $darkModeEnabledValue = $_COOKIE['dark_mode_enabled'];
            }
        } else { //logged user
            if (isset($_COOKIE['dark_mode_enabled'])) {
                $darkModeEnabledValue = $_COOKIE['dark_mode_enabled'];
            } else {
                $clientId = '';
                if (isset($vars['client'])) {
                    $clientId = $vars['client']->id; //user has not clients
                } else {
                    $loggedInUser = $vars['loggedinUser'];
                    foreach ($loggedInUser->getClientIds() as $id) {
                        $client = Client::find($id);
                        if ($client->email == $loggedInUser->email) { //account selection
                            $clientId = $client->id;
                        }
                    }
                }
                $darkModeCustomField = CustomField::where('fieldname', 'Dark Mode Enabled')
                    ->where('type', 'client')
                    ->where('fieldtype', 'tickbox')
                    ->where('relid', 0)
                    ->first();
                $darkModeCustomFieldValue = CustomFieldValue::where('fieldid', $darkModeCustomField->id)
                    ->where('relid', $clientId)
                    ->first();
                if (!is_null($darkModeCustomFieldValue) && $darkModeCustomFieldValue->value == 'on') { //if user has custom field and value is true
                    $darkModeEnabledValue = true;
                }
            }
        }
    }
    return [
        'mode_switcher' => [
            'enabled' => $displayModeSwitcherEnabled,
            'value' => $darkModeEnabledValue
        ]
    ];
});

add_hook('ClientAreaRegister', 1, function($vars) {
    $darkModeEnabledValue = false;
    if (isset($_COOKIE['dark_mode_enabled'])) {
        $darkModeEnabledValue = $_COOKIE['dark_mode_enabled'];
    }
    $darkModeCustomField = CustomField::where('fieldname', 'Dark Mode Enabled')
        ->where('type', 'client')
        ->where('fieldtype', 'tickbox')
        ->where('relid', 0)
        ->first();
    if (!is_null($darkModeCustomField)) {
        $darkModeCustomFieldValue = new CustomFieldValue(); //custom field value creation
        $darkModeCustomFieldValue->fieldid = $darkModeCustomField->id;
        $darkModeCustomFieldValue->relid = $vars['client_id'];
        $darkModeCustomFieldValue->value = $darkModeEnabledValue ? 'on' : '';
        $darkModeCustomFieldValue->created_at = new DateTime();
        $darkModeCustomFieldValue->updated_at = new DateTime();
        $darkModeCustomFieldValue->save();
    }
});

add_hook('UserLogin', 1, function($vars) {
    $user = $vars['user'];
    $clientExists = false;
    foreach ($user->getClientIds() as $id) {
        $client = Client::find($id);
        if ($client->email == $user->email) {
            $clientId = $client->id;
            $clientExists = true; // orderform account creation login hook is triggered, no client in db
        }
    }
    $darkModeEnabledValue = false;
    if (isset($_COOKIE['dark_mode_enabled'])) {
        $darkModeEnabledValue = $_COOKIE['dark_mode_enabled'];
    }
    $darkModeCustomField = CustomField::where('fieldname', 'Dark Mode Enabled')
        ->where('type', 'client')
        ->where('fieldtype', 'tickbox')
        ->where('relid', 0)
        ->first();
    if (!is_null($darkModeCustomField) && $clientExists) {
        $darkModeCustomFieldValue = new CustomFieldValue(); //custom field value creation
        $darkModeCustomFieldValue->fieldid = $darkModeCustomField->id;
        $darkModeCustomFieldValue->relid = $clientId;
        $darkModeCustomFieldValue->value = $darkModeEnabledValue ? 'on' : '';
        $darkModeCustomFieldValue->created_at = new DateTime();
        $darkModeCustomFieldValue->updated_at = new DateTime();
        $darkModeCustomFieldValue->save();
    }
});

/*
 * ******************************************
   11. Product Details - Get Product group ID
 * ******************************************
 */

add_hook('ClientAreaPageProductDetails', 2, function($vars) {
    $groupId = ProductGroup::where('name', $vars['groupname'])->value('id');
    return [
        'groupId' => $groupId
    ];
});

add_hook('ClientAreaPage', 1, function($vars) {
    $uri = str_replace("&amp;", "&", $_SERVER['REQUEST_URI']);
    $uri = strstr($uri, '?rs', true) ?: $uri;
    $uri = strstr($uri, '&rs', true) ?: $uri;
    
    return [
        'currentUrl' => $uri,
        'hideServerAlert' => $_SESSION['hide_server_alert'] ?? ""
    ];
});

/*
 * ******************************************
   12. Remove addon from cart + select product period
 * ******************************************
*/

add_hook('ClientAreaPage', 1, function($vars) {
    
    if ($vars['templatefile'] == "viewcart"){

        $currency = getCurrency(WHMCS\Session::get("uid"), WHMCS\Session::get("currency"));
        
        if(App::getFromRequest("removeAddon"))
        {   
            if (App::getFromRequest("pt") == "products" && $_SESSION['cart']['products'][App::getFromRequest("pi")]){
                unset($_SESSION['cart']['products'][App::getFromRequest("pi")]['addons'][App::getFromRequest("ai")]);
            }
            if (App::getFromRequest("pt") == "domains" && $_SESSION['cart']['domains'][App::getFromRequest("pi")]){
                $_SESSION['cart']['domains'][App::getFromRequest("pi")][App::getFromRequest("ai")] = NULL;
            }
            if (App::getFromRequest("pt") == "renewals" && $_SESSION['cart']['rewals'][App::getFromRequest("pi")]){
                $_SESSION['cart']['rewals'][App::getFromRequest("pi")][App::getFromRequest("ai")] = NULL;
            }

            $response = new WHMCS\Http\JsonResponse();
            $response->setData(calcCartTotals(null, false, $currency));
            $response->send();
            WHMCS\Terminus::getInstance()->doExit();
        }

        elseif(App::getFromRequest("selectProductPeriod") && App::getFromRequest("pi") >= 0 && App::getFromRequest("pc") )
        {
            if($_SESSION['cart']['products'][App::getFromRequest("pi")])
            {
                $_SESSION['cart']['products'][App::getFromRequest("pi")]['billingcycle'] = App::getFromRequest("pc");
            }
            
            $response = new WHMCS\Http\JsonResponse();
            $response->setData(calcCartTotals(null, false, $currency));
            $response->send();
            WHMCS\Terminus::getInstance()->doExit();
        }
        $cycles = [];
        $billingcycles = [];
        foreach($vars['products'] as $i => $p)
        {
            $product = \WHMCS\Product\Product::find($vars['products'][$i]['pid']);
            $cycles[$i] = $product->pricing()->allAvailableCycles();
            $billingcycles[$i] = [];
            $proratabilling = in_array($product->paytype, [WHMCS\Product\Product::PAYMENT_ONETIME, WHMCS\Product\Product::PAYMENT_FREE]) ? "" : $product->proratabilling;

            try {
                foreach($cycles[$i] as $key => $cycle)
                { 
                    if ($proratabilling) {
                        $proratavalues = getProrataValues($cycle->cycle(), $cycle->price()->toNumeric(), $product->proratadate, $product->proratachargenextmonth, date("d"), date("m"), date("Y"), $_SESSION['uid']);
                        $product_onetime = $proratavalues["amount"];
                        $exploded = explode('/', $cycle->toFullString());
                        $billingcycles[$i][] = [
                            'price' => $product_onetime, // add currency
                            'cycle' => $cycle->cycle(),
                            'toFullString' => $currency['prefix'] . $product_onetime . $currency['suffix'] . '/' . $exploded[1],
                            'toFullStringCalculated' => $currency['prefix'] . $product_onetime . $currency['suffix'] . '/' . $exploded[1],
                        ];
                    }else
                    {
                        $currency = $cycle->price()->getCurrency();
                        //$currency['format'] = 1;
                        $exploded = explode('/', $cycle->toFullString());
                        $price = new \WHMCS\View\Formatter\Price($cycle->price()->toNumeric()*$p['qty'],$cycle->price()->getCurrency());
                        $billingcycles[$i][] = [
                            'price' => $cycle->price(),
                            'cycle' => $cycle->cycle(),
                            'toFullString' => $cycle->toFullString(),
                            //'toFullStringFormatted' => $cycle->price()->format(NULL, $currency) . '/' . $exploded[1],
                            'toFullStringCalculated' => $price->format() . '/' . $exploded[1],
                        ];
                    }
                
                }

               
            } catch (\Throwable $th) {}
        }
        return [ 'allAvailableCycles' => $billingcycles];
    }
});

/*
 * ******************************************
   13. Check if bundle
 * ******************************************
*/

add_hook('ClientAreaPage', 1, function($vars) {
    if (isset($_SESSION['cart']['bundle']) && !empty($_SESSION['cart']['bundle']) && $vars['templatefile'] == 'configureproductdomain'){
        return [
            'isBundle' => true                  
        ];
    }
});

/*
 * ******************************************
   14. Invoice - Show 0% Taxes
 * ******************************************
*/

add_hook('ClientAreaPageViewInvoice', 1, function($vars) {
    if(function_exists('invoiceVars')){
        $vars = invoiceVars($vars);
        foreach($vars as $var => $value){
            $vars[$var] = $value;
        }
    }
    return $vars;
});

/*
 * ******************************************
    15. Hide Inactive Services
 * ******************************************
*/

add_hook('ClientAreaPage', 1, function($vars) {
    if ($vars['templatefile'] == "clientareaproducts" || $vars['templatefile'] == "clientareadomains"){
        if (isset($_COOKIE['hideInactiveSercices']) && $_COOKIE['hideInactiveSercices'] == "true"){
            $inactiveServices = true;
        }
        else{
            $inactiveServices = false;
        }
    
        if (isset($_COOKIE['hideInactiveDomains']) && $_COOKIE['hideInactiveDomains'] == "true"){
            $inactiveDomains = true;
        }
        else{
            $inactiveDomains = false;
        }
    
        $hideInacviveServices = [
            "inactiveServices" => $inactiveServices,
            "inactiveDomains" => $inactiveDomains
        ];
    
        return [
            'hideInactiveServices' => $hideInacviveServices
        ];
    }
    
});

add_hook('ClientAreaPageSubmitTicket', 1, function($vars) {
    $user = $vars['client'];
    $client = Client::find($user->id);
    if ($client){
        $clientServices = $client->services()->get();
        $clientDomains = $client->domains()->get();

        $services = [];
        $domains = [];
        foreach ($clientServices as $key => $service) {
            $services[$key]['id'] = $service->id;
            $services[$key]['status'] = $service->status;
        }
        foreach($clientDomains as $key => $domain) {
            $domains[$key]['id'] = $domain->id;
            $domains[$key]['status'] = $domain->status;
        }

        return[
            'services' => $services,
            'domains' => $domains
        ];
    }
});

/*
 * ******************************************
    16. Dashboard Alerts Cookies
 * ******************************************
*/

add_hook('ClientAreaPage', 2, function($vars) {
    if ($vars['templatefile'] == "clientareahome"){
        return[
            'clienthomealertscookies' => $_COOKIE
        ];
    }
});

/*
 * **************************************************************
    17. Product Configure - Password Strenght - Show Errors
 * **************************************************************
*/

add_hook('ShoppingCartValidateProductUpdate', 1, function($vars) {
    $validate = new WHMCS\Validate();
    if (isset($vars['rootpwstrength']) && $vars['rootpwstrength'] == "true"){
        if (!$validate->validate("pwstrength", 'rootpw', "pwstrengthfail")){
            return [    
                Lang::trans("pwstrengthfail")
            ];
        }
    }
});


/*
 * **************************************************************
    18. SEO - Server HTTP Host
 * **************************************************************
*/

add_hook('ClientAreaPage', 2, function($vars) {
    if ($vars['templatefile'] == "knowledgebasearticle" || $vars['templatefile'] == "viewannouncement" || $vars['templatefile'] == "products" || str_contains($vars['templatefile'], "store/")){
        $seoHost = 'https://'.$_SERVER['HTTP_HOST'].'/';
        return[
            'seoHost' => $seoHost
        ];
    }
});

/*
 * **************************************************************
    19. ProductGroups
 * **************************************************************
*/

add_hook('ClientAreaPage', 2, function($vars) {
    if(isset($vars['gid']) && isset($vars['services']) && $vars['gid'] == "service-renewals" && $vars['services'] == "renew"){
        $renewableServicesGroups = [];
        if(isset($vars['renewableServices']))
            foreach($vars['renewableServices'] as $item){
                if(!isset($renewableServicesGroups[$item['product']->gid]))
                    $renewableServicesGroups[$item['product']->gid] = ProductGroup::where('id', $item['product']->gid)->first();
            }
        if(isset($vars['nonRenewableServices']))
            foreach($vars['nonRenewableServices'] as $item){
                if(!isset($renewableServicesGroups[$item['product']->gid]))
                    $renewableServicesGroups[$item['product']->gid] = ProductGroup::where('id', $item['product']->gid)->first();
            }
        return ['renewableServicesGroups' => $renewableServicesGroups];
    }
});