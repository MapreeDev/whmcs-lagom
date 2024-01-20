<?php

return [
    'display_name' => 'RS Studio',
    'preview'      => 'thumb.png',
    'variables' => [],
    'settings' => [
        'forceshowtax1' => [
            'type' => 'checkbox',
            'name' => 'forceshowtax1',
            'label' => 'Show 0% Tax Level 1',
            'tooltip' => "Show tax level 1 on this page"
        ],
        'forceshowtax2' => [
            'type'  => 'checkbox',
            'name'  => 'forceshowtax2',
            'label' => 'Show 0% Tax Level 2',
            'tooltip' => "Show tax level 2 on this page"
        ],
        'displayDueWhenPaid' => [
            'type'  => 'checkbox',
            'name'  => "Display invoice due date when it's paid",
            'label' => "Display invoice due date when it's paid",
            'tooltip' => "Display invoice due date when it's paid"
        ],
        'displayBankDetailsOnInvoice' => [
            'type'  => 'checkbox',
            'name'  => "Display bank transfer details on the invoice",
            'label' => "Display bank transfer details on the invoice",
            'tooltip' => "This option will automatically display selected bank transfer details, on invoices. However your payment gateway need to have 'Bank Transfer' name included in your payment gateway settings, for example: 'Bank Transfer USD', 'Bank Transfer EUR', etc."
        ],
    ]
];
