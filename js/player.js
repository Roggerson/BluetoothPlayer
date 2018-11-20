var mac="safdat"; //Currently connected Device Mac address

//Get current Device Mac and Track data
$(document).ready(function() {
    setInterval(function() {
        $.post("./scripts/php/checkDevCon.php",function(response) {
            console.log("Response: "+response + "Mac: "+mac+"\n");
            if(mac == "safdat"){
                console.log("first start");
                mac = response;
            }else if(response.length < 18){
                console.log("No valid Mac address: "+response);
            }else if(mac != response){//valid mac from device
                    mac = response;
                    console.log("Disconnecting from old Device and connecting to new one: "+response);
                    //$.get('./scripts/php/newDevice.php');
                    $.get('./scripts/php/disconnect.php');//disconnect from old device
                    $.post('./scripts/php/connect.php',{'mac': mac});//connect to new device
            }else{
                console.log("Connected to: "+mac);
            }
          });
          $("#Track").load("./scripts/php/getTrack.php",{'mac': mac });
          //console.log($("#Track").load("./scripts/php/getTrack.php",{'mac': mac }).text());
        
    }, 1000);
});

//Get all scanned Devices and put them into pupout menu
$(document).ready(function() {
    $('.popr').popr();
    $("#scannedDevices").load('./scripts/php/readScanned.php');
});

//On click of popr item, pair to device

$(document).on('click', ".popr-item", function () {
    var macToPair = $(this).attr("value");
    $.get('./scripts/php/pair.php',{'mac': macToPair });
    var passPrompt = prompt("Enter Passkey:");
    if (passPrompt == null || passPrompt == "") {
        pass = "Invalid Passkey.";
    } else { 
        $.get('./scripts/php/passKey.php', {'passKey': passPrompt});
        $.get('./scripts/php/connect.php',{'mac': macToPair});
    }
});
 
//Play Pause Button
var state = 'Pause';

$(document).on('click', ".progress-circle-back, .btn_play, .trackInfo ", function () {
    if(state=='Play'){
        state = 'Pause';
        //console.log("send pause");
        $.get('./scripts/php/control.php',{'mac' : mac , 'control' : state});
        $('.btn_play i').removeClass("btglyphicon glyphicon-pause").addClass("glyphicon glyphicon-play");
    }
    else if(state=='Pause'){
        state = 'Play';
        //console.log("send play");
        $.get('./scripts/php/control.php',{'mac' : mac , 'control' : state});
        $('.btn_play i').removeClass("glyphicon glyphicon-play").addClass("glyphicon glyphicon-pause");
        
    }  
});
function rc(){
    rc1=Math.floor((Math.random() * 255) + 1);
    rc2=Math.floor((Math.random() * 255) + 1);
    rc3=Math.floor((Math.random() * 255) + 1);
    rrgb='rgb('+rc1+','+rc2+','+rc3+')';
    return rrgb;
}
//next song click
$(document).on('click', ".btn_next", function () {
    $.get('./scripts/php/control.php',{'mac' : mac , 'control' : "Next"});
    $(this).css('color', rc());
});

//previous song click
$(document).on('click', ".btn_previous", function () {
    $.get('./scripts/php/control.php',{'mac' : mac , 'control' : "Previous"});
    $(this).css('color', rc());
});

//Volume bar event
$(document).on('click', ".slyder", function () {
    volume = $(this).val();
    console.log("Set volume to: "+volume);
   
    $(".safdat").load("./scripts/php/volume.php",{'volume' : volume});
});

//RADIAL
//Progress bar player
    var prog=0;
    setInterval(function(){ //Draw bar once every second
        var durSec = $('#hiddenDuration').html(); 
        var nowSec = $('#hiddenPosition').html(); 
        
        prog=203/durSec*nowSec;
    
        if(prog>203){
            nowSec=0;
        }
        progressBar(); //maxValue is 203 ... Me no know why do, me not do progress bar, only adapt
    }, 1000);

function progressBar(){
    //draw
    var x = document.querySelector('.progress-circle-prog');
    x.style.strokeDasharray = (prog * 4.65) + ' 999';
    //text
    var el = document.querySelector('.progress-text'); 
    var from = $('.progress-text').data('progress');
    $('.progress-text').data('progress', prog);
}

//Rippler
$(document).ready(function() {
    $(".rippler").rippler({
      effectClass      :  'rippler-effect'
      ,effectSize      :  2      // Default size (width & height)
      ,addElement      :  'div'   // e.g. 'svg'(feature)
      ,duration        :  300
    });
  });
