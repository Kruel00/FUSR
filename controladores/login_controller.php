<?php
if (isset($_POST['login'])) {
    $usuario = $_POST['username'];
    $userpass = $_POST['passwd'];
    $database = "pt1";
    $username = "webuser";
    $pass = "a7um0WDTTl";
    $servername = "DESKTOP-VB9MFBR";
    $conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass);
    $con = sqlsrv_connect($servername, $conectionInfo);
    $consult = "SELECT userpassword FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);

    if($userpass==$row['userpassword']){
        ECHO "SI ES IGUANAS";
    } 
    else{
        header("location: login.php?errorpass=false");
    }


} else {
    header("location: login.php");
}
