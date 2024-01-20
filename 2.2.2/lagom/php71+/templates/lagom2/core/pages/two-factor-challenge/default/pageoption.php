<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'isFullPage' => [
            'type' => 'checkbox',
            'name' => 'isFullPage',
            'label' => 'Full Page',
            'tooltip' => "Decide whether you would like to hide the Lagom theme navigation and footer."  
        ],
        'showLogo' => [
            'type'  => 'checkbox',
            'name'  => 'showLogo',
            'label' => 'Show Logo',
            'tooltip' => "Choose whether you would like to show or hide the content sidebar available on this page."    
        ],
    ]
];