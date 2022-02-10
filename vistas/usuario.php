<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/sitio.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <title>Pagina de usuario</title>
</head>

<body>
    <script src="../js/site.js"></script>
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

    include '../controladores/conect_db.php';
    $consult = "SELECT descripcion FROM tipoSalida";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);
    ?>
    <div class="container-fluid">
        <!-- Header -->
        <div class="row">
            <?php include 'header.php'; ?>
        </div>
        <!-- Fin de header -->

        <div class="row">
            <div class="col-2">
                <h2>Formato</h2>
                <form action="" method="POST">
                    <div class="form-group">
                    <select class="form-control form-control-lg" id="" onchange="activar_boton_mostrar()" name="select_format"  aria-label="Default select example">
                        <option selected disabled>Seleeccione formato</option>
                        <option disabled><b>Seguridad patrimonial</b></option>
                        <option value="1">-> Salida de material</option>
                        <option value="2">-> Acceso a didispositivo</option>
                        <option value="3">-> Permiso de trabajo</option>
                        <option disabled>Recursos humanos</option>
                        <option value="4">-> Solicitud de vacaciones</option>
                        <option value="5">-> Pase de salida</option>
                        <option disabled>Ingenieria de procesos</option>
                        <option value="6">IT Support</option>
                        <option value="7">IT Jigs</option>
                        <option value="8">IT Systems</option>
                    </select>
                    </div>
                    
                    <br>
                    <input type="submit" disabled name="seleccion" id="boton_mostrar" value="Mostrar">
                </form>

            </div>
            <div class="col-7">
                <div class="formato" id="formato">
                    <?php
                    if (isset($_POST['seleccion'])) {
                        mostrar_catalogo_departamento($_POST['select_format']);
                    }
                    function mostrar_catalogo_departamento($index)
                    {
                        switch ($index) {
                            case "1":
                                include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
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
                                include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
                                break;
                            case "6":
                                var_dump($index);
                                break;
                            case "7":
                                include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
                                break;
                            case "8":
                                var_dump($index);
                                break;
                            case "9":
                                include 'Formatos/seguridad-patrimonial/pase_de_salida.html';
                                break;
                            case "10":
                                var_dump($index);
                                break;
                        }
                    }
                    ?>


                </div>
            </div>
        </div>
        <div class="row">
            <h1>area footer</h1>
        </div>
    </div>

    <script>

    </script>
</body>

</html>