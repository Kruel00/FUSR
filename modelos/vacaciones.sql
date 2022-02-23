

create table tipo_solicitud(
	id_tipo int identity primary key not null,
	desc_solicitud varchar(64)
);


create table tipo_dispositivo(
	id_dispositivo int identity primary key not null,
	desc_dispositivo varchar(64)
);

create table planta(
	id_planta int identity primary key not null,
	nom_planta varchar(32)
);

create table propiedad(
	id_propiedad int primary key identity not null,
	desc_propiedad varchar(15)
)


create table solicitud_dispositivo(
	folio int identity primary key not null,
	tipo_solicitud int,
	tipo_dispositivo int,
	solicitante varchar(30) not null,
	imei int not null,
	num_serie varchar(32) not null,
	marca varchar(64),
	modelo varchar(64),
	color varchar(32),
	num_telefono varchar(10),
	planta int,
	propiedad int,
	aprobacion int not null
	foreign key (tipo_solicitud) references tipo_solicitud(id_tipo),
	foreign key (tipo_dispositivo)  references tipo_dispositivo(id_dispositivo),
	foreign key (planta) references planta(id_planta),
	foreign key (propiedad) references propiedad(id_propiedad),
	foreign key (aprobacion) references solicitud(IdSolicitud)
);
