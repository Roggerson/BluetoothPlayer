<?php
$mac = $_REQUEST['mac'];
$state = $_REQUEST['state'];

shell_exec("../bash/control.sh $mac Pause")

?>
