<?php
$mac=$_REQUEST['mac'];
shell_exec("../bash/disconnect.sh && ../bash/connect.sh $mac");
?>