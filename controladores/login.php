<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sitio.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="https://www.google.com/recaptcha/api.js?hl=es" async defer></script>
    <title>Document</title>
</head>

<body>
    <script src="../js/site.js"></script>
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
                                    <label class="form-label" for="typePasswordX-2">Contraseña</label>
                                    <center>
                                        <div class="g-recaptcha" data-sitekey="6LfFjGAeAAAAACRDH-_Rl3RaJD-iIyMMbGNZzpcV"></div>
                                    </center>
                                    <br />
                                    <br>
                                    <button class="btn btn-primary btn-lg btn-block" name="login" id="login" type="submit">Entrar</button>
                                    <?php
                                    if (isset($_GET['errorcode'])) {
                                        echo "<hr>";
                                        switch ($_GET['errorcode']) {
                                            case 1:
                                                echo "<h5>Contraseña incorrecta</h5>";
                                                break;
                                            case 2:
                                                echo "<h5>Por favor inicie sesion</h5>";
                                                break;
                                            case 3:
                                                echo "<h5>Error usuario no existe</h5>";
                                                break;
                                            case 4:
                                                echo "<h5>Capcha invalido!</h5>";
                                                break;
                                        }
                                        echo "<hr>";
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