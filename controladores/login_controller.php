<?php
if(isset($_SESSION)){session_destroy();}
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
    include 'conect_db.php';
    ### Almacenar los datos del usuario en la session "userdata".
    session_start();
    
    /* consultar nombre del departamento */
    $numero_departamento = $row['Departamento'];
    $consulta_departament = "SELECT NombreDepartamento FROM Departamento WHERE DepartamentoId = '$numero_departamento'";
    $resultado_departamento = sqlsrv_query($con, $consulta_departament);
    $departamento = sqlsrv_fetch_array($resultado_departamento);

    /* consultar nombre del puesto */
    $numero_puesto = $row['Puesto'];
    $consulta_puesto = "SELECT descripcion FROM Puesto WHERE PuestoID = '$numero_puesto'";
    $resultado_puesto = sqlsrv_query($con, $consulta_puesto);
    $puesto = sqlsrv_fetch_array($resultado_puesto);

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