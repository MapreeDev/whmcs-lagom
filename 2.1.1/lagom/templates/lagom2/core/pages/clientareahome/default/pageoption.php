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
        'hideExpiringIn' => [
            'type' => 'checkbox',
            'name' => 'hideExpiringIn',
            'label' => 'Hide Expiring In / Expired label',
            'tooltip' => "Choose whether you would like to show or hide Expiring in / Expired label in services panel"    
        ],
    ]
];