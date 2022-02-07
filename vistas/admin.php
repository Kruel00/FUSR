<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        
</body>

</html>