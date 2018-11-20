<?php
$mac = $_REQUEST['mac'];
if (strlen($mac) < 17){
    echo "ungültig";
}else{
    shell_exec("../bash/connect.sh $mac");
}
?>