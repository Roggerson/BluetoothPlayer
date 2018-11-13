<?php
$mac = $_REQUEST['mac'];
$songInfo=shell_exec("../bash/control.sh $mac Track");
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

$durSec=intval(($duration/1000)%60);//sec
$durMin=intval($duration/1000/60);//min
echo "<div id='trackinfo'> <i id='album'>".$album."</i> <i id='artist'>".$artist."</i> <i id='duration'>".$durMin.":".$durSec."</i><i id='title'>".$title."</i></div>";
//Album
//Artist
//Duration
//Ttitle
?>
