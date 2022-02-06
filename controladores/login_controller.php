<?php
/* if(isset($_SESSION)){
    session_destroy();
} */

if (isset($_POST['login'])) {
    $usuario = $_POST['username'];
    $userpass = $_POST['passwd'];
    $database = "pt1";
    $username = "webuser";
    $pass = "a7um0WDTTl";
    $servername = "localhost";
    $conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass);
    $con = sqlsrv_connect($servername, $conectionInfo);
    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);


    if ($userpass == $row['UserPassword']) {
        echo "SI ES IGUANAS<br>";
        create_session($row);
    } else {
        header("location: login.php?errorcode=1");
    }

} else {
    header("location: login.php");
}

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

    /* redireccionar a su pagina */
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
