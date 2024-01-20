<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'variables' => [

    ],
    'settings'     => [
        'hideProductBillingCycleDropdown' => [
            'type' => 'checkbox',
            'name' => 'hideProductBillingCycleDropdown',
            'label' => 'Hide Product Billing Cycle Dropdown',
            'tooltip' => "Choose whether you would like to show or hide the billing cycle dropdown displayed in the checkout table.",
        ],
        'hidePromoBox' => [
            'type' => 'checkbox',
            'name' => 'hidePromoBox',
            'label' => 'Hide Promo Box',
            'tooltip' => "Choose whether you would like to show or hide the promotion box.",
        ],
        'hideCreateSubAccount' => [
            'type' => 'checkbox',
            'name' => 'hideCreateSubAccount',
            'label' => 'Hide Create Sub-account',
            'tooltip' => "Choose whether you would like to show or hide create sub-account - for logged in user only.",
        ]
    ]
];