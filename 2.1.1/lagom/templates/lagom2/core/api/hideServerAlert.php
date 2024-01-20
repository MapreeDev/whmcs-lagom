<?php

if(isset($_SESSION)){
    session_start();
}
require_once '../../../../init.php';
$test = $_POST['hide_server_alerts'];
if(isset($test)){
    $_SESSION['hide_server_alert'] = $test;
}else{
    $_SESSION['hide_server_alert'] = false; 
}