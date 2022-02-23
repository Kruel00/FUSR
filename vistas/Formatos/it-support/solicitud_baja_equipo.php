<html>
<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];
?>


<div class="container">
<h4>Baja de inventario activo de sistemas</h4>
    <form action="">
        <div class="row">
            <div class="form-group col-4">
                <label for="">Solicitante</label>
                <input type="text" class="form-control" name="nombre" disabled value="<?php echo $nombre;?>">
                <input type="hidden" name="solicitante" value="<?php echo $usuario;?>">
            </div>
            <div class="form-group col-4">
                <label for="">Tipo de dispositivo</label>
                <select class="form-control" name="" id="">
                    <option value="" disabled>-- Seleccione una opcion --</option>
                    <option value="1">CPU</option>
                    <option value="2">Monitor</option>
                    <option value="3">Impresora</option>
                    <option value="4">Switch</option>
                </select>
            </div>
            <div class="form-group col-4">
                <label for="">Cantidad:</label>
                <input class="form-control" type="number">
            </div>
        </div>
        <div class="row">
            <div class="form-group col">
                <label for="">Pais de origen</label>
                <select class="form-control" name="" id="">
                    <option disable value="">-- Seleccione una opcion --</option>
                    <option value="1">USA</option>
                    <option value="2">Mexico</option>
                </select>
            </div>
            <div class="form-group col">
                <label for="">Asset</label>
                <input name="asset" class="form-control" type="number">
            </div>
            <div class="form-group col">
                <label for="">Numero de serie</label>
                <input class="form-control" type="text">
            </div>
        </div>

        <div class="row">
            <div class="form-group col">
                <label for="">Marca</label>
                <input class="form-control" type="text">
            </div>
            <div class="form-group col">
                <label for="">Modelo</label>
                <input class="form-control" type="text">
            </div>
            <div class="form-group col">
                <label for="">Ubicacion</label>
                <input class="form-control" type="text">
            </div>
        </div>
        <div class="form-group">
            <label for="">Razon de la baja</label>
            <input class="form-control" type="text">
        </div>
    <br>
    <input type="submit" class="btn btn-primary" value="Enviar solicitud">
    </form>
</div>

</html>