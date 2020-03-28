<?php
    include 'handler_h.php';
    define("DEBUG", "0");
    $handler = new handler();

    if (DEBUG == "1") {
         $playerControl = (object) [
            'navigation' => 'play',
            'state' => "next",
            'volume' => 20,
            'mac' => "01:23:45:67:89:AB",
            'pass' => ""
        ];
        json_encode($playerControl);        
    } else

        // validate json object, sent from js
        $playerControl = $handler->validateJSON($_REQUEST['playerControl']);
                       
        // validate data object for input erros
        $playerControl = $handler->validateData($playerControl);
        
        // process Data
        $playerControl = $handler->processData($playerControl);

        //Encode object back to JSON
        if ($playerControl->errMsg == "") die(json_encode($playerControl));

        echo json_encode($playerControl);
     
    
?>