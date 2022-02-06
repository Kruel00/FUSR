<?php
session_start();
$datosuser = $_SESSION['datosDelUsuario'];
?>
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
    <h1>Pagina de <?php echo $datosuser['nombre'] ?></h1>
    <br>
    <br>
    <div class="side-left-bar">
<?php 
printf("
    <ul>
        <li>Usuario: %s</li>
        <li>Nombre: %s</li>
        <li>Puesto: %s</li>
        <li><a href=\"../index.php\">Logout</a></li>
    </ul>",strtoupper($datosuser['usuariodominio']) ,$datosuser['nombre'] . " " . $datosuser['apellido'],$datosuser['puesto']);
    ?>
    </div>
    
    <table>
        <tr>
            <td># requisision</td>
            <td>Tipo</td>
            <td>Area</td>
            <td>Descripcion</td>
            <td>Fecha de creacion</td>
            <td>Evidencia</td>
        </tr>
        <tr>
            <td> - </td>
            <td> - </td>
            <td> - </td>
            <td> - </td>
            <td> - </td>
            <td> <a href="">Ver</a> </td>
        </tr>
    </table>


</body>

</html>