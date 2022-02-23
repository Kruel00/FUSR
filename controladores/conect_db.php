<?php
function prepare_conn(){
    $database = "pt1";
    $username = "webuser";
    $pass = "a7um0WDTTl";
    $servername = "localhost";
    $conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass);
    $con = sqlsrv_connect($servername, $conectionInfo);
    return $con;
    
}

function exec_query($con, $query_strng)
{
    $consulta = sqlsrv_query($con, $query_strng);
    $respuest = sqlsrv_fetch_array($consulta);
    
    return $respuest;
}
