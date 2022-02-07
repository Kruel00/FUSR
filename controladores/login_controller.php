<?php
if (isset($_POST['login'])) {
    /* Verificacion del captcha */
    $secretKey = "6LfFjGAeAAAAAG7ETE2-FjNc4bLbOAD1fqwx_42e";
    $responseKey = $_POST['g-recaptcha-response'];
    $userIP = $_SERVER['REMOTE_ADDR'];
    $verifcador = "https://www.google.com/recaptcha/api/siteverify?secret=";
    $url = "$verifcador$secretKey&response=$responseKey&remoteip=$userIP";
    $response = file_get_contents($url);
    $response = json_decode($response);


    if($response->success){
        $usuario = $_POST['username'];
        $userpass = $_POST['passwd'];
        include 'conect_db.php';
        $consult = "SELECT * FROM users WHERE username = '$usuario'";
        $result = sqlsrv_query($con, $consult);
        $row = sqlsrv_fetch_array($result);
        
            /* si el password recivido es igual al de la base de datos */
        if ($userpass == $row['UserPassword']) {
            /* llamamos a la funcion para crear la sesion de usuario */
            create_session($row);
        } else {
            /* si no es igual regresamos a la pagina de login con el codigo de error 1 */
            header("location: login.php?errorcode=1");
        }
    }
    else{
        /* Captcha incorrecto */
        header("location: login.php?errorcode=4");
    }

}

/* Funcion crear sesion de usuario */
function create_session($row)
{
    session_start();
    ### Almacenar los datos del usuario en la session "userdata".

    $datosUsuario = [
        "UserName" => $row['UserName'],
        "UserPassword" => $row['UserPassword'],
        "NumEmpleado" => $row['NumEmpleado'],
        "nombre" => $row['nombre'],
        "apellido" => $row['apellido'],
        "Email" => $row['Email'],
        "Company" => $row['Company'],
        "Departamento" => $row['Departamento'],
        "Puesto" => $row['Puesto'],
        "UserRole" => $row['UserRole']
    ];

    $_SESSION["userdata"] = $datosUsuario;

     switch ($_SESSION['userdata']['UserRole']){
        case 1 : 
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