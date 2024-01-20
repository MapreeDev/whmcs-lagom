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
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => 'Show "Manage" button',
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
        ],
        'showPdfButton' => [
            'type' => 'checkbox',
            'name' => 'showPdfButton',
            'label' => 'Show "Download" button',
            'tooltip' => "Choose whether you would like to show or hide the 'Download' button.",
        ]
    ]
];