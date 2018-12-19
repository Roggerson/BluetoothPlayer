//Get current Device Mac and Track data
var mac;
var cnt=0;
$(document).ready(function() {
    $('.popr').popr();
    //on first page load, get mac, doesnt matter if there is already one or if it is invalid
    $.post("./scripts/php/checkDevCon.php",function(response) {
        mac = response;
        //console.log("page load: "+mac);
    });
    setInterval(function() {
        $.post("./scripts/php/checkDevCon.php",function(response) {
            //console.log("Bluetoothctl Mac: "+response);
            if(mac != response && response.length == 18){
                    //console.log("Connecting to new Device: "+response);
                    mac = response;
                    $.get('./scripts/php/disconnect.php');//disconnect from old device
                    $.post('./scripts/php/connect.php',{'mac': mac});//connect to new device
                    //$.get('./scripts/php/newDevice.php',{'mac': mac});    
            }else{
                //console.log("Current device: "+mac);
                if(response.length < 18 && mac.length != 1){
                    cnt ++;
                    if(cnt >5){
                        //$.post('./scripts/php/connect.php',{'mac':mac});
                        cnt = 0;
                        console.log("Trying to connect to last device: "+mac);
                    }
                }
            }
          });
          $("#Track").load("./scripts/php/getTrack.php",{'mac': mac });        
    }, 1000);
});
// _ ___ _
//| |   | |
//| |:D | |
//|_|___|_|
// 
//scan
$(document).on('click', "#scan", function () {  
    $.post("./scripts/php/scan.php",function() {
        $("#scannedDevices").load('./scripts/php/readScanned.php');
        console.log("finished scanning for devices");
    });
});

//On click of popr item, pair to device

$(document).on('click', ".popr-item", function () {
    var macToPair = $(this).attr("value");
    $.post('./scripts/php/pair.php',{'mac': macToPair });
    console.log(macToPair);
    $.post('./scripts/php/connect.php',{'mac': macToPair});//connect to new device
    $('#numPad').css('display','block');
});

//Play Pause Button
var state = 'Pause';

$(document).on('mousedown', ".progress-circle-back, .btn_play, .trackInfo ", function () {
    $(".btn_play").css('color', "rgb(140, 140, 140)"); //make button darker
});

$(document).on('mouseup', ".progress-circle-back, .btn_play, .trackInfo ", function () {
    $(".btn_play").css('color', "rgb(240, 240, 240)"); //make button brighter
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

//btn_next - skip song 
$(document).on('mousedown', ".btn_next", function(){
        console.log("next down");
        $(this).css('color', "rgb(140, 140, 140)"); //make button darker
    });
    //optic feedback for pressing the button
    $(document).on('mouseup', ".btn_next", function(){
        $.get('./scripts/php/control.php',{'mac' : mac , 'control' : "Next"});
        $(this).css('color', "rgb(240, 240, 240)");
    });

//btn_previous - previous song 
    $(document).on('mousedown', ".btn_previous", function(){
        console.log("prev down");
        $(this).css('color', "rgb(140, 140, 140)"); //make button darker
    });
    //optic feedback for pressing the button
    $(document).on('mouseup', ".btn_previous", function(){
        $.get('./scripts/php/control.php',{'mac' : mac , 'control' : "Previous"});
        $(this).css('color', "rgb(240, 240, 240)");
    });

//Volume bar event
$(document).on('click', ".slyder", function () {
    volume = $(this).val();
    console.log("Set volume to: "+volume);
   
    $(".safdat").load('./scripts/php/volume.php',{'volume' : volume});
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
var pin="";
//numPad
$(document).on('click', "ul#keyboard li", function () {  
    if(isNaN(this.innerHTML)){
    }else{
        pin = $('.numPadBox').val();
        pin = pin + this.innerHTML;
        console.log(pin);
        $('.numPadBox').val(pin);
        if(pin.length == 6){
            console.log("sending pin: |" + pin + "|");
            $.post('./scripts/php/passKey.php', {'passKey': pin});//store pin in file on server
            
            //$(".safdat").load('./scripts/php/passKey.php', {'passKey': pin});
            //$.get('./scripts/php/passKey.php', {'passKey': pin});
           
            $('.numPadBox').val("");//Reset numpad value
            $('#numPad').css('display','none'); //hide numpad
        }
    }
});

