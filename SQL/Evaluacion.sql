--Crear base de datos
create database hospitalevaluacion
go

--Crar tabla 
create table pacientes (
Id  int  NOT NULL PRIMARY KEY,
Nombre nvarchar(150) NOT NULL,
Apellidos nvarchar(150) NOT NULL,
Telefono nchar(15) NOT NULL,
Direccion nvarchar(120)  NOT NULL)
go


--Crar tabla 
create table Doctor (
Id  int  NOT NULL PRIMARY KEY,
Nombre nvarchar(150) NOT NULL,
Especialidad nvarchar(200) NOT NULL)
go


--Crar tabla 
create table Enfermedades(
Id  int  NOT NULL PRIMARY KEY,
Nombre nvarchar(150) NOT NULL,
Valoracion nvarchar(150) NOT NULL,
Sintoma nvarchar(200) NOT NULL,
Gravedad nvarchar(250)  NOT NULL)
go


--Crar tabla 
create table Citas(
Id  int  NOT NULL PRIMARY KEY,
Idpaciente int NOT NULL,
Idenfermedad int NOT NULL,
Iddoctor int NOT NULL,
Observacion nvarchar(300)NOT NULL,
Medicamento nvarchar(200) NOT NULL,
ValorConsulta float NOT NULL,
Proxcita datetime)
go


--Insertar datos en tabla
INSERT INTO dbo.pacientes
(Id,Nombre,Apellidos,Telefono,Direccion)
VALUES
(1, 'Juan','Silva', 3123654714,'Cle 32 65 16'),
(2, 'Carlos','Zambrano', 3102568741,'Cle 10 8 66'),
(3, 'Jersson','Perez', 3133438020,'Cr 35 22 15 sur'),
(4, 'Joaquin','Quintero', 3102014137,'Cle 8 30 125'),
(5, 'Ana ','Losada', 3217029806,'Cra 6 12 15'),
(6, 'Carmen','Soto', 3125386806,'Cle 10 6 58'),
(7, 'Amanda','Quiñones', 3102504789,'Cra 6 12 21'),
(8, 'Deisy','Pineda', 3143579546,'Cle 15 9 15'),
(9, 'Diego','Zapata', 3506587987,'Cra 5 36 58'),
(10, 'Ariel','Lima', 3126543219,'Cle 15 8 74')
go

--Insertar datos en tabla
INSERT INTO dbo.Enfermedades
(Id,Nombre,Valoracion,Sintoma,Gravedad)
VALUES
(1, 'Gripa','Acude paciente con molestias en su cuerpo','Fiebre,vómito,escalofrios','Leve'),
(2, 'Alergia','Acude paciente con rasquiña en su cuerpo','Hinchazón','Leve'),
(3, 'Cancer','Paciente con una masa sospechosa en su abdomen','Fiebre,vómito,escalofrios, dolor intenso,','Grave'),
(4, 'Gripa','Acude paciente con molestias en su cuerpo','Fiebre,vómito,escalofrios','Leve'),
(5, 'Alergia','Acude paciente con rasquiña en su cuerpo','Fiebre,vómito,escalofrios','Leve'),
(6, 'Cancer','Acude paciente con cancer, invadido en todo su sistema respiratorio','Fiebre,vómito,escalofrios','Urgente'),
(7, 'Gripa','Acude paciente con dolor en su cuerpo','Fiebre,vómito,escalofrios','Leve'),
(8, 'Alergia','Acude paciente con hinchazón en sus orejas','Rasquiña','Leve'),
(9, 'Cancer','Acude paciente con masa para estudio','Fiebre,vómito,escalofrios','Urgente'),
(10, 'Gripa','Acude paciente con dolor en su cuerpo','Fiebre,vómito,escalofrios','Leve')
go

--Insertar datos en tabla
INSERT INTO dbo.Doctor
(Id,Nombre,Especialidad)
VALUES
(1, 'Javier Perafan','Medicina General'),
(2, 'Pedro Silva','Medicina General'),
(3, 'MAnuel Tovar','Oncólogo'),
(4, 'Pedro Silva','Medicina General'),
(5, 'Javier Perafan','Medicina General'),
(6, 'Manuel Tovar','Oncólogo'),
(7, 'Pedro Silva','Medicina General'),
(8, 'Manuel Tovar','Medicina General'),
(9, 'Javier Perafan','Oncólogo'),
(10, 'Javier Perafan','Medicina General')
go










