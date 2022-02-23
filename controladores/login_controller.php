<?php

if (isset($_POST['login'])) {
    check_exist_session();
    include_once '../controladores/conect_db.php';
    $usuario = $_POST['username'];
    $userpass = $_POST['passwd'];
        /* Verificacion del captcha */
    $responseKey = $_POST['g-recaptcha-response'];
    $userIP = $_SERVER['REMOTE_ADDR'];
    $google_response = capcha_validate($responseKey, $userIP);
    try_to_loguin($google_response, $usuario, $userpass);
} else {
    check_exist_session();
    header("location: login.php");
}

function capcha_validate($key, $user)
{
    $secretKey = "6LfFjGAeAAAAAG7ETE2-FjNc4bLbOAD1fqwx_42e";
    $verifcador = "https://www.google.com/recaptcha/api/siteverify?secret=";
    $url = "$verifcador$secretKey&response=$key&remoteip=$user";
    $response = file_get_contents($url);
    $response = json_decode($response);

    return $response;
}

function try_to_loguin($response, $usuario, $userpass)
{

    if ($response->success) {
        $conn = prepare_conn();
        $consult = "SELECT * FROM users WHERE username = '$usuario'";
        $result = exec_query($conn, $consult);

        if ($userpass == $result['UserPassword']) {
            create_session($result);
        } else {
            /* si no es igual regresamos a la pagina de login con el codigo de error 1 */
            header("location: login.php?errorcode=1");

        }
    } else {
        /* Captcha incorrecto */
        header("location: login.php?errorcode=4");
    }
}

/* Funcion crear sesion de usuario */
function create_session($row)
{
    session_start();
    $conn = prepare_conn();

    /* consultar nombre del departamento */
    $numero_departamento = $row['Departamento'];
    $consulta_departament = "SELECT NombreDepartamento FROM Departamento WHERE DepartamentoId = '$numero_departamento'";
    $departamento = exec_query( $conn, $consulta_departament);

    /* consultar nombre del puesto */
    $numero_puesto = $row['Puesto'];
    $consulta_puesto = "SELECT descripcion FROM Puesto WHERE PuestoID = '$numero_puesto'";
    $puesto =  exec_query( $conn, $consulta_puesto,);

    $datosUsuario = [
        "UserName" => $row['UserName'],
        "UserPassword" => $row['UserPassword'],
        "NumEmpleado" => $row['NumEmpleado'],
        "nombre" => $row['nombre'],
        "apellido" => $row['apellido'],
        "Email" => $row['Email'],
        "Company" => $row['Company'],
        "Departamento" => $row['Departamento'],
        "nombre_departamento" => $departamento['NombreDepartamento'],
        "Puesto" => $row['Puesto'],
        "nombre_puesto" => $puesto['descripcion'],
        "UserRole" => $row['UserRole']
    ];

    $_SESSION["userdata"] = $datosUsuario;

    switch ($_SESSION['userdata']['UserRole']) {
        case 1:
            header("location: ../vistas/usuario.php"); 
            break;
        case 2:
            header("location: ../vistas/directivo.php");
            break;
        case 3:
            header("location: ../vistas/admin.php");
            break;
    }
}

function check_exist_session()
{
    if (isset($_SESSION)) {
        session_destroy();
    }
}
