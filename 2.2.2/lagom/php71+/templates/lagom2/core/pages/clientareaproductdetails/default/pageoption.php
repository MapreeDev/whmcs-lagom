<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'freeProductCancellation' => [
            'type' => 'checkbox',
            'name' => 'freeProductCancellation',
            'label' => 'Free Services Request Cancellation',
            'tooltip' => "Show Request Cancellation Option on Free Services."  
        ],
        'removeUrlFromDomainName' => [
            'type' => 'checkbox',
            'name' => 'removeUrlFromDomainName',
            'label' => 'Remove URL from the domain/host name',
            'tooltip' => "Remove anchor link from the domain/host name.",
        ],
        'removeProductGroupName' => [
            'type' => 'checkbox',
            'name' => 'removeProductGroupName',
            'label' => 'Hide group name from product header',
            'tooltip' => "Choose whether you would like to show or hide Product Group Name in product header.",
        ],
        'hideRightBoxWithDetailsUsage' => [
            'type' => 'checkbox',
            'name' => 'hideRightBoxWithDetailsUsage',
            'label' => 'Hide Right Box with Billing Details/Server Usage',
            'tooltip' => "Choose whether you would like to show or hide Billing Details/Server Usage box on this page.",
        ],
        'showProductAddonsId' => [
            'type' => 'checkbox',
            'name' => 'showProductAddonsId',
            'label' => 'Display addon ID',
            'tooltip' => "Choose whether you would like to show or hide addon ID in Addon tab.",
        ]
    ]
];