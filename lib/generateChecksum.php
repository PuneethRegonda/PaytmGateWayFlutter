<?php
require_once("./lib/encdec_paytm.php");

$checkSum = "";

$paramList = array();

//   var_dump($_POST);

$paramList["MID"] = $_POST["MID"];
$paramList["CHANNEL_ID"] = $_POST["CHANNEL_ID"];
$paramList["INDUSTRY_TYPE_ID"] = $_POST["INDUSTRY_TYPE_ID"];
$paramList["WEBSITE"] = $_POST["WEBSITE"];
// $paramList["PAYTM_MERCHANT_KEY"] = $_POST["PAYTM_MERCHANT_KEY"];
$paramList["TXN_AMOUNT"] = $_POST["TXN_AMOUNT"];
$paramList["ORDER_ID"] = $_POST["ORDER_ID"];
$paramList["CUST_ID"] = $_POST["CUST_ID"];

/*    "MID": "GmvHHd58746018888699",

     "CHANNEL_ID": "WAP",

    "INDUSTRY_TYPE_ID": "Retail",

     "WEBSITE": "APPSTAGING",

     "PAYTM_MERCHANT_KEY": "ZZq!5y!a3hU1mTS_",

     "TXN_AMOUNT": "10",

     "ORDER_ID": "sakjkd",

     "CUST_ID": "122"
*/

 
$checkSum = getChecksumFromArray($paramList,$_POST["PAYTM_MERCHANT_KEY"]);
 
    // echo json_encode($checkSum);
    // header("Content-Type: application/json");

    echo str_replace('"', '', json_encode($checkSum));

 
?>
