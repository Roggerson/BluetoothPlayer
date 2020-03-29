<?php
    include 'handler_h.php';
    
    if ($argv[1] == "1") {
      $handler = new handler("next","play","20","ö1:23:45:67:89:AB","","",""); 
      $handler->validateJSON(json_encode($handler)); 
    }else{
      $handler = new handler("","","","","","","");
      $handler->validateJSON($_REQUEST['playerControl']);            
    }

    // validate data object for input erros
    $handler->validateData();
    
    // process Data
    $handler->processData();
    //Encode object back to JSON

    // if ($handler->errMsg != "") die(json_encode($handler));

    echo json_encode($handler);    
?>