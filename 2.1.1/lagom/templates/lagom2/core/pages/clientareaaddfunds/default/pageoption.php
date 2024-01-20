<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'amountVal1' => [
            'type' => 'number',
            'name' => 'amountVal1',
            'label' => '"Amount to add" value 1',
            'default' => '10',             
            'dataAttr' => 'data-amount-input',
        ],
        'amountVal2' => [
            'type' => 'number',
            'name' => 'amountVal2',
            'label' => '"Amount to add" value 2',
            'default' => '25',
            'dataAttr' => 'data-amount-input',  
        ],
        'amountVal3' => [
            'type' => 'number',
            'name' => 'amountVal3',
            'label' => '"Amount to add" value 3',
            'default' => '50',
            'dataAttr' => 'data-amount-input',  
        ],
        'amountVal4' => [
            'type' => 'number',
            'name' => 'amountVal4',
            'label' => '"Amount to add" value 4',
            'default' => '75',
            'dataAttr' => 'data-amount-input',  
        ],
        'amountVal5' => [
            'type' => 'number',
            'name' => 'amountVal5',
            'label' => '"Amount to add" value 5',
            'default' => '100',
            'dataAttr' => 'data-amount-input',
        ],
        'amountCalculated' => [
            'type' => 'checkbox',
            'name' => 'amountCalculated',
            'label' => 'Automatically calculate these values based on min/max values',
            'dataAttr' => 'data-amount-toggle',
        ],
    ]
];
