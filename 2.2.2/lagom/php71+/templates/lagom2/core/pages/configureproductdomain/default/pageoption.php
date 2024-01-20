<?php

return [
    'display_name' => 'Default',
    'preview'      => 'thumb.png',
    'settings'     => [
        'showContinueButton' => [
            'type' => 'checkbox',
            'name' => 'showContinueButton',
            'label' => 'Replace "Add To Cart" button with "Continue"',
            'tooltip' => 'Replace "Add To Cart" button with "Continue" button, for primary domain lookup in the main box below domain search.'
        ],
        'automaticallyAddViaExternalLink' => [
            'type' => 'checkbox',
            'name' => 'automaticallyAddViaExternalLink',
            'label' => 'Automatic domain order',
            'tooltip' => "When external product link includes sld & tld - eg. `cart.php?a=add&pid=1&sld=whmcs&tld=.com` - domain will be automatically added to the cart"    
        ],
    ]
];
