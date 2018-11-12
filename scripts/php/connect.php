<?php

$mac = "";
if (strlen($_POST['mac']) < 17){
    echo "ungültig";
}else{
    $mac = $_POST['mac'];
    
    //$mac = "D0:13:FD:77:8A:58";
    shell_exec("/var/www/html/radiogui/scripts/bash/connect.sh $mac");
    echo $mac;
}
?>