<?php

// [custom app main body class, additional <body> classes depended on pages, main content custom classes]
return [
    'login'                             => [false, 'page-login'],
    'logintwofa'                        => [false, 'page-login'],
    'logout'                            => [false, 'page-login'],
    'pwreset'                           => [false, 'page-login'],
    'pwresetvalidation'                 => [false, 'page-login'],
    'password-reset-container'          => [false, 'page-login'],
    'contact'                           => [false, 'page-contact'],
    'clientregister'                    => [false, 'page-login register-page'],
    'configureproduct'                  => [false, false, 'main-content-m-w'],
    'viewcart'                          => [false, false, 'main-content-m-w'],
    'error/page-not-found'              => ['error-page pattern-bg-error', false],
    'error/unknown-routepath'           => ['error-page pattern-bg-error', false],
    '/modules/addons/DomainOrdersExtended/templates/client/lagom/main.tpl' => [false, 'doe'],
    'oauth/layout'                      => [false, 'page-login'],
    'two-factor-challenge'              => [false, 'page-login'],
    'two-factor-new-backup-code'        => [false, 'page-login'],
    'user-invite-accept'                => [false, 'page-login'],
];