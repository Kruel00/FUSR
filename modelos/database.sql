create database pt1
go
use pt1 
go

CREATE TABLE Company(
	CompanyId INT PRIMARY KEY IDENTITY, 
	CompanyName CHAR(80) NOT NULL,
	CompanyAddress CHAR(200) NOT NULL,
	Phone CHAR(14) NOT NULL
);

CREATE TABLE Departamento(
	DepartamentoId INT PRIMARY KEY NOT NULL IDENTITY,
	NombreDepartamento varchar(40) NOT NULL,
);

CREATE TABLE Puesto(
	PuestoID INT PRIMARY KEY NOT NULL IDENTITY,
	Descripcion VARCHAR(60) NOT NULL
);

create table UserRole(
	RoleID int identity primary key not null,
	Descripcion varchar(30)
);

CREATE TABLE Users(
	UserId int UNIQUE NOT NULL IDENTITY,
	UserName varchar(30) primary key,
	UserPassword varchar(60) not null,
	NumEmpleado varchar(15) NOT NULL,
	nombre CHAR(40) NOT NULL,
	apellido CHAR(50) NOT NULL,
	Email VARCHAR(60),
	Company INT,
	Departamento INT,
	Puesto INT,
	UserRole int,
	Firmante bit,
	foreign key (Company) references Company(CompanyId) ON DELETE CASCADE,
	foreign key (Departamento) references Departamento(DepartamentoId) ON DELETE CASCADE,
	foreign key (Puesto) references Puesto(PuestoID) ON DELETE CASCADE,
	foreign key (UserRole) references UserRole(RoleID) ON DELETE CASCADE
);

create table VacacionesDisponibles(
	idPeriodoAnual int primary key identity not null,
	periodo_anual int,
	dias_disponibles INT NOT NULL
	foreign key (usuario) references users(UserName)
);

create table statusSolicitud(
	idStatus int identity primary key,
	descripcion varchar(64)
);

create table tipoSalida(
	idTipoSalida int identity primary key not null,
	descripcion varchar(256)
);

create table solicitud(
	IdSolicitud VARCHAR(32) primary key not null,
	solicitante varchar(64) not null,
	FechaCreacion date not null,
	FechaCierre date,
	departamento varchar(64) not null,
	statusSolicitud int not null,
	FirmaSupervisor bit not null,
	FirmaMateriales bit not null,
	FirmaMantenimiento bit not null,
	FirmaFinanzas bit not null,
	FirmaRH bit not null,
	FirmaDireccion bit not null,
	FirmaSeguridad bit not null,
	FirmaSEH bit not null,
	FirmaITSupport bit not null,
	FirmaIngProcesos bit not null,
	FirmaTrafico bit not null 
	foreign key (statusSolicitud) references statusSolicitud(idStatus)
);


create table layout(
	noDeDocumento int primary key identity not null,
	descripcion varchar(512),
	docVersion char(2),
	modelo varchar(64),
	OEMDoc varchar(64),
	elaborador int,
	fechaCreacion date,
	revisionTecnica varchar(8),
	aprobacion VARCHAR(32),
	justificacion varchar(512)
	foreign key (elaborador) references users(UserId),
	foreign key (aprobacion) references solicitud(IdSolicitud)
)

create table solicitudVacaciones(
	folio int identity primary key not null,
	Company int,
	empleado varchar(32) not null,
	dias int not null,
	periodo int not null,
	fechaInicio date not null,
	semanaPagara int not null,
	observaciones varchar(512),
	aprobacion VARCHAR(32) not null
	foreign key (empleado) references users(UserName),
	foreign key (periodo)  references VacacionesDisponibles(idPeriodoAnual),
	foreign key (aprobacion) references solicitud(IdSolicitud)
);


create table salidaMaterial(
	idSalida int primary key identity not null,
	tipoSalida int not null,
	numControl varchar(64),
	numFolio varchar(64),
	fechaSalida datetime,
	planta varchar(64),
	cantidad int,
	descripcion varchar(256),
	proveedor varchar(128),
	solicitante varchar(30) not null,
	jusificacion varchar(512),
	aprobacion VARCHAR(32) not null
	foreign key (aprobacion) references solicitud(IdSolicitud),	
	foreign key (solicitante) references users(UserName),
	foreign key (tipoSalida) references tipoSalida(idTipoSalida)
);

create table Evidencia(
	IdEvidencia int identity primary key,
	RutaEvidencia varchar(512) not null,
	solicitud varchar(32) not null
	foreign key (solicitud) references solicitud(IdSolicitud)
);

create table comentarios(
	idComentario int identity not null primary key,
	pert_solicitud varchar(32) not null,
	fechaCreacion date,
	comentario varchar(512)
	foreign key (pert_solicitud) references solicitud(IdSolicitud)
)

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
	imei varchar(15) not null,
	num_serie varchar(32) not null,
	marca varchar(64),
	modelo varchar(64),
	color varchar(32),
	num_telefono varchar(10),
	planta int,
	propiedad int,
	justificacion varchar(256),
	aprobacion varchar(32) not null
	foreign key (tipo_solicitud) references tipo_solicitud(id_tipo),
	foreign key (tipo_dispositivo)  references tipo_dispositivo(id_dispositivo),
	foreign key (planta) references planta(id_planta),
	foreign key (propiedad) references propiedad(id_propiedad),
	foreign key (aprobacion) references solicitud(IdSolicitud)
);

create table bajaEquipo(
	idSolicitud int identity not null,
	solicitante varchar(30),
	tipodispositivo int not null,
	cantidad int,
	paisOrigen int,
	asset int,
	numSerie varchar(64),
	marca varchar(120),
	modelo varchar(120),
	ubicacion varchar(256),
	razonBaja varchar(512)
	foreign key (solicitante) references users(UserName),
)

USE [pt1]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName], [CompanyAddress], [Phone]) VALUES (1, N'Reconext                                                                        ', N'Calz. Manuel Gómez Morín 569, 21394 Mexicali, B.C.                                                                                                                                                      ', N'686 159 3100  ')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (1, N'IT SYSTEMS')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (2, N'NETGEAR')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (3, N'PLANNING')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (4, N'QUALITY')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (5, N'MAINTENANCE')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (6, N'CORPORATE SYSTEMS')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (7, N'SAFETY AND INDUSTRIAL HYGIENE')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (8, N'HUMAN RESOURCES')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (9, N'IT')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (10, N'Technicians')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (11, N'SECCURITY')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (12, N'OPERATIONS')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (13, N'ENGINEERING')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (14, N'Materials')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (15, N'WIP-CTRL')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (16, N'DELL')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (17, N'iPhone 4 AT&T')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (18, N'FITBIT')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (19, N'BACK COVER CENTER')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (20, N'PROGRAM MANAGEMENT')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (21, N'ACCOUNTING')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (22, N'Production')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (23, N'Logistics')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (24, N'Finance')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (25, N'Receiving Inspection')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (26, N'')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (27, N'MRB')
INSERT [dbo].[Departamento] ([DepartamentoId], [NombreDepartamento]) VALUES (28, N'Wip Control')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[Puesto] ON 

INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (1, N'SUPPORT TECHNICIAN')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (2, N'OPERATOR 1')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (3, N'Supply Chain Director')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (4, N'OPERATOR 2')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (5, N'QUALITY SUPERVISOR LEVEL 1')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (6, N'MAINTENANCE MANAGER')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (7, N'ITSUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (8, N'SHMA GENERAL SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (9, N'SUPPORT SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (10, N'HUMAN RESOURCES DIRECTOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (11, N'Supervisor')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (12, N'OPERATOR 3')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (13, N'Operator')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (14, N'IT MANAGER')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (15, N'SECURITY SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (16, N'DIRECTOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (17, N'LEVEL 1 IT SUPPORT')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (18, N'ENGINEERING SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (19, N'Data Entry Clerk')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (20, N'PRODUCTION GENERAL SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (21, N'Supervisor de Producción')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (22, N'DOCTOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (23, N'ESPECIALIZED OPERATOR II')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (24, N'Development Supervisor')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (25, N'PROGRAM MANAGER')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (26, N'CFO MEXICO')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (27, N'LEVEL 2 IT SUPPORT')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (28, N'QUALITY DIRECTOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (29, N'QUALITY INSPECTOR LEVEL 1')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (30, N'HR SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (31, N'Production Operator')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (32, N'MAINTENANCE ENGINEER')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (33, N'TECHNICIAN 1')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (34, N'TECHNICIAN LEVEL 1')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (35, N'SERVER ADMINISTRATOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (36, N'ACCOUNTS PAYABLE SUPERVISOR')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (37, N'QA Inspector')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (38, N'')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (39, N'Production Supervisor')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (40, N'PRICE ANALYST')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (41, N'PRINTER TECHNICIAN')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (42, N'OPERATOR LEVEL 3')
INSERT [dbo].[Puesto] ([PuestoID], [Descripcion]) VALUES (43, N'JIGS SUPERVISOR')
SET IDENTITY_INSERT [dbo].[Puesto] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [Descripcion]) VALUES (1, N'Usuario')
INSERT [dbo].[UserRole] ([RoleID], [Descripcion]) VALUES (2, N'Directivo')
INSERT [dbo].[UserRole] ([RoleID], [Descripcion]) VALUES (3, N'Administrador')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (91, N'aaguilar', N'abc123!@#', N'26089', N'Alfonso                                 ', N'Aguilar Soto                                      ', N'', 1, 27, 39, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (74, N'aaguirre', N'abc123!@#', N'18162', N'Alvaro                                  ', N'Aguirre                                           ', N'', 1, 5, 32, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (34, N'alopez', N'abc123!@#', N'41621', N'Antonio Fernando                        ', N'Lopez Rodriguez                                   ', N'', 1, 2, 2, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (90, N'amarin', N'abc123!@#', N'24298', N'Adelaida                                ', N'Marin Buenrostro                                  ', N'', 1, 22, 31, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (35, N'aquiroz', N'abc123!@#', N'31286', N'Angelica                                ', N'Quiroz Quiroz                                     ', N'', 1, 2, 4, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (36, N'arlopez', N'abc123!@#', N'13590', N'Araceli                                 ', N'Lopez                                             ', N'', 1, 4, 5, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (37, N'arturolopez', N'abc123!@#', N'40242', N'Arturo                                  ', N'Lopez                                             ', N'arturo.lopez@reconext.com', 1, 5, 6, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (105, N'blopez', N'abc123!@#', N'60061', N'Berenice                                ', N'Lopez Zuniga                                      ', N'', 1, 14, 19, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (33, N'cojeda', N'abc123!@#', N'8', N'Claudia Isabel                          ', N'Ojeda                                             ', N'', 1, 2, 2, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (93, N'crisgarcia', N'abc123!@#', N'62909', N'Cristian eduardo                        ', N'Garcia  Encinas                                   ', N'', 1, 28, 19, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (111, N'cristgarcia', N'abc123!@#', N'87883', N'Cristobal                               ', N'Garcia Ramirez                                    ', N'Cristobal.Garcia@reconext.com', 1, 1, 41, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (39, N'crivas', N'abc123!@#', N'50297', N'Carlos                                  ', N'Rivas                                             ', N'Carlos.Rivas@reconext.com', 1, 6, 7, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (41, N'dopadilla', N'abc123!@#', N'63623', N'Doris Liliana                           ', N'Padilla Romero                                    ', N'Doris.Padilla@reconext.com', 1, 7, 8, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (42, N'eljimenez', N'abc123!@#', N'22783', N'Elisa                                   ', N'Jimenez Perez                                     ', N'', 1, 2, 2, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (43, N'emeraz', N'abc123!@#', N'55493', N'Ernesto                                 ', N'Meraz                                             ', N'Ernesto.Meraz@reconext.com', 1, 1, 9, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (44, N'fmendieta', N'abc123!@#', N'79419', N'Fernando                                ', N'Mendieta                                          ', N'Fernando.Mendieta@reconext.com', 1, 8, 10, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (45, N'fmonroy', N'abc123!@#', N'22', N'Fidencio                                ', N'Monroy                                            ', N'', 1, 9, 11, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (114, N'frocha', N'abc123!@#', N'24062', N'Fernando                                ', N'Rocha                                             ', N'Fernando.Rocha@reconext.com', 1, 13, 18, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (46, N'fvera', N'abc123!@#', N'74992', N'Francisca                               ', N'Vera Aguilar                                      ', N'', 1, 2, 12, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (117, N'Gazambrano', N'abc123!@#', N'39791', N'Gabriel                                 ', N'Zambrano                                          ', N'Gabriel.Zambrano@reconext.com', 1, 1, 43, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (47, N'gguerrero', N'abc123!@#', N'60661', N'Guadalupe Sarahi                        ', N'Guerrero Juarez                                   ', N'', 1, 10, 13, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (48, N'gzambrano', N'abc123!@#', N'71', N'Gerardo                                 ', N'Zambrano                                          ', N'Gerardo.Zambrano@reconext.com', 1, 1, 14, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (49, N'hlimon', N'abc123!@#', N'79268', N'Humberto                                ', N'Limon Peña                                        ', N'Humberto.Limon@reconext.com', 1, 11, 15, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (83, N'hpardini', N'abc123!@#', N'14490', N'Hector                                  ', N'Pardini                                           ', N'hector.pardini@reconext.com', 1, 6, 7, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (50, N'janavarro', N'abc123!@#', N'60660', N'Javier Alberto                          ', N'Navarro Cecena                                    ', N'', 1, 1, 1, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (32, N'jcastorena', N'abc123!@#', N'60663', N'Javier                                  ', N'Castorena Carvajal                                ', N'JAVIER.CASTORENA@reconext.com', 1, 1, 1, 3,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (40, N'jdelatorre', N'abc123!@#', N'A00R', N'Jorge                                   ', N'de la Torre                                       ', N'Jorge.DeLaTorre@reconext.com', 1, 12, 16, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (75, N'jladino', N'abc123!@#', N'54554', N'Jesus Ricardo                           ', N'Ladino Ochoa                                      ', N'jesus.ladino@reconext.com', 1, 5, 32, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (52, N'jluna', N'abc123!@#', N'53356', N'Jonatan Mizael                          ', N'Luna Sandoval                                     ', N'Jonatan.Luna@reconext.com', 1, 1, 17, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (53, N'jnicanor', N'abc123!@#', N'13484', N'Nicanor                                 ', N'Juangorena                                        ', N'Juangorena.Nicanor@reconext.com', 1, 13, 18, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (54, N'jocegueda', N'abc123!@#', N'60667', N'Jose Luis                               ', N'Ocegueda Marquez                                  ', N'', 1, 14, 19, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (55, N'jouribe', N'abc123!@#', N'60666', N'Jose Roberto                            ', N'Uribe Orendain                                    ', N'', 1, 15, 19, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (56, N'jrobles', N'abc123!@#', N'14448', N'Juan                                    ', N'Robles                                            ', N'Juan.Robles@reconext.com', 1, 16, 20, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (76, N'jsantana', N'abc123!@#', N'57132', N'Javier                                  ', N'Santana                                           ', N'Javier.Santana@reconext.com', 1, 13, 33, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (57, N'juagutierrez', N'abc123!@#', N'60665', N'Juan Carlos                             ', N'Gutierrez Woodill                                 ', N'', 1, 14, 19, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (58, N'Julopez', N'abc123!@#', N'17775', N'Julio                                   ', N'Lopez                                             ', N'', 1, 17, 21, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (59, N'kamontoya', N'abc123!@#', N'87864', N'Karime                                  ', N'Montoya Llamas                                    ', N'KARIME.MONTOYA@reconext.com', 1, 8, 22, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (60, N'legarcia', N'abc123!@#', N'20664', N'Leticia                                 ', N'Garcia                                            ', N'', 1, 2, 12, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (61, N'lesarroyo', N'abc123!@#', N'18391', N'Leslye Alejandra                        ', N'Arroyo Herran                                     ', N'Leslye.Arroyo@reconext.com', 1, 18, 5, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (88, N'lperez', N'abc123!@#', N'38511', N'Laura                                   ', N'Perez                                             ', N'', 1, 25, 37, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (115, N'luisalfmartinez', N'abc123!@#', N'41238', N'Luis Alfonso                            ', N'Martinez Lopez                                    ', N'Luis.Martinez@reconext.com', 1, 1, 34, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (62, N'mareyes', N'abc123!@#', N'34', N'Ma Adela                                ', N'Reyes Martinez                                    ', N'', 1, 19, 23, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (63, N'mariapeperez', N'abc123!@#', N'25446', N'Maria                                   ', N'Perez Gudino                                      ', N'', 1, 2, 2, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (87, N'mherran', N'abc123!@#', N'15412', N'Mary                                    ', N'Herran                                            ', N'Mary.Herran@reconext.com', 1, 24, 36, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (64, N'mrivera', N'abc123!@#', N'99', N'Monica                                  ', N'Rivera                                            ', N'', 1, 9, 24, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (86, N'mrodriguez', N'abc123!@#', N'', N'Martha                                  ', N'Rodriguez                                         ', N'', 1, 23, 11, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (103, N'ocastorena', N'abc123!@#', N'87923', N'Oscar Valentin                          ', N'Castorena Carvajal                                ', N'', 1, 1, 40, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (73, N'racosta', N'abc123!@#', N'87007', N'Ronaldo                                 ', N'Acosta Castro                                     ', N'', 1, 22, 31, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (80, N'rcastanon', N'abc123!@#', N'48091', N'Raul                                    ', N'Castanon                                          ', N'Raul.Castanon@reconext.com', 1, 6, 35, 1, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (65, N'rguadarrama', N'abc123!@#', N'89', N'Rafael                                  ', N'Guadarrama                                        ', N'Rafael.Guadarrama@reconext.com', 1, 13, 18, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (66, N'rlopez', N'abc123!@#', N'31471', N'Rafael                                  ', N'Lopez De anda                                     ', N'Rafael.Lopez@reconext.com', 1, 20, 25, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (77, N'rrincon', N'abc123!@#', N'68740', N'Raul                                    ', N'Rincon Calderon                                   ', N'Raul.Rincon@reconext.com', 1, 1, 34, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (67, N'Rtucker', N'abc123!@#', N'40322', N'Ricardo                                 ', N'Tucker                                            ', N'Ricardo.Tucker@reconext.com', 1, 21, 26, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (89, N'salopez', N'abc123!@#', N'', N'SALVADOR                                ', N'LOPEZ                                             ', N'', 1, 26, 38, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (68, N'sballesteros', N'abc123!@#', N'17683', N'Santiago                                ', N'Ballesteros                                       ', N'Santiago.Ballesteros@reconext.com', 1, 1, 27, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (69, N'smontoya', N'abc123!@#', N'97', N'Sergio                                  ', N'Montoya                                           ', N'Sergio.Montoya@reconext.com', 1, 4, 28, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (70, N'vamartinez', N'abc123!@#', N'57214', N'Vanesa                                  ', N'Martinez                                          ', N'', 1, 18, 29, 1,0)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (71, N'vchacon', N'abc123!@#', N'16446', N'Veronica                                ', N'Chacon                                            ', N'Veronica.Chacon@reconext.com', 1, 8, 30, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (72, N'vtrillo', N'abc123!@#', N'75', N'Victor                                  ', N'Trillo                                            ', N'Victor.Trillo@reconext.com', 1, 1, 7, 1,1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserPassword], [NumEmpleado], [nombre], [apellido], [Email], [Company], [Departamento], [Puesto], [UserRole],[Firmante]) VALUES (113, N'ymata', N'abc123!@#', N'30714', N'Yessica                                 ', N'Mata                                              ', N'yessica.mata@cloverwireless.com', 1, 2, 42, 1,0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[statusSolicitud] ON 

INSERT [dbo].[statusSolicitud] ([idStatus], [descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[statusSolicitud] ([idStatus], [descripcion]) VALUES (2, N'Cancelada')
INSERT [dbo].[statusSolicitud] ([idStatus], [descripcion]) VALUES (3, N'Aprobada')
SET IDENTITY_INSERT [dbo].[statusSolicitud] OFF
GO

SET IDENTITY_INSERT [dbo].[tipo_solicitud] ON 

INSERT [dbo].[tipo_solicitud] ([id_tipo], [desc_solicitud]) VALUES (1, N'Primera vez')
INSERT [dbo].[tipo_solicitud] ([id_tipo], [desc_solicitud]) VALUES (2, N'Renovacion')
INSERT [dbo].[tipo_solicitud] ([id_tipo], [desc_solicitud]) VALUES (3, N'Cambio de equipo')
SET IDENTITY_INSERT [dbo].[tipo_solicitud] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_dispositivo] ON 

INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (1, N'Telefono')
INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (2, N'Laptop')
INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (3, N'Disco duro o USB')
INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (4, N'Relog')
INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (5, N'Tablet')
INSERT [dbo].[tipo_dispositivo] ([id_dispositivo], [desc_dispositivo]) VALUES (6, N'otro')
SET IDENTITY_INSERT [dbo].[tipo_dispositivo] OFF
GO
SET IDENTITY_INSERT [dbo].[planta] ON 

INSERT [dbo].[planta] ([id_planta], [nom_planta]) VALUES (1, N'Reconext 1')
INSERT [dbo].[planta] ([id_planta], [nom_planta]) VALUES (2, N'Reconext 2')
INSERT [dbo].[planta] ([id_planta], [nom_planta]) VALUES (3, N'Reconext 3')
INSERT [dbo].[planta] ([id_planta], [nom_planta]) VALUES (5, N'Reconext CLX')
SET IDENTITY_INSERT [dbo].[planta] OFF
GO
SET IDENTITY_INSERT [dbo].[propiedad] ON 

INSERT [dbo].[propiedad] ([id_propiedad], [desc_propiedad]) VALUES (1, N'Personal')
INSERT [dbo].[propiedad] ([id_propiedad], [desc_propiedad]) VALUES (2, N'Empresa')
SET IDENTITY_INSERT [dbo].[propiedad] OFF
GO

insert into tipo_solicitud values ('Primera vez');
insert into tipo_solicitud values ('Renovacion');
insert into tipo_solicitud values ('Cambio de equipo');

insert into statusSolicitud values('Pendiente')
insert into statusSolicitud values('Cancelada')
insert into statusSolicitud values('Aprobada')

insert into propiedad values ('Personal');
insert into propiedad values ('Empresa');

insert into planta values ('Reconext 1');
insert into planta values ('Reconext 2');
insert into planta values ('Reconext 3');
insert into planta values ('Reconext CLX');

insert into tipo_dispositivo values ('Telefono');
insert into tipo_dispositivo values ('Laptop');
insert into tipo_dispositivo values ('Disco duro o USB');
insert into tipo_dispositivo values ('Relog');
insert into tipo_dispositivo values ('Tablet');
insert into tipo_dispositivo values ('otro');