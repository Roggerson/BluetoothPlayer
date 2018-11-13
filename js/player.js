var state = 'pause';

function buttonBackPress() {
    console.log("button back invoked.");
}

function buttonForwardPress() {
    console.log("button forward invoked.");
}

function buttonRewindPress() {
    console.log("button rewind invoked.");
}

function buttonFastforwardPress() {
    console.log("button fast forward invoked.");
}

function buttonPlayPress() {
     if(state=='play'){
      state = 'pause';
      $('#button_play i').removeClass("btglyphicon glyphicon-pause").addClass("glyphicon glyphicon-play");
    }
    else if(state=='pause'){
      state = 'play';
      $('#button_play i').removeClass("glyphicon glyphicon-play").addClass("glyphicon glyphicon-pause");
    }

}

//Progress bar player


$(document).ready(function() {
    $(".rippler").rippler({
      effectClass      :  'rippler-effect'
      ,effectSize      :  2      // Default size (width & height)
      ,addElement      :  'div'   // e.g. 'svg'(feature)
      ,duration        :  300
    });
  });