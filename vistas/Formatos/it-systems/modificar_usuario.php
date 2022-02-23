<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];
$database = "pt1";
$username = "webuser";
$pass = "a7um0WDTTl";
$servername = "localhost";
$conectionInfo = array("Database" => $database, "UID" => $username, "PWD" => $pass);
$con = sqlsrv_connect($servername, $conectionInfo);
$consulta_departamentos = "select NombreDepartamento from Departamento";
$resultado_departamentos = sqlsrv_query($con, $consulta_departamentos);
?>

<html>

<h4>Solicitud de modificacion de usuarios</h4>
<div class="container">
    <form action="../../../controladores/format_controller.php" method="POST">
        <div class="row">
            <div class="form-group col">
                <label for="">Usuario:</label>
                <input class="form-control" type="text" >
            </div>
            <div class="form-group col">
                <label for="">Numero de empleado:</label>
                <input class="form-control" type="text" >
            </div>
        </div>
        <div class="row">
            <div class="form-group col">
                <label for="">Nombre:</label>
                <input class="form-control" type="text" >
            </div>
            <div class="form-group col">
                <label for="">Apellido:</label>
                <input class="form-control" type="text" >
            </div>
        </div>
        <div class="form-group">
            <label for="">Email:</label>
            <input class="form-control" type="text" >
        </div>
        <div class="row">
            <div class="form-group col">
                <label for="">Departamento:</label>
                <input class="form-control" type="text" >
            </div>
            <div class="form-group col ">
                <label for="">Puesto:</label>
                <input class="form-control" type="text" >
            </div>
            <div class="form-group">
                <label for="">Justificacion</label>
                <input class="form-control" type="text">
            </div>
            <div class="form-group">
                <!-- <center> -->
                <br>
                <input type="hidden" name="tipo_formato" value="1">
                <input type="submit" name="enviar" value="Enviar Solicitud" class="btn btn-primary">
                <!--  </center> -->

            </div>
        </div>
    </form>
</div>
<div class="row">

</div>

</html>