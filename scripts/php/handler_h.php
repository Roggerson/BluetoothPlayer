<?php
class handler
{

    static $m_navigation =  [
        "connect",
        "disconnect",
        "play",
        "pause",
        "next",
        "prev",
        "volume"
    ];

    function validateData($data)
    {
        $navi = FALSE;
        $vol = FALSE;
        $mac = FALSE;

        foreach (self::$m_navigation as $nav)                                   // check if the to performing action is one of the above
            if ($data->navigation == $nav)
                $navi = TRUE;

        if ($data->volume >= 0 || $data->volume <= 100)                         // voluime in % can only be 0 ... 100
            $vol = TRUE;


        if (preg_match("/^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$/", $data->mac))    // regex for MAC addresss
            $mac = TRUE;

        return ($navi && $vol && $mac);                                         // if anyone is false... error
    }


    function processData($data)
    {
        switch ($data->navigation) {

            case 'connect':
                # code...
                break;

            case 'disconnect':
                # code...
                break;

            case 'play':
            case 'pause':
            case 'next':
            case 'prev':
                $response= "PRESS BUTTON BIG";
            break;

            case 'volume':
                # code...
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

            case 'volume':
                # code...
                break;

            case 'volume':
                # code...
                break;

            default:
                $response= "Invalid Action:" + $data->navigation;
                break;
        }

        echo $response;
        $response = "";
    }
}
