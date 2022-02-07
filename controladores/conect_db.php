<?php
    /* capcha correcto */
    $database = "pt1";
    $username = "webuser";
    $pass = "a7um0WDTTl";
    $servername = "localhost";
    $conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass);
    $con = sqlsrv_connect($servername, $conectionInfo);
