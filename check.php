<?php
$token=$_SERVER['TOKEN'];
$url="http://127.0.0.1:5700/get_status?access_token=".$token;
$rsp=file_get_contents($url);
$arr=json_decode($rsp,true);
$boolJson = (json_last_error() == JSON_ERROR_NONE);
if(!$boolJson)
{
    //fata err
    exit(1);
}
if($arr['status']!=='ok')
{
    exit(1);
}
if($arr['data']['online']!==true && $arr['data']['good']!==true)
{
    exit(1);
}
exit(0);

