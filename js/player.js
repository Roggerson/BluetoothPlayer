$(document).ready(function () {
    //on first page load, get mac, doesnt matter if there is already one or if it is invalid
    var cnt = 0;
    var playerControl = new tplayerControl("", "", 0, "", "" ,"");     // init Control object

    console.log(playerControl);

    $('.popr').popr();
    $.post("/scripts/php/handler.php", function (response) {
        // playerControl.mac = response;
    });

    $(document).on('mousedown', ".progress-circle-back, .btn_play, .trackInfo ", function () {
        $(".btn_play").css('color', darkGrey); //make button darker
    });

    // pause play button handling
    $(document).on('mouseup', ".progress-circle-back, .btn_play, .trackInfo ", function () {
        $(".btn_play").css('color', lightGrey); //make button brighter
        if ( playerControl.state == navigation.play) {
            $('.btn_play i').removeClass("btglyphicon glyphicon-pause").addClass("glyphicon glyphicon-play");
            playerControl.state = navigation.pause;

        } else if (playerControl.state == navigation.pause) {
            $('.btn_play i').removeClass("glyphicon glyphicon-play").addClass("glyphicon glyphicon-pause");
            playerControl.state = navigation.play;
        }

        console.group("request: ");
        console.log(JSON.stringify(playerControl));
        console.groupEnd("response: ");

        $.post( handler , {'playerControl': JSON.stringify(playerControl)} , function (response){
            playerControl=JSON.parse(response);
            handleErrors(playerControl.errMsg);
          
          console.group("response: ");
          console.log(playerControl);
          console.groupEnd("response: ");
        })
        
        //Volume bar event
        $(document).on('click', ".slyder", function () {
            playerControl.navigation=navigation.volume;
            playerControl.volume = $(this).val();

            $.post( handler , {'playerControl': JSON.stringify(playerControl)} , function (response){
                handleErrors(playerControl.errMsg)
                playerControl=JSON.parse(response);
                console.log("Setting volume to: " + playerControl.volume + " for device: " + playerControl.mac);

            });
         });
    });
    
    //scan
    $(document).on('click', "#scan", function () {
        playerControl.navigation=navigation.scan;
        $.post("/scripts/php/handler.php", function (response) {
            $("#scannedDevices").load(handler);
              console.log(JSON.parse(response));
        });
    });

    //On click of popr item, pair to device
    $(document).on('click', ".popr-item", function () {
        var macToPair = $(this).attr("value");
        $.post(handler, {
            'mac': macToPair
        });
        console.log(macToPair);
        $.post(handler, {
            'mac': macToPair
        }); //connect to new device
        $('#numPad').css('display', 'block');
    });

    //btn_next - skip song 
    $(document).on('mousedown', ".btn_next", function () {
        $(this).css('color', darkGrey); //make button darker
        console.log(navigation.next);
    });
    //optic feedback for pressing the button
    $(document).on('mouseup', ".btn_next", function () {
        $.get(handler, {
            'mac': playerControl.mac,
            'control': navigation.next
        });
        $(this).css('color', lightGrey);
    });

    //btn_previous - previous song 
    $(document).on('mousedown', ".btn_previous", function () {
        console.log("prev down");
        $(this).css('color', lightGrey); //make button darker
    });
    //optic feedback for pressing the button
    $(document).on('mouseup', ".btn_previous", function () {
        $.get(handler, {
            'mac': playerControl.mac,
            'control': navigation.prev
        });
        $(this).css('color', lightGrey);
    });

    


    //RADIAL
    //Progress bar player
    var prog = 0;
    setInterval(function () { //Draw bar once every second
        var durSec = $('#hiddenDuration').html();
        var nowSec = $('#hiddenPosition').html();

        prog = 203 / durSec * nowSec;

        if (prog > 203) {
            nowSec = 0;
        }
        progressBar(); //maxValue is 203 ... Me no know why do, me not do progress bar, only adapt
    }, 1000);

    function progressBar() {
        //draw
        var x = document.querySelector('.progress-circle-prog');
        x.style.strokeDasharray = (prog * 4.65) + ' 999';
        //text
        var el = document.querySelector('.progress-text');
        var from = $('.progress-text').data('progress');
        $('.progress-text').data('progress', prog);
    }
    var pin = "";
    //numPad
    $(document).on('click', "ul#keyboard li", function () {
        if (isNaN(this.innerHTML)) {} else {
            pin = $('.numPadBox').val();
            pin = pin + this.innerHTML;
            console.log(pin);
            $('.numPadBox').val(pin);
            if (pin.length == 6) {
                console.log("sending pin: |" + pin + "|");
                $.post(handler, {
                    'passKey': pin
                }); //store pin in file on server

                //$(".safdat").load(handler, {'passKey': pin});
                //$.get(handler, {'passKey': pin});

                $('.numPadBox').val(""); //Reset numpad value
                $('#numPad').css('display', 'none'); //hide numpad
            }
        }
    });
    /*
    setInterval(function () {
        if (playerControl.mac == ""){
            $.post("/scripts/php/handler.php", function (response) {
                // console.log("Bluetoothctl Mac: "+response);
                if (playerControl.mac != response && response.length == 18) {
                    //console.log("Connecting to new Device: "+response);
                    playerControl.mac = response;
                    $.get(handler); //disconnect from old device
                    $.post(handler, {
                        'mac': playerControl.mac
                    }); //connect to new device
                    //$.get(handler,{'mac': mac});    
                } else {
                    //console.log("Current device: "+mac);
                    if (response.length < 18 && playerControl.mac.length != 1) {
                        cnt++;
                        if (cnt > 5) {
                            //$.post(handler,{'mac':mac});
                            cnt = 0;
                            console.log("Trying to connect to last device: " + playerControl.mac);
                        }
                    }
                }
            });
        }
        $("#Track").load("/scripts/php/handler.php", {
            'mac': playerControl.mac
        });
    }, 1000); */
});
