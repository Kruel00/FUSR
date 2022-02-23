<html>

<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];
?>


<div class="container">
    <form method="POST" action="../../../controladores/format_controller.php">
        <h2>Formato de vacaciones</h2>
        <br>
        <div class="row">
            <div class="form-group col">
                <label for="">Compañia:</label>
                <select class="form-control" name="company" id="">
                    <option selected disabled>-- Seleccione una opcion --</option>
                    <option value="1">Reconext</option>
                    <option value="2">Teleplan</option>
                    <option value="2">TSSI</option>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="form-group col">
                <label for="">Nombre: </label>
                <input disabled class="form-control" type="text" name="nombre" id="" value="<?php echo $nombre; ?>">
                <input type="hidden" name="user" value="<?php echo $usuario; ?>">
            </div>
            <div class="form-group col">
                <label for="">Numero de empleado: </label>
                <input class="form-control" type="text" disabled value="<?php echo $numero_empleado; ?>">
            </div>
        </div>

        <div class="row">

            <div class="form-group col-4">
                <label for="">Dias</label>
                <input name="dias" class="form-control" type="number">
            </div>

            <div class="form-group col-4">
                <label for="">Periodo:</label>
                <select class="form-control" name="periodo" id="">
                    <option selected disabled value="">-- Seleccione una opción --</option>
                    <option value="1">2018</option>
                    <option value="2">2019</option>
                    <option value="3">2020</option>
                    <option value="4">2021</option>
                </select>
            </div>

            <div class="form-group col-4">
                <label for="">Fecha de inicio</label>
                <input name="fecha_inicio" class="form-control" type="date">
            </div>
        </div>

        <div class="row">
            <div class="form-group col-4">
                <label for="">Semana de pago:</label>
                <input class="form-control" name="semana_pago" type="number" max="52">
            </div>

            <div class="form-group col-8">
                <label for="">Observaciones:</label>
                <input class="form-control" type="text" name="observaciones" id=""></textarea>
            </div>
        </div>

        <input type="hidden" name="tipo_formato" value="2">
        <br>
        <input class="btn btn-primary" name="enviar" value="Enviar solicitud" type="submit">
    </form>
</div>

</div>

</html>