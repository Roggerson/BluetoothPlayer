<?php
class handler
{

    public static $m_navigation =  [
        "connect",
        "disconnect",
        "play",
        "pause",
        "next",
        "prev",
        "volume"
    ];

    public function validateJSON($json){
        $playerControl=json_decode($json);
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
        $playerControl->errMsg=$errMsg;
        return $playerControl;      
    }

    public function validateData($data)
    {
        $navi = FALSE;
        $vol = FALSE;
        $mac = FALSE;
        $errMsg = "";

        foreach (self::$m_navigation as $nav)                                   // check if the to performing action is one of the above
            if ($data->navigation == $nav)
                $navi = TRUE;                

        if ($data->volume >= 0 && $data->volume <= 100)                         // voluime in % can only be 0 ... 100
            $vol = TRUE;


        if (preg_match("/^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$/", $data->mac))    // regex for MAC addresss
            $mac = TRUE;

         
        $navi ? $navi=TRUE :  $errMsg .= "Invalid action: $data->navigation ;";
        $vol  ? $vol =TRUE :  $errMsg .= "Invalid volume: $data->volume ;";
        $mac  ? $mac =TRUE :  $errMsg .= "Invalid mac: $data->mac ;";

        $data->errMsg=$errMsg;
        return $data;
    }


    public function processData($data)
    {
        switch ($data->navigation) {

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
                # code...
                break;

            case 'pairTrust':
                # code...
                break;

            case 'scan':
                # code...
                break;

            case 'readScanned':
                # code...
                break;

            case 'passKey':
                # code...
                break;

            default:
                shell_exec("../dummy/dummy.sh 0");
                break;
        }

        return $data;
    }

}
