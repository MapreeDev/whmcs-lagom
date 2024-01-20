<?php

return [
    'general' => [
        'confirm' => 'Confirm',
        'cancel' => 'Cancel',
        'remove' => 'Remove',
        'delete' => 'Delete',
        'add_new' => 'Add New',
        'add_new_item' => 'Add New Item',
        'edit' => 'Edit',
        'save_changes' => 'Save Changes',
        'export' => 'Export',
        'translate' => 'Translate',
        'docs' => 'docs',
        'refresh' => 'Refresh',
        'changes_saved' => 'Changes have been saved successfully',
        'changes_saved_error' => 'Failed to save changes. Please try again.',
        'active' => 'Active',
        'inactive' => 'Inactive',
        'disabled' => 'Disabled',
        'search' => 'Search',
        'actions' => 'Actions',
        'manage' => 'Manage',
        'status' => 'Status',
        'live_preview' => 'Live Preview',
        'activate' => 'Activate',
        'restore_defaults' => 'Restore Defaults',
        'name' => 'Name',
        'menu' => 'Menu',
        'categories' => 'Categories',
        'settings' => 'Settings',
        'show' => 'Show',
        'all' => 'All',
        'template' => 'Template',
        'import' => 'Import',
        'rule' => 'Rule',
        'location' => 'Location',
        'field_required' => 'This field is required', 
        'expire_in' => 'Expires in',
        'expire_today' => 'Expires today',
        'day' => 'day',
        'days' => 'days',
        'learn_more' => 'Learn More',
        'download_now' => 'Download Now',
        'invalid' => 'Invalid',
        'explore_marketplace' => 'Explore Marketplace',
        'filter_by_status' => 'Filter by status',
        'version' => 'Version',
        'dismiss' => 'Dismiss',
        'expired' => 'Expired',
    ],
    'navigation' => [
        'contact_us' => 'Contact Us',
        'my_account' => 'My Account',
    ],
    'tabs' => [
        'style_variables' => 'Style Variables',
        'custom_css' => 'Custom CSS',
    ],
    'breadcrumb' => [
        'styles' => 'Styles',
        'pages' => 'Pages',
        'website' => 'Website',
        'new_page' => 'New Page',
        'sections' => 'Sections',
        'new_section' => 'New Section',
        'menu' => 'Menu',
        'new_menu' => 'New Menu',
        'display_rules' => 'Display Rules',
        'sidebar' => 'Sidebar',
        'new_sidebar' => 'New Sidebar',
        'report_bug' => 'Report Bug',
        'docs' => 'Docs',
        'activate_theme' => 'Activate Theme',
        'media' => 'Media',
        'sitemap' => 'Sitemap',
    ],
    'info' => [
        'theme_information' => [
            'title' => 'Theme Information',
            'theme_version' => 'Theme Version',
            'new_version' => 'New Version Available',
            'new_version_desc' => 'A new version of <b>Lagom WHMCS Client Theme</b> is available to download. Log in to the RS Studio client portal and download the latest version.',
            'registration_date' => 'Registration Date',
            'next_due_date' => 'Next Due Date',
            'lifetime_license' => 'Lifetime License',
            'first_payment' => 'First Payment Amount',
            'recurring' => 'Recurring Amount',
            'payment_method' => 'Payment Method',
            'incompatible_version' => 'Incompatible Version',
            'incompatible_version_desc_1' => 'is not compatible with',
            'incompatible_version_desc_2' => 'version. Please follow our documentation to learn what steps should be taken to resolve this problem.',
            'support_access' => 'Support & Updates',
            'support_access_expire_desc' => 'If “Support & Updates” is not renewed, you will no longer receive access to the latest versions of Lagom WHMCS Client Theme. Renewing is not obligatory, your license will remain active.',
            'support_access_pay_invoice' => 'Log in to the RS Studio client area to pay the renewal invoice.',
            'support_access_expired_desc' => 'Access to “Support & Updates” has expired. You will no longer receive access to the latest versions of Lagom WHMCS Client Theme. Renewing is not obligatory, your license will remain active.',
            
        ],
        'license_key' => [
            'title' => 'License Key',
            'license_status' => 'License Status',
            
        ]
    ],
    'settings' => [
        'sidebar' => [
            'categories' => 'Categories',
            'display' => 'Display',
            'general' => 'General',
            'order_process' => 'Order Process',
        ],
        'section' => [
            'general' => [
                'title' => 'General Settings',
                'custom_logo_url' => [
                    'title' => 'Custom Logo URL',
                    'label' => 'Logo URL',
                ],
                'homepage_price_display' => [
                    'title' => 'Homepage Price Display',
                ],
                'sticky_sidebars' => [
                    'title' => 'Sticky Sidebars',
                ],
                'gravatar' => [
                    'title' => 'Gravatar',
                    'placeholder' => [
                        'label' => 'Choose gravatar placeholder',
                        'options' => [
                            'default' => 'default',
                            '404'=> '404 - do not load any image if none is associated with the email hash, instead return an HTTP 404 (File Not Found) response',
                            'mp' => 'mp - (mystery-person) a simple, cartoon-style silhouetted outline of a person (does not vary by email hash)',
                            'identicon' => 'identicon - a geometric pattern based on an email hash',
                            'monsterid' => "monsterid - a generated 'monster' with different colors, faces, etc",
                            'wavatar' => 'wavatar - generated faces with differing features and backgrounds',
                            'retro' => 'retro - awesome generated, 8-bit arcade-style pixelated faces',
                            'robohash' => 'robohash - a generated robot with different colors, faces, etc',
                            'blank' => 'blank - a transparent PNG image (border added to HTML below for demonstration purposes)',
                        ]
                    ]
                ],
                'show_status_icon' => [
                    'title' => 'Show Status Icon',
                ],
                'affixed_navigation' => [
                    'title' => 'Affixed Navigation',
                ],
                'cookie_box' => [
                    'title' => "Cookie Box",
                    'label_position' => 'Cookie Box Position',
                    'label_message' => 'Cookie Box Message',
                    'position' => [
                        'bottom_left' => 'bottom left',
                        'bottom_right' => 'bottom right',
                        'bottom' => 'bottom',
                    ]
                ],
                'affixed_navigation' => [
                    'title' => 'Affixed Navigation',
                ],
                'free_product_price' => [
                    'title' => '0.00 Converted To "Free"',
                    'label' => 'Choose Where 0.00 Values Will Be Converted To "Free"',
                    'options' => [
                        'boxes' => "Product Boxes",
                        'all' => "Whole Order Process and Client Area"
                    ]
                ],
                'mobile_menu_style' => [
                    'title' => 'Mobile Menu Style',
                    'label' => 'Select Style For Mobile Menu',
                    'style' => [
                        'slide' => 'Slide',
                        'dropdown' => "Dropdown",
                    ],
                ],
                'table_cache' => [
                    'title' => 'Table Cache Duration',
                    'label' => 'Select Duration Time Of Table Cache',
                    'duration' => [
                        'disabled' => 'Disabled',
                        'one_day' => 'One Day',
                        'one_week' => 'One Week',
                        'two_weeks' => 'Two Weeks',
                        'one_month' => 'One Month',
                        'one_year' => 'One Year'
                    ]
                ],
                'show_client_id' => [
                    'title' => 'Show Client ID',
                ]
            ],
            'order_process' => [
                'title' => 'Order Process Settings',
                'product_package_settings' => [
                    'title' => 'Product Package Settings',
                    'label_auto_width' => 'Auto Adjust Package Width',
                    'label_price' => 'Package Price',
                    'price_wrap' => [
                        'default' => 'Default',
                        'break_all' => 'Break All'
                    ]
                ],
                'product_price_calculation' => [
                    'title' => 'Choose Product Price Calculation',
                    'label' => 'Price Calculation',
                    'price' => [
                        'default' => 'Default WHMCS price calculation',
                        'lowest' => 'Lowest monthly price from all billing cycles'
                    ]
                ],
                'hide_product_nameservers' => [
                    'title' => 'Hide Product Nameservers',
                ],
                'hide_product_hostname' => [
                    'title' => 'Hide Product Hostname',
                    'custom_hostname' => 'Use Custom Hostname',
                    'prefix' => 'Subdomain',
                    'interfix' => 'Prefix Random Chars Length',
                    'suffix' => 'Suffix',
                ],
                'hide_product_common' => [
                    'hide_all' => 'Hide For All Products',
                    'hide_selected' => 'Hide For Selected Product Groups',
                    'choose_product_groups' => 'Choose Product Groups',
                ],
                'enable_pw_strength' => [
                    'title' => 'Enable Password Strength For Root Password Field'
                ]
            ]
        ],  
    ],
    'styles' => [
        'title' => 'Theme Style',
        'table' => [
            'color_scheme' => 'Color Scheme',
            'force_style_refresh' => 'Force Style Refresh',
        ],
    ],
    'layouts' => [
        'main_menu' => [
            'title' => 'Main Menu Layout',
        ],
        'footer' => [
            'title' => 'Footer Layout',
        ],
        'sidebar' => [
            'main_menu' => 'Main Menu',
            'footer' => 'Footer',
        ],
        'table' => [
            'activate_for' => 'Activate For',
        ] 
    ],
    'pages' => [
        'with_templates' => 'With Templates',
    ],
    'page' => [
        //general
        'general' => [
            'configuration' => 'Configuration',
        ],
        //template
        'page_template' => [
            'header' => 'Page Template',
        ],
        //template settings
        'template_settings' => [
            'header' => 'Template Settings',
            'no_data' => 'There are no settings for the current option'
        ],
        //settings
        'page_settings' => [
            'header' => 'Page Settings',
        ],
        //title
        'page_title' => [
            'header' => 'Page Title',
            'input_placeholder' => 'Enter Page Title',
            'permalink' => 'Permalink:',
            'alert' => [
                'name' => 'This name is taken, please choose different one',
                'url'  => 'This url contains illegal characters'
            ]
        ],
        //sections
        'page_sections' => [
            'header' => 'Page Sections',
            'show_hide' => 'Show/Hide Section',
            'section_style' => 'Section Style',
            //sections modals
            'modal' => [
                //add section
                'add_section' => [
                    'title' => 'Add New Section',
                    'choose_predefined' => 'Choose Predefined Section',
                    'create_new' => 'Create New Section',
                ],
                'remove_section' => [
                    'title' => 'Remove Section',
                    'desc' => 'Are you sure? Changes are irreversible.',
                ],
            ],
        ],
        //seo
        'seo' => [
            'header' => 'SEO',
            'title'  => 'Title',
            'desc'   => 'Description',
            'robots' => 'Robots',
            'social_image' => 'Social Image',
            'choose_image' => 'Choose Image',
        ],
    ],
    'menu' => [
        'main_menu' => [
            'title' => 'Main Menu',
        ],
        'secondary_menu' => [
            'title' => 'Secondary Menu',
        ],
        'sidebar_menu' => [
            'title' => 'Sidebar Menu',
        ],
        'footer_menu' => [
            'title' => 'Footer Menu',
        ],
        //general
        'general' => [
            'name' => 'Name',
            'display_rule' => 'Display Rule',
            'status' => 'Status',
            'active' => 'Active',
            'inactive' => 'Inactive',
            'disabled' => 'Disabled',
        ],
        // menu items
        'menu_items' => [
            'title' => 'Menu Items',
            'add_child' => 'Add Child',
            'show_hide' => 'Show/Hide',
            'move_up'   => 'Move Up',
            'move_down' => 'Move Down',
            'show_customization_options' => 'Show Customization Options',
            'hide_customization_options' => 'Close Customization Options',
            // main no data
            'no_data' => [
                'title' => 'No Menu Items Created',
                'desc' => 'Please use the below button to start adding new menu items or follow our <a href="#">documentation</a>.'
            ],
            // menu items modals
            'modal' => [
                'remove_menu_item' => [
                    'title' => 'Remove Menu Item',
                    'desc' => 'You are trying to remove menu item, <b class="text-danger">this action can not be undone!</b>. Please confirm, to remove this item completely.',
                ],
                'icon' => [
                    'title' => "Choose Icon",
                    'no_data' => "No Icons Found",
                    'fa'    => "FontAwesome",
                    'lm'    => "Medium Icons",
                    'ls'    => "Small Icons"
                ],
                'change_type' => [
                    'title' => "Change Item Type",
                    'desc'  => "This change will remove all 'child' elements under this item."
                ]
            ],
        ],
        // menu settings
        'menu_settings' => [
            'title' => 'Menu Settings',
        ],
        // menu modals
        'modal' => [
            'remove_menu' => [
                'title' => 'Remove Menu',
                'desc' => 'You are trying to remove menu, <b class="text-danger">this action can not be undone!</b>. Please confirm, to remove this menu completely.'
            ],
        ],

        // menu items
        'sidebar_items' => [
            'title' => 'Sidebar Items',
        ],
        // sidebar settings
        'sidebar_settings' => [
            'title' => 'Sidebar Settings',
        ],
    ],
    'extensions' => [
        'title' => 'Extensions',
        'new_version_desc_1' => 'A new version of',
        'new_version_desc_2' => 'extension is available to download. Log in to the RS Studio client portal and download the latest version.',
        'activate_extension' => 'Activate Extension',
        'please_activate' => 'Please activate this extension before you will be able to start using its features. During activation we will validate if this extension can be used with this license key of Lagom WHMCS Client Theme.',
        'system_requirements' => 'System Requirements Check',
        'requirements_met' => 'Extension requirements met. Activation possible.',
        'requirements_not_met' => 'Requirements not met. Unable to activate extension.',
        'custom_code_modal' => [
            'title' => 'Remove Item',
            'desc' => 'Are you sure you want to delete this item? <b class="text-danger">This action can not be undone!</b>. Please confirm, to remove this item completely.'
        ],
        'sensitive_data' => [
            'settings' => [
                'title_1' => 'Access To Sensitive Data Extension',
                'desc_1' => 'Allow access to Sensitive Data Manager Extension in RS Themes addon for below administrator roles',
                'title_2' => 'Access To Sensitive Data in WHMCS Admin Area',
                'desc_2' => 'Allow access to client Sensitive Data in WHMCS admin area for below administrator roles',
                'title_3' => 'Display For Selected Support Departments',
                'desc_3' => 'Choose for which support departaments your customers should see Sensitive Data field in Open Ticket and View Ticket pages',
            ],
            'modals' => [
                'title_remove' => 'Remove Sensitive Data',
                'desc_remove' => 'Are you sure you want to delete this data? <b class="text-danger">This action can not be undone!</b>. Please confirm, to remove this data completely.',
            ],
        ],
    ],
    'modal' => [
        'settings' => [
            'title' => 'Confirmation',
            'subtitle' => 'Are you sure that you would like to save these changes?'
        ],
        'email_preview' => [
            'title' => 'Email Template Preview',
        ],
        'cookie_box_translation' => [
            'title' => 'Cookie Box Translation',
        ],
        'unsaved_changes' => [
            'title' => 'You have unsaved changes!',
            'desc1' => 'Changes made on this page have not been saved. Do you want to leave this page anyway?',
            'desc2' => 'This action cannot be undone. Unsaved changes will be lost.',
            'btn_confirm' => 'Yes, leave this page',
            'btn_dismiss' => 'No, I want to save my changes',
        ],
        'overwrite_menu_display_rules' => [
            'title' => 'Overwrite Display Rules',
            'desc' => 'This action will overwrite display rules in following menus:',
        ],
        'refresh_license' => [
            'title' => 'Change License Key',
            'desc' => 'Please note that if entered license is incorrect <b class="text-danger">Lagom Client Theme will be deactivated</b>.<br/><br/> Lagom Extensions assigned to current license will be also deactivated if license will change. <a href="https://lagom.rsstudio.net/docs/extensions/licensing.html" target="_blank">Learn more about extension licensing</a>. <br/></br>Click "Confirm" button to save entered license key.'
        ]
    ],
    'alert' => [
        'new_menu_version' => [
            'title' => 'New Menu Version Available!',
            'desc'  => 'Addon has detected theme version change. Installed theme version contain changes made in default theme navigations. Default theme navigations has been customized, please confirm automatic menu update. New menu items can be added or removed from your exisitng navigations. Learn more about implemented changes in our <a href="https://lagom.rsstudio.net/docs/changelog.html" target="_blank">changelog</a>.'
        ],
        'integration_available' => [
            'title' => 'Install Configuration for Lagom Integration',
            'desc'  => 'Addon has detected installation of integration files. Integration files installed on your server contains configuration file, which will automatically set correct configuration for your Lagom installation. This file has been prepared during integration service, so please click "Update" button to install this configuration.',
        ],
    ],
    'ajax' => [
        'color_api' => [
            'success' => [
                'color_scheme_saved' => "The color scheme has been saved successfully.",
                'style_saved' => "The styles have been saved successfully.",
                'restore_success' => "The style has been restored successfully.",
                'restore_all_success' => "All styles have been restored successfully.",
                'update_success' => "Changes have been updated successfully.",
            ],
            'error' => [
                'color_scheme_load_error' => "The color scheme ':scheme:' could not be loaded",
                'color_scheme_not_exists' => "The color scheme does not exist",
                'style_not_exists' => "The style does not exist",
                'saved_not_generated' => "The styles have been saved but the minified file has not been generated",
                'directory_not_writeable' => "The directory is not writeable",
                'file_not_writeable' => "The file is not writeable",
                'restore_failed' => "The process of restoring the file :style:.css has failed",
                'color_is_not_writeable' => "Could not save color scheme :scheme: since its not writeable",
                'color_scheme_could_not_be_saved' => "Color Scheme Could not be saved",
                'restore_all_failed' => "The process of restoring the styles has failed",
            ]
        ]
    ],
    'flash_message' => [
        'template_update' => [
            'success' => 'Your styles has been updated into latest version, because addon detected update of Lagom WHMCS Client Theme on your server.',
        ],
        'integration_import' => [
            'success' => 'Configuration for Lagom integration has been installed correctly.',
            'error' => 'Something went wrong! Configuration for Lagom integration was NOT installed. Please contact our support.',
        ],
        'styles' => [
            'custom_style_settings' => 'Custom style settings has been saved!',
            'custom_style' => 'Custom style has been saved!',
            'activate_style' => 'Style was set as active!',
        ],
        'settings' => [
            'success' => 'Settings has been updated',
        ],
        'extensions' => [
            'activate' => 'Extension was activated',
            'deactivate' => 'Extension was deactivated',
        ],
        'media' => [
            'upload' => [
                'sucess' => 'Images have successfully uploaded.',
                'error' => [
                    'size' => 'The size of the graphic exceeds the allowed limit. Try a different graphics or increase the limit in the server configuration.',
                    'extension' => 'This extension is not allowed. Please try another one.',
                    'other' => 'An error occured. Please refresh page and try again.',
                ]
            ]
        ]
    ],
];
