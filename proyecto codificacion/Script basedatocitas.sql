drop database if exists BaseDatoCitas;

/* CREACION DE BASE DE DATOS*/
create database BaseDatoCitas;
use BaseDatoCitas;

/* TABLAS DE LA BASE DE DATOS*/

create table Medicos(
MedIdentificacion char(10) not null,
MedNombres varchar(50) not null,
MedApellidos varchar(50) not null,
primary key (MedIdentificacion)
);

create table Pacientes(
PacIdentificacion char(10) not null,
PacNombres varchar(50) not null,
PacApellidos varchar(50) not null,
PacFechaNacimiento date not null,
PacSexo enum('M','F') not null,
primary key(PacIdentificacion)
);

create table Consultorios(
ConNumero int(3) not null,
ConNombre varchar(50) not null,
ConEstado varchar(20) default 'Disponible' not null,
primary key(ConNumero)
);

create table Tratamientos(
TraNumero int auto_increment,
TraFechaAsignado date not null,
TraDescripcion text not null,
TraFechaInicio date not null,
TraFechaFin date not null,
TraValor double not null,
TraPaciente char(10) not null,
primary key( TraNumero ),
foreign key ( TraPaciente ) references Pacientes ( PacIdentificacion )
);

CREATE TABLE citas (
CitNumero int AUTO_INCREMENT,
CitFecha date NOT NULL,
CitHora varchar(10) NOT NULL,
CitPaciente char(10) NOT NULL,
CitMedico char(10) NOT NULL,
CitConsultorio int(3) NOT NULL,
CitEstado enum('Asignada','Cumplida','Cancelada') NOT NULL DEFAULT 'Asignada',
PRIMARY KEY (CitNumero),
FOREIGN KEY (CitPaciente) REFERENCES Pacientes (PacIdentificacion),
FOREIGN KEY (CitMedico) REFERENCES Medicos (MedIdentificacion),
FOREIGN KEY (CitConsultorio) REFERENCES Consultorios (ConNumero)
);

create table Usuarios(
Identificacion int not null,
Nombre varchar(50) not null,
Sexo enum('M','F') not null,
Nacimiento date not null,
Rol varchar(30) not null,
Correo varchar(50) null,
Foto varchar(70) null,
primary key (Identificacion)
);

-- /INSERTAR INFORMACION ALA TABLA USUARIOS/

insert into Usuarios(Identificacion, Nombre,Sexo, Nacimiento, Rol, Correo,Foto)
values	(10278, 'Edinson','M','1980-06-15','Medico','edi@gmail.com',null),
		(70529, 'Andres Felipe','M','2011-08-29','Paciente','pipe@hotmail.com',null),
        (4520, 'Perla','F','1978-04-24','Empleado','perlita@hotmail.com',null),
        (950328, 'Fabian','M','1995-03-28','Paciente','fabian950328@gmail.com',null),
        (970419, 'Diana','F','1997-04-19','Paciente','dianadiaz182@hotmail.com',null),
        (411005, 'Rosario','F','1947-10-05','Paciente','rosario@hotmail.com',null);
        
-- /INSERTAR INFORMACION ALA TABLA PACIENTE/

insert into pacientes(PacIdentificacion, PacNombres, PacApellidos, PacFechaNacimiento, PacSexo)
values('91222333', 'CARLOS JESUS','RODRIGUEZ CAlA','1970-01-03','M'); 


--  /INSERTAR INFORMACION ALA TABLA TRATAMIENTO/

insert into tratamientos(TraFechaAsignado, TraDescripcion, TraFechaInicio, TraFechaFin,TraValor,TraPaciente)
values('2017-07-13','Tratamiento de conductos','2017-08-01','2017-08-03',45000.00,'91222333');

--  /INSERTAR INFORMACION ALA TABLA CONSULTORIO/
insert into consultorios(ConNumero, ConNombre,ConEstado)
values(1050,'Odontologia',Default);
