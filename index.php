<!DOCTYPE html>
<html lang="en">
<head>
<?php $mac="D0:13:FD:77:8A:58"; ?>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/bootstrap.css"> 
  <link rel="stylesheet" href="./rippler/dist/css/rippler.css">
  
  <script src="./js/jquery.min.js"></script>
  <script src="./js/bootstrap.js"></script>
  <script src="./rippler/dist/js/jquery.rippler.js"></script>
  <script src="./js/player.js"></script>

<script>
$(document).ready(
  function() {
      setInterval(function() {
          $("#Track").load('./scripts/php/getTrack.php',{'mac': 'D0:13:FD:77:8A:58'}); 
      }, 1000);
  });
</script>
</head>

<div id="Track"></div>
<body>
  <div class="container">

  <div class="mediPlayer">
	  <audio class="listen" preload="none" data-size="250" src="./Circular-Html5-Audio-Player-jQuery/sound.mp3"></audio>
	</div>

    <div class="player text-center">
    <form action = previous.php>
        <button type="submit" id="button_bw" class="btn rippler rippler-default" href="#" onclick='buttonBackPress()'>
            <i class="glyphicon glyphicon-backward"></i>
        </button>
    </form> 

    <form action = play.php>
      <button type="submit" id="button_play" class="btn rippler rippler-default" href="#" onclick='buttonPlayPress()'>
        <i class="glyphicon glyphicon-play"></i>
      </button>
    </form> 

    <form action = next.php>
      <button type="submit" id="button_fw" class="btn rippler rippler-default" href="#" onclick='buttonForwardPress()'>
        <i class="glyphicon glyphicon-forward"></i>
      </button>
      
    </form> 

    <form action = ./scripts/php/readScanned.php>
      <button type="submit" id="button_fw" class="btn rippler rippler-default" href="#">
        <i class="glyphicon glyphicon-forward"></i>
      </button>
    </form> 
    </div>
  </div>
  
</body>
</html> 