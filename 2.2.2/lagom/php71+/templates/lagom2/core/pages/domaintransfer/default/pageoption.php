<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'hideSidebar' => [
            'type' => 'checkbox',
            'name' => 'hideSidebar',
            'label' => 'Hide Sidebar',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page."    
        ],
        'showFeaturedTLD' => [
            'type' => 'checkbox',
            'name' => 'showFeaturedTLD',
            'default' => '1',
            'label' => 'Show Featured TLDS',
            'tooltip' => "Choose whether you would like to show or hide featured TLDs on this page. Featured TLDs can be configured in Domain Pricing of the WHMCS admin area settings.",
        ],
        'showTLDCategoryFilter' => [
            'type' => 'checkbox',
            'name' => 'showTLDCategoryFilter',
            'default' => '1',
            'label' => 'Show TLDS Category Filter',
            'tooltip' => "Choose whether you would like to show or hide the category filter displayed in the TLD pricing table.",
        ]
    ]
];