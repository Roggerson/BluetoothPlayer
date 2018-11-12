 <?php

$i=0;
$f = fopen("../bash/scannedDevices.txt", "r") or die("Unable to open file!");
echo "<html><body><form action=connect.php method='POST'><table border><tr><th>Mac</th><th>Name</th></tr>\n\n";
while(!feof($f)){
    $macNname = trim(fgets($f));
    echo "<tr>";
    if($macNname != ""){
        $ary=explode(";",$macNname);
        echo "<td><input type='submit' name='mac' value='".$ary[0]."'></input></td>"."<td><input type='button' name='mac' value='".rtrim($ary[1],"#")."'></input></td>";
    }
    echo "</tr>"; 
  }
fclose($f);

echo "\n</table></form></body></html>";
//header('Location: ../../index.php');
?> 


