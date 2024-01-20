<?php

use RSThemes\Models\Settings;
use WHMCS\Database\Capsule;
use RSThemes\Template\Template;
use RSThemes\Template\Page;

add_hook('ClientAreaSidebars', 1, function($vars) {
    $primarySidebar = Menu::primarySidebar();
    $secondarySidebar = Menu::secondarySidebar();

    //dashboard
    if ($primarySidebar && !is_null($primarySidebar->getChild('Client Details'))) {
        $primarySidebar->getChild('Client Details')->setClass('panel-client-details');
        
        //show client id in Client Details Panel
        $client = \Menu::context("client");
        if (!is_null($client)) {
            if (Settings::where('setting', 'show_client_id')->first()->value && Settings::where('setting', 'show_client_id')->first()->value == "displayed"){
                if (Capsule::schema()->hasTable('ResellersCenter_ResellersClients')){
                    $resellersCheck = Capsule::table('ResellersCenter_ResellersClients')
                    ->where('client_id', $client->id)
                    ->value('id');
                }
                if (isset($resellersCheck) && $resellersCheck){
                    $clientId = $resellersCheck;
                }
                else{
                    $clientId = $client->id;
                }
                
                $show_id = '#'.$clientId.' ';
                $details = "";
                if ($client->companyName) {
                    $details .= "<strong>". $show_id . $client->companyName . "</strong><br><em>" . $client->fullName . "</em><br>";
                } else {
                    $details .= "<strong>". $show_id . $client->fullName . "</strong><br>";
                }
                $details .= $client->address1 . "<br>";
                if ($client->address2) {
                    $details .= $client->address2 . "<br>";
                }
                $address = [];
                if ($client->city) {
                    $address[] = $client->city;
                }
                if ($client->state) {
                    $address[] = $client->state;
                }
                if ($client->postcode) {
                    $address[] = $client->postcode;
                }
                $details .= implode(", ", $address) . "<br>" . $client->countryName;
                if ($client->taxId) {
                    $details .= "<br>" . $client->taxId;
                }
                $primarySidebar->getChild('Client Details')->setBodyHtml($details);
            }
        }
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Client Contacts'))) {
        $secondarySidebar->getChild('Client Contacts')->setClass('panel-client-contacts');
        $secondarySidebar->getChild('Client Contacts')->addChild('more')
        ->setUri('clientarea.php?action=contacts')
        ->setLabel(Lang::trans('more'))
        ->setClass('contact-more')
        ->setIcon('fa-ticket ls ls-more')
        ->setOrder(1000);
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Client Shortcuts'))) {
        $shortcutsSidebar = $secondarySidebar->getChild('Client Shortcuts');
        if (!is_null($shortcutsSidebar->getChild('Order New Services'))){
            $shortcutsSidebar->getChild('Order New Services')->setIcon('fa-ticket ls ls-basket');
        }
        if (!is_null($shortcutsSidebar->getChild('Register New Domain'))){
            $shortcutsSidebar->getChild('Register New Domain')->setIcon('fa-ticket ls ls-dns');
        }
        if (!is_null($shortcutsSidebar->getChild('Logout'))){
            $shortcutsSidebar->getChild('Logout')->setIcon('fa-ticket ls ls-reply');
        }
    }
    //my account
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Account'))) {
        $accountSidebar = $primarySidebar->getChild('My Account');
        if (!is_null($accountSidebar->getChild('My Details'))){
            $accountSidebar->getChild('My Details')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($accountSidebar->getChild('Billing Information'))){
            $accountSidebar->removeChild('Billing Information');
        }
        if (!is_null($accountSidebar->getChild('Payment Methods'))){
            $accountSidebar->getChild('Payment Methods')->setIcon('fa-ticket ls ls-credit-card');
        }
        if (!is_null($accountSidebar->getChild('Contacts/Sub-Accounts'))){
            $accountSidebar->getChild('Contacts/Sub-Accounts')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($accountSidebar->getChild('Change Password'))){
            $accountSidebar->getChild('Change Password')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($accountSidebar->getChild('Security Settings'))){
            $accountSidebar->getChild('Security Settings')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($accountSidebar->getChild('Email History'))){
            $accountSidebar->getChild('Email History')->setIcon('fa-ticket ls ls-envelope');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Account')) && $secondarySidebar && !is_null($secondarySidebar->getChild('Billing'))) {
        $primarySidebar->removeChild('My Account');
    }

    //account
    if ($primarySidebar && !is_null($primarySidebar->getChild('Account'))) {
        $accountSidebar = $primarySidebar->getChild('Account');
        if (!is_null($accountSidebar->getChild('My Details'))){
            $accountSidebar->getChild('My Details')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($accountSidebar->getChild('Billing Information'))){
            $accountSidebar->removeChild('Billing Information');
        }
        if (!is_null($accountSidebar->getChild('Payment Methods'))){
            $accountSidebar->getChild('Payment Methods')->setIcon('fa-ticket ls ls-credit-card');
        }
        if (!is_null($accountSidebar->getChild('Contacts/Sub-Accounts'))){
            $accountSidebar->getChild('Contacts/Sub-Accounts')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($accountSidebar->getChild('Change Password'))){
            $accountSidebar->getChild('Change Password')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($accountSidebar->getChild('Security Settings'))){
            $accountSidebar->getChild('Security Settings')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($accountSidebar->getChild('Account Security'))){
            $accountSidebar->getChild('Account Security')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($accountSidebar->getChild('Email History'))){
            $accountSidebar->getChild('Email History')->setIcon('fa-ticket ls ls-envelope');
        }
        if (!is_null($accountSidebar->getChild('User Management'))){
            $accountSidebar->getChild('User Management')->setIcon('fa-ticket ls ls-configure');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Account')) && $secondarySidebar && !is_null($secondarySidebar->getChild('Billing'))) {
        $primarySidebar->removeChild('Account');
    }

    // your profile
    if ($primarySidebar && !is_null($primarySidebar->getChild('Profile'))) {
        $profileSidebar = $primarySidebar->getChild('Profile');
        if (!is_null($profileSidebar->getChild('Your Profile'))){
            $profileSidebar->getChild('Your Profile')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($profileSidebar->getChild('Change Password'))){
            $profileSidebar->getChild('Change Password')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($profileSidebar->getChild('User Security'))){
            $profileSidebar->getChild('User Security')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($profileSidebar->getChild('Logout'))){
            $profileSidebar->getChild('Logout')->setIcon('fa-ticket ls ls-sign-out');
        }
        if (!is_null($profileSidebar->getChild('Switch Account'))){
            $profileSidebar->getChild('Switch Account')->setIcon('fa-ticket ls ls-refresh');
        }

    }

    // Support
    if ($primarySidebar && !is_null($primarySidebar->getChild('Support Knowledgebase Categories'))) {
        $primarySidebar->removeChild('Support Knowledgebase Categories');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Support Knowledgebase Tag Cloud'))) {
        $secondarySidebar->getChild('Support Knowledgebase Tag Cloud')->setClass('panel-styled-group panel-support-tags');
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Ticket Information'))) {
        $primarySidebar->getChild('Ticket Information')->setClass('panel-styled-group panel-ticket-information');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Recent Tickets'))) {
        $secondarySidebar->getChild('Recent Tickets')->setClass('panel-styled-group');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Attachments'))) {
        $secondarySidebar->getChild('Attachments')->setClass('panel-styled-group panel-ticket-attachements');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('CC Recipients'))) {
        $secondarySidebar->getChild('CC Recipients')->setClass('panel-styled-group panel-ticket-cc');
    }
    
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Support'))) {
        $supportSidebar = $secondarySidebar->getChild('Support');
        if (!is_null($supportSidebar->getChild('Support Tickets'))){
            $supportSidebar->getChild('Support Tickets')->setIcon('fa-ticket ls ls-ticket-tag');
        }
        if (!is_null($supportSidebar->getChild('Announcements'))){
            $supportSidebar->getChild('Announcements')->setIcon('fa-ticket ls ls-text-cloud');
        }
        if (!is_null($supportSidebar->getChild('Knowledgebase'))){
            $supportSidebar->getChild('Knowledgebase')->setIcon('fa-ticket ls ls-document-info');
        }
        if (!is_null($supportSidebar->getChild('Downloads'))){
            $supportSidebar->getChild('Downloads')->setIcon('fa-ticket ls ls-download-square');
        }
        if (!is_null($supportSidebar->getChild('Network Status'))){
            $supportSidebar->getChild('Network Status')->setIcon('fa-ticket ls ls-range');
        }
        if (!is_null($supportSidebar->getChild('Open Ticket'))){
            $supportSidebar->getChild('Open Ticket')->setIcon('fa-ticket ls ls-new-window');
        }
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Popular Downloads'))) {
        $secondarySidebar->removeChild('Popular Downloads');
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Ticket List Status Filter'))) {
        $primarySidebar->removeChild('Ticket List Status Filter');
    }

    if ($primarySidebar && !is_null($primarySidebar->getChild('Announcements Months'))) {
        $annoucementSidebar = $primarySidebar->getChild('Announcements Months');
        if (!is_null($annoucementSidebar->getChild('Older'))){
            $annoucementSidebar->getChild('Older')->setIcon('fa-ticket ls ls-hourglass');
        }
        if (!is_null($annoucementSidebar->getChild('RSS Feed'))){
            $annoucementSidebar->getChild('RSS Feed')->setIcon('fa-ticket ls ls-rss');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Network Status'))) {
        $primarySidebar->removeChild('Network Status');
    }

    // Billing
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Billing'))) {
        $billingSidebar = $secondarySidebar->getChild('Billing');
        if (!is_null($billingSidebar->getChild('Invoices'))){
            $billingSidebar->getChild('Invoices')->setIcon('fa-ticket ls ls-document');
        }
        if (!is_null($billingSidebar->getChild('Quotes'))){
            $billingSidebar->getChild('Quotes')->setIcon('fa-ticket ls ls-text-cloud');
        }
        if (!is_null($billingSidebar->getChild('Mass Payment'))){
            $billingSidebar->getChild('Mass Payment')->setIcon('fa-ticket ls ls-bank-note');
        }
        if (!is_null($billingSidebar->getChild('Manage Credit Card'))){
            $billingSidebar->getChild('Manage Credit Card')->setIcon('fa-ticket ls ls-credit-card');
        }
        if (!is_null($billingSidebar->getChild('Add Funds'))){
            $billingSidebar->getChild('Add Funds')->setIcon('fa-ticket ls ls-credit');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Invoices Summary'))) {
        $primarySidebar->removeChild('My Invoices Summary');
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Invoices Status Filter'))) {
        $primarySidebar->removeChild('My Invoices Status Filter');
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Quotes Status Filter'))) {
        $primarySidebar->removeChild('My Quotes Status Filter');
    }

    //add funds
    if ($primarySidebar && !is_null($primarySidebar->getChild('Add Funds'))) {
        $primarySidebar->removeChild('Add Funds');
    }

    //my services
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Services Status Filter'))) {
        $primarySidebar->removeChild('My Services Status Filter');
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Service Details Overview'))) {
        $servicesSidebar = $primarySidebar->getChild('Service Details Overview');
        if (!is_null($servicesSidebar->getChild('Information'))){
            $servicesSidebar->getChild('Information')->setIcon('fa-ticket ls ls-dashboard');
        }
        if (!is_null($servicesSidebar->getChild('Change Password'))){
            $servicesSidebar->getChild('Change Password')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($servicesSidebar->getChild('Downloads'))){
            $servicesSidebar->getChild('Downloads')->setIcon('fa-ticket ls ls-download-square');
        }
        if (!is_null($servicesSidebar->getChild('Addons'))){
            $servicesSidebar->getChild('Addons')->setIcon('fa-ticket ls ls-addon');
        }
    }
    if ($primarySidebar && !is_null($primarySidebar->getChild('Service Details Actions'))) {
        $servicesSidebar = $primarySidebar->getChild('Service Details Actions');
        if (!is_null($servicesSidebar->getChild('Login to cPanel'))){
            $servicesSidebar->getChild('Login to cPanel')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('cpanel'))){
            $servicesSidebar->getChild('cpanel')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('Manage'))){
            $servicesSidebar->getChild('Manage')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('Login to Plesk'))){
            $servicesSidebar->getChild('Login to Plesk')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('plesk'))){
            $servicesSidebar->getChild('plesk')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('Login to WHM'))){
            $servicesSidebar->getChild('Login to WHM')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('whm'))){
            $servicesSidebar->getChild('whm')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('Login to Webmail'))){
            $servicesSidebar->getChild('Login to Webmail')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('webmail'))){
            $servicesSidebar->getChild('webmail')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($servicesSidebar->getChild('Change Password'))){
            $servicesSidebar->getChild('Change Password')->setIcon('fa-ticket ls ls-padlock');
        }
        if (!is_null($servicesSidebar->getChild('Cancel'))){
            $servicesSidebar->getChild('Cancel')->setIcon('fa-ticket ls ls-denial');
        }
        if (!is_null($servicesSidebar->getChild('Upgrade/Downgrade'))){
            $servicesSidebar->getChild('Upgrade/Downgrade')->setIcon('fa-ticket ls ls-new-window');
        }
        if (!is_null($servicesSidebar->getChild('Upgrade/Downgrade Options'))){
            $servicesSidebar->getChild('Upgrade/Downgrade Options')->setIcon('fa-ticket ls ls-configure');
        }        
        if (!is_null($servicesSidebar->getChild('Renew Service'))){
            $servicesSidebar->getChild('Renew Service')->setIcon('fa-ticket ls ls-refresh');
        }        
    }

    if ($secondarySidebar && !is_null($secondarySidebar->getChild('My Services Actions'))) {
        $servicesSidebar = $secondarySidebar->getChild('My Services Actions');
        if (!is_null($servicesSidebar->getChild('Place a New Order'))){
            $servicesSidebar->getChild('Place a New Order')->setIcon('fa-ticket ls ls-box');
        }
        if (!is_null($servicesSidebar->getChild('View Available Addons'))){
            $servicesSidebar->getChild('View Available Addons')->setIcon('fa-ticket ls ls-addon');
        }
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Sitelock Sidebar Promo'))) {
        $secondarySidebar->removeChild('Sitelock Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Spamexperts Sidebar Promo'))) {
        $secondarySidebar->removeChild('Spamexperts Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Ssl Sidebar Promo'))) {
        $secondarySidebar->removeChild('Ssl Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Weebly Sidebar Promo'))) {
        $secondarySidebar->removeChild('Weebly Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Codeguard Sidebar Promo'))) {
        $secondarySidebar->removeChild('Codeguard Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Sitelockvpn Sidebar Promo'))) {
        $secondarySidebar->removeChild('Sitelockvpn Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Marketgoo Sidebar Promo'))) {
        $secondarySidebar->removeChild('Marketgoo Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Ox Sidebar Promo'))) {
        $secondarySidebar->removeChild('Ox Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Symantec Sidebar Promo'))) {
        $secondarySidebar->removeChild('Symantec Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Sitebuilder Sidebar Promo'))) {
        $secondarySidebar->removeChild('Sitebuilder Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Cpanelseo Sidebar Promo'))) {
        $secondarySidebar->removeChild('Cpanelseo Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Nordvpn Sidebar Promo'))) {
        $secondarySidebar->removeChild('Nordvpn Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Xovinow Sidebar Promo'))) {
        $secondarySidebar->removeChild('Xovinow Sidebar Promo');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Threesixtymonitoring Sidebar Promo'))) {
        $secondarySidebar->removeChild('Threesixtymonitoring Sidebar Promo');
    }

    //Upgrade Downgrade
    if ($primarySidebar && !is_null($primarySidebar->getChild('Upgrade Downgrade'))) {
        $primarySidebar->getChild('Upgrade Downgrade')->setClass('panel-summary panel-summary-primary panel-upgrade');
    }

    //my domains
    if ($primarySidebar && !is_null($primarySidebar->getChild('My Domains Status Filter'))) {
        $primarySidebar->removeChild('My Domains Status Filter');
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('My Domains Actions'))) {
        $domainsSidebar = $secondarySidebar->getChild('My Domains Actions');
        if (!is_null($domainsSidebar->getChild('Renew Domain'))){
            $domainsSidebar->getChild('Renew Domain')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($domainsSidebar->getChild('Register a New Domain'))){
            $domainsSidebar->getChild('Register a New Domain')->setIcon('fa-ticket ls ls-dns');
        }
        if (!is_null($domainsSidebar->getChild('Transfer in a Domain'))){
            $domainsSidebar->getChild('Transfer in a Domain')->setIcon('fa-ticket ls ls-transfer');
        }
    }
    //domains management
    if ($primarySidebar && !is_null($primarySidebar->getChild('Domain Details Management'))) {
        $domainsDetailsSidebar = $primarySidebar->getChild('Domain Details Management');
        if (!is_null($domainsDetailsSidebar->getChild('Overview'))){
            $domainsDetailsSidebar->getChild('Overview')->setIcon('fa-ticket ls ls-dashboard');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Auto Renew Settings'))){
            $domainsDetailsSidebar->getChild('Auto Renew Settings')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Modify Nameservers'))){
            $domainsDetailsSidebar->getChild('Modify Nameservers')->setIcon('fa-ticket ls ls ls-share');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Registrar Lock Status'))){
            $domainsDetailsSidebar->getChild('Registrar Lock Status')->setIcon('fa-ticket ls ls-shield');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Release Domain'))){
            $domainsDetailsSidebar->getChild('Release Domain')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Domain Addons'))){
            $domainsDetailsSidebar->getChild('Domain Addons')->setIcon('fa-ticket ls ls-addon');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Domain Contacts'))){
            $domainsDetailsSidebar->getChild('Domain Contacts')->setIcon('fa-ticket ls ls-user');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Manage Private Nameservers'))){
            $domainsDetailsSidebar->getChild('Manage Private Nameservers')->setIcon('fa-ticket ls ls-share');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Manage DNS Host Records'))){
            $domainsDetailsSidebar->getChild('Manage DNS Host Records')->setIcon('fa-ticket ls ls-dns');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Manage Email Forwarding'))){
            $domainsDetailsSidebar->getChild('Manage Email Forwarding')->setIcon('fa-ticket ls ls-envelope');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Get EPP Code'))){
            $domainsDetailsSidebar->getChild('Get EPP Code')->setIcon('fa-ticket ls ls-input-code');
        }
    }
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Domain Details Actions'))) {
        $domainsDetailsActionsSidebar = $secondarySidebar->getChild('Domain Details Actions');
        if (!is_null($domainsDetailsActionsSidebar->getChild('Renew Domain'))){
            $domainsDetailsActionsSidebar->getChild('Renew Domain')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($domainsDetailsActionsSidebar->getChild('Register a New Domain'))){
            $domainsDetailsActionsSidebar->getChild('Register a New Domain')->setIcon('fa-ticket ls ls-dns');
        }
        if (!is_null($domainsDetailsActionsSidebar->getChild('Transfer in a Domain'))){
            $domainsDetailsActionsSidebar->getChild('Transfer in a Domain')->setIcon('fa-ticket ls ls-transfer');
        }
    }
    //orderform
    if ($secondarySidebar && !is_null($secondarySidebar->getChild('Actions'))) {
        $cartActionsSidebar = $secondarySidebar->getChild('Actions');
        if (!is_null($cartActionsSidebar->getChild('Domain Renewals'))){
            $cartActionsSidebar->getChild('Domain Renewals')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($cartActionsSidebar->getChild('Renew Services'))){
            $cartActionsSidebar->getChild('Renew Services')->setIcon('fa-ticket ls ls-refresh');
        }
        if (!is_null($cartActionsSidebar->getChild('Domain Registration'))){
            $cartActionsSidebar->getChild('Domain Registration')->setIcon('fa-ticket ls ls-dns');
        }
        if (!is_null($cartActionsSidebar->getChild('Domain Transfer'))){
            $cartActionsSidebar->getChild('Domain Transfer')->setIcon('fa-ticket ls ls-transfer');
        }
        if (!is_null($cartActionsSidebar->getChild('View Cart'))){
            $cartActionsSidebar->getChild('View Cart')->setIcon('fa-ticket ls ls-basket');
        }
    }

    if ($primarySidebar && !is_null($primarySidebar->getChild('Email Actions - S403'))) {
        $domainsDetailsSidebar = $primarySidebar->getChild('Email Actions - S403');
        if (!is_null($domainsDetailsSidebar->getChild('Manage'))){
            $domainsDetailsSidebar->getChild('Manage')->setIcon('fa-ticket ls ls-user');
            $domainsDetailsSidebar->getChild('Manage')->setClass('d-flex align-center btn-service-sso');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Manage OX'))){
            $domainsDetailsSidebar->getChild('Manage OX')->setIcon('fa-ticket ls ls-configure');
        }
        if (!is_null($domainsDetailsSidebar->getChild('Upgrade OX'))){
            $domainsDetailsSidebar->getChild('Upgrade OX')->setIcon('fa-ticket ls ls ls-new-window');
        }
    }

    /* custom sidebars */

    // GLOBAL $smarty;
    // $vars = $smarty->getTemplateVars();

    // if ($vars['templatefile'] == "clientareaaddfunds"){

    // }

});

//REQUEST CANCELLATION BUTTON ON FREE PRODUCT 
add_hook('ClientAreaPrimarySidebar', 1, function($primarySidebar) {
    // Get the handle for the Service Details Overview sidebar
    $serviceDetailsOverview = $primarySidebar->getChild('Service Details Actions');

    // Make sure the handle is not null
    if (!is_null($serviceDetailsOverview)) {
        GLOBAL $smarty;
        $templateVars = $smarty->getTemplateVars();
        $template = new Template($templateVars['template']);
        $page = new Page($template, 'clientareaproductdetails');
        $show_cancellation_button = false;
        if (isset($page) && $page){
            if ($page->getConfiguredOption()){
                $settings = $page->getConfiguredOption()->getSettings(true);
            }
        }
        if (isset($settings) && is_array($settings)){
            if (isset($settings['freeProductCancellation']) && $settings['freeProductCancellation'] == 1){
                $show_cancellation_button = true;
            }
        }

        // Make sure the ID is available
        if (!empty($_REQUEST['id']) && $show_cancellation_button) {
            $serviceId = (int) $_REQUEST['id'];

            // Check if this is a free service
            $billingCycle = Capsule::table('tblhosting')
                ->where('id', $serviceId)
                ->value('billingcycle');
            if ($billingCycle === 'Free Account') {               
                // Add the cancellation request menu item for the service to the sidebar
                $serviceDetailsOverview->addChild(
                    'freeServiceCancellationRequest',
                    [
                        'name' => 'CancellationRequest',
                        'label' => Lang::trans('clientareacancelrequestbutton'),
                        'uri' => '/clientarea.php?action=cancel&id=' . $serviceId,
                        'icon' => 'fa-ticket ls ls-denial',
                        'order' => 90,
                    ]
                );
            }
        }
    }
});

add_hook('ClientAreaFooterOutput', 2, function($vars) {
    return "<script>
        document.addEventListener('DOMContentLoaded', function(event) {
            let form = document.querySelector('#frmDomainHomepage');
            if (form === null) return;
            form.onkeydown = (e) => {
                if (e.key === 'Enter') {
                    document.querySelector('#btnDomainSearch').click();
                    form.addEventListener('submit', ev => ev.preventDefault());
                }
            }
        });
    </script>";
});

/* TODO uncomment this

add_hook('ClientAreaPage', 1, function($vars) {
    $pageName = $vars['templatefile'];
    if ($pageName === 'lagompage') {
        $pageFileName = $vars['filename'] . '.php';
        foreach (Page::all() as $page) {
            if ($page->custom_page && $page->settings['filename'] == $pageFileName) {
                $pageName = $page->name;
            }
        }
    }
    generateRsSidebars('primary', $pageName, $vars['language']);
    generateRsSidebars('secondary', $pageName, $vars['language']);
});

function generateRsSidebars($type, $pageName, $language) {
    $page = Page::where('name', $pageName)->first();
    if (!is_null($page)) {
        if ($type == 'primary') {
            $menuSidebar = Menu::primarySidebar();
            $customSidebars = $page->sidebars()
                ->where('location', 'primary')
                ->where('active', true)
                ->get();
        } elseif ($type == 'secondary') {
            $menuSidebar = Menu::secondarySidebar();
            $customSidebars = $page->sidebars()
                ->where('location', 'secondary')
                ->where('active', true)
                ->get();
        }
        if (!is_null($menuSidebar->getChildren())) { //remove current menu
            foreach ($menuSidebar->getChildren() as $navbarItem){
                $menuSidebar->removeChild($navbarItem->getName());
            }
        }
        foreach ($customSidebars as $sidebar) {
            if ($sidebar->translation == 'whmcs') {
                $sidebarName = \Lang::trans($sidebar->title->whmcs);
            } else { //custom
                $sidebarName = $sidebar->title->custom->{$language};
            }
            $menuSidebar->addChild($sidebar->name)
                ->setLabel($sidebarName)
                ->setOrder($sidebar->order);
            foreach ($sidebar->items as $index => $item) {
                $customSidebar = $menuSidebar->getChild($sidebar->name);
                $itemOrder = $item->order * 100;
                if (isset($item->content['page'])) {
                    $itemName = SidebarProcessor::getSideBarItemName($item);
                    $itemLabel = SidebarProcessor::getSidebarItemLabel($item, $language);
                    $itemPageName = $item->content['page'];
                    $sidebarPage = Page::where('name', $itemPageName)->first();
                    $url = 'index.php';
                    $pageEnabled = true;
                    if ($sidebarPage) {
                        $icon = 'fa fa-ticket' . $item->content['icon'];  //TODO validate type of icon
                        if ($sidebarPage->custom_page) {
                            $url = $sidebarPage->url;
                        } else {
                            if (isset($routes[$sidebarPage->name]['page'])) {
                                $url = $routes[$sidebarPage->name]['page'];
                            }
                            if (isset($routes[$sidebarPage->name]['routePath'])) {
                                $url = routePath($routes[$sidebarPage->name]['routePath']);
                            }
                            $pageOptions = MenuProcessor::getWhmcsPageConfiguration($sidebarPage->name);
                            if (!$pageOptions['enabled']) {
                                $pageEnabled = false;
                            }
                        }
                        if ($pageEnabled) {
                            $customSidebar->addChild($itemName, [
                                'label' => $itemLabel,
                                'uri' => $url,
                                'order' => $itemOrder,
                                'icon' => $icon
                            ]);
                        }
                    }
                }
                if (isset($item->content['link'])) {
                    $itemName = SidebarProcessor::getSideBarItemName($item);
                    $itemLabel = SidebarProcessor::getSidebarItemLabel($item, $language);
                    $url = 'index.php';
                    $icon = '';
                    if (!empty($item->content['link'])) {
                        $url = $item->content['link'];
                    }
                    if (!empty($item->content['icon'])) {
                        $icon = 'fa fa-ticket ' . $item->content['icon'];
                    }
                    $customSidebar->addChild($itemName, [
                        'label' => $itemLabel,
                        'uri' => $url,
                        'order' => $itemOrder,
                        'icon' => $icon
                    ]);
                }
                if (isset($item->content['html'])) {
                    $customNameHtml = 'Custom_Html_' . $index . '_' . $itemOrder;
                    $customSidebar->addChild($customNameHtml);
                    $customSidebar->getChild($customNameHtml)
                        ->setBodyHtml(html_entity_decode($item->content['html']))
                        ->setOrder($itemOrder);
                }
                if (isset($item->content['list'])) {
                    $list = $item->content['list'];
                    if ($list == 'Product Groups') {
                        $listOffset = 0;
                        foreach (ProductGroup::all() as $group) {
                            if (!$group->isHidden) {
                                $customSidebar->addChild($group->name . '-' . $item->id, [
                                    'label' => $group->name,
                                    'uri' => 'cart.php?gid=' . $group->id,
                                    'order' => $itemOrder + $listOffset,
                                    'icon' => 'fa-ticket ls ls-box'
                                ]);
                                $listOffset++;
                            }
                        }
                    }
                    if ($list == 'Client Details') { //TODO what to do if no user logged
                        $client = \Menu::context("client");
                        if (!is_null($client)) {
                            $bodyHtml = "";
                            if ($client->companyName) {
                                $bodyHtml .= "<strong>" . $client->companyName . "</strong><br><em>" . $client->fullName . "</em><br>";
                            } else {
                                $bodyHtml .= "<strong>" . $client->fullName . "</strong><br>";
                            }
                            $bodyHtml .= $client->address1 . "<br>";
                            if ($client->address2) {
                                $bodyHtml .= $client->address2 . "<br>";
                            }
                            $address = [];
                            if ($client->city) {
                                $address[] = $client->city;
                            }
                            if ($client->state) {
                                $address[] = $client->state;
                            }
                            if ($client->postcode) {
                                $address[] = $client->postcode;
                            }
                            $bodyHtml .= implode(", ", $address) . "<br>" . $client->countryName;
                            if ($client->taxId) {
                                $bodyHtml .= "<br>" . $client->taxId;
                            }
                            $updateText = \Lang::trans("update");
                            $clientDetailsFooter = "    <a href=\"clientarea.php?action=details\" class=\"btn btn-success btn-sm btn-block\">\n        <i class=\"fas fa-pencil-alt\"></i> " . $updateText . "\n    </a>";
                            $menuSidebar->addChild('Client Details', [
                                'label' => \Lang::trans("yourinfo"),
                                'order' => 1, //TODO rethink positioning
                                'icon' => 'fa-user',
                                'bodyHtml' => $bodyHtml,
                                'footerHtml' => $clientDetailsFooter
                            ]);
                        }
                    }
                    if ($list == 'Contacts') { //TODO what to do if no user logged
                        $client = \Menu::context("client");
                        $contactsChildren = [];
                        if (!is_null($client)) {
                            if ($client->contacts->isEmpty()) {
                                $contactsChildren[] = [
                                    "name" => "No Contacts",
                                    "label" => \Lang::trans("clientareanocontacts"),
                                    "order" => $itemOrder
                                ];
                            } else {
                                $order = $itemOrder + 1;
                                $numberOfContacts = 0;
                                foreach ($client->contacts()->orderBy("firstname", "ASC")->orderBy("lastname", "ASC")->get() as $contact) {
                                    $contactsChildren[] = [
                                        "name" => (string) $contact->fullName . " " . $contact->id,
                                        "label" => $contact->fullName,
                                        "uri" => "clientarea.php?action=contacts&id=" . $contact->id,
                                        "order" => $order,
                                    ];
                                    $order++;
                                    $numberOfContacts++;
                                    if ($numberOfContacts > 20) {
                                        break;
                                    }
                                }
                            }
                            $newContactText = \Lang::trans("createnewcontact");
                            $clientContactsFooter = "<a href=\"clientarea.php?action=addcontact\" class=\"btn btn-default btn-sm btn-block\">\n        <i class=\"fas fa-plus\"></i> " . $newContactText . "\n    </a>";
                            $menuSidebar->addChild('Client Contacts', [
                                'label' => \Lang::trans("contacts"),
                                'order' => $itemOrder, //TODO rethink positioning (contact is the new sidebar)
                                'footerHtml' => $clientContactsFooter
                            ]);
                            foreach ($contactsChildren as $contactsChild) {
                                $menuSidebar->getChild('Client Contacts')
                                    ->addChild($contactsChild['name'], [
                                        'label' => $contactsChild['label'],
                                        'uri' => $contactsChild['uri'],
                                        'order' => $contactsChild['order']
                                    ]);
                            }
                            $isContactListApllied = true; // TODO handle the positioning of elements listed bellow contacts
                        }
                    }
                }
            }
        }
    }
}
*/ 