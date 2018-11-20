<?php
$volume=$_REQUEST['volume'];
shell_exec("/var/www/html/radiogui/scripts/bash/volume.sh $volume");
?>