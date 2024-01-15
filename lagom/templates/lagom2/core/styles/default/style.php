<?php

return [
    'name'          => 'Default',
    'preview'       => 'thumb.png',
    'variables' => [
        'bodyClass'  => 'lagom-default'
    ],
	'settings' => [
		'schemes' => [
			'primary' => [
				'name' => 'Primary',
				'color' => '--brand-primary-gradient-v',
			],
			'secondary' => [
				'name' => 'Secondary',
				'color' => '--brand-secondary-gradient-v',
			]
		],
		'group' => [
			'sidebar' => [
				'name' => "Sidebar",
				'styles' => [
					"summary" => [
						"variableName" => "summaryStyle",
						"name" => "Sidebar Summary Style",
						"default" => "primary",
                        "tooltip" => "Choose what style you would like to use for Summary Box. This element is visible in sidebars during the ordering process."
					],
					"boxed" => [
						"variableName" => "sidebarBoxStyle",
						"name" => "Sidebar Boxed Style",
						"default" => "primary",
                        "tooltip" => "Choose what style you would like to use for Sidebar Box. This element is displayed to logged in customers on client area pages. For example, a box with the total amount for unpaid invoices on the View Invoice pages."
					],
					"account" => [
						"variableName" => "sidebarAccountBoxStyle",
						"name" => "Sidebar Account Style",
						"default" => "default",
                        "tooltip" => "Choose what style you would like to use for Account Box. This element is displayed to logged in customers in the sidebar on the Dashboard page."
					]
				] 
			],
			'site' => [
				'name' => "Site",
				'styles' => [
					"banner" => [
						"variableName" => "siteBannerStyle",
						"name" => "Site Banner Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Site Banner. Those banners are displayed on the Homepage and MarketConnect product pages."
					],
					"secondary" => [
						"variableName" => "secondarySectionStyle",
						"name" => "Site Secondary Section Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Secondary Section. Those sections are displayed on the Homepage and MarketConnect product pages."
					]
				] 
			],
			'layout' => [
				'name' => "Layout",
				'styles' => [
					"navigation" => [
						"variableName" => "leftNavStyle",
						"name" => "Left Navigation Style",
						"default" => "primary",
                        "tooltip" => "Choose what style you would like to use for Left Navigation for both logged in and logged out customers."
					],
					"login" => [
						"variableName" => "loginBgStyle",
						"name" => "Login Page Background Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Login Background. This also sets the background for the login sidebar in the Sidebar templates."
					],
					"loginSidebar" => [
						"variableName" => "loginSidebarStyle",
						"name" => "Login Sidebar Background Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Login Sidebar Background."
					]
				] 
			],
			'elements' => [
				'name' => "Elements",
				'styles' => [
					"promo" => [
						"variableName" => "promoSliderStyle",
						"name" => "Promotion Banner Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Promotion Banners. Those are MarketConnect product banners that are displayed for example on Dashboard to logged in customers."
					],
					"search" => [
						"variableName" => "searchBoxStyle",
						"name" => "Search Box Style",
						"default" => "secondary",
                        "tooltip" => "Choose what style you would like to use for Search Box. Those are boxes with the search input displayed on the Knowledgebase, Downloads, Domain Search pages."
					]
				] 
			]
		]
	]
];