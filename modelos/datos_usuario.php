<?php
### Conexion a la base de datos.
$servername = "b1rhtools";
$database = "FUS";
$username = "webuser";
$pass = "Mxli6r0up!!";
$conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass, 'CharacterSet' => 'UTF-8');
$con = sqlsrv_connect($servername, $conectionInfo);
session_start();

$datosUsuario = $_SESSION['credencial'];
$usuario = $datosUsuario['username'];


getUaserData($usuario, $con);
echo var_dump(getUaserData($usuario, $con));
header("Location: ../vistas/usuario.php");


function getUaserData($usuario, $con)
{
    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);


    if($row){
        $datosDelUsuario = [
            "numempleado" => $row['numempleado'],
            "nombre" => $row['nombre'],
            "apellido" => $row['apellido'],
            "usuariodominio" => $row['username'],
            "passwdOK" => $row['password'],
            "departamento" => $row['departamento'],
            "puesto" => $row['puesto'],
            "mail" => $row['mail']
        ];
    }
    
    echo var_dump($datosDelUsuario);
    $_SESSION['datosDelUsuario'] = $datosDelUsuario;

}

?>