<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/icons/bootstrap-icons.css">
    <title>Administrador</title>
</head>

<body>
    <?php
    session_start();
    if (isset($_SESSION['userdata'])) {
        if ($_SESSION['userdata']['UserRole'] != 3) {
            session_destroy();
            header("location: ../controladores/login.php?errorcode=2");
        }
    } else {
        header("location: ../controladores/login.php?errorcode=2");
    }
    ?>

    <!-- Header -->
    <div class="row">
        <?php include 'header.php'; ?>
    </div>
    <!-- Fin de header -->
    <i class="bi-github" role="img" aria-label="GitHub"></i>
    <div class="container">
        <div class="card" style="width: 18rem;">

            <div class="card-body">
                <i class="bi bi-layer-forward"></i>
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

    </div>

</body>

</html>