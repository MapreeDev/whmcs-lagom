<?php

return [
    'display_name' => 'Modern',
    'preview'      => 'thumb.png',
    'variables' => [
        'skipMainBody' => true,
        'skipMainHeader' => true
    ],
    'settings'     => [
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