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
                <h1>Area seleccion de formatos</h1>
                <form action="" method="POST">
                    <select class="form-select" onchange="activar_boton_mostrar()" name="select_format" id="seleccion-departamento" aria-label="Default select example">
                        <option value="0" selected disabled>Seleecciones departamento</option>
                        <option value="1">Seguridad patrimonial</option>
                        <option value="2">Recursos humanos</option>
                        <option value="3">Ingenieria de procesos</option>
                        <option value="4">IT Support</option>
                        <option value="5">IT Jigs</option>
                        <option value="6">IT Systems</option>
                    </select>
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

                    var_dump($_POST);
                    function mostrar_catalogo_departamento($index)
                    {
                        var_dump($index);
                        switch ($index) {
                            case "1":
                                include 'Formatos/seguridad-patrimonial/indice_formatos.html';
                                break;
                            case "5":
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