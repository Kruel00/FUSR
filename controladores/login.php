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
    <section class="vh-100" style="background-color: #508bfc;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card shadow-2-strong" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-center">
                            <div class="logo-reconext">
                                <img src="../img/company_logo_big.png" alt="">
                            </div>
                            <h3 class="mb-5">Iniciar sesion</h3>

                            <!-- form de login -->
                            <form action="login_controller.php" method="post">
                                <div class="form-outline mb-4">
                                    <input type="text" id="typeEmailX-2" name="username" required placeholder="Usuario" class="form-control form-control-lg" />
                                    <label class="form-label" for="typeEmailX-2">Usuario de dominio</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" name="passwd" id="typePasswordX-2" required placeholder="Contraseña" class="form-control form-control-lg" />
                                    <label class="form-label" for="typePasswordX-2">Password</label>
                                    <br>
                                    <button class="btn btn-primary btn-lg btn-block" name="login" id="login" type="submit">Login</button>
                                    <?php
                                    if (isset($_GET['errorpass'])) {
                                        echo "<hr><br>";
                                        echo "<h5>Error contraseña incorrecta</h5>";
                                        echo "<br><hr>";
                                    }
                                    ?>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>


</html>