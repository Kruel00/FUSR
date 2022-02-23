<?php
session_start();
$campos = array();
foreach ($_POST as $campo) {
    array_push($campos, $campo);
}

if (isset($_POST['enviar'])) {
    identificar_formato($campos);
} else {
    echo 'Error origen desconocido!!!';
}
/* var_dump($campos);  */

function identificar_formato($campos)
{
    include_once "conect_db.php";
    //layout firmas [supervisor][materales][mantenimiento][finanzas][RH][direccion][seguridad][SEH][ITSupport][IngProcesos][Trafico] 
    switch ($_POST['tipo_formato']) {
        case '1':
            //solicitud de entrada de dispositivos
            $firmas = [0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1];
            $id = preparar_formato($firmas);
            $formato = "insert into solicitud_dispositivo values ($campos[0],$campos[1],'$campos[2]','$campos[3]','$campos[4]','$campos[5]','$campos[6]','$campos[7]','$campos[8]',$campos[9],$campos[10],'$id')"; 
            break;
        case '2':
            //solicitud de vacaciones
            echo "solicitud de vacaciones <br>";
            $firmas = [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1];
            $id = preparar_formato($firmas);
            $formato = "insert into solicitudVacaciones values ($campos[0],'$campos[1]',$campos[2],$campos[3],'$campos[4]',$campos[5],'$campos[6]','$id')"; 
            break;
    }

    if (test_formatid($id)) {
        $conn = prepare_conn();
       exec_query($conn,$formato);
    } else {
        echo "<script> alert('La solicitud no se guardo con exito')</script>";
    } 
}

function guardar_formato($formato){
    $formato =$formato;
    $conn = prepare_conn();
    exec_query($conn,$formato);
}

function preparar_formato($firmas){
    $conn = prepare_conn();
    $consulta_formato = crear_consulta($firmas);
    exec_query($conn, $consulta_formato[0]);
    $id = $consulta_formato[1];
    return $id;
}

function crear_consulta($firmas)
{
    $id = get_formatid();
    $solicitante = $_SESSION['userdata']['UserName'];
    $fecha_creacion =  date("Y-m-d");
    $fecha_cierre = " ";
    $departamento = $_SESSION['userdata']['nombre_departamento'];
    $status_solicitud = 1;
    $firma_supervisor = $firmas[0];
    $firma_materiales = $firmas[1];
    $firma_mantenimiento = $firmas[2];
    $firma_finanzas = $firmas[3];
    $firma_rh = $firmas[4];
    $firma_direccion = $firmas[5];
    $firma_seguridad = $firmas[6];
    $firma_SEH = $firmas[7];
    $firma_itsupport = $firmas[8];
    $firma_ingprocesos = $firmas[9];
    $firma_trafico = $firmas[10];

    $consulta = ["insert into solicitud values(
        '$id',
        '$solicitante',
        '$fecha_creacion',
        '$fecha_cierre',
        '$departamento',
        $status_solicitud,
        $firma_supervisor,
        $firma_materiales,
        $firma_mantenimiento,
        $firma_finanzas,
        $firma_rh,
        $firma_direccion,
        $firma_seguridad,
        $firma_SEH,
        $firma_itsupport,
        $firma_ingprocesos,
        $firma_trafico
    )", $id];

    return $consulta;
}


function get_formatid()
{
    $usernam = $_SESSION['userdata']['UserName'];
    include_once "conect_db.php";
    $conn  = prepare_conn();
    $consultid = "select UserId from users where UserName = '$usernam'";
    $idUser = exec_query($conn, $consultid);
    $fecha = new DateTime();
    $timestamp = $fecha->getTimestamp();
    $userid = intval($timestamp . $idUser[0]);
    return $userid;
}

function test_formatid($id)
{
    include_once "conect_db.php";
    $conn = prepare_conn();
    $consulta_silicitud = "select IdSolicitud from solicitud where IdSolicitud='$id'";
    $exist = exec_query($conn, $consulta_silicitud);

    if ($id == $exist['IdSolicitud']) {
        return true;
    } else {
        return false;
    }
}
