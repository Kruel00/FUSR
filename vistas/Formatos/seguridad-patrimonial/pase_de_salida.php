<html>

<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];

/* consultar departamentos */
include "/xampp/htdocs/controladores/conect_db.php";
$consulta_departamentos = "select NombreDepartamento from Departamento";
$resultado_departamentos = sqlsrv_query($con, $consulta_departamentos);
/* $departamentos = array();

while ($row_departamento = sqlsrv_fetch_array($resultado_departamentos, SQLSRV_FETCH_ASSOC)) {
        array_push($departamentos, $row_departamento['NombreDepartamento']);
}

print_r($departamentos); */


?>

<div class="container">
    <h2>Salida de material</h2>
    <form method="POST" action="">

        <div class="form-group">
            <label for="txt_ID">Tipo de salida:</label>
            <select class="form-control" name="" id="">
                <option selected disabled value="">-- Seleccione una opcion --</option>
                <option value="1">Salida</option>
                <option value="2">Entrada</option>
            </select>
        </div>

        <div class="form-group">
            <label for="txt_solicitante">Solicitante:</label>
            <input class="form-control" value="<?php echo $nombre; ?>" type="text" disabled name="" id="">
        </div>
        <div class="form-group">
            <label for="txt_descripcion">Descripcion:</label>
            <input class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="Evidencia">Evidencia:</label>
            <input class="form-control" type="file" name="Evidencia" id="">
        </div>

        <div class="row">
            <div class="form-group col">
                <label for="">Fecha:</label>
                <input type="date" class="form-control" name="" id="">
            </div>
            <div class="form-group col">
                <label for="">Hora de salida:</label>
                <input type="text" class="form-control" name="" id="">
            </div>

        </div>


        <div class="row">
            <div class="form-group col">
                <label for="">Planta:</label>
                <select class="form-control" name="" id="">
                    <option value="">-- Seleccione una opcion --</option>
                    <option value="1">Reconext 1</option>
                    <option value="1">Reconext 2</option>
                    <option value="1">Reconext 3</option>
                    <option value="1">Reconext Calexico</option>
                </select>
            </div>


            <div class="form-group col">
                <label>Departamento:</label>
                <select class="form-control" name="" id="">
                    <option value=""> -- Seleccione una opcion -- </option>
                    <?php
                    while ($row_departamento = sqlsrv_fetch_array($resultado_departamentos, SQLSRV_FETCH_ASSOC)) {
                        echo "<option value=''>" . $row_departamento['NombreDepartamento'] .  "</option>";
                    }
                    ?>
                </select>
            </div>
        </div>

        <hr>
        <center>
            <h4>Agregar articulos</h4>
        </center>

        <div class="row">
            <div class="form-group col-6">
                <label for="">Descripcion:</label>
                <input type="text" class="form-control" name="" id="">
            </div>

            <div class="form-group col-5">
                <label for="">Cantidad:</label>
                <input type="number" class="form-control" name="" id="">
            </div>

            <div class="form-group col-1">
                <br>
                <button class="btn btn-primary"> Agregar</button>
            </div>
        </div>

        <br>
        <table class="table">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Mesa</th>
                    <th>1</th>
                </tr>
                <tr>
                    <th>Mesa</th>
                    <th>5</th>
                </tr>
            </tbody>
        </table>

</div>
<br>
<input class="btn btn-primary" type="submit">
</form>
</div>

</html>