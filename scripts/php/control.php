<?php

$mac = trim($_REQUEST['mac']);
$control = trim($_REQUEST['control']);
shell_exec("/var/www/html/radiogui/scripts/bash/control.sh $mac $control");
?>
