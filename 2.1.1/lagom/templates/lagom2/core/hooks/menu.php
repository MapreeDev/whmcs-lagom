<?php

/*
 * ******************************************
  RS Studio Menu Hooks
  1. Namespaces
  2. Primary Navbar
  3. Secondary Navbar
  4. Footer
  5. Functions
    5.1. Get Display Rule
    5.2. Generate Menu
  6. Additional Navbar Hooks  
 * ******************************************
 */


/*
 * ******************************************
   1. Namespaces
 * ******************************************
 */

use RSThemes\Helpers\StringConverter;
use RSThemes\Helpers\Lang as RsLang;
use RSThemes\Helpers\AddonHelper;
use RSThemes\Models\Display;
use RSThemes\Models\Icon;
use RSThemes\Models\Menu as RsMenu;
use RSThemes\Models\DisplayRule;
use RSThemes\Models\Page;
use RSThemes\Processors\MenuProcessor;
use RSThemes\Template\Layout\MainMenuLayout;
use RSThemes\Template\Template;
use WHMCS\Product\Group as ProductGroup;
use WHMCS\Database\Capsule;
use WHMCS\MarketConnect\Service;
use WHMCS\View\Menu\Item as MenuItem;

/*
 * ******************************************
   2. Primary Navbar
 * ******************************************
*/

add_hook('ClientAreaPrimaryNavbar', 0, function($vars) {
    GLOBAL $smarty;
    $vars = $smarty->getTemplateVars();
    $pageName = $vars['templatefile'];
    $filenameToTemplateFile = ["cart"=>"viewcart"];
    if(!isset($vars['templatefile']))
    {
        if(!isset($filenameToTemplateFile[$vars['filename']]))
        {
            $pageName = $vars['filename'];
        }else{
            $pageName = $filenameToTemplateFile[$vars['filename']];
        }
    }
    if ($pageName === 'lagompage') {
        $pageFileName = $vars['filename'] . '.php';
        foreach (Page::all() as $page) {
            if ($page->custom_page && $page->settings['filename'] == $pageFileName) {
                $pageName = $page->name;
            }
        }
    }
    else if($pageName == "error/page-not-found")
    {
        $activeDisplay = \RSThemes\Models\Display::where('active', true)->value('name');
        if($activeDisplay == 'CMS') {
            foreach (\RSThemes\Models\Page::all() as $page) {
                if ($page->custom_page && $page->url == "404") {
                    $pageName = $page->name;
                    break;
                }
            }
        }
    }
    $rule = getDisplayRule($pageName);
    $rsThemesPrimaryMenu = RsMenu::find($rule->main_menu_id);
    if (!is_null($rsThemesPrimaryMenu) && $rsThemesPrimaryMenu->active) {
        $primaryNavbar = Menu::primaryNavbar();
        $navbarType = "primary";
        $template = new Template($vars['template']);
        $page = \RSThemes\Models\Page::where('name', $pageName)->first();
        if(isset($page) && $page->settings['layoutEnabled']){
            $activeLayout = $page->settings['layout_mainmenu'];
        }else {
            $activeLayout = $template->getActiveLayout($rule->navigation_layout, 'rsmenulayout');
        }
        $mainMenuLayout = new MainMenuLayout($template, $activeLayout);
        $layout = [
            'name' => $mainMenuLayout->getName(),
            'type' => $mainMenuLayout->getType(),
            'theme_layout' => $mainMenuLayout->getThemeLayout(),
        ];
        generateRsMenu($primaryNavbar, $rsThemesPrimaryMenu, $vars['language'], $layout, $vars, $navbarType);
    }
});

/*
 * ******************************************
   3. Secondary Navbar
 * ******************************************
 */

add_hook('ClientAreaSecondaryNavbar', 0, function($vars) {
    //TODO edit navbar.tpl to apply secondary navbar hooks (account type)
    GLOBAL $smarty;
    $vars = $smarty->getTemplateVars();
    $pageName = $vars['templatefile'];
    if ($pageName === 'lagompage') {
        $pageFileName = $vars['filename'] . '.php';
        foreach (Page::all() as $page) {
            if ($page->custom_page && $page->settings['filename'] == $pageFileName) {
                $pageName = $page->name;
            }
        }
    }
    else if($pageName == "error/page-not-found")
    {
        $activeDisplay = \RSThemes\Models\Display::where('active', true)->value('name');
        if($activeDisplay == 'CMS') {
            foreach (\RSThemes\Models\Page::all() as $page) {
                if ($page->custom_page && $page->url == "404") {
                    $pageName = $page->name;
                    break;
                }
            }
        }
    }
    $rule = getDisplayRule($pageName);
    $rsThemesSecondaryMenu = RsMenu::find($rule->secondary_menu_id);
    if (isset($rsThemesSecondaryMenu)) {
        $secondaryNavbar = Menu::secondaryNavbar();
        $navbarType = "secondary";
        $template = new Template($vars['template']);
        $page = \RSThemes\Models\Page::where('name', $pageName)->first();
        if(isset($page) && $page->settings['layoutEnabled']){
            $activeLayout = $page->settings['layout_mainmenu'];
        }else {
            $activeLayout = $template->getActiveLayout($rule->navigation_layout, 'rsmenulayout');
        }
        $mainMenuLayout = new MainMenuLayout($template, $activeLayout);
        $layout = [
            'name' => $mainMenuLayout->getName(),
            'type' => $mainMenuLayout->getType(),
            'theme_layout' => $mainMenuLayout->getThemeLayout(),
        ];
        generateRsMenu($secondaryNavbar, $rsThemesSecondaryMenu, $vars['language'], $layout, $vars, $navbarType);
    }
});

/*
 * ******************************************
   4. Footer
 * ******************************************
 */

add_hook('ClientAreaPage', 0, function($vars) {
    $pageName = $vars['templatefile'];

    if ($pageName === 'lagompage') {
        $pageFileName = $vars['filename'] . '.php';
        foreach (Page::all() as $page) {
            if ($page->custom_page && $page->settings['filename'] == $pageFileName) {
                $pageName = $page->name;
            }
        }
    }
    else if($pageName == "error/page-not-found")
    {
        $activeDisplay = \RSThemes\Models\Display::where('active', true)->value('name');
        if($activeDisplay == 'CMS') {
            foreach (\RSThemes\Models\Page::all() as $page) {
                if ($page->custom_page && $page->url == "404") {
                    $pageName = $page->name;
                    break;
                }
            }
        }
    }
    $rule = getDisplayRule($pageName);
    $rsFooterMenu = RsMenu::find($rule->footer_menu_id);
    if (isset($rsFooterMenu)) {
        $language = $vars['language'];
        $client = Menu::context('client');
        $userStatus = 'Logged-Out';
        if (!is_null($client)) {
            $userStatus = 'Logged-In';
        }
       
        $routes = json_decode(file_get_contents(ROOTDIR . DS . 'templates' . DS . 'lagom2' . DS . 'core' . DS . 'config' . DS  . 'routing' . DS . 'routes.json'), true);
        $rsFooter = [];
        foreach ($rsFooterMenu->parents as $parent) {
            $clientStatus = $parent->content->display_settings['client-status'];
            $footerItemLocation = strtolower($parent->content->display_settings['footer-position']); //primary / secondary
            if (($clientStatus === $userStatus || $clientStatus === 'All') && $parent->active) {
               
                $parentOrder = $parent->order;
                $itemStyle = $parent->content->display_settings['style']['layout'];
               
                /* WHMCS Pages */
                if ($parent->content->type->name == 'WHMCS Page') {
                    
                    $pageName = $parent->content->content_settings['page'];
                    $page = Page::where('id', $pageName)->first();
                    $url = 'index.php';
                    $pageEnabled = true;
                    $name = '';
                    if ($page) {
                        $name = MenuProcessor::getMenuItemLabel($parent, $language);
                        if ($page->custom_page) {
                            $url = $page->url;
                        } else {
                            if (isset($routes[$page->name]['page'])) {
                                $url = $routes[$page->name]['page'];
                            }
                            if (isset($routes[$page->name]['routePath'])) {
                                $url = routePath($routes[$page->name]['routePath']);
                            }
                            $pageConfig = MenuProcessor::getWhmcsPageConfiguration($page);
                            if (!$pageConfig['enabled']) {
                                $pageEnabled = false;
                            }
                        }
                        $url = AddonHelper::convertUri($url);
                        /*if ((strpos($url, 'http') === false) && (substr($url, 0, 1) != '/') && (substr($url, 0, 1) != '#') && (strpos($url, 'javascript') === false)) {
                            $url = $vars['systemurl'] . $url;
                        }*/
                    }
                    if ($pageEnabled) {
                        $rsFooter[$footerItemLocation][$parentOrder]['item'] = MenuProcessor::getMenuItemName($parent);
                        if ($itemStyle != 'icon'){
                            $rsFooter[$footerItemLocation][$parentOrder]['name'] = $name;
                        }
                        $rsFooter[$footerItemLocation][$parentOrder]['url'] = $url;
                    }
                }
                /* Custom Link */
                if ($parent->content->type->name == 'Custom Link') {
                    $url = 'index.php';
                    if (!empty($parent->content->content_settings['link'])) {
                        $url = $parent->content->content_settings['link'];
                        /*if ((strpos($url, 'http') === false) && (substr($url, 0, 1) != '/') && (substr($url, 0, 1) != '#') && (strpos($url, 'javascript') === false)) {
                            $url = $vars['systemurl'] . $url;
                        }*/
                        $url = AddonHelper::convertUri($url);
                    }
                    $rsFooter[$footerItemLocation][$parentOrder]['item'] = MenuProcessor::getMenuItemName($parent);
                    if ($itemStyle != 'icon'){
                        $rsFooter[$footerItemLocation][$parentOrder]['name'] = MenuProcessor::getMenuItemLabel($parent, $language);
                    }
                    $rsFooter[$footerItemLocation][$parentOrder]['url'] = $url;
                }
                
                /* Language */
                if ($parent->content->type->name == 'Language' && $vars['languagechangeenabled']) {
                    $parentLabel = '<spam>'.$vars['activeLocale']['localisedName'].'</span>';
                    $flag = false;

                    if ($itemStyle == "icon"){
                        $parentLabel = false;
                    }
                    if ($itemStyle  == 'icon-text' || $itemStyle == "icon"){
                        $flag = '<span class="language-flag '.$vars["activeLocale"]["language"].'"></span>';
                    }
                    $rsFooter[$footerItemLocation][$parentOrder]['type'] = 'language';
                    $rsFooter[$footerItemLocation][$parentOrder]['item'] = $parentLabel;
                    $rsFooter[$footerItemLocation][$parentOrder]['name'] = $flag.$parentLabel;
                }

                /* Currencies */
                if ($parent->content->type->name == 'Currency Switcher') {
                    $parentLabel = '<span>'.$vars['activeCurrency']['prefix'].' '.$vars['activeCurrency']['code'].'</span>';

                    if ($itemStyle == "icon"){
                        $parentLabel = false;
                    }

                    $rsFooter[$footerItemLocation][$parentOrder]['type'] = "currencies";
                    $rsFooter[$footerItemLocation][$parentOrder]['item'] = "currencies";
                    $rsFooter[$footerItemLocation][$parentOrder]['name'] = $parentLabel;
                }
                
                /*** Item Font Icon ***/
                if (isset($parent->content->content_settings['icon']) && !empty($parent->content->content_settings['icon'])) {
                    $itemIcon = $parent->content->content_settings['icon'];
                    if ($itemStyle == 'icon-text' || $itemStyle == 'icon') {
                        $rsFooter[$footerItemLocation][$parentOrder]['icon'] = $itemIcon;
                    }
                }

                /*** Item Image Icon ***/
                if (isset($parent->content->content_settings['predefined_icon']) && !empty($parent->content->content_settings['predefined_icon'])) {
                    $predefinedIcon = $parent->content->content_settings['predefined_icon'];
                    if (str_contains($predefinedIcon, '.tpl')) {
                        $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}";
                    }
                    else{
                        $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}.tpl";
                    }
                    $iconExists = false;
                    $iconHtml = '';

                    if (file_exists($iconPath)) {
                        $iconHtml = file_get_contents($iconPath);
                        $iconExists = true;
                    }
                   
                    if (($itemStyle == 'icon' || $itemStyle == 'icon-text') && $iconExists) {
                        $rsFooter[$footerItemLocation][$parentOrder]['predefined_icon'] =  $iconHtml;
                    }
                }

                /* Item Style */
                if ($itemStyle){
                    $rsFooter[$footerItemLocation][$parentOrder]['style'] =  $itemStyle;
                }

                /* Custom Classes */
                if (isset($parent->content->display_settings['custom-data-classes'])) {
                    $rsFooter[$footerItemLocation][$parentOrder]['custom_classes'] =  $parent->content->display_settings['custom-data-classes'];
                }

                /* Target Blank */
                if (isset($parent->content->display_settings['target']) && $parent->content->display_settings['target'] == "1") {
                    $rsFooter[$footerItemLocation][$parentOrder]['target_blank'] = true;
                }
                
                if ($parent->children_count > 0) { //item children
                    foreach ($parent->children as $child) {
                        $childClientStatus = $child->content->display_settings['client-status'];
                        if (($childClientStatus === $userStatus || $childClientStatus === 'All') && $child->active) {
                            $childOrder = $child->order * 100;
                            $itemStyle = $child->content->display_settings['style']['layout'];
                            if ($child->content->type->name == 'WHMCS Page') {
                                $childPageName = $child->content->content_settings['page'];
                                $childPage = Page::where('id', $childPageName)->first();
                                $url = 'index.php';
                                $name = '';
                                $item = '';
                                $childPageEnabled = true;
                                if ($childPage) {
                                    $item = MenuProcessor::getMenuItemName($child);
                                    $name = MenuProcessor::getMenuItemLabel($child, $language);
                                    if ($childPage->custom_page) {
                                        $url = $childPage->url;
                                    } else {
                                        if (isset($routes[$childPage->name]['page'])) {
                                            $url = $routes[$childPage->name]['page'];
                                        }
                                        if (isset($routes[$childPage->name]['routePath'])) {
                                            $url = routePath($routes[$childPage->name]['routePath']);
                                        }
                                        $pageConfig = MenuProcessor::getWhmcsPageConfiguration($childPage);
                                        if (!$pageConfig['enabled']) {
                                            $childPageEnabled = false;
                                        }
                                    }
                                    /*if ((strpos($url, 'http') === false) && (substr($url, 0, 1) != '/') && (substr($url, 0, 1) != '#') && (strpos($url, 'javascript') === false)) {
                                        $url = $vars['systemurl'] . $url;
                                    }*/
                                    $url = AddonHelper::convertUri($url);
                                }
                                if ($childPageEnabled) {
                                    $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['item'] = $item;
                                    if ($itemStyle != 'icon'){
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['name'] = $name;
                                    }
                                    $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['url'] = $url;
                                }
                            }
                            if ($child->content->type->name == 'Custom Link') {
                                $url = 'index.php';
                                if (isset($child->content->content_settings['link'])) {
                                    $url = $child->content->content_settings['link'];
                                    /*if ((strpos($url, 'http') === false) && (substr($url, 0, 1) != '/') && (substr($url, 0, 1) != '#') && (strpos($url, 'javascript') === false)) {
                                        $url = $vars['systemurl'] . $url;
                                    }*/
                                    $url = AddonHelper::convertUri($url);
                                }
                                $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['item'] = MenuProcessor::getMenuItemName($child);
                                if ($itemStyle != 'icon'){
                                    $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['name'] = MenuProcessor::getMenuItemLabel($child, $language);
                                }
                                $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['url'] = $url;
                            }
                            if ($child->content->type->name == 'Predefined List') {
                                $list = $child->content->content_settings['list'];
                                $listOffset = 0;
                                if ($list == 'Product Groups') {
                                    foreach (ProductGroup::notHidden()->sorted()->get() as $group) {
                                        if ($itemStyle['type'] != 'icon'){
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['name'] = $group->name;
                                        }
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['url'] = $group->getRoutePath();
                                        $listOffset++;
                                    }
                                }
                                if ($list == 'Client Details') {
                                    if (!is_null($client)) {
                                        $clientDetails = $client->fullName . '-' . $client->email;
                                        if ($itemStyle != 'icon'){
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['name'] = $clientDetails ;
                                        }
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['url'] = 'clientarea.php?action=details';
                                    }
                                }
                                if ($list == 'Download Categories') {
                                    $downloadCats = Capsule::table('tbldownloadcats')->where('hidden', '')->orWhere('hidden', 0)->get();
                                    foreach ($downloadCats as $downloadCat) {
                                        $uri = trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $downloadCat->name), '-');
                                        if ($itemStyle != 'icon'){
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['name'] = $downloadCat->name;
                                        }
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['url'] = 'index.php?rp=/download/category/'.$downloadCat->id.'/' .$uri.'.html';
                                        $listOffset++;
                                    }
                                }
                                if ($list == 'Knowledgebase Categories') {
                                    $knowledgebaseCats = Capsule::table('tblknowledgebasecats')->where('hidden', '')->orWhere('hidden', 0)->get();
                                    foreach ($knowledgebaseCats as $knowledgebaseCat) {
                                        $uri = trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $knowledgebaseCat->name), '-');
                                        if ($itemStyle != 'icon'){
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['name'] = $knowledgebaseCat->name;
                                        }
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['url'] = 'index.php?rp=/knowledgebase/'.$knowledgebaseCat->id.'/'.$uri;
                                        $listOffset++;
                                    }
                                }

                                /*** Predefined List - MarketConnect Products ***/
                                if ($list == 'MarketConnect Products' && \WHMCS\MarketConnect\MarketConnect::hasActiveServices()) {
                                    
                                    $marketConnectProducts = \WHMCS\MarketConnect\MarketConnect::getMenuItems(false);
                                    foreach ($marketConnectProducts as $marketConnectProduct) {
                                        if ($itemStyle != 'icon'){
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['name'] = $marketConnectProduct['label'];
                                        }
                                        $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['url'] = $marketConnectProduct['uri'];
                                        $listOffset++;
                                    }
                                    
                                }
                                
                                if ($list == 'Ticket Departments') {
                                    $departments = \RSThemes\Models\TicketDepartments::orderBy('order')->get();
                                    foreach ($departments as $department) { 
                                        if ($userStatus == 'Logged-Out' && $department->clientsonly == "on"){}
                                        else{                                      
                                            if ($itemStyle != 'icon'){
                                                $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['name'] = $department->name;
                                            }
                                            $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder + $listOffset]['url'] = 'submitticket.php?step=2&deptid=' . $department->id;
                                            $listOffset++;
                                        }    
                                    }
                                }
                            }
                            /*** Item Font Icon ***/
                            if (isset($child->content->content_settings['icon']) && !empty($child->content->content_settings['icon'])) {
                                $itemIcon = $child->content->content_settings['icon'];
                                if ($itemStyle == 'icon-text' || $itemStyle == 'icon') {
                                    $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['icon'] = $itemIcon;
                                }
                                
                            }
                            /*** Item Image Icon ***/
                            
                            if (isset($child->content->content_settings['predefined_icon']) && !empty($child->content->content_settings['predefined_icon'])) {
                                $predefinedIcon = $child->content->content_settings['predefined_icon'];
                                if (str_contains($predefinedIcon, '.tpl')) {
                                    $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}";
                                }
                                else{
                                    $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}.tpl";
                                }
                                $iconExists = false;
                                $iconHtml = '';

                            
                                if (file_exists($iconPath)) {
                                    $iconHtml = file_get_contents($iconPath);
                                    $iconExists = true;
                                }
                            
                                if (($itemStyle == 'icon' || $itemStyle == 'icon-text') && $iconExists) {
                                    $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['predefined_icon'] =  $iconHtml;
                                }
                            }

                            /* Item Type */
                            if ($itemStyle){
                                 $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['style'] =  $itemStyle;
                            }

                            /* Custom Classes */
                            if (isset($child->content->display_settings['custom-data-classes'])) {
                                 $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['custom_classes'] =  $child->content->display_settings['custom-data-classes'];
                            }

                            /* Target Blank */
                            if (isset($child->content->display_settings['target']) && $child->content->display_settings['target'] == "1") {
                                 $rsFooter[$footerItemLocation][$parentOrder]['children'][$childOrder]['target_blank'] = true;
                            }
                        }
                    }
                    ksort($rsFooter[$footerItemLocation][$parentOrder]['children']);
                }
            }
        }
        return [
            'rsFooter' => $rsFooter
        ];
    }
});

/*
 * ******************************************
   5. Functions
 * ******************************************
 */



/* ******************************************
   5.1. Get Display Rule
 * ******************************************/

function getDisplayRule($pageName) {
    $display = Display::where('active', true)->first();
    if ($display->name == 'Default') {
        if (isset($_SESSION['uid'])) {
            $rule = DisplayRule::where('name', 'Existing Client')->first();
        } else {
            $rule = DisplayRule::where('name', 'Guest Client')->first();
        }
    } else { //CMS
        $page = Page::where('name', $pageName)->first();
        if (is_null($page)) { //if page not added to page manager
            $rule = DisplayRule::where('name', 'Client Portal')->first();
        } else {
            switch ($page->display_type) {
                case 'client-portal':
                    $rule = DisplayRule::where('name', 'Client Portal')->first();
                    break;
                case 'website':
                    $rule = DisplayRule::where('name', 'Website')->first();
                    break;
                case 'order-process':
                    $rule = DisplayRule::where('name', 'Order Process')->first();
                    break;
                default:
                    $rule = DisplayRule::where('name', 'Client Portal')->first();
            }
        }
    }

    return $rule;
}

/* ******************************************
   5.2. Generate Menu
 * ******************************************/

function generateRsMenu($navbar, $menu, $language, $layout, $vars, $navbarType) {
    /*** Remove Current Menu ***/
    if (!is_null($navbar->getChildren())) {
        foreach ($navbar->getChildren() as $navbarItem){
            $navbar->removeChild($navbarItem->getName());
        }
    }

    /*** Check User Status ***/
    $client = Menu::context('client');
    $userStatus = 'Logged-Out';
    if (!is_null($client)) {
        $userStatus = 'Logged-In';
    }

    /*** Get WHMCS Pages Routes ***/
    $routes = json_decode(file_get_contents(ROOTDIR . DS . 'templates' . DS . $vars['template'] . DS . 'core' . DS . 'config' . DS  . 'routing' . DS . 'routes.json'), true);

    /*** Items ***/
    foreach ($menu->parents as $parent) {
        $clientStatus = $parent->content->display_settings['client-status'];
        $themeLayouts = $parent->content->display_settings['theme-layout'];

        /*** Set Items - Check User Status / Theme Layouts / Active State ***/
        if (($clientStatus == $userStatus || $clientStatus == 'All') &&
            (in_array($layout['theme_layout'], $themeLayouts) || in_array('All', $themeLayouts)) && 
            $parent->active) {
                
            /*** Declareate variables ***/
            $parentName = '';
            $parentLabel = '';
            $position = $parent->content->display_settings['position'];
            $positionRightClass = '';
            $buildInClasses = '';
            $parentOrder = $parent->order;
            if ($position === 'right') {
                $parentOrder = $parent->order * 100 ;
                $positionRightClass = "is-right";
            }
            $uri = 'index.php';

            /*** Item Type - WHMCS Page ***/
            if ($parent->content->type->name == 'WHMCS Page') {
                $parentName = MenuProcessor::getMenuItemName($parent);
                $parentLabel = MenuProcessor::getMenuItemLabel($parent, $language);
                $parentPageName = $parent->content->content_settings['page'];
                $parentPage = Page::where('id', $parentPageName)->first();
                $pageEnabled = true;
                if ($parentPage) {
                    if ($parentPage->custom_page) {
                        $uri = $parentPage->url;
                    } else {
                        if (isset($routes[$parentPage->name])) {
                            if (isset($routes[$parentPage->name]['page'])) {
                                $uri = $routes[$parentPage->name]['page'];
                            }
                            if (isset($routes[$parentPage->name]['routePath'])) {
                                $uri = routePath($routes[$parentPage->name]['routePath']);
                            }
                        }
                        $pageConfig = MenuProcessor::getWhmcsPageConfiguration($parentPage->name);
                        if (!$pageConfig['enabled']) {
                            $pageEnabled = false;
                        }
                    }
                    if ($pageEnabled) {
                        $navbar->addChild($parentName)
                            ->setLabel($parentLabel)
                            ->setUri($uri)
                            ->setOrder($parentOrder);
                    }
                }
            }

            /*** Item Type - Custom Link ***/
            if ($parent->content->type->name == 'Custom Link') {
                $parentName = MenuProcessor::getMenuItemName($parent);
                $parentLabel = MenuProcessor::getMenuItemLabel($parent, $language);
                $uri = 'index.php';
                if (!empty($parent->content->content_settings['link'])) {
                    $uri = $parent->content->content_settings['link'];
                }
                $navbar->addChild($parentName)
                    ->setLabel($parentLabel)
                    ->setUri($uri)
                    ->setOrder($parentOrder);
            }

            if ($parent->content->type->name == 'Client Account') {
                $parentName = 'My Account';
                $parentLabel = Lang::trans('myaccount', [], null, $language);
                if (isset($parent->content->display_settings['style'])) {
                    $itemStyle = $parent->content->display_settings['style'][$layout['type']];
                    if ($itemStyle['layout'] == 'icon') {
                        if ($navbarType == "primary"){
                            $buildInClasses .= ' nav-item-icon-only';
                        }
                        else{
                            $parentLabel = false;
                        }
                    }
                }
                $uri = '#';
                $buildInClasses = " my-account";
                if (!empty($parent->content->content_settings['link'])) {
                    $uri = $parent->content->content_settings['link'];
                }
                $navbar->addChild('Account')
                    ->setLabel($parentLabel)
                    ->setUri($uri)
                    ->setOrder($parentOrder);
            }

            /*** Item Type - WHMCS Notifications ***/
            if ($parent->content->type->name == 'WHMCS Notifications') {
                $parentName = MenuProcessor::getMenuItemName($parent);
                $parentLabel = MenuProcessor::getMenuItemLabel($parent, $language);
                if (isset($parent->content->display_settings['style'])) {
                    $itemStyle = $parent->content->display_settings['style'][$layout['type']];
                    if ($itemStyle['layout'] == 'icon') {
                        if ($navbarType == "primary"){
                            $buildInClasses .= ' nav-item-icon-only';
                        }
                        else{
                            $parentLabel = false;
                        }
                    }
                }
                if (!is_null($client)) {
                    $uri = '#';
                    $navbar->addChild($parentName)
                        ->setLabel($parentLabel)
                        ->setUri($uri)
                        ->setOrder($parentOrder)
                        ->setAttribute('notificationDropdown', true);
                    $alerts = new WHMCS\User\Client\AlertFactory($client);
                    $clientAlerts = $alerts->build();
                    $navigationOffset = 0;

                    if ($clientAlerts->count() > 0){
                        $navbar
                            ->getChild($parentName)
                            ->addChild("Alert_{$navigationOffset}", [
                                'bodyHtml' => '<li class="client-alerts-header">'.Lang::trans('notifications', [], null, $language).'</li>'
                            ]);

                        $navigationOffset++;            
                        
                        foreach ($clientAlerts as $clientAlert) {
                            $navbar
                                ->getChild($parentName)
                                ->addChild("Alert_{$navigationOffset}", [
                                    'icon' => 'fa-ticket lm lm-info text-' . $clientAlert->getSeverity(),
                                    'label' => '<div>' . $clientAlert->getMessage() . '</div>',
                                    'uri' => $clientAlert->getLink(),
                                    'order' => $navigationOffset
                                ]);
                            $navigationOffset++;
                        }
                        $navbar
                            ->getChild($parentName)
                            ->setBadge('<span class="nav-badge badge badge-primary badge-dot badge-icon"><span>'.Lang::trans('notificationsnew').'</span></span>');
                    }
                    else{
                        $navbar
                            ->getChild($parentName)
                            ->addChild("Alert_{$navigationOffset}", [
                                'bodyHtml' => '<li class="none"><div class="none-icon">'.file_get_contents('templates/'.$vars['template'].'/assets/svg-icon/notification.tpl').'</div><span class="text-light">'.Lang::trans('notificationsnone', [], null, $language).'</span></li>'
                            ]);
                    }
                }
            }

            /*** Item Type - Language ***/
            if ($parent->content->type->name == 'Language' && $vars['languagechangeenabled']) {
                $parentName = "Language-{$parent->id}";
                $parentLabel = $vars['activeLocale']['localisedName'];
                $flag = false;
                if (isset($parent->content->display_settings['style'])) {
                    $itemStyle = $parent->content->display_settings['style'][$layout['type']];
                    if ($itemStyle['layout'] == 'icon') {
                        if ($navbarType == "primary"){
                            $buildInClasses .= ' nav-item-icon-only';
                        }
                        else{
                            $parentLabel = false;
                        }
                    }
                    if ($itemStyle['layout'] == 'icon-text' || $itemStyle['layout'] == 'icon') {
                        $flag = '<span class="language-flag '.$vars["activeLocale"]["language"].'"></span>';
                    }
                }
                $navbar->addChild($parentName)
                    ->setLabel($parentLabel)
                    ->setUri($uri)
                    ->setOrder($parentOrder)
                    ->setAttribute('languageDropdown', true)
                    ->setHeadingHtml($flag);
            }

            /* Currencies */
            if ($parent->content->type->name == 'Currency Switcher') {
                $parentName = "Currencies-{$parent->id}";
                $rslang = RsLang::factory(AddonHelper::getTemplate()->getFullPath());
                $currencyLang = $rslang->trans('generals.currency');
                $parentLabel = $vars['activeCurrency']['code'];
                $buildInClasses .= ' nav-item-currency';

                if (isset($parent->content->display_settings['style'])) {
                    $itemStyle = $parent->content->display_settings['style'][$layout['type']];
                    if ($itemStyle['layout'] == 'icon') {
                        if ($navbarType == "primary"){
                            $buildInClasses .= ' nav-item-icon-only';
                        }
                        else{
                            $parentLabel = false;
                        }
                    }
                }

                $navbar->addChild($parentName)
                    ->setLabel($parentLabel)
                    ->setUri($uri)
                    ->setOrder($parentOrder)
                    ->setAttribute('currencyDropdown', true);
                    
            }

            /*** Item Style ***/
            if (isset($parent->content->display_settings['style'])) {
                $itemStyle = $parent->content->display_settings['style'][$layout['type']];
                if ($parentName == "My Account" && $parent->content->type->name == 'Client Account'){
                    $parentName = "Account";
                }
                $navItem = $navbar->getChild($parentName);
                if (isset($navItem) && !empty($itemStyle)) {
                    /*** Item Style - Button ***/
                    if ($itemStyle['layout'] == 'button') {
                        if ($parentName == "My Account" || $parentName == "Account"){
                            $parentLabel = $vars['clientsdetails']['firstname'].' '.$vars['clientsdetails']['lastname'];
                        }
                        /*if ((strpos($uri, 'http') === false) && (substr($uri, 0, 1) != '/') && (substr($url, 0, 1) != '#') && (strpos($uri, 'javascript') === false)) {
                            $uri = $vars['systemurl'] . $uri;
                        }*/
                        $uri = AddonHelper::convertUri($uri);
                        if (isset($parent->content->display_settings['target']) && $parent->content->display_settings['target'] == "1"){
                            $target = 'target="_blank"';
                        }
                        if ($itemStyle['button-style'] == "outline"){
                            $itemStyle['button-style'] = $itemStyle['button-style'].' btn-default';
                        }
                        if ($navbarType == "secondary"){
                            $itemStyle['button-style'] = $itemStyle['button-style'].' btn-xs';
                        }
                        if ($parent->children_count > 0) { 
                            $buttonTemplate = '
                                <a class="dropdown-toggle btn btn-'.$itemStyle['button-style'].'" href="#" data-toggle="dropdown">
                                    <span>'.$parentLabel.'</span>
                                    <b class="ls ls-caret"></b>
                                </a>';
                        }
                        else{
                            $buttonTemplate = '
                            <a class="btn btn-'.$itemStyle['button-style'].'" href="'.$uri.'" '.$target.'>
                                <span>'.$parentLabel.'</span> 
                            </a>';
                        }

                        $navItem->setBodyHtml($buttonTemplate);
                    }
                    /*** Item Style - Link ***/
                    if ($itemStyle['layout'] != 'button') {
                        
                        /*** Item Badge - Cart Items ***/
                        $cartItemCountBadge = false;
                        
                        if ($parentName == "View Cart"){
                            $cart = new WHMCS\OrderForm();
                            $cartItemCount = $cart->getNumItemsInCart();
                            $buildInClasses .= ' nav-item-cart';
                            if ($cartItemCount > 0){                              
                                $cartItemBadgeHide = false;
                            }
                            else{
                                $cartItemCount = false;
                                $cartItemBadgeHide = 'hidden';
                            }
                            $cartItemCountBadge = '<span class="nav-badge badge badge-primary-faded ' . $cartItemBadgeHide . '"><span>' . $cartItemCount . '</span></span>';
                            $navItem->setBadge($cartItemCountBadge);
                        }

                        /*** Item Font Icon ***/
                        if (isset($parent->content->content_settings['icon']) && !empty($parent->content->content_settings['icon'])) {
                            $itemIcon = $parent->content->content_settings['icon'];
                            $navItem->setIcon('fa fa-test ' . $itemIcon);
                            if ($itemStyle['layout'] == 'text'){
                                $buildInClasses .= ' nav-item-text-only';
                            }
                            if ($itemStyle['layout'] == 'icon') {
                                if ($navbarType == "primary"){
                                    $buildInClasses .= ' nav-item-icon-only';
                                }
                                else{
                                    $navItem->setLabel(false);
                                }
                            }
                        }

                        /*** Item Image Icon ***/
                        if (isset($parent->content->content_settings['predefined_icon']) && !empty($parent->content->content_settings['predefined_icon'])) {
                            $predefinedIcon = $parent->content->content_settings['predefined_icon'];
                            if (str_contains($predefinedIcon, '.tpl')) {
                                $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}";
                            }
                            else{
                                $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}.tpl";
                            }
                            $iconExists = false;
                            
                            $iconHtml = '';
                            if (file_exists($iconPath)) {
                                $iconHtml = file_get_contents($iconPath);
                                $iconExists = true;
                            }
                            
                            if ($iconExists) {
                                $navItem->setHeadingHtml($iconHtml);
                            }
                            if ($itemStyle['layout'] == 'text'){
                                $buildInClasses .= ' nav-item-text-only';
                            }
                            if ($itemStyle['layout'] == 'icon' && $iconExists) {
                                if ($navbarType == "primary"){
                                    $buildInClasses .= ' nav-item-icon-only';
                                }
                                else{
                                    $navItem->setLabel(false);
                                }
                            }
                        }
                    }
                }
            }
            /*** Item Children ***/
            if ($parent->children_count > 0) { 
                $domainsPageCount = 0;
                foreach ($parent->children as $child) {
                    /*** Declarate Variables ***/
                    if ($parentName == "My Account" && $parent->content->type->name == 'Client Account'){
                        $parentName = "Account";
                    }
                    $navItem = $navbar->getChild($parentName);
                    $childName = '';
                    $childOrder = $child->order * 100;
                    $childClientStatus = $parent->content->display_settings['client-status'];
                    $childBuildInClasses = false;

                    /*** Set Items - Check User Status / Active State ***/
                    if (!is_null($navItem) && ($childClientStatus == $userStatus || $childClientStatus == 'All') && $child->active) {
                        $divider = false;
                        
                        /*** Child Item Type - Divider ***/
                        if ($child->content->type->name == 'Divider') {
                            $divider = true;
                        }
                        if (!$divider) {
                            /*** Child Item Type - WHMCS Page ***/
                            if ($child->content->type->name == 'WHMCS Page') {
                                $uri = 'index.php';
                                $childName = MenuProcessor::getMenuItemName($child);
                                $childLabel = MenuProcessor::getMenuItemLabel($child, $language);
                                $childBadge = false;
                                $childPageName = $child->content->content_settings['page'];
                                $childPage = Page::where('id', $childPageName)->first();  
                                $childPageEnabled = true;
                                if ($childPage) {
                                    if ($childPage->custom_page) {
                                        $uri = $childPage->url;
                                    } else {
                                        if (isset($routes[$childPage->name])) {
                                            if (isset($routes[$childPage->name]['page'])) {
                                                $uri = $routes[$childPage->name]['page'];
                                            }
                                            if (isset($routes[$childPage->name]['routePath'])) {
                                                $uri = routePath($routes[$childPage->name]['routePath']);
                                            }
                                        }
                                        $pageConfig = MenuProcessor::getWhmcsPageConfiguration($childPage->name);
                                        if (!$pageConfig['enabled']) {
                                            $childPageEnabled = false;
                                        }
                                    }
                                    if($childPage->name == "clientareadomains" && $vars['clientsstats']['numactivedomains'] > 0)
                                        $childBadge = "<span class='badge badge-info badge-right'>".$vars['clientsstats']['numactivedomains']."</span>";
                                    elseif($childPage->name == "supportticketslist" && $vars['clientsstats']['numactivetickets'] > 0)
                                        $childBadge = "<span class='badge badge-info badge-right'>".$vars['clientsstats']['numactivetickets']."</span>";
                                    elseif($childPage->name == "clientareainvoices" && $vars['clientsstats']['numoverdueinvoices'] > 0)
                                        $childBadge = "<span class='badge badge-danger badge-right'>".$vars['clientsstats']['numoverdueinvoices']."</span>";
                                    elseif($childPage->name == "clientareaquotes" && $vars['clientsstats']['numacceptedquotes'] > 0)
                                        $childBadge = "<span class='badge badge-info badge-right'>".$vars['clientsstats']['numacceptedquotes']."</span>";
                                    elseif($childPage->name == "clientareaproducts" && $vars['clientsstats']['productsnumactive'] > 0) {
                                        $childBadge = "<span class='badge badge-info badge-right'>" . $vars['clientsstats']['productsnumactive'] . "</span>";
                                    }
                                  
                                    if ($childPageEnabled) {
                                        $navItem->addChild($childName, [
                                            'label' => $childLabel,
                                            'uri' => $uri,
                                            'order' => $childOrder,
                                            'badge' => $childBadge,
                                        ]);
                                    }
                                }
                            }

                            /*** Child Item Type - Custom Link ***/
                            if ($child->content->type->name == 'Custom Link') {
                                $childName = MenuProcessor::getMenuItemName($child);
                                $childLabel = MenuProcessor::getMenuItemLabel($child, $language);
                                $childUri = 'index.php';
                                if (!empty($child->content->content_settings['link'])) {
                                    $childUri = $child->content->content_settings['link'];
                                }
                                $navItem->addChild($childName, [
                                    'label' => $childLabel,
                                    'uri' => $childUri,
                                    'order' => $childOrder,
                                ]);
                            }

                            /*** Child Item Type - Predefined List ***/
                            if ($child->content->type->name == 'Predefined List') {
                                $list = $child->content->content_settings['list'];
                                $listOffset = 0;
                                if (!empty($list)) {
                                    $pageConfig = MenuProcessor::getWhmcsPageConfiguration("predefined_list.$list");
                                    if (!$pageConfig['enabled']) {
                                        continue;
                                    }
                                    /*** Predefined List - Product Groups ***/
                                    if ($list == 'Product Groups') {
                                        foreach (ProductGroup::notHidden()->sorted()->get() as $group) {
                                            $order = $childOrder + $listOffset;
                                            $navItem->addChild("{$group->name}", [
                                                'label' => $group->name,
                                                'uri' => $group->getRoutePath(),
                                                'order' => $order,
                                            ]);
                                            $listOffset++;
                                        }

                                        $addonChildren = getStoreAddonChildren($order + $listOffset);

                                        if (!empty($addonChildren)) {
                                            $navItem->addChild("Divider-{$child->id}", [
                                                'bodyHtml' => '-----',
                                                'order' => $childOrder + 10000
                                            ])->setClass('nav-divider');
                                            $listOffset ++;

                                            foreach ($addonChildren as $addon) {
                                                $order = $childOrder + 10000 + $listOffset;
                                                $navItem->addChild($addon['label'], [
                                                    'label' => $addon['label'],
                                                    'uri' => routePath('store-addon', $addon['url']),
                                                    'order' => $order,
                                                ]);
                                                $listOffset++;
                                            }  
                                        }

                                    }
                                    /*** Predefined List - Client Details ***/
                                    if ($list == 'Client Details') {
                                        if (!is_null($client)) {
                                            $template = ' 
                                                <div class="dropdown-header-desc">
                                                    ' . $client->companyname .'
                                                </div>
                                                <div class="dropdown-header-title">
                                                    ' . $client->fullName .'
                                                </div>
                                                ';
                                            $navItem->addChild("Client Details", [
                                                'label' => $template,
                                                'uri' => 'clientarea.php?action=details',
                                                'order' => $childOrder,
                                                'target' => '_blank',
                                            ]);
                                        }
                                    }

                                    /*** Predefined List - Download Categories ***/
                                    if ($list == 'Download Categories') {
                                        $downloadCats = Capsule::table('tbldownloadcats')->where('hidden', '')->orWhere('hidden', 0)->get();
                                        foreach ($downloadCats as $downloadCat) {
                                            $uri = StringConverter::toUpperCaseSlug($downloadCat->name);
                                            $order = $childOrder + $listOffset;
                                            $navItem->addChild("{$downloadCat->name}", [
                                                'label' => $downloadCat->name,
                                                'uri' => '/index.php?rp=/download/category/'.$downloadCat->id.'/' .$uri.'.html',
                                                'order' => $order
                                            ]);
                                            $listOffset++;
                                        }
                                    }

                                    /*** Predefined List - Knowledgebase Categories ***/
                                    if ($list == 'Knowledgebase Categories') {
                                        $knowledgebaseCats = Capsule::table('tblknowledgebasecats')->where('hidden', '')->orWhere('hidden', 0)->get();
                                        foreach ($knowledgebaseCats as $knowledgebaseCat) {
                                            $uri = StringConverter::toUpperCaseSlug($knowledgebaseCat->name);
                                            $order = $childOrder + $listOffset;
                                            $navItem->addChild("{$knowledgebaseCat->name}", [
                                                'label' => $knowledgebaseCat->name,
                                                'uri' => '/index.php?rp=/knowledgebase/'.$knowledgebaseCat->id.'/'.$uri,
                                                'order' => $order
                                            ]);
                                            $listOffset++;
                                        }
                                    }

                                    /*** Predefined List - MarketConnect Products ***/
                                    if ($list == 'MarketConnect Products' && \WHMCS\MarketConnect\MarketConnect::hasActiveServices()) {
                                        
                                        $marketConnectProducts = \WHMCS\MarketConnect\MarketConnect::getMenuItems(false);
                                        foreach ($marketConnectProducts as $marketConnectProduct) {                                                                                       
                                            $order = $childOrder + round($marketConnectProduct['order'] / 10) - 100;
                                            $navItem->addChild($marketConnectProduct['name'], [
                                                'label' => $marketConnectProduct['label'],
                                                'uri' => $marketConnectProduct['uri'],
                                                'order' => $order
                                            ]); 
                                        }
                                    }

                                    /*** Predefined List - Ticket Departments ***/
                                    if ($list == 'Ticket Departments') {
                                        $departments = \RSThemes\Models\TicketDepartments::orderBy('order')->get();
                                       
                                        foreach ($departments as $department) {
                                            $order = $childOrder + $listOffset;
                                            
                                            if ($userStatus == 'Logged-Out' && $department->clientsonly == "on"){}
                                            else{
                                                $navItem->addChild("{$department->name}", [
                                                    'label' => $department->name,
                                                    'uri' => 'submitticket.php?step=2&deptid=' . $department->id,
                                                    'order' => $order,
                                                ]);
                                                $listOffset++;
                                            }
                                        }
                                    }
                                }
                            }
                            
                            /*** Child Item Style ***/
                            if (isset($child->content->display_settings['style'])) {
                                $childItemStyle = $child->content->display_settings['style']['layout'];
                                $childItem = $navItem->getChild($childName);
                               
                                if (isset($childItem) && !empty($childItemStyle)) {
                                    
                                    if (isset($child->content->content_settings['icon']) && !empty($child->content->content_settings['icon'])) {
                                        $itemIcon = $child->content->content_settings['icon'];
                                        $childItem->setIcon('fa fa-test ' . $itemIcon);
                                        if ($childItemStyle == 'text'){
                                            $childBuildInClasses .= 'nav-item-text-only';
                                        }
                                        if ($childItemStyle == "icon"){
                                            $childItem->setLabel(false);
                                            $childBuildInClasses .= 'nav-item-icon-only';
                                        }
                                    }
                                    if (isset($child->content->content_settings['predefined_icon']) && !empty($child->content->content_settings['predefined_icon'])) {
                                        $predefinedIcon = $child->content->content_settings['predefined_icon'];
                                        if (str_contains($predefinedIcon, '.tpl')) {
                                            $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}";
                                        }
                                        else{
                                            $iconPath = __DIR__ ."/../../assets/svg-icon/{$predefinedIcon}.tpl";
                                        }
                                        $iconExists = false;
                                        $iconHtml = '';
                                        if (file_exists($iconPath)) {
                                            $iconHtml = file_get_contents($iconPath);
                                            $iconExists = true;
                                        }
                                        if ($iconExists) {
                                            $childItem->setHeadingHtml($iconHtml);
                                        }
                                        if ($childItemStyle == 'text'){
                                            $buildInClasses .= ' nav-item-text-only';
                                        }
                                        if ($childItemStyle == 'icon' && $iconExists) {
                                            $buildInClasses .= ' nav-item-icon-only';
                                        }
                                    }
                                    
                                }    
                               
                            }

                            /*** Child Item Custom Classes ***/
                            if (isset($child->content->display_settings['custom-data-classes'])) {
                                $childItem = $navItem->getChild($childName);
                                $navItemClasses = false;
                                if (isset($childItem)) {                                  
                                    if ($child->content->display_settings['custom-data-classes'] != ""){
                                        $navItemClasses .= ' '.$child->content->display_settings['custom-data-classes'];
                                    }
                                    if ($childBuildInClasses != ""){
                                        $navItemClasses .= ' '.$childBuildInClasses;
                                    }
                                    if ($navItemClasses){
                                        $childItem->setClass($navItemClasses);
                                    }
                                }  
                            }  

                            /*** Child Item - Set Target */
                            if (isset($child->content->display_settings['target']) && $child->content->display_settings['target'] == "1") {
                                $childItem = $navItem->getChild($childName);
                                if (isset($childItem)) {
                                    $childItem->setAttribute('target', '_blank');
                                }
                            }

                        } else {
                            /*** Child Item - Set Divider ***/
                            $navItem->addChild("Divider-{$child->id}", [
                                'bodyHtml' => '-----',
                                'order' => $childOrder,
                            ])->setClass('nav-divider');
                        }
                    }
                }
                /* ??? //parent has two domains pages (register & transfer) */
                if ($domainsPageCount == 2) { 
                    $navbar->removeChild("{$parentName}");
                }
            }
            
            /* Item - Set classes */
            if (isset($parent->content->display_settings['custom-data-classes'])) {
                $navItem = $navbar->getChild($parentName);

                $navItemClasses = false;

                if (isset($navItem)) {
                    if ($itemStyle['layout'] == 'button') {
                        $navItemClasses .= ' nav-item-btn';
                    }
                    if ($positionRightClass != ""){
                        $navItemClasses .= ' '.$positionRightClass;
                    }
                    if ($parent->content->display_settings['custom-data-classes'] != ""){
                        $navItemClasses .= ' '.$parent->content->display_settings['custom-data-classes'];
                    }
                    if ($buildInClasses != ""){
                        $navItemClasses .= ' '.$buildInClasses;
                    }
                    if ($navItemClasses){
                        $navItem->setClass($navItemClasses);
                    }
                }  
            }  
            /* Item - Set Target */
            if (isset($parent->content->display_settings['target']) && $parent->content->display_settings['target'] == "1") {
                $navItem = $navbar->getChild($parentName);
                if (isset($navItem)) {
                    $navItem->setAttribute('target', '_blank');
                }
            }
        }
    }
    MenuItem::sort($navbar);
}


function getStoreAddonChildren($startIndex){
    $matchingAddonConfigs = \WHMCS\Config\Module\ModuleConfiguration::with("productAddon")->where("entity_type", "addon")->where("setting_name", "configoption1")->whereIn("value", ["wp-toolkit-deluxe", "WordPress Toolkit with Smart Updates"])->get()->sort(function ($a, $b) {
        if ($a->value == $b->value) {
            return 0;
        }
        return $a->value == "wp-toolkit-deluxe" ? -1 : 1;
    })->take(1);
    $menuItemIndex = $startIndex;
    $addonChildren = [];
    foreach ($matchingAddonConfigs as $addonConfig) { 
        $addonSlug = \Illuminate\Support\Str::slug($addonConfig->value);
        $addonChildren[$startIndex]['label'] = \WHMCS\Cart\Controller\ProductController::ADDON_SLUGS[$addonSlug]["friendlyName"];
        $addonChildren[$startIndex]['url'] = $addonSlug;
        
    }
    return $addonChildren;
}


/*
 * ******************************************
   6. Additional Navbar Hooks
 * ******************************************
 */


add_hook('ClientAreaPrimaryNavbar', 2, function ($primaryNavbar) {
    /* Services */
    if ($primaryNavbar && !is_null($primaryNavbar->getChild('Services'))) {
        $servicesNavbar =  $primaryNavbar->getChild('Services');
        
        if ($servicesNavbar && !is_null($servicesNavbar->getChild('My Licenses'))) {
            $servicesNavbar->getChild('My Licenses')->setIcon('fa-ticket ls ls-chain');
        }
    }

    /* Domains */
    if ($primaryNavbar && !is_null($primaryNavbar->getChild('Domains'))) {
        $domainNavbar =  $primaryNavbar->getChild('Domains');
        
        if ($domainNavbar && !is_null($domainNavbar->getChild('Manage DNS'))) {
            $domainNavbar->getChild('Manage DNS')->setIcon('fa-ticket ls ls-input-code');
        }
    }

    /* Project Managenemt */
    if ($primaryNavbar && !is_null($primaryNavbar->getChild('pm-addon-overview'))) {
        $primaryNavbar->getChild('pm-addon-overview')->setIcon('fa-folder lm lm-folder');
    }

    /* Market Connect Services */
    $mcServices = [
        'symantec' => 'fa-ticket ls ls-padlock',
        'weebly' => 'fa-ticket ls ls-dashboard',
        'spamexperts' => 'fa-ticket ls ls-envelope',
        'sitelock' => 'fa-ticket ls ls-shield',
        'codeguard' => 'fa-ticket ls ls-refresh',
        'marketgoo' => 'fas fa-ticket ls ls-search',
        'sitelockvpn' => 'fa-ticket ls ls-key',
        'ox' => 'fa-ticket ls ls-envelope',
        'siteBuilder' => 'fa-ticket ls ls-sitebuilder',
        'cpanelseo' => 'fa-ticket ls ls-box',
        'WordPress Toolkit' => 'fa-ticket ls ls-addon',
    ];

    /* Product Groups */
    $servicesNames = [];
    $servicesItem = [];
    
    foreach (ProductGroup::notHidden()->sorted()->get() as $group) {
        $servicesNames[] = $group->name;
    }

    foreach ($primaryNavbar as $navItem){
        /* Assign Icons to MC Services*/
        foreach($mcServices as $service => $icon){
            if (!is_null($navItem->getChild($service))){
                $navItem->getChild($service)->setIcon($icon);               
            }
        }
        /* Get Products List Parent Name */
        $children = $navItem->getChildren();
        foreach ($children as $child){
            foreach ($servicesNames as $name){
                if (strstr($child->getName(), $name)){
                    if(!in_array($child->getParent()->getName(), $servicesItem)){
                        $servicesItem[] = $child->getParent()->getName();
                    }
                }
            }
        }
    }

    /* Set Icons in products list */
    foreach ($servicesItem as $item){   
        if (!is_null($primaryNavbar->getChild($item))){
            $item = $primaryNavbar->getChild($item);
            $children = $item->getChildren();
            foreach ($children as $child){
                if ((strstr($child->getName(), "Dedicated") || strstr($child->getName(), "VPS") || strstr($child->getName(), "Hosting")) && $child->getIcon() == "" && $child->getHeadingHtml() == ""){
                    $child->setIcon('fa-ticket ls ls-hosting');
                }
                else if(strstr($child->getName(), "SSL") && $child->getIcon() == "" && $child->getHeadingHtml() == ""){
                    $child->setIcon('fa-ticket ls ls-shield');
                }
                else if ($child->getIcon() == "" && $child->getHeadingHtml() == ""){    
                    $child->setIcon('fa-ticket ls ls-box');
                }
            }
        }
    }
});