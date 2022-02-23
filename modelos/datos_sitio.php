<?php
    class empleado
    {
        public $username;
        private $passwrd;
        public $numEmpleado;
        public $nombre;
        public $apellido;
        public $email;
        public $comapany;
        public $departamento;
        public $puesto;
        public $UserRole;
        
        public function __construct($UN, $PSWD, $NEMP, $NAM , $LNAM, $EM, $CO, $DP, $WK, $ROL ){
            $this->username = $UN;
            $this->passswrd = $PSWD;
            $this->numEmpleado =  $NEMP;
            $this->nombre = $NAM;
            $this->apellido = $LNAM;
            $this->email = $EM;
            $this->company =  $CO;
            $this->departamento = $DP;
            $this->puesto = $WK;
            $this->UserRole = $ROL;
        }
    }

    class Solicitud{
        public $idSolicitud;
        public $solicitante;
        public $fechaCreacion;
        public $fechaCierre;
        public $departamento;
        public $statusSolicitud;
        public $firmaSupervisor;
        public $firmaMateriales;
        public $firmaMantenimiento;
        public $firmaFinanzas;
        public $firmaRH;
        public $firmaDireccion;
        public $firmaSeguridad;
        public $firmaSEH;
        public $firmaITSupport;
        public $firmaIngProcesos;
        public $firmaTrafico;
        
        public function __construct($ID,$SL,$DTO,$DTC,$DP,$ST,$SGS,$SGW,$SGM,$SGF,$SGR,$SGD,$SGC,$SGH,$SIT,$SPR,$STF){
            $this -> idSolicitud=$ID;
            $this -> solicitante=$SL;
            $this -> fechaCreacion=$DTO;
            $this -> fechaCierre=$DTC;
            $this -> departamento=$DP;
            $this -> statusSolicitud=$ST;
            $this -> firmaSupervisor=$SGS;
            $this -> firmaMateriales=$SGW;
            $this -> firmaMantenimiento=$SGM;
            $this -> irmaFinanzas=$SGF;
            $this -> firmaRH=$SGR;
            $this -> firmaDireccion=$SGD;
            $this -> firmaSeguridad=$SGC;
            $this -> firmaSEH=$SGH;
            $this -> firmaITSupport=$SIT;
            $this -> firmaIngProcesos=$SPR;
            $this -> firmaTrafico=$STF;
        }

        
    }

    class company{
        public $companyid;
        public $CompanyName;
        public $CompanyAddress;
        public $phone;
    }

    class departamento{
        public $departamentoID;
        public $NombreDepartamento;
    }

    class puesto{
        public $puestoID;
        public $descripcionPuesto;
    }

    class userRole{
        public $roleID;
        public $Descripcion;
    }

    class Vacaciones{
        public $idPeriodoAnual;
        public $periodoAnual;
        public $diasDisponibles;
        public $usuario;
    }

    class evidencia{
        public $idEvidencia;
        public $fechaCreacion;
    }

    class recursosEvidencia{
        public $idevidencia;
        public $rutaEviencia;
        public $FKIDEvidencia;
    }

    class Actividad{
        public $idActividad;
        public $descripcion;
        public $departamento;
    }

    class statusSolicitud{
        public $isStatus;
        public $descripcion;
    }

    class statusFirmas{
        public $idStatusFirmas;
        public $descripcion;
    }

    class tipoSalida{
        public $tipoSalida;
        public $descripcion;
    }

    class comentarios{
        public $idcomentarios;
        public $comentario;
        public $solicitud;
    }

    class layout{
        public $noDocumento;
        public $descripcion;
        public $versionDoc;
        public $modelo;
        public $OEMDoc;
        public $elaborador;
        public $fechaCreacion;
        public $revision;
        public $aprobacion;
    }

    class solicitudVacaciones{
        public $folio;
        public $company;
        public $idempleado;
        public $dias;
        public $periodo;
        public $fechaInicio;
        public $fechaPagara;
        public $observaciones;
        public $aprobaciones;
    }

    class salidaMaterial{
        public $idSalida;
        public $tipoSalida;
        public $numControl;
        public $numFolio;
        public $fechaSalida;
        public $planta;
        public $cantidad;
        public $descripcion;
        public $proveedor;
        public $solicitante;
        public $aprobacion;
    }

?>