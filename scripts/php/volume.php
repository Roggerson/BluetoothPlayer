<?php
//putenv sets an environmental variable for running scripts as the correct user with correct session 
//(important for volume control since each session has its own audio control)

putenv("PULSE_SERVER=/run/user/".getmyuid()."/pulse/native");
$volume=$_REQUEST['volume']; /* $argv[1]; */
shell_exec("/var/www/html/radiogui/scripts/bash/volume.sh $volume");

?>