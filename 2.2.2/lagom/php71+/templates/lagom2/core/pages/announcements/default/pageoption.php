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
        'displayImages' => [
            'type' => 'checkbox',
            'name' => 'displayImages',
            'label' => 'Display images on Announcement list',
            'tooltip' => "If you'd like to disply images on articles list, your article should include graphic at the beginning of the article description."
        ]
    ]
];