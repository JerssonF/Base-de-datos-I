--Crear base de datos
create database Aeropuerto
go

--Crar tabla 
create table Piloto(
Id  int PRIMARY KEY IDENTITY,
IdBase int NOT NULL,
identificación nvarchar(20) NOT NULL,
nombre nvarchar(150) NOT NULL,
apellido nvarchar(150) NOT NULL,
horas int NOT NULL)
go

--Crar tabla 
create table Tripulacion (
Id  int PRIMARY KEY IDENTITY,
IdBase int NOT NULL,
identificación nvarchar(20) NOT NULL,
nombre nvarchar(150) NOT NULL,
apellido nvarchar(150) NOT NULL)
go

--Crar tabla 
create table Base (
Id  int PRIMARY KEY IDENTITY,
nombre nvarchar(150) NOT NULL,
direccion nvarchar(150) NOT NULL)
go

--Crar tabla 
create table Avion(
Id  int PRIMARY KEY IDENTITY,
IdBase int NOT NULL,
tipo nvarchar(150) NOT NULL)
go

--Crar tabla 
create table Vuelo(
Id  int PRIMARY KEY IDENTITY,
IdCiudadDestino int NOT NULL,
IdPiloto int NOT NULL,
IdTripulacion int NOT NULL,
IdAvion int NOT NULL,
numero int NOT NULL,
origen nvarchar(100)NOT NULL,
fecha_hora datetime2 NOT NULL)
go

--Crar tabla 
create table Ciudades(
Id  int PRIMARY KEY IDENTITY,
nombre nvarchar(105) NOT NULL,
clima nvarchar(100) NOT NULL)
go

--Insertar datos en tabla Piloto
INSERT INTO dbo.Piloto
(IdBase, identificación, nombre, apellido, horas)
VALUES
(1, 12345886, 'Juan', 'Silva', 20 ),
(2, 45648778, 'Brandon', 'Sanchez', 30),
(3, 49845659, 'Nicolas', 'Tello', 50),
(4, 96355447, 'Leonardo', 'Vargas', 45),
(6, 67156565, 'Marlon', 'Romero', 10),
(7, 32165468, 'Yeison', 'Scarpetta', 99),
(5, 32545547, 'Pablo', 'Valdes', 30),
(9, 64861387, 'Alexis', 'Ariza', 20),
(10, 65456455, 'Pedro', 'Gutierrez', 30),
(8, 54465458, 'Jersson', 'Buitrago', 82)
go

--Insertar datos en tabla Tripulación
INSERT INTO dbo.Tripulacion
(IdBase,identificación, nombre, apellido)
VALUES
(1, 65484855, 'Hermes', 'Espitia'),
(2, 65456489, 'Jorge', 'Tamayo'),
(3, 98465684, 'Sandra', 'Rivera'),
(4, 68468168, 'Deisy', 'Cuenca'),
(6, 36546879, 'Lorena', 'Ayala'),
(7, 12324654, 'Andy', 'Yara'),
(5, 65456488, 'Dayana', 'Caicedo'),
(9,94715584, 'Derly', 'Perafan'),
(10, 35454865, 'Hector', 'Caicedo'),
(8, 10355489, 'Daniel', 'Perez')
go

--Insertar datos en tabla Base
INSERT INTO dbo.Base
(nombre, direccion)
VALUES
('Dorado', 'Av 26 5 33'),
('Benito Salas', 'Cr 6 5 20'),
('Palo Negro', 'Cl 15 9 44'),
('Eden', 'Au 10 6 44'),
('Ernesto Cortissoz', 'Cr 33 8 10'),
('Alfonso Bonilla', 'Cl 99 8 06'),
('Camilo Daza', 'Cr 46 2 02'),
('Simon Bolivar', 'Av 37 3 99'),
('Perales', 'Cl 16 5 00'),
('Contador', 'Av 56 16 32')
go

--Insertar datos en tabla Ciudades
INSERT INTO dbo.Ciudades
(nombre, clima)
VALUES
('Bogota', 'Frio'),
('Neiva', 'Calido'),
('Armenia', 'Templado'),
('Cartagena', 'Calido'),
('Manizales', 'Frio'),
('Barranquilla', 'Calido'),
('Medellin', 'Templado'),
('Ibague', 'Calido'),
('Santa Marta', 'Calido'),
('Cucuta', 'Calido')
go


--Insertar datos en tabla Avion
INSERT INTO dbo.Avion
(IdBase, tipo)
VALUES
(1, 'Airbus'),
(2, 'Focker'),
(3, 'Boeing'),
(5, 'Atr'),
(4, 'Antonov'),
(7, 'Douglas'),
(9, 'Embraer'),
(8, 'Jumbo'),
(6, 'Bombardier'),
(10, 'McDonnell')
go

--Insertar datos en tabla Vuelo
INSERT INTO dbo.Vuelo
(IdCiudadDestino, IdPiloto, IdTripulacion, IdAvion, numero, origen,Fecha_hora )
VALUES
(1, 2, 3, 4, 2456,'Cali', '2024-05-23'),
(2, 1, 2, 3, 1026,'Pereira', '2024-05-22'),
(4, 4, 1, 2, 7896,'Neiva', '2024-04-23'),
(3, 3, 4, 1, 9800,'Medellin', '2024-03-10'),
(5, 5, 5, 5, 9896,'Ibague', '2024-02-28'),
(7, 6, 8, 9, 7274,'Barranquilla', '2024-03-16'),
(6, 7, 6, 8, 9295,'Leticia', '2024-02-12'),
(8, 9, 10,6, 9273,'Arauca', '2024-01-11'),
(9, 8, 7, 7, 7458,'Villavicencio', '2024-03-19'),
(10, 10, 9, 10, 9200,'Choco', '2024-05-06')
Go

--1 Listar nombre completo y base a la que pertenece todos los pilotos
SELECT Concat(Pil.nombre, ' ',Pil.apellido) AS nombreCompleto, bas.*
FROM Piloto AS Pil
Left JOIN Base as bas ON Pil.IdBase = bas.id;

--2 Encontrar todos los vuelos que salen de una ciudad específico
SELECT *FROM Vuelo
WHERE origen = 'neiva';  

--3 Obtener el número de vuelos realizados por cada avión
SELECT avi.tipo, COUNT(*) AS numero_vuelos
FROM Vuelo as Vuel
INNER JOIN Avion as avi ON Vuel.IdAvion = avi.id
GROUP BY avi.tipo

--4 Encontrar la tripulación asignada a un vuelo en particular
select CONCAT(tri.Nombre,' ',tri.Apellido)As Nombre_completo,vuel.numero
FROM Tripulacion AS tri
INNER JOIN Vuelo As vuel ON tri.Id = vuel.IdTripulacion
Where vuel.numero = 9800

--5 El listado de destinos con la cantidad de vuelos recibidos, organizados de forma descendente
SELECT ciu.nombre AS destino, COUNT(*) AS numero_vuelos
FROM Vuelo as vuel
INNER JOIN Ciudades as ciu ON vuel.IdCiudadDestino = IdCiudadDestino
GROUP BY ciu.nombre
ORDER BY numero_vuelos DESC

--6 El tipo de avión y detalle de los vuelos de dicho avión en un rango de fechas
SELECT avi.tipo, vuel.*
FROM Vuelo as vuel
INNER JOIN Avion as avi ON vuel.IdAvion= avi.id
WHERE vuel.fecha_hora = '2024-05-23'

--7 El detalle de aviones que pertenecen a una base específica
select Avion.*from Avion
where Avion.IdBase= 3

--8 Muestre los dos pilotos con más números de vuelos
SELECT TOP 2 pil.nombre + ' ' + pil.apellido AS nombre_completo, COUNT(*) AS numero_vuelos
FROM Vuelo as vuel
INNER JOIN Piloto as pil ON vuel.IdPiloto = pil.id
GROUP BY pil.nombre, pil.apellido
ORDER BY numero_vuelos DESC;

--9 Muestre el detalle de vuelos que llegaron a una ciudad con clima templado (CLimas: Caliente, Frío y Templado)
SELECT vuel.*FROM Vuelo as vuel
INNER JOIN Ciudades as ciu ON Vuel.IdCiudadDestino= ciu.id
WHERE ciu.clima = 'frio'

--10 Liste el nombre completo de los pilotos, nombre completo de tripulación, nombre de ciudad y avion de todos los vuelos.
SELECT 
    pil.nombre + ' ' + pil.apellido AS nombre_piloto, 
    tri.nombre + ' ' + tri.apellido AS nombre_tripulacion, 
    ciu.nombre AS ciudad_destino, 
    avi.tipo AS avion
FROM Vuelo as vuel
INNER JOIN Piloto as pil ON vuel.IdPiloto = pil.id
INNER JOIN Tripulacion as tri ON vuel.IdTripulacion = Tri.id
INNER JOIN Ciudades as ciu ON vuel.IdCiudadDestino = Ciu.id
INNER JOIN Avion as avi ON vuel.IdAvion = avi.id

select*from dbo.Vuelo
select*from dbo.Tripulacion
select*from dbo.Piloto
select*from dbo.Ciudades
select*from dbo.Base
select*from dbo.Avion