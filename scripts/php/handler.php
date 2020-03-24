<?php
include 'handler_h.php';
define("DEBUG", "1");

if (DEBUG == "1") {
    $playerControl = (object) [
        'navigation' => 'play',
        'state' => "next",
        'volume' => 20,
        'mac' => "01:23:45:67:89:AB",
        'pass' => ""
      ];
   
} else 
    $playerControl = json_decode($_REQUEST['playerControl']);
   
   if  ( handler::validateData($playerControl) == FALSE){
        echo "ERROR";
   } else

   handler::processData($playerControl);
?>