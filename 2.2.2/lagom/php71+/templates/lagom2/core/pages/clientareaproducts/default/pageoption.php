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
            'label' => 'Hide Inactive Services',
            'tooltip' => "Choose whether you would like to show or hide inactive services on this page.",
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
        'hideInactiveServicesTerminatedDays' => [
            'type' => 'number',
            'name' => 'terminatedDays',
            'label' => 'Hide service after “X” amount of days from the “Terminated” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Terminated"',
            'dataAttr' => 'data-inactive-services-terminated-days-select',
        ],
        'hideInactiveServicesCancelledDays' => [
            'type' => 'number',
            'name' => 'cancelledDays',
            'label' => 'Hide service after “X” amount of days from the “Cancelled” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-t-2x m-b-0x',
            'formGroupDataAttr' => 'data-inactive-services-days="Cancelled"',
            'dataAttr' => 'data-inactive-services-cancelled-days-select',
        ],
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => 'Show "Manage" button',
            'customFormGroupClass' => 'm-t-2x',
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
        ],
        'showIdProduct' => [
            'type' => 'checkbox',
            'name' => 'showIdProduct',
            'label' => 'Display product ID',
            'tooltip' => "Adds product ID in product list table, next to its name.",
        ],
        'hideSslIcon' => [
            'type' => 'checkbox',
            'name' => 'hideSslIcon',
            'label' => 'Hide SSL Icon',
            'tooltip' => "Hide the icon with SSL status, shown in the table next to the domain name",
        ],
        'removeUrlFromDomainName' => [
            'type' => 'checkbox',
            'name' => 'removeUrlFromDomainName',
            'label' => 'Remove URL from the domain/host name',
            'tooltip' => "Remove anchor link from the domain/host name.",
        ],
        'hideTabServiceGroup' => [
            'type' => 'checkbox',
            'name' => 'hideTabProductGroup',
            'label' => 'Hide group name',
            'tooltip' => "Choose whether you would like to show or hide the group name shown in the table.",
        ]
    ]
];