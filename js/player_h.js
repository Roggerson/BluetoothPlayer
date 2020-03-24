function tplayerControl(naviagtion, state, volume, mac, pass) {
    this.naviagtion = naviagtion;
    this.state = state;
    this.volume = volume;
    this.mac = mac;
    this.pass = pass;
}

const naviagtion = {
    connect: "connect",
    disconnect: "disconnect",
    play: "play",
    pause: "pause",
    next: "next",
    prev: "prev",
    volume: "volume"
};
Object.freeze(naviagtion);

const handler = "./scripts/php/handler.php";
const defaultDevice = "00-00-00-00-00-00";

const darkGrey  = "rgb(140, 140, 140)";
const lightGrey = "rgb(240, 240, 240)";
