<?php
session_start();
include 'conect_db.php';
$usuario = $_SESSION['userdata']['UserName'];
$consult = "SELECT * FROM users WHERE username = '$usuario'";
$result = sqlsrv_query($con, $consult);
$row = sqlsrv_fetch_array($result);


$numero_departamento = $row['Departamento'];
### Almacenar los datos del usuario en la session "userdata".
$consulta_departament = "SELECT NombreDepartamento FROM Departamento WHERE DepartamentoId = '$numero_departamento'";
$resultado_departamento = sqlsrv_query($con, $consulta_departament);
$departamento = sqlsrv_fetch_array($resultado_departamento);

    /* consultar nombre del puesto */
    $numero_puesto = $row['Puesto'];
    $consulta_puesto = "SELECT descripcion FROM Puesto WHERE PuestoID = '$numero_puesto'";
    $resultado_puesto = sqlsrv_query($con, $consulta_puesto);
    $puesto = sqlsrv_fetch_array($resultado_puesto);

    var_dump($puesto);