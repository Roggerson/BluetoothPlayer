<?php
$mac = trim($_REQUEST['mac']);



$songInfo=shell_exec("/var/www/html/radiogui/scripts/bash/control.sh $mac Track");
$nowMilliSec=shell_exec("/var/www/html/radiogui/scripts/bash/control.sh $mac Position");

//Character positions of each 
$posAlbum=strpos($songInfo,"Album: ");
$posArtist=strpos($songInfo,"Artist: ");
$posDuration=strpos($songInfo,"Duration: ");
$posItem=strpos($songInfo,"Item: ");
$NumberOfTracks=strpos($songInfo,"NumberOfTracks: ");
$posTitle=strpos($songInfo,"Title: ");
$posTrackNumber=strpos($songInfo,"TrackNumber: ");


//get values
$album=trim(substr($songInfo,$posAlbum+strlen("Album: "),$posArtist-strlen("Album: ")));
$artist=trim(substr($songInfo,$posArtist+strlen("Artist: "),$posDuration-$posArtist-strlen("Artist. ")));
$duration=trim(substr($songInfo,$posDuration+strlen("Duration: "),$posItem-$posDuration-strlen("Duration: ")));
$title=trim(substr($songInfo,$posTitle+strlen("Title: "),$posTrackNumber-$posTitle-strlen("Title: ")));

$title=substr($title,0,21);
$artist=substr($artist,0,23);
$durMin=intval($duration/1000/60);
$durSec=intval(($duration/1000)%60);
if($durSec<10){
    $durSec="0".$durSec;
}

$nowMin=intval($nowMilliSec/1000/60);
$nowSec=intval(($nowMilliSec/1000)%60);
if($nowSec<10){
    $nowSec="0".$nowSec;
}

echo "<div id='trackinfo'><p id='artist'>".$artist."</p><p id='title'>".$title."</p><p id='duration'>".$durMin.":".$durSec."</p><p id='position'>".$nowMin.":".$nowSec."</p></div></p><p id='hiddenPosition'>".intval($nowMilliSec/1000)."</p><p id='hiddenDuration'>".intval($duration/1000)."</p></div>";
//Album
//Artist
//Duration
//Ttitle
?>
