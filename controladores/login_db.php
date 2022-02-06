<?php
### Conexion a la base de datos.
$servername = "localost";
$database = "pt1";
$username = "webuser";
$pass = "a7um0WDTTl";
$conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass, 'CharacterSet' => 'UTF-8');
$con = sqlsrv_connect($servername, $conectionInfo);


session_start();
$credenciales = $_SESSION['credencial'];
$consultUser = $credenciales['username'];


if ($_SESSION['loginsusses']) {
    ### si se autentifico correctamente en el dominio.
    echo " -- Se autentifico el usuario <b>" . $credenciales['username'] . "</b> en el dominio<br> 
           -- Buscando usuario en la base de datos...";

    if (usuarioExiste($credenciales['username'], $con)) {
        echo "<br>-- El usuario<b> " . $credenciales['username'] . "</b> si existe en la base de datos";
        $passDB = getUaserPassDB($credenciales['username'], $con);
        echo "<br>-- La contraseña en la base de datos es: "  . $passDB;
        echo "<br>-- La contraseña introducida en el login es: "  . $credenciales['passwd'];
        if (!strcmp($passDB, $credenciales['passwd'])) {
            echo "<br>-- Las credenciales introducidas son iguales.";
            echo "<br>-- Redireccionando a la pagina de usuario.";
            header("Location: ../modelos/datos_usuario.php");
        } else {
            echo "<br>-- Las credenciales introducidas no son iaguales.";
            echo "<br>-- Actualizando la contraseña de la base de datos...";
            actualizarPassDB($passDB, $con);
        }
    } else {
        echo "<br>-- El usuario <b> " . $credenciales['username'] . "no existe en la base de datos.";
        echo "<br>-- Registrando usuario en la base de datos...";
        registrarUsuario($con);
        header("Location: ../modelos/datos_usuario.php");
    }
    
} else
### si no se logro autentificar en el dominio
{
    echo "-- No se autentifico el usuario en el dominio <br> 
          -- Buscando usuario en la base de datos... ";
    if (usuarioExiste($credenciales['username'], $con)) {
        echo "<br>-- El usuario:<b> " . $credenciales['username'] . "</b> si existe en la base de datos";
    }

    echo "<br>-- Validando contraseña de la base de datos...";
    $passDB = getUaserPassDB($credenciales['username'], $con);
    echo "<br>-- La contraseña en la base de datos es: "  . $passDB;
    echo "<br>-- La contraseña introducida en el login es: "  . $credenciales['passwd'];

    if (!strcmp($passDB, $credenciales['passwd'])) {
        echo "<br>-- Las credenciales introducidas son correctas.";
        echo "<br>-- Redireccionando a la pagina de usuario.";
        header("Location: ../modelos/datos_usuario.php");
    } else {
        echo "<br>-- Las credenciales introducidas no son correctas.";
        echo "<br>-- Redireccionando a pagina de login.";
        header("Location: ../index.php?conexionerror=true");
    }
}

function obtenerDatos($usuario, $con)
{
    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);

    if ($row) {

        var_dump($row);
        $userdata = [
            "usuariodominio" => $row['username'],
            "nombre" => $row['nombre'],
            "apellido" => $row['apellido'],
            "puesto" => $row['puesto']
        ];

        $_SESSION['datosDelUsuario'] = $userdata;
        var_dump($_SESSION['datosDelUsuario']);

    }
}

function usuarioExiste($usuario, $con)
{
    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);

    if ($row) {
        return TRUE;
    }
}

function getUaserPassDB($usuario, $con)
{
    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);

    if ($row) {
        return $row[2];
    }
}


function registrarUsuario($con)
{
    $datosuser = $_SESSION['userdata'];
    ### Registrar usuario en la base de datos
    $usuariodn = $datosuser['usuariodominio'];
    $passOk = $datosuser['passwdOK'];
    $numeroEmpleado = $datosuser['numempleado'];
    $nombre = $datosuser['nombre'];
    $apellido = $datosuser['apellido'];
    $departamento = $datosuser['departamento'];
    $puesto = $datosuser['puesto'];
    $mail = $datosuser['mail'];

    $registrarusuario = "INSERT INTO Users VALUES (
                    '$usuariodn',
                    '$passOk',
                    '$numeroEmpleado',
                    '$nombre',
                    '$apellido',
                    '$departamento',
                    '$puesto',
                    '$mail')";

    sqlsrv_query($con, $registrarusuario);

    echo "<br> -- Usuario registrado con exito...";
    echo "<br> -- Accediendo a la pagina de usuario..";
}


function actualizarPassDB($passDB, $con)
{
    $credenciales = $_SESSION['credencial'];
    echo "<br>-- Se actualizara la contraseña <b>"  . $passDB . "</b> por <b> " . $credenciales['passwd'];
    $newpass =  $credenciales['passwd'];
    $userToUpdate = $credenciales['username'];
    $registrarusuario = "update users set password='$newpass' where username='$userToUpdate'; ";
    sqlsrv_query($con, $registrarusuario);
    echo "<br> -- Password de la base de datos actualizada con exito.";
    echo "<br> -- Accediendo a la pagina de usuario..";
}

?>
