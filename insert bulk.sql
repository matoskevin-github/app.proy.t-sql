use master
create database Empresa
go

use Empresa
go

go
create table Empleados(
Nombres nchar(100)  null)
go




BULK
INSERT Empleados 
FROM 'D:\LISTA NOMBRES\Personas_NOMBRE_APELLIDO.txt' --location with filename
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO

select * from Empleados