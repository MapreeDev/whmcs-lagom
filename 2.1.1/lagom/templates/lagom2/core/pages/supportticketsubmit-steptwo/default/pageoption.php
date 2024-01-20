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
        'hideInactiveServices' => [
            'type' => 'checkbox',
            'name' => 'hideInactiveServices',
            'label' => 'Hide Inactive Services/Domains',
            'tooltip' => "Choose whether you would like to show or hide inactive services/domains on this page.",
            'customFormGroupClass' => 'm-b-0x',            
            'dataAttr' => 'data-inactive-services-show',  
        ],
        'hideInactiveServicesStatus' => [
            'type' => 'multiselect',
            'name' => 'servicesStatus',
            'label' => 'Choose service statues which should be hidden:',
            'options' => 'Pending,Completed,Suspended,Terminated,Cancelled,Fraud',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x', 
            'formGroupDataAttr' => 'data-inactive-services-status',           
            'dataAttr' => 'data-inactive-services-status-select',
        ],
        'hideInactiveDomainStatus' => [
            'type' => 'multiselect',
            'name' => 'domainStatus',
            'label' => 'Choose domain statues which should be hidden:',
            'options' => 'Pending,Pending Registration,Pending Transfer,Grace,Redemption,Expired,Transferred Away,Cancelled,Fraud',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x', 
            'formGroupDataAttr' => 'data-inactive-services-status',           
            'dataAttr' => 'data-inactive-services-status-select',
        ],
    ]
];