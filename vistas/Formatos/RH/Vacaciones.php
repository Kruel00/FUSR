<html>

<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];
?>


<div class="controles-departamentos">
    <h2>Formato de vacaciones</h2>
    <div class="container">
        <form action="" method="POST">

            <div class="row">
                <div class="form-group col">
                    <label for="">Folio: </label>
                    <input class="form-control" type="text" value="A12456">
                </div>

                <div class="form-group col">
                    <label for="">Compañia:</label>
                    <select class="form-control" name="" id="">
                    <option selected disabled >-- Seleccione una opcion --</option>
                        <option value="1">Reconext</option>
                        <option value="2">Teleplan</option>
                        <option value="2">TSSI</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="form-group col">
                    <label for="">Nombre: </label>
                    <input class="form-control" type="text" name="" id="" value="<?php echo $nombre; ?>">
                </div>
                <div class="form-group col">
                    <label for="">Numero de empleado: </label>
                    <input class="form-control" type="text" value="60663">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-4">
                    <label for="">Periodo:</label>
                    <select class="form-control" name="" id="">
                        <option selected disabled value="">-- Seleccione una opción --</option>
                        <option value="1">2018</option>
                        <option value="2">2019</option>
                        <option value="3">2020</option>
                        <option value="4">2021</option>
                        <option value="5">2022</option>
                    </select>
                </div>

                <div class="form-group col-4">
                    <label for="">Fecha de inicio</label>
                    <input class="form-control" type="date">
                </div>

                <div class="form-group col-4">
                    <label for="">Fecha retorno</label>
                    <input class="form-control" type="date">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-4">
                    <label for="">Semana de pago:</label>
                    <input class="form-control" type="text" value="50">
                </div>
                <div class="form-group col-8">
                    <label for="">Observaciones:</label>
                    <input class="form-control" type="text" name="" id=""></textarea>
                </div>
            </div>

            <br>
            <div class="form-group">
                <input class="btn btn-primary" type="submit">
            </div>

    </div>
    </form>
</div>

</div>

</html>