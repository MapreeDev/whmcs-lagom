<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'variables' => [

    ],
    'settings'     => [
        'hideSidebar' => [
            'type' => 'checkbox',
            'name' => 'hideSidebar',
            'label' => 'Hide Sidebar',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page."    
        ],
        'horizontalPackage' => [
            'type' => 'checkbox',
            'name' => 'horizontalPackage',
            'label' => 'Horizontal Packages',
            'tooltip' => "Choose whether you would like to show horizontal or vertical packages."    
        ],
        'productColumns' => [
            'type' => 'select',
            'name' => 'productColumns',
            'label' => 'Product Columns',
            'options' => '1,2,3,4',
            'default' => '3',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page."    
        ],
    ]
];