use master
use Northwind
go

select * from Categories
select * from Employees
select * from Products
select * from Suppliers
select * from Customers
select * from CustomerCustomerDemo
select * from CustomerDemographics
select * from EmployeeTerritories
select * from Orders
select * from [Order Details]
select * from Region
select * from Shippers
select * from Territories

-- Consulta N° 1
select CustomerID,CompanyName
from Customers
-- Consulta N° 2
select CustomerID Codigo
from Customers Cliente
-- Consulta N° 3
select CustomerID Codigo,CompanyName 'Cliente Extranjero'
from Customers
-- Consulta N° 4
select ProductID,ProductName,UnitPrice
from Products
-- Consulta N° 5
select *
from Products
-- Consulta N° 6
select ProductID,ProductName,UnitPrice
from Products
-- Consulta N° 7
select Country,City,CompanyName
from Customers
order by Country,City
-- Consulta N° 8
select top 5 Country,City,CompanyName
from Customers
-- Consulta N° 9
select CustomerID,CompanyName
from Customers
where City = 'Madrid'
-- Consulta N° 10
select CustomerID,CompanyName,City
from Customers
where City = 'Madrid' or City = 'Barcelona'
-- Consulta N° 11
select ProductID,ProductName,UnitPrice,CategoryID
from Products
where CategoryID in (4,6) and UnitPrice >= 100 
-- Consulta N° 12
select ProductID,ProductName,UnitPrice,CategoryID
from Products
where (CategoryID = 4 or CategoryID = 6) and UnitPrice > 99 
-- Consulta N° 13
select * 
from [Order Details]
-- Consulta N° 14
select ProductName,UnitPrice, IGV = UnitPrice * 0.18,Total = UnitPrice + (UnitPrice * 0.18)
from Products
order by ProductName
-- Consulta N° 15
select OrderID,Quantity,UnitPrice, Importe = UnitPrice * Quantity,ProductID
from [Order Details]
where ProductID = 11 or ProductID = 12
order by ProductID
-- Consulta N° 16
select *
from Customers
where City in ('Madrid','Buenos Aires','London')
-- Consulta N° 17
select ProductName,UnitPrice
from Products
where UnitPrice between 10 and 20
-- Consulta N° 18
select CompanyName,City
from Customers
where CompanyName like 'A%'
-- Consulta N° 19
select ProductName,UnitPrice
from Products
where ProductName like 'C%' and (UnitPrice >= 10 and UnitPrice <= 20)
-- Consulta N° 19
select ProductName
from Products
where ProductName like '__A%'
-- Consulta N° 20
select *
from Customers
where CompanyName like '___p'
-- Consulta N° 21
select ProductName,
       LEFT(ProductName,5) as [Metodo Left], -- Extraer Caracteres Izquierda
	   RIGHT(ProductName,5) as [Metodo Right], -- Extraer Caracteres Derecha
	   SUBSTRING(ProductName,3,8) as [Metodo SubString] -- Extrae caracteres de cualquier posicion (PI,CC)
from Products
-- Consulta N° 22
print ('Sise')
-- Consulta N° 23
select CompanyName, Longitud = LEN(CompanyName) -- Longitud Caracteres
from Customers
-- Consulta N° 24
select CompanyName ,
	   Mayuscula = UPPER(CompanyName),
	   Minuscula = LOWER(CompanyName)
from Customers
-- Consulta N° 25
select Empleado = FirstName + SPACE(10) + LastName
from Employees
-- Consulta N° 26
select ProductName,
	   Reversa = REVERSE (ProductName),
	   Reemplazo = REPLACE(ProductName,'A','X')
from Products
-- Consulta N° 27
select [Nombres Completos] = LastName + ',' + FirstName,
	   [Nombres Completos Sin Espacios] = LTRIM(LastName) + ' , ' + LTRIM(FirstName)
from Employees
-- Consulta N° 28
select Fecha = GETDATE(),
	   Año = YEAR(GETDATE()),
	   Mes = MONTH(GETDATE()),
	   Dia = DAY(GETDATE())
-- Consulta N° 29
select * 
from Orders
where YEAR(OrderDate) = 1998
-- Consulta N° 30
select OrderID Numero,
	   OrderDate [Fecha Pedido],
	   ShipName 'Nombre Nave'
from Orders
where YEAR(OrderDate) = 1998
-- Consulta N° 31
select OrderID Numero,
       CustomerID,
	   ShippedDate 'Fecha de Envio'
from Orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) in (1,2)
-- Consulta N° 32
select OrderID Numero,CustomerID,ShippedDate [Fecha de Envio]
from orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) in (10,11,12)
-- Consulta N° 33
select CustomerID,CompanyName
from Customers
where CompanyName = 'Antonio Moreno Taquería'
-- Consulta N° 34
select CustomerID,OrderID Numero,OrderDate,ShippedDate
from Orders
where (ShippedDate between convert(datetime,'15/05/1997',103) and CONVERT(datetime, '30/05/1997',103)) and CustomerID = 'ANTON'
-- Consulta N° 35
select *
from  Orders
where OrderDate between convert(datetime,'15/01/1997',103) and convert(datetime,'30/04/1997',103)
-- Consulta N° 36
select Fecha = GETDATE(),
       [Numero Año] = DATEPART(YY,GETDATE()),
	   [Nombre Mes] = DATEPART(MM,GETDATE()),
	   Trimestre = DATEPART(QQ,GETDATE()),
	   'Nombre del Dia' = DATENAME(Dw,GETDATE())
-- Consulta N° 37
select OrderID,ShippedDate
from Orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) = 6 and DATENAME(dw,ShippedDate) = 'Tuesday'
-- Consulta N° 38
select OrderID,ShippedDate
from Orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) = 6 and DATEPART(dw,ShippedDate) = 3
-- Consulta N° 39
select  Fecha  = GETDATE(),
        [Nueva Fecha] = DATEADD(DD,5,GETDATE()) -- Adelantando 5 Dias
-- Consulta N° 40
select Fecha = GETDATE(),
       [Nueva Fecha] = DATEADD(MM,5,GETDATE()) -- Adelantando 5 Meses
-- Consulta N° 41
select Fecha = GETDATE(),
       [Nueva Fecha] = DATEADD(YY,5,GETDATE()) -- Adelantando 5 Años
-- Consulta N° 42
select OrderID,OrderDate,ShippedDate,[Dias Diferencia] = DATEDIFF(DD,OrderDate,ShippedDate)
from Orders
where CustomerID = 'ANTON'
-- Consulta N° 43
select P.ProductID,P.ProductName,C.CategoryName
from Products as P inner join Categories as C on P.CategoryID = c.CategoryID
-- Consulta N° 44
select P.ProductID,P.ProductName,P.UnitsInStock,S.CompanyName,S.ContactName
from Products as P inner join Suppliers as S on P.SupplierID = S.SupplierID
-- Consulta N° 45
select P.ProductID,P.ProductName,C.CategoryName,S.CompanyName,S.ContactName
from Products as P inner join Categories as C on P.CategoryID = C.CategoryID
     inner join Suppliers as S on P.SupplierID = S.SupplierID
-- Consulta N° 46
select O.OrderID,o.OrderDate,O.ShippedDate,'Nombres y Apellidos' = E.LastName + ' ' + E.FirstName
from Orders as O inner join Employees as E on O.EmployeeID = E.EmployeeID
where YEAR(OrderDate) = 1998 and MONTH(OrderDate) between 1 and 6 
-- Consulta N° 47
select P.ProductName Producto,D.Quantity Cantidad,D.UnitPrice 'Precio Unitario',Importe = D.UnitPrice * D.Quantity
from [Order Details] D inner join Products P on D.ProductID = P.ProductID
where OrderID = 10535
-- Consulta N° 47
select ProductID,ProductName,UnitPrice,C.CategoryName
from Products P inner join Categories C on P.CategoryID = C.CategoryID
where CategoryName = 'Beverages'
-- Consulta N° 48
select P.ProductID,P.ProductName,P.UnitPrice,C.CategoryName
from Products P inner join Categories C on P.CategoryID = C.CategoryID
where CategoryName in (select CategoryName
					   from Categories
					   where CategoryName = 'Beverages')
-- Consulta N° 49
select O.OrderID [N° Pedido],O.ShipName [Enviado A],O.ShippedDate [Fecha Envio]
from Orders O inner join Employees E on O.EmployeeID = E.EmployeeID
	 inner join Shippers S on o.ShipVia = S.ShipperID
where YEAR(O.ShippedDate) in (1997)
-- Consulta N° 50
select OrderID,ShippedDate,ShipName, LastName + ',' + FirstName Empleado,S.CompanyName
from Orders O inner join Employees E on O.EmployeeID = E.EmployeeID
	 inner join Shippers S on O.ShipVia = S.ShipperID
where YEAR(ShippedDate)  = 1997 and MONTH(ShippedDate) in (1,2,3)
order by MONTH(ShippedDate) asc
-- Consulta N° 51
insert Categories (CategoryName) values ('Computo');
select P.ProductName,C.CategoryName
from Categories C left join Products P on C.CategoryID = p.CategoryID
-- Consulta N° 52
select P.ProductName,C.CategoryName
from Categories C right join Products P on C.CategoryID = P.CategoryID
-- Consulta N° 53
select ProductName,C.CategoryName
from Categories C full join Products P on C.CategoryID = P.CategoryID
-- Consulta N° 54
update Products set UnitPrice = 99.99
where ProductName = 'Chai'
-- Consulta N° 55
update Customers set City = 'Lima',Country = 'Peru'
where CompanyName in ('Antonio Moreno Taquería')
-- Consulta N° 56
update Products set UnitsInStock = UnitsInStock + 2
where CategoryID = 1
-- Consulta N° 57
delete from Products 
where ProductName = 'Chai'
-- Consulta N° 58
select ProductID,ProductName,CategoryID
from Products
where CategoryID = (select CategoryID
					from Categories
					where CategoryName = 'Condiments')
-- Consulta N° 59
select OrderID,OrderDate,ShippedDate,ShipVia
from Orders
where ShipVia in (select ShipperID	
				  from Shippers
				  where CompanyName = 'Speedy Express')
-- Consulta N° 60
select CompanyName,City
from Customers
where City = (select City
			  from Customers
			  where CompanyName = 'Antonio Moreno Taquería')
-- Consulta N° 61
update Customers set City = 'México D.F.'
where CustomerID = 'ANTON'
-- Consulta N° 62
select ProductName,UnitPrice
from Products
where ProductID in (select ProductID
					from [Order Details]
					where Quantity > 100)
-- Consulta N° 63
select Country Pais,COUNT(*) Cantidad
from Customers
group by Country
order by Country
--
use Northwind
/* Informacion de una Tabla */
SELECT *
FROM Northwind.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Customers'

set statistics time on;





