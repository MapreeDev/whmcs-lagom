<?php
add_hook('ClientAreaPageViewTicket', 1, function($vars) {
    if ($vars['templatefile'] == 'viewticket') {
        if (isset($vars['descreplies'])) {
            foreach ($vars['descreplies'] as $key => $reply) {
                if ($reply['admin']) {
                    $admins = \WHMCS\User\Admin::all();
                    foreach ($admins as $admin) {
                        $fullname = $admin->fullname;
                        if ($fullname == $reply['name']) {
                            $vars['descreplies'][$key]['email'] = $admin->email;
                        }
                    }
                }
            }
        }
        return $vars;
    }
});