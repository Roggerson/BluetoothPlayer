<?php

$mac = trim($_REQUEST['mac']);
$control = trim($_REQUEST['control']);
shell_exec("/var/www/html/BluetoothPlayer/scripts/bash/control.sh $mac $control");
?>
