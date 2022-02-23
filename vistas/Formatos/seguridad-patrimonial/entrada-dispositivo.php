
<?php
$numero_empleado =  $_SESSION['userdata']['NumEmpleado'];
$usuario = $_SESSION['userdata']['UserName'];
$nombre = trim($_SESSION['userdata']['nombre']) . " " . $_SESSION['userdata']['apellido'];
$departamento =  $_SESSION['userdata']['nombre_departamento'];
?>


<div class="container">
    <form id="formulario" name="formulario" method="POST" action="../../../controladores/format_controller.php">
        <h2>Acceso a dispositivos</h2>
        <br>

        <div class="row tipos">
            <div class="form-group col">
                <label class="requiried" for="slt_tipo_solicitud">* Tipo de solicitud</label>
                <select name="slt_tipo_solicitud" class="form-select" id="">
                    <option value="0" selected >--Seleccione una opcion--</option>
                    <option value="1">Primera vez</option>
                    <option value="2">Renovacion</option>
                    <option value="3">Cambio de equipo</option>
                </select>
            </div>

            <div class="form-group col">
                <label class="requiried" for="slt_tipo_dispositivo">* Tipo de dispositivo</label>
                <select name="slt_tipo_dispositivo" class="form-select" id="">
                    <option value="0" selected >--Seleccione una opcion--</option>
                    <option value="1">Telefono</option>
                    <option value="2">Laptop</option>
                    <option value="3">Disco Duro o USB</option>
                    <option value="4">Relog</option>
                    <option value="2">Tablet</option>
                    <option value="3">Otro</option>
                </select>
            </div>

        </div>
        <div class="row datos1">
            <div class="form-group col-4">
                <label for="txt_num_empleado">Numero de empleado</label>
                <input disabled class="form-control" disabled name="txt_num_empleado" value="<?php echo $numero_empleado; ?>" type="text">
            </div>
            <div class="form-group col-4">
                <label for="txt_usuario">Usuario</label>
                <input class="form-control" name="txt_usuario" readonly  type="text"  value="<?php echo $usuario; ?>">
            </div>
            <div class="form-group col-4">
                <label for="txt_departamento">Departamento</label>
                <input class="form-control" name="txt_departamento" type="text"  disabled value="<?php echo $departamento; ?>">
            </div>
        </div>

        <div class="form-group col">
            <label for="txt_nombre">Nombre</label>
            <input class="form-control" name="txt_nom_empleado" type="text" disabled  value="<?php echo $nombre; ?>">
        </div>

        <div class="row">
            <div class="form-group col">
                <label class="requiried" for="txt_IMEI">*IMEI</label>
                <input class="form-control" id="txtimei" name="txt_IMEI" type="number" max="15" min="15">
            </div>
            <div class="form-group col">
                <label for="txt_num_serie">Serie del dispositivo</label>
                <input class="form-control" name="txt_num_serie" type="text">
            </div>
        </div>


        <div class="row">
            <div class="form-group col-4">
                <label class="requiried" for="txt_marca">*Marca</label>
                <input class="form-control" name="txt_marca" type="text">
            </div>
            <div class="form-group col-4">
                <label class="requiried" for="txt_modelo">*Modelo</label>
                <input class="form-control" name="txt_modelo" type="text">
            </div>
            <div class="form-group col-4">
                <label class="requiried" for="txt_color">*Color</label>
                <input class="form-control" name="txt_ncolor" type="text">
            </div>
        </div>


        <div class="form-group">
            <label class="requiried" for="txt_num_telefono">*Numero de telefono</label>
            <input class="form-control" name="txt_num_telefono" type="text">
        </div>



        <div class="row">
            <div class="form-group col">
                <label class="requiried" for="slt_planta">*Planta</label>
                <select name="slt_planta" class="form-select" id="">
                    <option selected disabled>--Seleccione una opcion--</option>
                    <option value="1">Reconext 1</option>
                    <option value="2">Reconext 2</option>
                    <option value="3">Reconext 3</option>
                    <option value="4">Reconext Calexico</option>
                </select>
            </div>

            <div class="form-group col">
                <label class="label-successrequiried" for="slt_propiedad">*Propiedad</label>
                <select name="slt_propiedad" class="form-select" id="">
                    <option selected disabled>--Seleccione una opcion--</option>
                    <option value="1">Personal</option>
                    <option value="2">Empresa</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="">Justificacion:</label>
            <input type="text" class="form-control" name="justificacion" id="">
        </div>
        <input type="hidden" name="tipo_formato" value="1">
        <div class="form-group">
            <br>
            <input class="btn btn-primary" name="enviar" value="Enviar solicitud" type="submit">
        </div>
    </form>
</div>