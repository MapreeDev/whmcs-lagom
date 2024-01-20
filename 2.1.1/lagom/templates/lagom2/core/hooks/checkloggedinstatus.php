<?php

namespace WHMCS;

add_hook('ClientAreaPageAffiliates', 1, function($vars) {
    if (!is_null(\Auth::user())) {
        $client = \Auth::client();
        $legacyClient = new Client($client);
        $clientAlerts = [];
        $clientsdetails = [];
        $clientsstats = [];
        if ($client) {
            $clientsdetails = $legacyClient->getDetails();
            if (!function_exists("getClientsDetails")) {
                require ROOTDIR . "/includes/clientfunctions.php";
            }
            $clientsstats = getClientsStats($client->id);
            $alerts = new User\Client\AlertFactory($client);
            $clientAlerts = $alerts->build();
        }
        return [
            'loggedin' => true,
            'clientsdetails' => $clientsdetails,
            'clientsstats' => $clientsstats,
            'clientAlerts' => $clientAlerts,
        ];
    }
});
