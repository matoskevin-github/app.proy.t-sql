use master
if not exists(select * from sys.databases where name = 'CyberPlaza')
    create database CyberPlaza

    
    if not exists (select * from sysobjects where name='Address' and xtype='U')
    CREATE TABLE Address
(
    AddressID int IDENTITY PRIMARY KEY,
    Street varchar(60) NULL,
    City varchar(50) NULL,
    State varchar(2) NULL,
    Zip varchar(10)NULL,
    Intersection1 varchar(60) NULL,
    Intersection2 varchar(60) NULL,
)
go
    
go
   