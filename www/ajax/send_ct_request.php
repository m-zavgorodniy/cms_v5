<?php

$call_value = $_POST['sessionId'];
$ch = curl_init();
curl_setopt($ch, CURLOPT_HTTPHEADER, array("Content-type: application/x-www-form-urlencoded;charset=utf-8"));
 
curl_setopt($ch, CURLOPT_URL,"http://api-node3.calltouch.ru/calls-service/RestAPI/11781/requests/orders/register/");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,
"orderSum=".$_POST['sum']."&fio=".urlencode($_POST['name'])."&email=".$_POST['email']
."&phoneNumber=".$_POST['phone']."&orderComment=".urlencode('Ok')
."&subject=".urlencode('Заказ товара XXX')."".($call_value != 'undefined' ? "&sessionId=".$call_value : ""));
 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$calltouch = curl_exec ($ch);
curl_close ($ch);
exit;
?>