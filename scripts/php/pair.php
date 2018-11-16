<?php

$mac = $_REQUEST['mac'];//$_REQUEST['mac'];$argv[1];//
if (strlen($mac) < 17){
    echo "Faulty Mac";
}else{
    shell_exec("../bash/pairTrust.sh $mac");
}
?>