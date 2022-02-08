

var selection_departeamento = document.getElementById('seleccion-departamento');

function activar_boton_mostrar() {
    if (selection_departeamento != 0) {
        document.getElementById('boton_mostrar').disabled = false;
    }
}