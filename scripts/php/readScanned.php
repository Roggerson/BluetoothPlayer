 <?php

$f = fopen("../bash/scannedDevices.txt", "r") or die("Unable to open file!");
while(!feof($f)){
    $macNname = trim(fgets($f));
    if($macNname != ""){
        $ary=explode(";",$macNname);
 
        echo "<a><div class='popr-item' value='".$ary[0]."'>".rtrim($ary[1],"#")."</div></a>";
        //echo "<td><input type='submit' name='mac' value='".$ary[0]."'></input></td>"."<td><input type='button' name='mac' value='".rtrim($ary[1],"#")."'></input></td>";
    }
  }
fclose($f);

//echo "\n</table></form></body></html>";
//header('Location: ../../index.php');
?> 