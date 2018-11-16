<?php
$passKey= $_REQUEST['passKey'];$argv[1];//
$f = fopen("../bash/passKey.txt", "w") or die("Couldn't open file, check permissions");
    fprintf($f,$passKey);
fclose($f);
?>