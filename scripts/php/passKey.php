<?php
$passKey=$_REQUEST['passKey'];//trim($argv[1]); //;
$passKey=intval($passKey);
$f = fopen("../bash/passKey", "w") or die("Couldn't open file, check permissions");
    fprintf($f,$passKey);
    echo var_dump($passKey);
fclose($f);

?>