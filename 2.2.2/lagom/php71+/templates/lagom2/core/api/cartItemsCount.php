<?php

require_once '../../../../init.php';

$cart = new WHMCS\OrderForm();
$cartItemCount = $cart->getNumItemsInCart();

echo json_encode([
    'cartItemCount' => $cartItemCount
]);