function tplayerControl(navigation, state, volume, mac, pass,errMsg) {
    this.navigation = navigation;
    this.state = state;
    this.volume = volume;
    this.mac = mac;
    this.pass = pass;
    this.errMsg = errMsg;
}

const navigation = {
    connect: "connect",
    disconnect: "disconnect",
    scan: "scan",
    play: "play",
    pause: "pause",
    next: "next",
    prev: "prev",
    volume: "volume"
};
Object.freeze(navigation);

const handler = "./scripts/php/handler.php";
const defaultDevice = "";

const darkGrey  = "rgb(140, 140, 140)";
const lightGrey = "rgb(240, 240, 240)";


function handleErrors(errMsg){
     if (errMsg != "" ) 
       alert(errMsg) ;
     
}
