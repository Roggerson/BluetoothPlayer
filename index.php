<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="./css/bootstrap.css"> 
  <link rel="stylesheet" href="./css/style.css">
  <!-- <link rel="stylesheet" href="./css/style.scss"> -->
  <link rel="stylesheet" href="./rippler/dist/css/rippler.css">
  <link rel="stylesheet" href="./css/progres-bar.css">
  <link rel="stylesheet" href="./css/radialProgress.css">
  <link rel="stylesheet" href="./css/normalize.css">
  <link rel="stylesheet" href="./css/standard.css">
  <link rel="stylesheet" href="./css/popr.css"> 

  <script src="./js/jquery.min.js"></script>
  <script src="./jqueryUi/jquery-ui.js"></script>
  <script src="./js/bootstrap.js"></script>

  <script src="./rippler/dist/js/jquery.rippler.js"></script>
  <script src="./js/player.js"></script>

  <script type="text/javascript" src="./js/popr.js"></script>
</head>

<body>
<div>
  <input type="range" min="50" max="100" value="75" class="slyder" id="myRange">
</div>

<div class="playerContainer">
  <div class="btn_play">
    <i class="glyphicon glyphicon-play"></i>
  </div>
  
  <div class="btn_next">
    <i class="glyphicon glyphicon-step-forward"></i>
  </div>
  <div class="btn_previous">
    <i class="glyphicon glyphicon-step-backward"></i>
  </div>

  <div class="progress">
    <svg class="progress-circle" width="400" height="400">
	    <circle class="progress-circle-back"
		        cx="200" cy="200" r="155"></circle>
        <circle class="progress-circle-prog"
                cx="200" cy="200" r="155"></circle>         
    </svg>
	  <div class="progress-text">/</div>
  </div>	
</div>
<div id="Track" class="trackInfo"></div> 

          <div class="center"><div class="inner" style="padding-top: 15px;"><div class="popr" data-id="1"><img src="img/popr_options.png"></div></div></div>

          <div id="scannedDevices"class="popr-box" data-box-id="1">
          <!-- pop up items -->
</div>
<div class="safdat"></div>
</div>
</body>
</html> 