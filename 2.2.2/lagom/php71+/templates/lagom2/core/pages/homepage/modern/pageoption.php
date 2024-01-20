<?php

return [
    'display_name' => 'Modern',
    'preview' => 'thumb.png',
    'variables' => [
        
    ],
    'settings'     => [
        'showSliderNavigation' => [
            'type' => 'checkbox',
            'name' => 'showSliderNavigation',
            'default' => '1',
            'label' => 'Show Banner Navigation',
            'tooltip' => "Choose whether you would like to show or hide boxes to navigate between banner slides.",
        ],
        'showDomainSearch' => [
            'type' => 'checkbox',
            'name' => 'showDomainSearch',
            'default' => '1',
            'label' => 'Show Domain Search',
            'tooltip' => "Specify whether you would like to show or hide the section with domain search."
        ],
        'showProducGroups' => [
            'type' => 'checkbox',
            'name' => 'showProducGroups',
            'default' => '1',
            'label' => 'Show Product Groups',
            'tooltip' => "Define whether you wish to show or hide the section with product group boxes."
        ],
        'showFeatures' => [
            'type' => 'checkbox',
            'name' => 'showFeatures',
            'default' => '1',
            'label' => 'Show Features Section',
            'tooltip' => "Choose whether you want to show or hide the section with features."
        ],
        'showTestimonials' => [
            'type' => 'checkbox',
            'name' => 'showTestimonials',
            'default' => '1',
            'label' => 'Show Testimonials Section',
            'tooltip' => "Decide whether you would like to show or hide the section with testimonials."
        ],
        'enableTestimonialsAutoplay' => [
            'type' => 'checkbox',
            'name' => 'enableTestimonialsAutoPlay',
            'default' => '1',
            'label' => 'Testimonials Autoplay',
            'tooltip' => "This option allows you to activate autoplay in testimonials section",
        ],
        'showNews' => [
            'type' => 'checkbox',
            'name' => 'showNews',
            'default' => '1',
            'label' => 'Show Latest News Section',
            'tooltip' => "Choose whether you wish to show or hide the section with the latest news."
        ],
        'showGetStarted' => [
            'type' => 'checkbox',
            'name' => 'showGetStarted',
            'default' => '1',
            'label' => 'Show Get Started Section',
            'tooltip' => "Define whether you would like to show or hide the section with the call to action button."
        ],
        'productGroupPriceDisplay' => [
            'type' => 'select',
            'name' => 'productGroupPriceDisplay',
            'label' => 'Choose product group price display',
            'options' => 'Cheapest billing cycle,Monthly,Quarterly,Semiannually,Annually,Biennially,Triennially',
        ]
    ]
];