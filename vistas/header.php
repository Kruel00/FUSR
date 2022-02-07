<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <title>Document</title>
</head>

<body>
    <header>
        <div class="container-fluid header">
            <img src="/img/company_logo_big.png" alt="">
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="navbar" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="#"><b> Nombre: </b><?php echo $_SESSION['userdata']['nombre'] . $_SESSION['userdata']['apellido'] ?></a>
                    <a class="nav-item nav-link active" href="#"><b> Puesto: </b><?php echo $_SESSION['userdata']['nombre_puesto'] ?></a>
                    <a class="nav-item nav-link active" href="#"><b> Departamento: </b><?php echo $_SESSION['userdata']['nombre_departamento'] ?></a>
                    <a class="nav-item nav-link active" href="#"><b> Email: </b><?php echo $_SESSION['userdata']['Email'] ?></a>
                    <a class="nav-item nav-link active red" href="/controladores/login.php?errorcode=5"><b>Cerrar sesion</b></a>
                </div>
            </div>
        </nav>

        <hr>
    </header>
</body>

</html>