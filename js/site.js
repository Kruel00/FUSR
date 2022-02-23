'use strict';

var selection_departeamento = document.getElementById('seleccion-departamento');

function activar_boton_mostrar() {
    if (selection_departeamento != 0) {
        document.getElementById('boton_mostrar').disabled = false;
    }
}

const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('input');

const expresiones = {
    imei: /^[0-9]{15,15}|[,]$/,
    telefono: /^[0-9]{10,10}|[,]$/
}

const validar_formulario = (e) => {
    switch (e.target.name) {
        case "txt_IMEI":
            validar_campo(expresiones.imei, e.target)
        break;
        case "asset":
            
        break;
        case "dias":
            
        break;
        case "txt_IMEI":
            
        break;
    }
}

inputs.forEach((input) => {
    input.addEventListener('keyup',validar_formulario);
    input.addEventListener('blur',validar_formulario);
})

 formulario.addEventListener('submit', (e)=>{
    e.preventDefault();
}) 

const validar_campo = (expresion, input) => {
    if(expresion.test(input.value)){
        
    }
}