<?php
class handler
{
    public $navigation;
    public $state;
    public $volume;
    public $mac;
    public $pass;
    public $errMsg;

    public function __construct($navigation, $state, $volume, $mac, $pass,  $errMsg) {
        $this->navigation = $navigation;
        $this->state = $state;
        $this->volume = $volume;
        $this->mac = $mac;
        $this->pass = $pass;
        $this->errMsg = $errMsg;
    }

    public function validateJSON($jsonRaw){

        $json=json_decode($jsonRaw);
        $errMsg="";

        switch(json_last_error()) {
           case JSON_ERROR_NONE:
                $errMsg="";
            break;
            case JSON_ERROR_DEPTH:
                $errMsg= '- Maximale Stacktiefe überschritten';
            break;
            case JSON_ERROR_STATE_MISMATCH:
                $errMsg= '- Unterlauf oder Nichtübereinstimmung der Modi';
            break;
            case JSON_ERROR_CTRL_CHAR:
                $errMsg= '- Unerwartetes Steuerzeichen gefunden';
            break;
            case JSON_ERROR_SYNTAX:
                $errMsg= '- Syntaxfehler, ungültiges JSON';
            break;
            case JSON_ERROR_UTF8:
                $errMsg= '- Missgestaltete UTF-8 Zeichen, möglicherweise fehlerhaft kodiert';
            break;
            default:
                $errMsg= '- Unbekannter Fehler';
            break;
        }

        $this->navigation = $json->navigation ;
        $this->state = $json->state;
        $this->volume = $json->volume;
        $this->mac = $json->mac;
        $this->pass = $json->pass;
        $this->errMsg = $errMsg;
    }

    public function validateData()
    {
        $navi   = FALSE;
        $vol    = FALSE;
        $mac    = FALSE;
        $errMsg = "";

        static $m_navigation =  [
            "connect",
            "disconnect",
            "play",
            "pause",
            "next",
            "prev",
            "volume"
        ];
        
       foreach ($m_navigation as $nav)                                   // check if the to performing action is one of the above
          if ($this->navigation == $nav)
            $navi = TRUE;                

        if ($this->volume >= 0 && $this->volume <= 100)                         // voluime in % can only be 0 ... 100
            $vol = TRUE;

        if (preg_match("/^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$/", $this->mac) || $this->mac == "")    // regex for MAC addresss
            $mac = TRUE;
         
        $navi ? $navi=TRUE :  $errMsg .= "Invalid action: $this->navigation ;";
        $vol  ? $vol =TRUE :  $errMsg .= "Invalid volume: $this->volume ;";
        $mac  ? $mac =TRUE :  $errMsg .= "Invalid mac: $this->mac ;";

        $this->errMsg=$errMsg;
    }


    public function processData()
    {
        switch ($this->navigation) {

            case 'connect':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'disconnect':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'play':
            case 'pause':
            case 'next':
            case 'prev':
                shell_exec("../dummy/dummy.sh 0");
            break;

            case 'volume':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'pair':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'pairTrust':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'scan':
                shell_exec("../dummy/dummy.sh 0");
                break;

            case 'readScanned':
               /* $f = fopen("../bash/scannedDevices.txt", "r") or die("Unable to open file!");
                while(!feof($f)){
                    $macNname = trim(fgets($f));
                    if($macNname != ""){
                        $ary=explode(";",$macNname);

                        //echo "<a><div class='popr-item' value='".$ary[0]."'>".rtrim($ary[1],"#")."</div></a>";
                        //echo "<td><input type='submit' name='mac' value='".$ary[0]."'></input></td>"."<td><input type='button' name='mac' value='".rtrim($ary[1],"#")."'></input></td>";
                    }
                }
                fclose($f);*/
                break;

            case 'passKey':
                shell_exec("../dummy/dummy.sh 0");
                break;

            default:
                shell_exec("../dummy/dummy.sh 0");
                break;
        }
    }

}
