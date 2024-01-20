<?php

require_once '../../../../init.php';

echo json_encode([
    'session' => $_SESSION['cart']
]);