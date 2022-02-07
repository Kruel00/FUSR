<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sitio.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <title>Document</title>
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

    include '../controladores/conect_db.php';

    $consult = "SELECT * FROM users WHERE username = '$usuario'";
    $result = sqlsrv_query($con, $consult);
    $row = sqlsrv_fetch_array($result);

    
    function populate_format_combo(){

    }

    ?>
    <div class="container-fluid">
        <div class="row">
            <h1>Area header</h1>
            <img src="../img/company_logo_big.png" alt="">
        </div>
        <div class="row ">
            <div class="col-sm">
                <h1>Area seleccion de formatos</h1>
                <label for="">Seleccione formato:</label>

                <select name="slct_entrada_salida" id="slct_entrada_salida">
                        <option value="0" selected disabled>Seleecciones una opcion</option>
                        <option value="1">Salida</option>
                        <option value="2">Entrada</option>
                    </select>
            </div>
            <div class="col">
                <h1>Area formatos</h1>
                <div>
                    <?php
                        include '../vistas/formatos/seguridad_patrimonial/pase_de_salida.html';
                    ?>
                </div>
            </div>
        </div>
        <div class="row">
            <h1>area boton</h1>
        </div>
    </div>
</body>
</html>