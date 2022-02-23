<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <title>Pagina de usuario</title>
</head>

<body>

    <?php
    session_start();

    if (isset($_SESSION['userdata'])) {
        if ($_SESSION['userdata']['UserRole'] != 1) {
            session_destroy();
            header("location: ../controladores/login.php?errorcode=2");
        }
    } else {
        header("location: ../controladores/login.php?errorcode=2");
    }

    include_once '../controladores/conect_db.php';
    $conn = prepare_conn();
    $consult = "SELECT descripcion FROM tipoSalida";
    $tipo_salida = exec_query($conn, $consult);

    ?>
    <div class="container-fluid">
        <!-- Header -->
        <div class="row">
            <?php include 'header.php'; ?>
        </div>
        <!-- Fin de header -->
        <div class="main row">
            <!-- aside -->

            <div class="aside col-3">
                Solicitudes creadas
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripcion</th>
                            <th>Departamento</th>
                            <th>solicitud</th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="col-1"></div>
            <!-- article -->
            <div class="article col-8">
                <h2>Formatos</h2>
                <div>
                    <div class="navbar navbar-expand-sm bg-light">
                        <div class="dropdown" style="margin:10px;">
                            <button class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                Seguridad e higiene
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="?opt=1">Salida de material</a>
                                <a class="dropdown-item" href="?opt=2">Acceso a dispositivos</a>
                                <a class="dropdown-item" href="?opt=3">Operating System</a>
                                <a class="dropdown-item" href="?opt=4">Computer Networks</a>
                            </div>
                        </div>

                        <div class="dropdown" style="margin:10px;">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                Seguridad patrimonial
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="?opt=5">Data Structure</a>
                                <a class="dropdown-item" href="?opt=6">Algorithm</a>
                                <a class="dropdown-item" href="?opt=7">Operating System</a>
                                <a class="dropdown-item" href="?opt=8">Computer Networks</a>
                            </div>
                        </div>

                        <div class="dropdown" style="margin:10px;">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                Recursos Humanos
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="?opt=4">Solicitu de vacaciones</a>
                                <a class="dropdown-item" href="?opt=11">Permiso para llegar tarde</a>
                                <a class="dropdown-item" href="?opt=12">Permiso para ausentarse</a>
                                <a class="dropdown-item" href="?opt=13">Pase de salida</a>
                            </div>
                        </div>

                        <div class="dropdown" style="margin:10px;">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                IT Systems
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="?opt=8">Modificar usuario</a>
                                <a class="dropdown-item" href="?opt=10">Algorithm</a>
                                <a class="dropdown-item" href="?opt=11">Operating System</a>
                                <a class="dropdown-item" href="?opt=12">Computer Networks</a>
                            </div>
                        </div>

                        <div class="dropdown" style="margin:10px;">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                IT Support
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="?opt=9">Data Structure</a>
                                <a class="dropdown-item" href="?opt=10">Algorithm</a>
                                <a class="dropdown-item" href="?opt=11">Operating System</a>
                                <a class="dropdown-item" href="?opt=12">Computer Networks</a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-9">
                    <div class="formato" id="formato">
                        <?php
                        if (isset($_GET['opt'])) {
                            mostrar_catalogo_departamento($_GET['opt']);
                        }
                        function mostrar_catalogo_departamento($index)
                        {
                            switch ($index) {
                                case "1":
                                    include 'Formatos/seguridad-patrimonial/pase_de_salida.php';
                                    break;
                                case "2":
                                    include 'Formatos/seguridad-patrimonial/entrada-dispositivo.php';
                                    break;
                                case "3":

                                    break;
                                case "4":
                                    include 'Formatos/rh/vacaciones.php';
                                    break;
                                case "5":
                                    include 'Formatos/seguridad-patrimonial/pase_de_salida.php';
                                    break;
                                case "6":
                                    include 'formatos/it-support/solicitud_baja_equipo.php';
                                    break;
                                case "7":
                                    include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
                                    break;
                                case "8":
                                    include 'Formatos/it-systems/modificar_usuario.php';
                                    break;
                                case "9":
                                    include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
                                    break;
                                case "10":
                                    echo "Formato no encontrado";
                                    break;
                                case "11":
                                    echo "Formato no encontrado";
                                    break;
                                case "12":
                                    echo "Formato no encontrado";
                                    break;
                                case "13":
                                    echo "Formato no encontrado";
                                    break;
                                case "14":
                                    echo "Formato no encontrado";
                                    break;
                                case "15":
                                    echo "Formato no encontrado";
                                    break;
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php include "footer.php" ?>
            </div>
        </div>
        <script type="text/javascript" src="../js/site.js"></script>
</body>

</html>