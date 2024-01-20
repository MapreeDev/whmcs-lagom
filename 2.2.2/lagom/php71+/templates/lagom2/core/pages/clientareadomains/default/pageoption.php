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
            'label' => 'Hide Inactive Domains',
            'tooltip' => "Choose whether you would like to show or hide inactive domains on this page.",
            'customFormGroupClass' => 'm-b-0x',            
            'dataAttr' => 'data-inactive-services-show',  
        ],
        'hideInactiveServicesStatus' => [
            'type' => 'multiselect',
            'name' => 'servicesStatus',
            'label' => 'Choose domain statues which should be hidden:',
            'options' => 'Pending,Pending Registration,Pending Transfer,Grace,Redemption,Expired,Transferred Away,Cancelled,Fraud',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x', 
            'formGroupDataAttr' => 'data-inactive-services-status',           
            'dataAttr' => 'data-inactive-services-status-select',
        ],		
	    'showManageButton' => [
            'type' => 'checkbox',
            'name' => 'showManageButton',
            'label' => 'Show "Manage" button',
            'tooltip' => "Choose whether you would like to show or hide the 'Manage' button.",
            'customFormGroupClass' => 'm-t-2x',
        ],
	    'showAutoRenewSwitcher' => [
            'type' => 'checkbox',
            'name' => 'showAutoRenewSwitcher',
            'label' => 'Show "Auto Renew" switcher',
            'tooltip' => "Choose whether you would like to show or hide the 'Auto Renew' switcher.",
        ],
        'showDomainId' => [
            'type' => 'checkbox',
            'name' => 'showDomainId',
            'label' => 'Display domain ID',
            'tooltip' => "Adds domain ID in the domain list table, next to its name.",
        ],
        'hideSslIcon' => [
            'type' => 'checkbox',
            'name' => 'hideSslIcon',
            'label' => 'Hide SSL Icon',
            'tooltip' => "Hide the icon with SSL status, shown in the table next to the domain name",
        ]

        /*'hideInactiveServicesPendingRegistrationDays' => [
            'type' => 'number',
            'name' => 'Pending Registration Days',
            'label' => 'Hide service after “X” amount of days from the “Pending Registration” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Pending Registration"',
            'dataAttr' => 'data-inactive-services-pending-registration-days-select',
        ],
        'hideInactiveServicesPendingTransferDays' => [
            'type' => 'number',
            'name' => 'Pending Transfer Days',
            'label' => 'Hide service after “X” amount of days from the “Pending Transfer” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Pending Transfer"',
            'dataAttr' => 'data-inactive-services-pending-transfer-days-select',
        ],
        'hideInactiveServicesGraceDays' => [
            'type' => 'number',
            'name' => 'Grace Period (Expired) Days',
            'label' => 'Hide service after “X” amount of days from the “Grace Period (Expired)” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Grace"',
            'dataAttr' => 'data-inactive-services-grace-days-select',
        ],
        'hideInactiveServicesRedemptionDays' => [
            'type' => 'number',
            'name' => 'Redemption Period (Expired) Days',
            'label' => 'Hide service after “X” amount of days from the “Redemption Period (Expired)” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Redemption"',
            'dataAttr' => 'data-inactive-services-redemption-days-select',
        ],
        'hideInactiveServicesExpiredDays' => [
            'type' => 'number',
            'name' => 'Expired Days',
            'label' => 'Hide service after “X” amount of days from the “Expired” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Expired"',
            'dataAttr' => 'data-inactive-services-expired-days-select',
        ],
        'hideInactiveServicesTransferredAwayDays' => [
            'type' => 'number',
            'name' => 'Transferred Away Days',
            'label' => 'Hide service after “X” amount of days from the “Transferred Away” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Transferred Away"',
            'dataAttr' => 'data-inactive-services-transferred-away-days-select',
        ],
        'hideInactiveServicesCancelledDays' => [
            'type' => 'number',
            'name' => 'Cancelled Days',
            'label' => 'Hide service after “X” amount of days from the “Cancelled” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Cancelled"',
            'dataAttr' => 'data-inactive-services-cancelled-days-select',
        ],
        'hideInactiveServicesFraudDays' => [
            'type' => 'number',
            'name' => 'Fraud Days',
            'label' => 'Hide service after “X” amount of days from the “Fraud” date',
            'default' => 0,
            'tooltip' => 'sample tooltip',
            'customFormGroupClass' => 'flex-column is-hidden m-b-0x m-t-2x',
            'formGroupDataAttr' => 'data-inactive-services-days="Fraud"',
            'dataAttr' => 'data-inactive-services-fraud-days-select',
        ],*/
    ]
];