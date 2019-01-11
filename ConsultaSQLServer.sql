use master
create database BDEJEMPLO
go

use BDEJEMPLO
go

-- crear tabla forma 1
go
CREATE TABLE employees
( employee_id INT PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  salary MONEY
);
-- crear tabla forma 2
go
CREATE TABLE employees
( employee_id INT,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  salary MONEY,
  CONSTRAINT employees_pk PRIMARY KEY (employee_id)
);
-- crear tabla forma 3
go
CREATE TABLE employees
( last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  salary MONEY,
  CONSTRAINT employees_pk PRIMARY KEY (last_name, first_name)
);

-- alterar tabla y agregar primary key
ALTER TABLE employees
ADD CONSTRAINT employees_pk PRIMARY KEY (employee_id);

ALTER TABLE employees
ADD CONSTRAINT employees_pk PRIMARY KEY (last_name, first_name);

-- eliminar primary key
ALTER TABLE employees
DROP CONSTRAINT employees_pk;

-- desabilitar primary key
ALTER INDEX employees_pk ON employees
DISABLE;
-- habilitar primary key
ALTER INDEX employees_pk ON employees
REBUILD;

-- crear tabla con referencia foreign key
CREATE TABLE products
( product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(25)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  quantity INT,
  min_level INT,
  max_level INT,
  CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
);

-- crear 2 foreign key en  constraint
CREATE TABLE products
( product_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  category VARCHAR(25)
  CONSTRAINT products_pk PRIMARY KEY (product_name, location)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  quantity INT,
  min_level INT,
  max_level INT,
  CONSTRAINT fk_inv_product
    FOREIGN KEY (product_name, location)
    REFERENCES products (product_name, location)
);

-- alterar tabla y agregar constraint 
ALTER TABLE inventory
ADD CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id);

ALTER TABLE inventory
ADD CONSTRAINT fk_inv_product
    FOREIGN KEY (product_name, location)
    REFERENCES products (product_name, location);

-- tabla eliminacion en cascada

CREATE TABLE products
( product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(25)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  quantity INT,
  min_level INT,
  max_level INT,
  CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
    ON DELETE CASCADE
);

-- alterar tabla
ALTER TABLE inventory
ADD CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
    ON DELETE CASCADE;

CREATE TABLE products
( product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(25)
);

CREATE TABLE inventory
( inventory_id INT PRIMARY KEY,
  product_id INT,
  quantity INT,
  min_level INT,
  max_level INT,
  CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
    ON DELETE SET NULL
);

ALTER TABLE inventory
ADD CONSTRAINT fk_inv_product_id
    FOREIGN KEY (product_id)
    REFERENCES products (product_id)
    ON DELETE SET NULL;

ALTER TABLE inventory
DROP CONSTRAINT fk_inv_product_id;

-- desabilitar foreign key
ALTER TABLE inventory
NOCHECK CONSTRAINT fk_inv_product_id;

-- activar foreign key
ALTER TABLE inventory
CHECK CONSTRAINT fk_inv_product_id;

-- constraint unique

CREATE TABLE employees
( employee_id INT PRIMARY KEY,
  employee_number INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY,
  CONSTRAINT employees_unique UNIQUE (employee_number)
);

CREATE TABLE employees
( employee_id INT PRIMARY KEY,
  employee_number INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY,
  CONSTRAINT employees_unique UNIQUE (last_name, first_name)
);

-- alterar tabla

ALTER TABLE employees
ADD CONSTRAINT employees_unique UNIQUE (employee_number);

ALTER TABLE employees
ADD CONSTRAINT employee_name_unique UNIQUE (last_name, first_name);


ALTER TABLE employees
DROP CONSTRAINT employees_unique;

-- restriccion check

CREATE TABLE employees
( employee_id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY,
  CONSTRAINT check_employee_id
    CHECK (employee_id BETWEEN 1 and 10000)
);

CREATE TABLE employees
( employee_id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY,
  CONSTRAINT check_salary
    CHECK (salary > 0)
);

-- alterar tabla y agregar check

ALTER TABLE employees
ADD CONSTRAINT check_last_name
  CHECK (last_name IN ('Smith', 'Anderson', 'Jones'));

-- eliminar constraint

ALTER TABLE employees
DROP CONSTRAINT check_last_name;

-- habilitar constraint
ALTER TABLE employees
WITH CHECK CHECK CONSTRAINT check_salary;

-- desabilitar constraint
ALTER TABLE employees
NOCHECK CONSTRAINT check_salary;

-- crear indices
CREATE INDEX contacts_idx
  ON contacts (last_name);

CREATE INDEX contacts_idx
  ON contacts (last_name, first_name);

CREATE INDEX contacts_idx
  ON contacts (last_name DESC, first_name DESC);

-- index unique
CREATE UNIQUE INDEX contacts_uidx
  ON contacts (last_name, first_name);

CREATE UNIQUE CLUSTERED INDEX contacts_uidx
  ON contacts (last_name, first_name);

-- renombrar index
sp_rename 'contacts.contacts_idx', 'contacts_index_cname', 'INDEX';

--eliminar index
DROP INDEX contacts.contacts_idx;

select * from Categories -- 8
 select * from Employees --9
 select * from Products --77
 select * from Suppliers -- 29
 select * from CustomerCustomerDemo -- 0
 select * from CustomerDemographics -- 0
 select * from Customers -- 91
 select * from EmployeeTerritories -- 49
  select * from Orders -- 830
 select * from [Order Details] -- 2155
 select * from Region -- 4
 select * from Shippers -- 3 
 select * from Territories -- 53
 
 -- Ejemplo N°1
 Select CustomerID,CompanyName
 From Customers
 -- Ejemplo N°2 - alias de campo
 Select CustomerID Codigo
 From Customers Cliente
 -- Ejemplo N°3 
 Select CustomerID Codigo,CompanyName 'Cliente Extranjero'
 From Customers
 -- Ejemplo N°4 - Recuperar los datos de una tabla
 Select * from Products
 -- Ejemplo N°5 - clasificacion y ordenamiento
 Select ProductID,ProductName,UnitPrice
 From Products
 -- Asc -> ascendente y Desc -> Descendente
 -- Ejemplo N°6 - Clasificacion y ordenamiento
 Select Country,City,CompanyName
 From Customers
 order by Country,City
 -- Ejemplo N°7 recuperar los 5 primeros
 Select top 5 Country,City,CompanyName
 From Customers
 -- Ejemplo N°8 
 Select CustomerID,CompanyName
 From Customers
 where City = 'Madrid'
 -- Ejemplo N°9
 Select CustomerID,CompanyName,City
 From Customers
 where City = 'Madrid' or City = 'Barcelona' 
 -- Ejemplo N°10
 Select  ProductID,ProductName,UnitPrice,CategoryID
 From Products
 --where  CategoryID in( 4,6) and UnitPrice >=  100
 where  (CategoryID = 4 or  CategoryID = 6) and UnitPrice >=  100
 -- Ejemplo N°11 - Pedido numero 10535
 Select * from [Order Details]
 where OrderID = 10535
 -- Ejemplo N° 12      
 Select ProductName,UnitPrice,IGV = UnitPrice*0.18, Total = UnitPrice+ (UnitPrice*0.18) --UnitPrice*0.18 as [IGV 18%]
 From Products
 order by ProductName
 -- Ejemplo N° 13
 Select OrderId,Quantity,UnitPrice,Importe = Unitprice*Quantity,ProductID
 from [Order Details]	
 where ProductID = 11 or ProductID = 12
 order by ProductID
 -- Ejemplo N° 14
 Select * From Customers
 where City in ('Madrid','Buenos Aires','London')
 -- Ejemplo N° 15
 Select ProductName,UnitPrice
 from Products
 where UnitPrice between 10 and 20
 -- Ejemplo N° 16
 Select CompanyName,City
 from Customers
 where CompanyName like 'A%'
 -- Ejemplo N° 17
 Select ProductName,UnitPrice
 From Products
 Where ProductName like 'C%' and(UnitPrice>=10 and UnitPrice<=20) -- UnitPrice between 10 and 20
 -- Ejemplo N° 18
 Select ProductName
 From Products 
 Where ProductName like '__A%'
 -- Ejemplo N° 19
 Select *
 From Customers
 Where  CompanyName  like '___p'
  -- Ejemplo N° 20
 Select ProductName,LEFT(ProductName,5)as [Metodo Left],RIGHT(ProductName,5) as[Metodo Right],SUBSTRING(ProductName,3,8)as[Metodo SubString]
 From Products
 -- Ejemplo N° 20
 print len('Sise')
-- Ejemplo N° 21
 Select CompanyName,Longitud = LEN(CompanyName)
 from Customers
 -- Ejemplo N° 21
 Select CompanyName,Mayusculas = UPPER(CompanyName),Minuscula = LOWER(CompanyName)
 from Customers
  -- Ejemplo N° 22
 Select Empleado = FirstName + SPACE(10)+LastName
 from Employees
 -- Ejemplo N° 23
 Select ProductName ,Reversa = reverse(ProductName),[Cambio "A" por "X"] =replace (ProductName,'A','X')
 from Products
 --Ejemplo N° 24
 Select Nombre1 = LastName+','+FirstName,Nombre2 = RTRIM(LastName)+','+LTRIM(FirstName)		
 from Employees
 --Ejemplo N° 25
 Select Fecha = GETDATE(),Año = YEAR(GETDATE()), Mes = MONTH(GetDate()),Dia = DAY(GetDate())
 --Ejemplo N° 26
 Select * From Orders
 where YEAR(OrderDate) = 1998
--Ejemplo N° 27
 Select OrderID Numero , OrderDate [Fecha Pedido],ShipName 'Fecha Pedido'
 From Orders
 where YEAR(OrderDate) = 1998
--Ejemplo N° 28
Select OrderID Numero,CustomerID,ShippedDate 'Fecha de Envio'
 From Orders
 where  Year(ShippedDate) = 1997 and MONTH(ShippedDate)in (1,2) 
 --Ejemplo N° 29
 Select OrderID Numero,CustomerID,ShippedDate 'Fecha de Envio' 
 From Orders
 where Year(ShippedDate) = 1997 and MONTH(ShippedDate)in (10,11,12) 
 --Ejemplo N° 30
 Select * From Orders
 where OrderDate between '15/01/1997' and '30/04/1997'
  --Ejemplo N° 31
  select CustomerID,CompanyName
  from Customers 
  where  CompanyName = 'Antonio Moreno Taquería'
  -----------------------------------------------------------------  
 Select CustomerID,OrderID Numero,OrderDate,ShippedDate
 From Orders
 where (ShippedDate between '15/05/1997' and '30/05/1997') and CustomerID = 'ANTON'
 --Ejemplo N° 32
 Select Fecha = GETDATE(),
        'Numero Año' = DATEPART(YY,GETDATE()),
        'Nombre Mes' = DATEPART(MM,GETDATE()),
        'Trimestre'  = DATEPART(QQ,GETDATE()),
        'Nombre De Dia De Semana' = DATENAME(DW,GETDATE())
        
 --Ejemplo N° 32
 Select OrderID,ShippedDate
 From Orders
 where  YEAR(ShippedDate) = 1997 and  MONTH(ShippedDate) = 6 and DATENAME(Dw,ShippedDate) = 'Martes'
 --Ejemplo N° 33
 Select OrderID,ShippedDate
 From Orders
 where  YEAR(ShippedDate) = 1997 and  MONTH(ShippedDate) = 6 and DATEPART(Dw,ShippedDate) = 3
 --Ejemplo N° 34
 Select Fecha = GETDATE(),Fecha =DATEADD(DD,5,GETDATE()) -- adelantar 5 dias
 --Ejemplo N° 35
 Select Fecha = GETDATE(),Fecha =DATEADD(MM,5,GETDATE()) -- adelantar 5 Meses
  --Ejemplo N° 35
 Select Fecha = GETDATE(),Fecha =DATEADD(YY,5,GETDATE()) -- adelantar 5 Años
--Ejemplo N° 34
 Select OrderID,OrderDate,ShippedDate, Diferencia = DATEDIFF(DD,OrderDate,ShippedDate)
 From Orders
 Where CustomerID = 'ANTON'
 --Ejemplo N° 35
 Select P.ProductID,P.ProductName,C.CategoryName
 From Products as P inner join Categories as C on P.CategoryID = C.CategoryID
 --Ejemplo N° 36
 Select P.ProductID,P.ProductName,P.UnitsInStock,S.CompanyName,S.ContactName
 From Products as P inner join Suppliers as S  on P.SupplierID = S.SupplierID
 --Ejemplo N° 37
 Select P.ProductID,P.ProductName,C.CategoryName,S.CompanyName,S.ContactName
 From Products as P inner join Categories as C on P.CategoryID = C.CategoryID
      inner join Suppliers as S on P.SupplierID = S.SupplierID
 --Ejemplo N° 37
 Select O.OrderID,O.OrderDate,O.ShippedDate,'Nombres y Apellidos' = E.LastName+' '+FirstName
 From Orders as O inner Join Employees as E on O.EmployeeID = E.EmployeeID
 Where   YEAR(OrderDate)= 1998 and MONTH(OrderDate) between 1 and 6 --MONTH(OrderDate) in (1,2,3,4,5,6)
 --Ejemplo N° 38
 Select P.ProductName Producto,D.Quantity Cantidad,D.UnitPrice 'Precio Unitario',Importe = D.UnitPrice*D.Quantity
 From [Order Details] D Inner Join Products P on D.ProductID = P.ProductID
 where OrderID = 10535
 -- Ejemplo N° 39
 Select ProductID,ProductName,UnitPrice,CategoryName
 From Products P inner join Categories  C on P.CategoryID = C.CategoryID
 Where CategoryName = 'Beverages'
-- Ejemplo N° 40
 Select ProductID,ProductName,UnitPrice,CategoryName
 From Products P inner join Categories  C on P.CategoryID = C.CategoryID
 Where CategoryName in (Select CategoryName
					   from Categories
					   where CategoryName = 'Beverages')
-- Ejemplo N° 41
 Select O.OrderID [N° Pedido],O.ShipName [Enviado A],O.ShippedDate [Fecha Envio],
		E.LastName+' '+E.FirstName [Apellido y Nombre],S.CompanyName [Distribuidor]
 From  Orders O Inner Join Employees E on  O.EmployeeID= E.EmployeeID
	   Inner Join Shippers S on O.ShipVia = S.ShipperID
 Where	YEAR(O.ShippedDate)in (1997)	 
  
-- Ejemplo N° 42
Select OrderID,ShippedDate,ShipName,LastName+','+FirstName Empleado,CompanyName
From Orders  O inner join Employees E on o.EmployeeID = E.EmployeeID
     inner join  Shippers S on o.ShipVia = S.ShipperID
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) in(1,2,3) --Datepart(ShippeDate) = 1
order by  MONTH(ShippedDate)asc
 -- Ejemplo N° 43
 Insert Categories(CategoryName) values ('Computo')
 Insert Products (ProductName,UnitPrice) values ('Mouse',25)
  -- Ejemplo N° 44
 Select ProductName,CategoryName
 From Categories C left join Products P on C.CategoryID = P.CategoryID 
 -- Ejemplo N° 45
 Select ProductName,CategoryName
 From Categories C right join Products P on C.CategoryID = P.CategoryID
  -- Ejemplo N° 46
  Select ProductName,CategoryName
 From Categories C full join Products P on C.CategoryID = P.CategoryID 
 -- Ejemplo N° 47
 select * from Products
 Update Products set UnitPrice = 99.99
 where ProductName = 'Chai'
  -- Ejemplo N° 48
 Select * from Customers
 Update Customers set City = 'Lima' , Country = 'Peru'
 where CompanyName in ('Antonio Moreno Taquería' )
 -- Ejemplo N° 49
 Select * from Products
 where CategoryID = 1
  Update Products set UnitsInStock = UnitsInStock +2
 where CategoryID = 1
  -- Ejemplo N° 50
  Delete from Products
  Where ProductName = 'Mouse'
  -- Ejemplo N° 51
   Delete from Products
  Where ProductName = 'Chai'  
  -- Ejemplo N° 52
  Select ProductID,ProductName,CategoryID
  From Products
  where  CategoryID = (Select CategoryID
					   From Categories
					   where CategoryName ='Condiments' )
    -- Ejemplo N° 53
  Select OrderID,OrderDate,ShippedDate,ShipVia
  From Orders
  where ShipVia in (select ShipperID
				   from Shippers
				   where CompanyName = 'Speedy Express')
  -- Ejemplo N° 54
  Select CompanyName,City
  From Customers
  where City = (Select City
				from Customers
				Where CompanyName = 'Antonio Moreno Taquería')  
  -- Ejemplo N° 55
  Update Customers Set City = 'México D.F.'
  where CustomerID = 'ANTON'
  -- Ejemplo N° 56
  Select ProductName,UnitPrice
  From Products
  Where ProductID in (Select ProductID
					from [Order Details]
					where Quantity>100)
  Order By  ProductName
  -- Ejemplo N° 57
  Create view Vista1
  as
  Select  ProductID Codigo,ProductName Producto ,UnitsInStock Stock
  From Products
  go  
  Select * from Vista1
  go
  -- Ejemplo N° 58
  Alter View Vista1
  as
  Select ProductID,ProductName,UnitsInStock,UnitPrice
  From Products
  go  
  Select * from Vista1
  -- Ejemplo N° 59
  Create view Vista2
  as
  Select C.CustomerID Codigo,C.CompanyName Nombre,C.Address Direccion,C.City Ciudad,C.Country Pais
  From Customers C
  go
  
  select * from Vista2
  go  
  -- Ejemplo N° 60
  Create View Vista3
  as
  Select P.ProductName,P.UnitsInStock,C.CategoryName
  From Products P inner join Categories C on P.CategoryID = C.CategoryID
  go   
  select * from Vista3
  -- Ejemplo N° 61
  Create View Vista4
  as
  Select CompanyName,Address,City
  From Customers
  where Country = 'Argentina'
  go
  select * from Vista4  
  -- Ejemplo N° 62
  Drop View Vista1  
  -- Ejemplo N° 63
  Select Country Pais,Count(*) Cantidad
  From Customers
  group by Country
  order by Country  
  -- Ejemplo N° 64
  Select Country Pais ,Count(*) Cantidad
  from Customers 
  group by Country
  Order by Country 
  -- Ejemplo N° 65
  Select City Ciudad,Count(*)Cantidad
  From  Suppliers 
  group by City
  order By City  
  -- Ejemplo N° 66
  Select C.CategoryName ,COUNT(*) Cantidad
  from Categories C  inner join Products P on P.CategoryID =  C.CategoryID 
  group by CategoryName
  order by CategoryName DESC --  Se puede especificar un numero de acuerdo al tipo de columna que queremos
  -- Ejemplo N° 67
  Select Country Pais,City Ciudad,Count(*)Cantidad
  from Customers 
  group By  Country,City 
  Order By Country,City    
  -- Ejemplo N° 68
 Select Country Pais,City Ciudad,Count(*)Cantidad
  from Customers 
  group By  Country,City   Having Count(*)>2 -- filtro especialmente para grupos
  Order By Country,City   
  -- Ejemplo N° 69
  Select ShipName 'Enviados a',COUNT(*)'1997'
  From Orders 
  Where  Year(ShippedDate)= 1997
  group by ShipName 
  Order By ShipName 
  -- Ejemplo N° 70
  Create View PedidosEnviados97
  as
  Select ShipName 'Enviados a',COUNT(*)'1997'
  From Orders 
  Where  Year(ShippedDate)= 1997
  group by ShipName 
  --Order By ShipName 
  go
  Select * from PedidosEnviados97  
  -- Ejemplo N° 71
  Select OrderID,Quantity,UnitPrice,Importe = UnitPrice * Quantity 
  From [Order Details] 
  where OrderID =  10535
  ------------------------------------
  Select OrderID,Sum( UnitPrice * Quantity ) [Suma Total De 10535]
  From [Order Details] 
  where OrderID =  10535
  Group By OrderID
  -- Ejemplo N° 72
  Select Año = year(ShippedDate ), Mes = DateName(mm,ShippedDate ),COUNT(*) Cantidad
  from Orders
  where ShippedDate not in ('')
  group by ShippedDate
  order by  Month(ShippedDate )
    
  select * from orders
  where ShippedDate is null  
  -- Ejemplo N° 73
  Select P.ProductName,SUM(OD.Quantity ) Cantidad
  From Products P  inner Join [Order Details] OD on P.ProductID  = OD.ProductID
       inner Join Orders O on O.OrderID = OD.OrderID 
  where YEAR(OrderDate)= 1997 
  group By  ProductName
  Order By ProductName   
  -- Ejemplo N° 74
  Select ProductName [Nombre Producto],UnitPrice as 'Precio Unitario',CategoryName  'Categoria Producto'
  From Products P inner Join Categories C on P.CategoryID = C.CategoryID 
  where UnitPrice > (Select AVG(UnitPrice)-- Media de todos los precios
					  from Products) -- 28.8663  
  -- Ejemplo N° 75
  Select OrderID [#Pedido],ShippedDate 'Fecha Envio',CompanyName [Distribuido Por]
  from Orders O inner join Shippers S on O.ShipVia = S.ShipperID 
  where YEAR(ShippedDate)= 1997  and  Datepart(qq,ShippedDate)= 4  --MONTH(ShippedDate)in (10,11,12)  
  -- Ejemplo N° 76
  Select OD.OrderID #Pedido,OD.Quantity Cantidad ,P.ProductName[Nombre Producto],P.UnitPrice 'Precio Unitario'
  From [Order Details] OD inner join Products P on Od.ProductID = P.ProductID
  where OD.OrderID = 10248  
  -- Ejemplo N° 77
  Select P.ProductID,P.ProductName,P.UnitsInStock,C.CategoryName
  From Products P inner join Categories C  On P.CategoryID = C.CategoryID
  where C.CategoryID = (Select CategoryID 
					  from Categories
                      where CategoryName = 'Condiments' ) 
  -- Ejemplo N° 78
  select * from Categories 
  select * from Products   
--__________________________________________________________________________________________________________________________
  
  Use master
use Northwind 
go

Select COUNT(*) from Territories 

Select * from Categories -- Categorias -- 8
Select * from CustomerCustomerDemo  -- Demostracion de Cliente -- 0
Select * from CustomerDemographics --Datos demográficos de los clientes -- 0
Select * from Customers -- Clientes -- 91
Select * from EmployeeTerritories -- Territorios del Empleado -- 49
Select * from Employees -- Empleado -- 9
Select * from [Order Details]-- Detalles Del Pedido -- 2155
Select * from Orders -- Pedidos -- 830
Select * from Products -- Productos -- 77
Select * from Shippers --Distribuidores -- 3
Select * from Suppliers -- Proveedores -- 29
Select * from Territories -- Territorios -- 53
---------------------------------Ejercicios N°1---------------------------------
Select CustomerID, CompanyName 
from Customers 
---------------------------------Ejercicios N°2---------------------------------
Select  lower(CustomerID) 'Codigo Cliente'
from Customers Clientes
---------------------------------Ejercicios N°3---------------------------------
Select CustomerID 'Codigo Cliente',CompanyName "Nombre Compañia" 
From Customers 
---------------------------------Ejercicios N°4---------------------------------
Select * from Orders 
---------------------------------Ejercicios N°5---------------------------------
Select ProductID,ProductName,UnitPrice     
from Products 
---------------------------------Ejercicios N°6---------------------------------
Select top 10 Country,City,CompanyName   
from Customers 
---------------------------------Ejercicios N°7---------------------------------
Select CustomerID,CompanyName  
from Customers 
where City = 'Madrid'
---------------------------------Ejercicios N°8---------------------------------
Select CustomerID,CompanyName,City  
from Customers 
where City in ('Madrid','Barcelona')--City = 'Madrid'or City = 'Barcelona'
---------------------------------Ejercicios N°9---------------------------------
Select ProductID,ProductName,UnitPrice,CategoryID    
from Products
where (CategoryID in(4,6))and UnitPrice >= 100--(CategoryID = 4 or CategoryID = 6)and UnitPrice >=100
---------------------------------Ejercicios N°10---------------------------------
Select * from [Order Details] 
where OrderID in(10535)--OrderID = 10535
---------------------------------Ejercicios N°11---------------------------------
Select ProductID,UnitPrice, IGV = UnitPrice *0.18,Total = UnitPrice+(UnitPrice *0.18)  
from Products 
Order By ProductID Asc
---------------------------------Ejercicios N°12---------------------------------
Select OrderID,Quantity,UnitPrice,'Importe Total' =  UnitPrice * Quantity 
from [Order Details] 
where ProductID = 11 or ProductID = 12--ProductID in(11,12)
Order By OrderID 
---------------------------------Ejercicios N°13---------------------------------
Select ProductName,UnitPrice  
From Products
where UnitPrice  between 10 and 20
order by UnitPrice 
---------------------------------Ejercicios N°14---------------------------------
Select *From Customers
Where City in('Madrid','Buenos Aires','London')
order By City
---------------------------------Ejercicios N°15---------------------------------
Select CompanyName,City 
from Customers 
Where CompanyName like 'F%' 
---------------------------------Ejercicios N°16---------------------------------
Select ProductName,UnitPrice  
from Products 
where  ProductName like 'C%'and UnitPrice between 10 and 20--(UnitPrice >=10 and UnitPrice<=20)
Order By UnitPrice 
---------------------------------Ejercicios N°17---------------------------------
Select ProductName 
from Products 
where ProductName like '__A%'
---------------------------------Ejercicios N°18---------------------------------
Select  * from Customers 
where CompanyName like '___P%'
---------------------------------Ejercicios N°19---------------------------------
Select ProductName,LEFT(ProductName,5) 'Metodo Left',RIGHT(ProductName,5) 'Metodo Right',SUBSTRING(ProductName,3,5)[Metodo SubString]
from Products 
---------------------------------Ejercicios N°20---------------------------------
Print len('Victor Kevin Matos Secce')
---------------------------------Ejercicios N°21---------------------------------
Select CompanyName,'Longitud De Caracter' = len(CompanyName) 
from Customers 
---------------------------------Ejercicios N°22---------------------------------
Select CompanyName,"Texto Mayuscula" = UPPER(CompanyName),'Texto Minuscula'= LOWER(CompanyName )
from Customers 
---------------------------------Ejercicios N°23---------------------------------
Select 'Nombre Empleado' = FirstName + SPACE(10)+ LastName 
from Employees 
---------------------------------Ejercicios N°24---------------------------------
Select ProductName,REVERSE(ProductName )'Texto Reverso',REPLACE(ProductName,'A','E') 'Reemplazo A por E' 
From Products
---------------------------------Ejercicios N°25---------------------------------
Select 'Nombre'  = FirstName +' , '+LastName,[Nombre Sin Espacios] = RTRIM(LastName)+' , '+LTRIM(FirstName) 
from Employees 
---------------------------------Ejercicios N°26---------------------------------
Select 'Fecha Actual' = GETDATE(),'Año Actual' = YEAR(GETDATE()),'Mes Actual' = MONTH(GETDATE()),'Dia Actual' = DAY(GETDATE())  
---------------------------------Ejercicios N°27---------------------------------
Select * From Orders 
Where YEAR(OrderDate) = 1998
Order By OrderID 
---------------------------------Ejercicios N°28---------------------------------
Select OrderID 'Numero De Orden',OrderDate [Fecha De Pedido],ShippedDate "Fecha Envio"   
From Orders
where YEAR(OrderDate) = 1998
Order By OrderID 
---------------------------------Ejercicios N°29---------------------------------
Select OrderID 'N° Orden',CustomerID'Codigo Cliente',ShippedDate[Fecha Envio]   
from Orders
Where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate)between 1 and 2--MONTH(ShippedDate)in (1,2)
---------------------------------Ejercicios N°30---------------------------------
Select OrderID Orden,CustomerID 'Codigo Cliente',ShippedDate 'Fecha Envio'  
from Orders
Where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate)between 10 and 12--MONTH(ShippedDate) in (10,11,12) 
order by OrderID 
---------------------------------Ejercicios N°31---------------------------------
Select CustomerID,CompanyName  
From Customers 
where CompanyName = 'Antonio Moreno Taquería'
---------------------------------Ejercicios N°32---------------------------------
Select CustomerID 'Codigo Cliente',OrderID 'Codigo de Orden',OrderDate 'Fecha De Pedido',ShippedDate'Fecha Envio'    
From Orders
where (ShippedDate between '15/05/1997'and '30/05/1997') and CustomerID like 'ANTON'
---------------------------------Ejercicios N°33---------------------------------
Select DATEPART(YY,GETDATE()) 'Numero Año',
	   DATEPART(MM,GETDATE()) 'Numero Mes' ,
	   DatePart(DD,getdate()) 'Numero Dia',
	   Datepart(QQ,getdate()) 'Numero Del Trimestre',
	   DateName(Dw,getdate()) 'Nombre Del Dia',
	   DateName(MM,getdate()) 'Nombre Del Mes'
---------------------------------Ejercicios N°34---------------------------------
Select OrderID,ShippedDate  
from Orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) = 6 And DATENAME(Dw,ShippedDate)= 'Martes'
---------------------------------Ejercicios N°35---------------------------------
Select OrderID,ShippedDate  
From Orders
where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) = 6 and DatePart(DW,ShippedDate) =3
---------------------------------Ejercicios N°36---------------------------------
Select 'Fecha Actual' = GETDATE(),'Fecha Adelantado 5 Dias' = DATEADD(DD,5,GETDATE()) 
Select 'Fecha Actual' = GETDATE(),'Fecha Adelantado 5 Meses' = DATEADD(MM,5,GETDATE() ) 
Select 'Fecha Actual' = GETDATE(),'Fecha Adelantado 5 Años' = DATEADD(YY,5,GETDATE())
---------------------------------Ejercicios N°37---------------------------------
Select OrderID,OrderDate,ShippedDate,DATEDIFF(DD,OrderDate,ShippedDate) 'Diferencia entre F. Pedido y F.Envio'  
from Orders 
where CustomerID like 'ANTON'
---------------------------------Ejercicios N°38---------------------------------
Select P.ProductID,P.ProductName,C.CategoryName  
From Products P inner join Categories C on P.CategoryID = C.CategoryID 
order By ProductID 
---------------------------------Ejercicios N°39---------------------------------
Select P.ProductID,P.ProductName,P.UnitsInStock,S.CompanyName,S.ContactName     
From Products P inner join Suppliers S on P.SupplierID = S.SupplierID 
Order by ProductID 
---------------------------------Ejercicios N°40---------------------------------
Select P.ProductID ,P.ProductName ,C.CategoryName,S.CompanyName,S.ContactName    
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
     inner join Suppliers S on P.SupplierID = S.SupplierID  
---------------------------------Ejercicios N°41---------------------------------
Select O.OrderID,O.OrderDate,o.RequiredDate,'Nombre Empleado' = E.FirstName +','+ E.LastName    
From Orders O inner join Employees E on O.EmployeeID = E.EmployeeID 
where YEAR(ShippedDate) = 1998 and MONTH(OrderDate) between 1 and 6
---------------------------------Ejercicios N°42---------------------------------
Select P.ProductName 'Nombre Producto',OD.Quantity 'Cantidad',OD.UnitPrice 'Precio Unitario',Importe = OD.UnitPrice *OD.Quantity   
From [Order Details] OD inner join Products P on OD.ProductID = P.ProductID 
where OD.OrderID = 10535
---------------------------------Ejercicios N°43---------------------------------
Select P.ProductID,P.ProductName,P.UnitPrice,C.CategoryName   
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
Where CategoryName like 'Beverages'
---------------------------------Ejercicios N°44---------------------------------
Select P.ProductID,P.ProductName,P.UnitPrice,C.CategoryName   
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
Where CategoryName like (Select CategoryName
						 from Categories 
						 where CategoryName like 'Beverages')
---------------------------------Ejercicios N°45---------------------------------
Select O.OrderID 'N° Pedido',O.ShipName 'Enviado a',ShippedDate 'Fecha Envio',E.LastName+''+E.FirstName 'Empleado' ,
       S.CompanyName 'Nombre Compañia'     
from Orders O inner join Employees E on O.EmployeeID = E.EmployeeID 
     inner join Shippers S on O.ShipVia = S.ShipperID 
where YEAR(O.ShippedDate) in (1997)
---------------------------------Ejercicios N°46---------------------------------
Select O.OrderID 'N° Pedido',O.ShipName 'Enviado a',ShippedDate 'Fecha Envio',E.LastName+''+E.FirstName 'Empleado' ,
       S.CompanyName 'Nombre Compañia'     
from Orders O inner join Employees E on O.EmployeeID = E.EmployeeID 
     inner join Shippers S on O.ShipVia = S.ShipperID 
where YEAR(O.ShippedDate) in (1997)and DATEPART(QQ,ShippedDate)  = 1
order by MONTH(ShippedDate)Asc
---------------------------------Ejercicios N°47---------------------------------
insert Categories (CategoryName)values ('Computo')
Insert Products(ProductName,UnitPrice) values ('Mouse',25) 
---------------------------------Ejercicios N°48---------------------------------
Select ProductName ,CategoryName 
from  Categories C left join Products P on C.CategoryID = P.CategoryID 
---------------------------------Ejercicios N°49---------------------------------
Select ProductName ,CategoryName 
from  Categories C right join Products P on C.CategoryID = P.CategoryID 
---------------------------------Ejercicios N°50---------------------------------
Select ProductName ,CategoryName 
from  Categories C full join Products P on C.CategoryID = P.CategoryID 
---------------------------------Ejercicios N°51---------------------------------
Select * from Products 
Update Products set UnitPrice = 99.99
where ProductName like 'Chai'
---------------------------------Ejercicios N°52---------------------------------
Select * from Customers 
update Customers set City = 'Lima',Country = 'Peru'
where CompanyName in('Antonio Moreno Taquería')
---------------------------------Ejercicios N°53---------------------------------
Select * from Products
where CategoryID = 1
Update Products set UnitsInStock = UnitsInStock +2
where CategoryID = 1
---------------------------------Ejercicios N°54---------------------------------
Delete from Products 
where ProductName = 'Mouse'
---------------------------------Ejercicios N°55---------------------------------
delete from Products
where ProductName = 'Chai'
---------------------------------Ejercicios N°56---------------------------------
Select ProductID,ProductName  
from Products 
where CategoryID in(Select CategoryID  
                    from Categories
                    where CategoryName  like 'Condiments' )
---------------------------------Ejercicios N°57---------------------------------
Select OrderID,OrderDate,ShippedDate,ShipVia    
from Orders 
where ShipVia = (Select ShipperID 
                 from Shippers 
                 where CompanyName = 'Speedy Express')
---------------------------------Ejercicios N°58---------------------------------
Select CompanyName,City  
from Customers 
where City = (Select City
              from Customers 
              Where CompanyName = 'Antonio Moreno Taquería')
---------------------------------Ejercicios N°59---------------------------------
Update Customers set City = 'Mexico D.F.'
where CustomerID = 'ANTON'
---------------------------------Ejercicios N°60---------------------------------
Select * from Employees
Select OrderID,CustomerID,EmployeeID  
from Orders 
where EmployeeID = (select EmployeeID 
                    from Employees 
                    where LastName = 'Suyama')
---------------------------------Ejercicios N°61---------------------------------
Select ProductID,ProductName  
from Products 
where ProductID in (select ProductID 
		           from [Order Details] 
                   where Quantity >= 100)
order By ProductID 
---------------------------------Ejercicios N°62---------------------------------
Create view Ejercicio1
as
Select ProductID 'Codigo',ProductName 'Nombre',UnitsInStock 'Stock'
from Products 
go
Select * from Ejercicio1 
go
---------------------------------Ejercicios N°63---------------------------------
Create view Ejercicio2
as
Select CustomerID 'Codigo',CompanyName as Cliente
from Customers 
go
Select * from Ejercicio2 
go
---------------------------------Ejercicios N°64---------------------------------
Create view Ejercicio3
as
Select P.ProductID 'Codigo Producto',P.ProductName 'Nombre Producto' ,C.CategoryName 'Nombre Categoria' 
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
go
Select * from Ejercicio3 
go
---------------------------------Ejercicios N°65---------------------------------
create view Ejercicio4
as
Select CompanyName,Address,City
From Customers 
where Country = 'Argentina'
go
Select * from Ejercicio4
go
---------------------------------Ejercicios N°66---------------------------------
Select Country Pais,Count(*)Cantidad
from Customers 
group by Country
order by Country 
---------------------------------Ejercicios N°67---------------------------------
Select * from Orders 
Select EmployeeID 'Codigo Empleado',Count(*)'Cantidad De Empleados Por Pedidos'
from Orders 
group By EmployeeID 
Order By EmployeeID 
---------------------------------Ejercicios N°68---------------------------------
Select Country Pais ,Count(*)'Cantidad De Clientes X pais'
from Customers 
group By Country 
Order by Country 
---------------------------------Ejercicios N°69---------------------------------
Select City Ciudad,Count(*)'Cantidad de proveedores por pais'
from Suppliers 
group by City
Order by City
---------------------------------Ejercicios N°70---------------------------------
Select C.CategoryID ,COUNT(*)'Cantidad de productos por categoria'
From Products P inner join Categories C on P.CategoryID = C.CategoryID 
group by C.CategoryID 
order By C.CategoryID  
---------------------------------Ejercicios N°71---------------------------------
Select Country Pais,City Ciudad ,COUNT(*)'Cantidad de ciudad por pais'
From Customers 
group by Country,City
Order by Country,City 
---------------------------------Ejercicios N°72---------------------------------
Select Country Pais,City Ciudad ,COUNT(*)'Cantidad de ciudad por pais'
From Customers 
group by Country,City
having COUNT(*) > 2
Order by Country,City 
---------------------------------Ejercicios N°73---------------------------------
Create View Ejercicio5
as
Select ShipName 'Enviados a',COUNT(*)'Numeros de pedidos en 1997' 
from Orders 
where YEAR(ShippedDate)= 1997
group by ShipName 
go
Select * from Ejercicio5
go
---------------------------------Ejercicios N°74---------------------------------
Select OrderID,Quantity,UnitPrice,Importe = UnitPrice * Quantity    
from [Order Details] 
where OrderID = 10535
---------------------------------Ejercicios N°75---------------------------------
Select OrderID,[Importe total del pedido 10535] = sum(UnitPrice*Quantity)  
from [Order Details] 
where OrderID = 10535
Group by OrderID 
---------------------------------Ejercicios N°76---------------------------------
Select Año = YEAR(ShippedDate),Mes = DATENAME(MM,ShippedDate),COUNT(*) 'Cantidad'
from Orders 
where ShippedDate not in('')
Group By ShippedDate 
order By MONTH(ShippedDate)
---------------------------------Ejercicios N°77---------------------------------
Select P.ProductName,SUM(OD.Quantity) 'Cantidad por tipo de producto' 
from Products P inner join [Order Details] OD on P.ProductID = OD.ProductID 
     inner join Orders O on OD.OrderID = O.OrderID   
where YEAR(O.ShippedDate)=1997
group by ProductName 
Order by ProductName 
---------------------------------Ejercicios N°78---------------------------------
Select ProductName 'Nombre Producto',UnitPrice'Precio Producto' ,CategoryName 'Categoria Producto' 
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
where UnitPrice > (Select avg(UnitPrice)
                   from Products  )
order by UnitPrice
---------------------------------Ejercicios N°79---------------------------------
Select OrderID '# Pedido',ShippedDate [Fecha Envio],CompanyName 'Distribuido por'  
from Orders O inner join Shippers S on O.ShipVia = S.ShipperID 
where YEAR(ShippedDate) = 1997 and DATEPART(QQ,ShippedDate)= 4 
---------------------------------Ejercicios N°80---------------------------------
Select OD.OrderID #Pedido,Od.Quantity Cantidad,P.ProductName,P.UnitPrice 'Precio Unitario'   
from [Order Details] OD inner join Products P on OD.ProductID = P.ProductID 
where OrderID = 10535
---------------------------------Ejercicios N°81---------------------------------
Select P.ProductID ,P.ProductName,P.UnitsInStock,C.CategoryName,C.CategoryID   
from Products P inner join Categories C on P.CategoryID = C.CategoryID  
where C.CategoryID = (Select CategoryID 
					  from Categories 
                      where CategoryName = 'Condiments')
---------------------------------Ejercicios N°82---------------------------------
-- Declarar
Declare @Valor int
Declare @Texto nchar(30)
--Asignar
Set @Valor = 15
set @Texto = 'Kevin Matos Secce Victor Kevin'
--Imprimir dato
Print @Valor
Print @Texto
---------------------------------Ejercicios N°83---------------------------------
Declare @Nombre varchar(30) = 'Victor Kevin'
Declare @Edad int = Datediff(YYYY,'02/01/1995',Getdate())
If @Edad > 18 
print (@Nombre +space(1)+'Mayor De Edad')
else
print (@Nombre +space(1)+'Menor De Edad')
---------------------------------Ejercicios N°84---------------------------------
Declare @I int = 0,@Suma int = 0
while  @I <= 100
begin
 Set @I = @I+1
 print(@I)
 set @Suma = @Suma+@I
 end
 Print('La Suma Total Es: '+str(@Suma))
---------------------------------Ejercicios N°85---------------------------------
Declare @Numero int = 4
Declare @Cuadrado int
Declare @Cubo int
Print(Space(6)+'Numero'+Space(3)  + 'Cuadrado'+Space(3) + 'Cubo')
Print('      ------'+Space(3)  + '--------'+Space(3) + '----')
while @Numero < 20
begin 
Set @Numero = @Numero +1
set @Cuadrado  = @Numero * @Numero
set @Cubo  = @Numero * @Numero*@Numero
print(Str(@Numero)+Str(@Cuadrado)+Str(@Cubo))
end
---------------------------------Ejercicios N°86---------------------------------
Declare @Pais nchar(15) = 'Madrid'
Select CompanyName,Address,City 
from Northwind.dbo.Customers 
where City = @Pais
---------------------------------Ejercicios N°87---------------------------------
Declare @TipoEnvio int = 1
Select * from Northwind.dbo.Orders 
where ShipVia = @TipoEnvio 
---------------------------------Ejercicios N°88---------------------------------
Select O.ShipVia'Codigo Compañia',S.CompanyName 'Nombre Compañia',COUNT(*)'Cantidad De Pedidos enviado por Distribuidores'
from Orders O inner join Shippers S on O.ShipVia = S.ShipperID 
group by O.ShipVia,S.CompanyName 
Order by ShipVia
---------------------------------Ejercicios N°89---------------------------------
-- Procedimientos
create procedure CuadradoCubo
as
Declare @Numero int = 4
Declare @Cuadrado int
Declare @Cubo int
Print(Space(6)+'Numero'+Space(3)  + 'Cuadrado'+Space(3) + 'Cubo')
Print('      ------'+Space(3)  + '--------'+Space(3) + '----')
while @Numero < 20
begin
Set @Numero +=1
set @Cuadrado = @Numero*@Numero
set @Cubo = @Numero*@Numero*@Numero
print(str(@Numero)+str(@Cuadrado)+str(@Cubo))
end
go

exec CuadradoCubo 
Execute CuadradoCubo 
---------------------------------Ejercicios N°90---------------------------------
Create Procedure CuadradoCuboParametro
@Numero int 
as
Declare @Cuadrado int ,@Cubo int
set @Cuadrado = @Numero*@Numero 
set @Cubo = @Numero*@Numero*@Numero
Print('Numero   :'+Str(@Numero))
Print('Cuadrado :'+Str(@Cuadrado))
Print('Cubo     :'+Str(@Cubo))
go
execute CuadradoCuboParametro 5
exec CuadradoCuboParametro 7
---------------------------------Ejercicios N°91---------------------------------
Create Procedure NumeroMayor
@Numero1 int,@Numero2 int
as
if @Numero1 > @Numero2 
   print ('El numero mayor es : '+ STR(@Numero1))
   else
   If @Numero2 > @Numero1 
   print ('El numero mayor es : '+ STR(@Numero2))
   else
   print ('Los Numero son iguales: '+ STR(@Numero1) +'='+STR(@Numero2))
 go
 
 exec NumeroMayor 10,6
---------------------------------Ejercicios N°92---------------------------------
create Procedure NMayor
@Numero1 int,@Numero2 int
as
if @Numero1 > @Numero2 
   print ('El numero mayor es: '+ STR(@Numero1))
If @Numero2 > @Numero1 
   print ('El numero mayor es: '+ STR(@Numero2))
If @Numero2 = @Numero1 
   print ('Los Numero son iguales: '+ STR(@Numero1)+'='+STR(@Numero2))
 go
 
 exec NMayor 1,9
 Execute NMayor 8,8
---------------------------------Ejercicios N°93---------------------------------
Create Procedure Consulta1
@City nchar(20)
as
Select *from Northwind.dbo.Customers  
where City = @City
go
exec Consulta1 'Rio de Janeiro'
select * from Customers 
---------------------------------Ejercicios N°94---------------------------------
create procedure Consulta2
@Codigo char(10)
as
select *from Orders 
Where CustomerID = @Codigo 
go
execute Consulta2 'VICTE'
---------------------------------Ejercicios N°95---------------------------------
create Procedure Consulta3
as
Select O.CustomerID,C.CompanyName,Count (*)'N° Pedidos por clientes' 
from Orders O inner join Customers C on O.CustomerID = C.CustomerID 
Group by O.CustomerID,CompanyName  
go

exec Consulta3 
---------------------------------Ejercicios N°96---------------------------------
create Procedure Consulta4
@VInicial int,@VFinal  int
as
Select ProductName 'Nombre Producto' ,UnitPrice 'Precio',UnitsInStock 'Cantidad Stock'   
from Northwind.dbo.Products  
where UnitsInStock between @VInicial and @VFinal 
order by UnitsInStock 
go

execute Consulta4 10,20
---------------------------------Ejercicios N°97---------------------------------
Create Procedure Consulta5
@Dato nchar(30)
as
Declare @Inicial int  = 0
while @Inicial < 50
begin
select @Inicial +=1
print(@Dato)
end
go

execute Consulta5 'Matos Secce Victor Kevin'
---------------------------------Ejercicios N°98---------------------------------
create procedure Consulta6
@Año int,@Mes int
as
Select OrderID '#Pedido',ShipName 'Enviado a',ShippedDate 'Fecha Envio'
from Northwind.dbo.Orders  
where (YEAR(ShippedDate) = @Año) and MONTH(ShippedDate) = @Mes
go

execute Consulta6 1998,1
---------------------------------Ejercicios N°99---------------------------------
Create Procedure Consulta7
@Compañia nchar(30),@Telefono nchar(30)
as
insert Shippers (CompanyName,Phone)values(@Compañia,@Telefono )
go

exec Consulta7 'Wester Union','(503) 985-2154'
select * from Shippers 
---------------------------------Ejercicios N°100---------------------------------
Create Procedure Consulta8
@Codigo nchar(10),@Nombre nchar(30),@City nchar(20),@Region nchar(2)
as
insert Customers (CustomerID,CompanyName,City,Region) values (@Codigo,@Nombre,@City,@Region)
go

execute Consulta8 'VKMS','Victor Kevin Matos Secce','Lima','LM'

select * from Customers 
where CustomerID = 'VKMS'
---------------------------------Ejercicios N°101---------------------------------
Create procedure Consulta9
@Codigo int
as
delete from Shippers 
where  ShipperID = @Codigo 
go

exec Consulta9 4

select * from Shippers 
---------------------------------Ejercicios N°102---------------------------------
Create procedure Consulta10
@Codigo nchar(10)
as
Delete from Customers 
where CustomerID = @Codigo 
go

execute Consulta10 'VKMS' 
---------------------------------Ejercicios N°103---------------------------------
Create Procedure Consulta11
@Codigo int ,@Telefono nchar(20)
as
update Shippers set Phone = @Telefono 
where ShipperID = @Codigo 
go

execute Consulta11 3,'(503) 520-1610'
select * from Shippers 
---------------------------------Ejercicios N°104---------------------------------
Create view Vista1
as
Select OD.ProductID 'Codigo Producto',P.ProductName [Nombre Producto],COUNT(*) "Cant. de pedidos por productos",Sum((OD.UnitPrice *OD.Quantity)-Discount ) 'Importe Total por producto'
from [Order Details] OD  right join Products P on OD.ProductID = P.ProductID 
group by OD.ProductID,P.ProductName

select * from [Order Details] 
select SUM((UnitPrice *Quantity)-Discount  )
from [Order Details] 
where ProductID =1 --14274.6500549316

Select * from Vista1 
go
---------------------------------Ejercicios N°105---------------------------------
Create view Vista2
as
Select DatePart(YYYY,OrderDate)'Pedido año',DatePart(mm,OrderDate)'Pedidos de mes' ,COUNT(*)'Pedidos por Año'
from Orders 
group by OrderDate

Select * from Vista2 
go
 
---------------------------------Ejercicios N°106---------------------------------
create view Vista3
as
select ShipCountry,COUNT(*)'N° de pedidos por pais' 
from Orders 
group by ShipCountry 

select * from Vista3 
go
---------------------------------Ejercicios N°107---------------------------------
create view Vista4
as
Select top 5 O.CustomerID 'Codigo Cliente',C.CompanyName [Nombre de Cliente],Count(*) 'Cantidad pedidos por cliente'
from Orders O inner join  Customers C on O.CustomerID = C.CustomerID 
group by O.CustomerID,C.CompanyName 
having COUNT(*) > 30

select * from Vista4
go
---------------------------------Ejercicios N°108---------------------------------
create view Vista5
as
Select O.EmployeeID  'Codigo Empleado',Upper(E.FirstName +SPACE(1)+E.LastName)'Nombre De Empleado' ,Count(*) 'Cant. pedidos atendidos por empleados'
from Orders O inner join Employees E  on O.EmployeeID  = E.EmployeeID  
group by O.EmployeeID,E.FirstName,E.LastName 
having COUNT(*)>100

select * from Vista5
Order by 3
go
---------------------------------Ejercicios N°109---------------------------------
create view Vista6
as
Select O.ShipVia 'Codigo Distribuidor',lower(S.CompanyName) 'Nombre Distribuidor',COUNT(*) 'Pedidos enviados por distribuidores',LEN(S.CompanyName) 'Longitud caracteres'
from Orders O inner join Shippers S on O.ShipVia = S.ShipperID 
group by  O.ShipVia,S.CompanyName  

select * from Vista6
go 
---------------------------------Ejercicios N°110---------------------------------
create procedure Procedimiento1
as
Select OrderID 'N° Pedido' ,COUNT(*)'Cantidad De Pedidos'
from [Order Details] 
group by OrderID 
go
execute Procedimiento1
---------------------------------Ejercicios N°111---------------------------------
create procedure Procedimiento2
as
select OD.ProductID'Codigo Productos',P.ProductName'Nombre Productos',COUNT(*)'Cantidad de productos pedidos'  
from [Order Details] OD inner join Products P on OD.ProductID = P.ProductID 
group by OD.ProductID,P.ProductName 
order by OD.ProductID 

execute Procedimiento2 
---------------------------------Ejercicios N°112---------------------------------
create procedure Procedimiento3
as
Select P.ProductID 'Codigo Producto',P.ProductName 'Nombre Producto',S.CompanyName 'Nombre Proveedor',
       C.CategoryName 'Nombre Categoria',UnitPrice 'Precio Producto'
from Products P inner join Suppliers S on P.SupplierID = S.SupplierID 
     inner join Categories C on P.CategoryID = C.CategoryID 
where P.UnitPrice >= (Select AVG(UnitPrice)
                    from Products  )-- 28.8663
order by P.UnitPrice desc
go

execute Procedimiento3
---------------------------------Ejercicios N°113---------------------------------
Select O.CustomerID 'Codigo Cliente',(C.CompanyName) 'Nombre Cliente',Upper(E.FirstName +SPACE(1)+E.LastName)'Nombre Empleado',S.CompanyName 'Nombre Distribuidor'
from Orders O inner join Customers C on O.CustomerID = C.CustomerID 
     inner join Employees E on O.EmployeeID = E.EmployeeID 
     inner join Shippers S on O.ShipVia = S.ShipperID 
where S.CompanyName = (select CompanyName 
					   from Shippers 
                       where CompanyName = 'United Package')
order by O.CustomerID 
     
---------------------------------Ejercicios N°114---------------------------------
select MAX(UnitPrice)'Valor Maximo'
from [Order Details] 

select Min(UnitPrice)'Valor Minimo'
from [Order Details] 

select Avg(UnitPrice)'Valor Promedio'
from [Order Details] 

select count(OrderID )'Contar Filas'
from [Order Details] 
---------------------------------Ejercicios N°115---------------------------------
Select * from Orders 
Select COUNT(*) 'Cantidad Distribuidores 1'
from Orders 
where ShipVia = 1
---------------------------------Ejercicios N°116---------------------------------
Create view CantidadProducto
as
Select C.CategoryName ,P.CategoryID,COUNT(*)[Cantidad Categoria Por Producto ]
From Products P inner join Categories C on P.CategoryID = C.CategoryID 
group by C.CategoryName ,P.CategoryID 
go

select * from CantidadProducto

---------------------------------Ejercicios N°117---------------------------------
Create database DBMS
on (
Name = 'DBMS_DATA',
FileName = 'C:\SGBD\DBMS_DATA.mdf',
Size = 4,
Maxsize = 5,
Filegrowth = 1%),
( Name = 'DBMS_SEC',
  FileName = 'C:\SGBD\DBMS_SEC.ndf',
  Size = 4,
  Maxsize = 5,
  Filegrowth = 5% )
log on (
Name = 'DBMS_LOG',
FileName = 'C:\SGBD\DBMS_LOG.ldf',
Size = 5,
Maxsize = 10,
Filegrowth = 5% )

exec sp_helpdb DBMS

---------------------------------Ejercicios N°118---------------------------------
Create view NombreEmpleado
as
Select O.OrderID,C.CompanyName,FirstName+','+LastName  as [Nombre Empleado]
From Orders O inner join Employees E on O.EmployeeID = E.EmployeeID 
     inner join Customers C on O.CustomerID = C.CustomerID 
go

select * from NombreEmpleado
---------------------------------Ejercicios N°119---------------------------------
Create Procedure Tabla
@Numero int
as
Declare @M int
Declare @Cont int = 0
while @Cont < 12
begin 
 set @Cont = @Cont+1
 set @M = @Numero * @Cont 
 print str(@Numero,2,1) +'*'+str(@Cont,2,1)+' = '+Str(@M,3)
 end
 go
 
 exec Tabla 12
---------------------------------Ejercicios N°120---------------------------------
Declare @Num int = 0
Declare @Sum int = 0
while @Num < 10
begin 
 set @Num = @Num +1
  print @Num
 set @Sum = @Sum+@Num 
end
print 'Suma :'+Str(@Sum,3)

---------------------------------Ejercicios N°121---------------------------------
create Procedure Ejercicio1
@Numero int
as
Declare @Cuadrado int
Declare @Cubo int
Print(Space(6)+'Numero'+Space(3)  + 'Cuadrado'+Space(3) + 'Cubo')
Print('      ------'+Space(3)  + '--------'+Space(3) + '----')
while @Numero<25
begin 
select @Numero = @Numero+1
select @Cuadrado = @Numero *@Numero 
select @Cubo = @Numero*@Numero*@Numero  
print (Str(@Numero)+Str(@Cuadrado)+Str(@Cubo))
end
go

execute Ejercicio1 0
---------------------------------Ejercicios N°122---------------------------------
create Procedure Ejercicio2
@Codigo nchar(10)
as
select *from Customers 
where CustomerID =@Codigo 
go

exec Ejercicio2 'BLAUS'

---------------------------------Ejercicios N°123---------------------------------
Create procedure Fechas
@FInicial Nchar(11),@FFinal Nchar(10)
as
Select OrderID ,CustomerID,EmployeeID,OrderDate   
From Orders 
where OrderDate between @FInicial and @FFinal 
go

exec Fechas '15/10/1997','20/10/1998'

---------------------------------Ejercicios N°124---------------------------------
Create Procedure Trimestres
@Año int,@NTrimi int
as
Select OrderID ,CustomerID,EmployeeID,OrderDate 
from Orders 
where (YEAR(OrderDate)= @Año)and DATEPART(QQ,OrderDate) = @NTrimi 
go

execute Trimestres 1997,2
---------------------------------Ejercicios N°125---------------------------------
create Procedure Insertar
@Nombre varchar(30),@Telefono varchar(20)
as
insert Shippers (CompanyName,Phone) values (@Nombre,@Telefono)
go

execute Insertar 'Wester Union','(503) 555-9999'
execute Insertar 'Uni Master','(503) 555-8974'
execute Insertar 'Wester Black','(503) 555-7825'

select * from Shippers

---------------------------------Ejercicios N°126---------------------------------
Create Procedure Eliminar
@Codigo int
as
delete from Shippers 
where ShipperID = @Codigo 
go

execute Eliminar 5
---------------------------------Ejercicios N°127---------------------------------
Create Procedure Buscar
@Codigo int
as
Select * from [Order Details] 
where OrderID = @Codigo 
go

execute Buscar 10250
select * from [Order Details] 
---------------------------------Ejercicios N°128---------------------------------
Create Procedure Edad
@FNacimiento date
as
declare @Edad int
set @Edad = DATEDIFF(YYYY,@FNacimiento,GETDATE())
print 'Edad Actual : '+str(@Edad,2,2)
go 

execute Edad '10/10/1995'
---------------------------------Ejercicios N°129---------------------------------
Create Procedure Contar
@Codigo varchar(10)
as
Select  COUNT(*)
from Orders
Where CustomerID = @Codigo 
go

execute Contar 'VINET'
select * from Orders
---------------------------------Ejercicios N°130---------------------------------
Create Function Menor (@N1 int,@N2 int,@N3 int)
returns int
as
begin 
Declare @Menor int
 if @N1<@N2 and @N1<@N3
  select @Menor = @N1
  else
  if @N2<@N1 and @N2<@N3
  select @Menor = @N2
  else
  select @Menor = @N3
return @Menor
end 
go

print 'Menor de tres numeros : '+Str(Dbo.Menor(5,0,8),2,2)

---------------------------------Ejercicios N°131---------------------------------
Create Function AplicarIgv (@Importe money)
returns money
as
begin
Declare @Resultado money
select @Resultado = @Importe *0.18
return @Resultado
end 
go

Select dbo.AplicarIgv (1000)as Igv

select OD.OrderID,P.ProductName ,OD.UnitPrice,Dbo.AplicarIgv(OD.UnitPrice) [IGV 18%]  
from [Order Details] OD inner join Products P on OD.ProductID  = P.ProductID 

---------------------------------Ejercicios N°132---------------------------------
Create Procedure FechaNombre
@Fecha date
as
Declare @Nombre varchar(80)
set  @Nombre = DATENAME(DW,@Fecha)+SPACE(1)+Str(DATEPART(DD,@Fecha),2,2)+' De '+DATENAME(MM,@Fecha)+' Del '+Str(DATEPART(YY,@Fecha),4,1)
print (@Nombre)
go

execute FechaNombre '10/10/2010'

---------------------------------Ejercicios N°133---------------------------------
create Function FNombre (@Fecha date)
returns varchar(40)
as
begin
Declare @Nombre varchar(40)
select @Nombre = DATENAME(DW,@Fecha)+SPACE(1)+STR(DATEPART(dd,@Fecha),2,2)+' De '+DATENAME(MM,@Fecha)+' Del '+STR(DATEPART(YY,@Fecha),4,1) 
return @Nombre
end 
go

select dbo.FNombre (GETDATE())as 'Nombre Hoy'
print dbo.FNombre (GETDATE())

---------------------------------Ejercicios N°134---------------------------------
Create Function BuscarCliente (@Codigo nchar(8))
returns Nchar(40)
as
begin
Declare @Resultado varchar(40)
Select @Resultado = CompanyName 
from Customers  
where CustomerID = @Codigo 
return @Resultado
end 
go

select Dbo.BuscarCliente ('BOTTM')as [Nombre Cliente]
Print Dbo.BuscarCliente ('BOTTM')

select * from Customers 

---------------------------------Ejercicios N°135---------------------------------
Create Function BuscarEmpleados(@Codigo int)
returns varchar(40)
as
Begin
Declare @Name varchar(40)
Select @Name = FirstName +','+LastName 
from Orders O inner Join Employees E on O.EmployeeID = E.EmployeeID 
where O.EmployeeID = @Codigo 
return @Name
end 
go

select Dbo.BuscarEmpleados(5) as 'Nombre Empleado'

select * from Orders  
select * from Employees   
---------------------------------Ejercicios N°136---------------------------------
Create Function CantidadPedidos (@Codigo nchar(5))
returns int
as
begin
Declare @Cantidad int
select @Cantidad = COUNT(*)
from Orders 
where CustomerID = @Codigo 
return @Cantidad
end
go

print dbo.CantidadPedidos('ANTON')
Select dbo.CantidadPedidos('ANTON')as 'Cantidad Pedidos'

select * from Orders  

---------------------------------Ejercicios N°137---------------------------------
Create Function ListaProductos(@NombreCategoria varchar(25))
returns table
as
return
Select P.ProductID,P.ProductName,C.CategoryName,P.UnitsInStock  
from Products P inner join Categories C on P.CategoryID = C.CategoryID 
where CategoryName = @NombreCategoria 
go

select * from Dbo.ListaProductos('Dairy Products')

select * from Products 
select * from Categories 
---------------------------------Ejercicios N°138---------------------------------
create function Pedidos (@Año int,@Trimestre int)
returns table
as
return
Select * From Orders 
where (YEAR(OrderDate) = @Año) and DATEPART(QQ,OrderDate) = @Trimestre 
go

select * from dbo.Pedidos(1997,4) 
---------------------------------Ejercicios N°139---------------------------------
-- Aprender Vistas 10
-- Aprender Procedimientos 10
-- Aprender Funciones 10
-- Aprender Tiggers 10
---------------------------------Ejercicios N°140---------------------------------
Create view View1
as
Select OD.OrderID,P.ProductName,OD.UnitPrice,OD.Quantity,OD.Discount  
from   [Order Details] OD inner join Products P on OD.ProductID = P.ProductID 
go

select * from View1
---------------------------------Ejercicios N°141---------------------------------
Create view View2
as
select OrderID,COUNT(*)[Cantidad Pedidos]
from [Order Details] 
group by OrderID 
go

select * from View2 
go

---------------------------------Ejercicios N°142---------------------------------
select *  from [Order Details] 



---------------------------------Ejercicios N°143---------------------------------
---------------------------------Ejercicios N°144---------------------------------
---------------------------------Ejercicios N°145---------------------------------
---------------------------------Ejercicios N°146---------------------------------
---------------------------------Ejercicios N°147---------------------------------
---------------------------------Ejercicios N°148---------------------------------
---------------------------------Ejercicios N°149---------------------------------
---------------------------------Ejercicios N°150---------------------------------
---------------------------------Ejercicios N°151---------------------------------
---------------------------------Ejercicios N°152---------------------------------
---------------------------------Ejercicios N°153---------------------------------
---------------------------------Ejercicios N°154---------------------------------
---------------------------------Ejercicios N°155---------------------------------
---------------------------------Ejercicios N°156---------------------------------
---------------------------------Ejercicios N°157---------------------------------
---------------------------------Ejercicios N°158---------------------------------
---------------------------------Ejercicios N°159---------------------------------
---------------------------------Ejercicios N°160---------------------------------
---------------------------------Ejercicios N°161---------------------------------
---------------------------------Ejercicios N°162---------------------------------
---------------------------------Ejercicios N°163---------------------------------
---------------------------------Ejercicios N°164---------------------------------
---------------------------------Ejercicios N°165---------------------------------
---------------------------------Ejercicios N°166---------------------------------
---------------------------------Ejercicios N°167---------------------------------
---------------------------------Ejercicios N°168---------------------------------
---------------------------------Ejercicios N°169---------------------------------
---------------------------------Ejercicios N°170---------------------------------
---------------------------------Ejercicios N°171---------------------------------
---------------------------------Ejercicios N°172---------------------------------
---------------------------------Ejercicios N°173---------------------------------
---------------------------------Ejercicios N°174---------------------------------
---------------------------------Ejercicios N°175---------------------------------
---------------------------------Ejercicios N°176---------------------------------
---------------------------------Ejercicios N°177---------------------------------
---------------------------------Ejercicios N°178---------------------------------
---------------------------------Ejercicios N°179---------------------------------
---------------------------------Ejercicios N°180---------------------------------
---------------------------------Ejercicios N°181---------------------------------
---------------------------------Ejercicios N°182---------------------------------
---------------------------------Ejercicios N°183---------------------------------
---------------------------------Ejercicios N°184---------------------------------
---------------------------------Ejercicios N°185---------------------------------
---------------------------------Ejercicios N°186---------------------------------
---------------------------------Ejercicios N°187---------------------------------
---------------------------------Ejercicios N°188---------------------------------
---------------------------------Ejercicios N°189---------------------------------
---------------------------------Ejercicios N°190---------------------------------
---------------------------------Ejercicios N°191---------------------------------
---------------------------------Ejercicios N°192---------------------------------
---------------------------------Ejercicios N°193---------------------------------
---------------------------------Ejercicios N°194---------------------------------
---------------------------------Ejercicios N°195---------------------------------
---------------------------------Ejercicios N°196---------------------------------
---------------------------------Ejercicios N°197---------------------------------
---------------------------------Ejercicios N°198---------------------------------
---------------------------------Ejercicios N°199---------------------------------
---------------------------------Ejercicios N°200---------------------------------
---------------------------------Ejercicios N°201---------------------------------
---------------------------------Ejercicios N°202---------------------------------
---------------------------------Ejercicios N°203---------------------------------
---------------------------------Ejercicios N°204---------------------------------
---------------------------------Ejercicios N°205---------------------------------
---------------------------------Ejercicios N°206---------------------------------
---------------------------------Ejercicios N°207---------------------------------
---------------------------------Ejercicios N°208---------------------------------
---------------------------------Ejercicios N°209---------------------------------
---------------------------------Ejercicios N°210---------------------------------
--___________________________________________________________________________________________________________

----- Variables De SQl - Lenguaje (Transact - SQL)o(T-SQL)-----
--1)Declaracion de Variables locales
--Declare @Nombre TipoDato
--Ejemplo:
	Declare @A int
	Declare @B char(5)
	Declare @C int = 8
--2)Asignar Dato a Variables
--Set @Nombre = Dato
--Select @Nombre = Dato
--Ejemplo:
	Set @A = 45
	Select @B = 'Sise'
	Set @C =@A+5
--3)Mostrar Variables
--Print @Nombre o
--Select @Nombre
--Ejemplo:
	Print @A
	Print @B
	Print @C
	Print 'A = '+Str(@A) -- -> String
	Print 'B = '+@B
	Print 'C = '+Str(@C,6)

--- Ejemplo 01 ---

Declare @Nom varchar(20) = 'Maria'
Declare @Ed int = DateDiff(YYYY,'23/02/1995',Getdate())
-- print ('Edad'+Str(@ED)) -- Ver Edad
if @Ed >= 18
 print ('Resultado: '+@Nom+Space(1)+'Mayor de Edad')
 else
 print ('Resultado : '+@Nom+Space(1)+'Menor de Edad')
 
--- Ejemplo 02 ---
-- EStructuras Repetitivas While
Declare @I int = 0,@Suma int = 0
While @I<=10
begin
 Set @I = @I+1
 Print @I
 Set @Suma = @Suma+@I
 end
 Print 'Suma: '+Str(@Suma,6)
--- Ejemplo 03 ---
Declare @Numero int = 4
Declare @Cuadrado int
Declare @Cubo int
Print(Space(6)+'Numero'+Space(3)  + 'Cuadrado'+Space(3) + 'Cubo')
Print('      ------'+Space(3)  + '--------'+Space(3) + '----')
While @Numero <20
begin
  Set @Numero = @Numero+1
  set @Cuadrado = @Numero *@Numero
  Set @Cubo = @Numero *@Numero*@Numero   
Print(Str(@Numero)+ Str(@Cuadrado)+Str(@Cubo))
  end
--- Ejemplo 04 ---
Declare @Ciudad varchar(20)  = 'Madrid'
Select CompanyName,Address,City
from Northwind.dbo.Customers  --> llamado mediante el from a la base de datos
Where City = @Ciudad 
--- Ejemplo 05 ---
-- Crear Procedimientos Almacenado(PA)
Create Procedure CuadradoCubo
as
Declare @Numero int = 4
Declare @Cuadrado int
Declare @Cubo int
Print(Space(6)+'Numero'+Space(3)  + 'Cuadrado'+Space(3) + 'Cubo')
Print('      ------'+Space(3)  + '--------'+Space(3) + '----')
While @Numero <20
begin
  Set @Numero = @Numero+1
  set @Cuadrado = @Numero *@Numero
  Set @Cubo = @Numero *@Numero*@Numero   
Print(Str(@Numero)+ Str(@Cuadrado)+Str(@Cubo))
  end 
  go
  
  Exec CuadradoCubo 
--- Ejemplo 06 ---
Create Procedure PA1
@Num int --> Parametro
as
Declare @Cuadrado int,@Cubo int
Set @Cuadrado = @Num*@Num
Set @Cubo = @Num*@Num*@Num
Print ('Numero  :'+Str(@Num))
Print ('Cuadrado:'+Str(@Cuadrado))
Print ('Cubo    :'+Str(@Cubo))
go

exec PA1 6 --> Se ingresa un parametro
--- Ejemplo 07 ---
Create Procedure PA2
@Num1 int,@Num2 int --> Parametro
as
 /*If @Num1>@Num2 
  Print(Str(@Num1)+' = '+' Mayor')
 If @Num1=@Num2 
  Print(Str(@Num1)+Str(@Num2)+' -->'+' Iguales')
  If @Num1<@Num2 
  Print(Str(@Num2) + ' = '+' Mayor')*/
  If @Num1>@Num2
  Print 'Mayor:'+str(@Num1)
  else
  If @Num1<@Num2
  Print 'Mayor:'+str(@Num2)
  else
  Print 'Iguales'
go

exec PA2 15,9 --> Se ingresa un parametro
--- Ejemplo 08 ---
use master
use Northwind 
go

Create Procedure PA3
@Pais varchar(20)
as
Select CompanyName  Cliente,Address Direccion,City Ciudad
From Customers
where Country = @Pais
go

exec PA3 'Argentina' -- > Ingrese de un parametro de texto
--- Ejemplo 09 ---
Create Procedure PA4
@Codigo varchar(10)
as
Select CustomerID 'Codigo Cliente',ShippedDate 'Fecha Envio'
From Orders
where CustomerID = @Codigo
go

exec PA4 'QUEDE'
Select * from Orders 
--- Ejemplo 10 ---
Create Procedure PA5
@Inicial int,@Final int
as
Select ProductID 'Codigo',ProductName Nombre ,UnitsInStock   Stock
From Products 
where UnitsInStock between @Inicial and @Final
Order by UnitsInStock 
go

exec PA5 80,120

--- Ejemplo 11 ---
Create Procedure Ejercicio01
@Dato varchar(50)
as
Declare @I int = 0
While @I<5
begin
Set @I=@I+1
Print(@Dato)
end
go

execute Ejercicio01 'Victor Kevin Matos Secce'
--- Ejemplo 12 ---
create Procedure Ejercicio02
@Año Int,@Mes Int
as
Select OrderID #Pedido,ShipName 'Enviado a',ShippedDate   'Fecha Envio'
From Orders
where (YEAR(ShippedDate) = @Año )and  Month(ShippedDate)in(@Mes)
go

execute Ejercicio02 1997,7
--- Ejemplo 13 ---
Create Procedure Ejercicio03
@Nombre Varchar(50),@Telefono Varchar(20)
as
Insert Shippers (CompanyName,Phone)values(@Nombre,@Telefono)
go

exec Ejercicio03 'Wester Union','(503) 478-1456'
--- Ejemplo 14 ---
Create Procedure Ejercicio04
@Codigo varchar(7),@Nombre varchar(50),@Direccion varchar(50),@Ciudad varchar(10),@Pais varchar(10)
as
Insert Customers (CustomerID,CompanyName,Address,City,Country) values(@Codigo,@Nombre,@Direccion,@Ciudad,@Pais )
go

Execute Ejercicio04 'MSVK','Victor Kevin Matos Secce','Av. Milagro De Jesus #243','Lima','Peru'

select * from Customers 
Where CustomerID = 'MSVK'
--- Ejemplo 15 ---
Create Procedure Ejercicio05
@Codigo int,@Nombre varchar(20),@Telefono varchar(20)
as
update Shippers set  CompanyName =@Nombre ,Phone =@Telefono  
where ShipperID = @Codigo 
go
execute Ejercicio05 4,'Envio Rapido','(503) 784-2451'

select * from Shippers 
--- Ejemplo 16 ---
------------------Funciones Definidas Por El Usuario------------------
Create Function FechaActual()
Returns Date
as
begin
return getDate()
end
go

Print Dbo.FechaActual()-- Salida Tipo Consola
Select Dbo.FechaActual()[Fecha Actual] -- Salida Tipo Tabla

--- Ejemplo 17 ---
Create Function IGV(@Importe money) -- Parametro
returns Money
as
begin
 Declare @Resultado money
 set @Resultado = @Importe*0.18
 return @Resultado
 end 
 go
 
print Dbo.IGV(500) 
print 'Impuesto:'+Str(Dbo.IGV(500),6,2)
Select Dbo.IGV(500)[IGV 18%]
Select ProductName Producto,UnitPrice Precio,Dbo.IGV(UnitPrice) '18% IGV' 
from Products 

--- Ejemplo 18 ---
Create Function Menor(@N1 int,@N2 int,@N3 int)
returns int
as
begin
 Declare @Menor int
 if @N1<@N2 and @N1<@N3
 set @Menor = @N1 
 else
 if @N2<@N1 and @N2<@N3 
 set @Menor = @N2
 else
 set @Menor = @N3
 return @Menor
 end 
 go
 
 print 'Numero Menor De Tres Digitos Ingresados'+Str(Dbo.Menor(5,14,9))
 Select Dbo.Menor (8,2,10)'Numero Menor De Tres Digitos Ingresados'
Print Dbo.Menor(1,2,3)
Print Dbo.Menor(10,2,3)
Print Dbo.Menor(50,60,3)
--- Ejemplo 19 ---
Create Function FechaNombre(@Fecha date)
returns varchar(80)
as
Begin
Declare @Nombre varchar(40)
set @Nombre = (DATENAME(Dw,@Fecha)+','+STR(DATEPART(DD,@Fecha),2,2)+' De '+SPACE(1)+DATENAME(mm,@Fecha))+SPACE(1)+(Str(Datepart(YY,@Fecha),4,1))
return  @Nombre
end
go

print dbo.FechaNombre('27/07/2014')
print dbo.FechaNombre(getdate())

--- Ejemplo 20 ---
Create Function BuscaCliente(@Codigo char(5))
returns varchar(40)
as
begin
Declare @Resultado varchar(40)
Select @Resultado = CompanyName
from Customers 
where CustomerID = @Codigo
return @Resultado
end
go

print Dbo.BuscaCliente('ANTON')
--- Ejemplo 21 ---
create Function CantidadPedidos(@CodigoCliente char(8))
returns int
as
begin
Declare @Resultado int
Select @Resultado = COUNT(*)
from Orders
where CustomerID = @CodigoCliente  
return @Resultado
end
go

print Dbo.CantidadPedidos('ANTON')

Select CompanyName Cliente,Dbo.CantidadPedidos(CustomerID)'Cantidad Pedidos'
from Customers 

--- Ejemplo 22 ---
-- Funciones De Tipo Tabla
Create Function ListaClientes(@Pais varchar(20))
returns table
as
return
Select CompanyName,Address,City  
From Customers 
where Country = @Pais 
go 

Select * from Dbo.ListaClientes('Argentina')

--- Ejemplo 23 ---
Create function ListaProductos(@NCategoria varchar(20))
returns Table
as
return
Select P.ProductID  Codigo,P.ProductName Nombre ,C.CategoryName Categoria,P.UnitsInStock   
From Products P inner join Categories C on P.CategoryID = C.CategoryID 
where C.CategoryName in (@NCategoria)
go

select *from Dbo.ListaProductos('Produce') 
select *from Dbo.ListaProductos('Condiments') 
select *from Dbo.ListaProductos('Confections') 
select *from Dbo.ListaProductos('Dairy Products') 
select *from Dbo.ListaProductos('Meat/Poultry') 

select * from Dbo.ListaProductos('Produce') 
where  UnitsInStock  > 10

select* from Categories 

--- Ejemplo 24 ---
create Function Fechas(@Año int,@Trimestre int)
returns table
as 
return
Select O.OrderID #Pedidos ,O.ShippedDate'Fecha Envio',ShipName 'Enviado a',S.CompanyName 'Distribuido por' 
from Orders  O inner join Shippers S on O.ShipVia = S.ShipperID 
where (YEAR(ShippedDate) in (@Año)) and DATEPART(QQ,ShippedDate) = @Trimestre
go

select * from Dbo.Fechas(1997,1)

-- ver datos de mi tabla

exec sp_columns Products;

select *  from information_schema.columns 
 where table_name = 'Products'
 order by ordinal_position

Select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'Products'


-- crear funcion que me aumente el precio 10 mas
go
create function fdu_AumentarPrecio (@Precio money)
returns money
as
begin
	declare @NuevoMonto money;
	set @NuevoMonto = @Precio + 10 ;
	return @NuevoMonto;
end;

select ProductID,ProductName,dbo.fdu_AumentarPrecio(UnitPrice) as Precio_Incrementado 
from Products;

-- crear funcion
CREATE FUNCTION ReturnSite
( @site_id INT )

RETURNS VARCHAR(50)

AS

BEGIN

   DECLARE @site_name VARCHAR(50);

   IF @site_id < 10
      SET @site_name = 'TechOnTheNet.com';
   ELSE
      SET @site_name = 'CheckYourMath.com';

   RETURN @site_name;

END;
-- ejecutar funcion 
SELECT dbo.ReturnSite(8);

-- eliminar funcion

DROP FUNCTION ReturnSite;

-- crear procedimientos almacenados

REATE PROCEDURE FindSite
  @site_name VARCHAR(50) OUT

AS

BEGIN

   DECLARE @site_id INT;

   SET @site_id = 8;

   IF @site_id < 10
      SET @site_name = 'TechOnTheNet.com';
   ELSE
      SET @site_name = 'CheckYourMath.com';

END;

-- ejecutar procedimiento
DECLARE @site_name varchar(50);

EXEC FindSite @site_name OUT;

PRINT @site_name;

GO

-- eliminar procedure
DROP PROCEDURE FindSite;

-- declarar variable
DECLARE @techonthenet VARCHAR(50);
SET @techonthenet = 'Example showing how to declare variable';

DECLARE @site_value INT;
SET @site_value = 10;

DECLARE @techonthenet VARCHAR(50), @site_value INT;

DECLARE @techonthenet VARCHAR(50) = 'Example showing how to declare variable';

DECLARE @site_value INT = 10;
print @site_value;

DECLARE @techonthenet VARCHAR(50) = 'Example showing how to declare variable',
        @site_value INT = 10;

-- sentencia if else
DECLARE @site_value INT;
SET @site_value = 15;

IF @site_value < 25
   PRINT 'TechOnTheNet.com';
ELSE
   PRINT 'CheckYourMath.com';

GO

-- sentencia if
DECLARE @site_value INT;
SET @site_value = 15;

IF @site_value < 25
   PRINT 'TechOnTheNet.com';

GO

-- sentencia if else elseif
DECLARE @site_value INT;
SET @site_value = 15;

IF @site_value < 25
   PRINT 'TechOnTheNet.com';
ELSE
BEGIN
   IF @site_value < 50
      PRINT 'CheckYourMath.com';
   ELSE
      PRINT 'BigActivities.com';
END;

GO

-- sentencia while

DECLARE @site_value INT;
SET @site_value = 0;

WHILE @site_value <= 10
BEGIN
   PRINT 'Inside WHILE LOOP on TechOnTheNet.com';
   SET @site_value = @site_value + 1;
END;

PRINT 'Done WHILE LOOP on TechOnTheNet.com';
GO

DECLARE products_cursor CURSOR FOR
SELECT ProductID, ProductName
FROM Products;

OPEN products_cursor;
FETCH NEXT FROM products_cursor;

WHILE @@FETCH_STATUS = 0
   BEGIN
      FETCH NEXT FROM products_cursor;
      PRINT 'Inside WHILE LOOP on TechOnTheNet.com';
   END;
PRINT 'Done WHILE LOOP on TechOnTheNet.com';

CLOSE products_cursor;
DEALLOCATE products_cursor;
GO

-- for loop

DECLARE @cnt INT = 0;

WHILE @cnt < 10
BEGIN
   PRINT 'Inside simulated FOR LOOP on TechOnTheNet.com';
   SET @cnt = @cnt + 1;
END;

PRINT 'Done simulated FOR LOOP on TechOnTheNet.com';
GO

-- sentencia break
DECLARE @site_value INT;
SET @site_value = 0;

WHILE @site_value <= 10
BEGIN
   IF @site_value = 2
      BREAK;
   ELSE
      PRINT 'Inside WHILE LOOP on TechOnTheNet.com';

   SET @site_value = @site_value + 1;
END;

-- sentencia continue
DECLARE @site_value INT;
SET @site_value = 0;

WHILE @site_value <= 10
BEGIN
   IF @site_value = 2
      BREAK;

   ELSE
   BEGIN
      SET @site_value = @site_value + 1;
      PRINT 'Inside WHILE LOOP on TechOnTheNet.com';
      CONTINUE;
   END;

END;

PRINT 'Done WHILE LOOP on TechOnTheNet.com';
GO

-- crear secuencia

CREATE SEQUENCE contacts_seq
  AS BIGINT
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 99999
  NO CYCLE
  CACHE 10;

SELECT NEXT VALUE FOR contacts_seq;

-- eliminar secuencia
DROP SEQUENCE contacts_seq;

-- propiedades de secuencia
SELECT *
FROM sys.sequences
WHERE name = 'contacts_seq';

--operadores de comparacion
SELECT *
FROM employees
WHERE FirstName = 'Jane';


SELECT *
FROM employees
WHERE firstname <> 'Jane';

SELECT *
FROM employees
WHERE firstname != 'Jane';

SELECT *
FROM employees
WHERE employeeid > 3000;

SELECT *
FROM employees
WHERE employeeid >= 3000;

SELECT *
FROM employees
WHERE employeeid < 500;

SELECT *
FROM employees
WHERE employeeid <= 500;

-- eliminar contenido de tabla
TRUNCATE TABLE Orders;

-- left outer join combinacion de tablas
select P.ProductID,P.ProductName,C.CategoryName,C.Description
from Products P left outer join Categories C on P.CategoryID = C.CategoryID

-- right outer join combinacion de tablas
select P.ProductID,P.ProductName,C.CategoryName,C.Description
from Products P right outer join Categories C on P.CategoryID = C.CategoryID

-- full outer join combinacion de tablas
select P.ProductID,P.ProductName,C.CategoryName,C.Description
from Products P full outer join Categories C on P.CategoryID = C.CategoryID

-- crear tabla
CREATE TABLE employees
( employee_id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY
);

-- alterar tabla

ALTER TABLE employees
  ADD last_name VARCHAR(50);

ALTER TABLE employees
  ADD last_name VARCHAR(50,
      first_name VARCHAR(40);

-- modificar columna
ALTER TABLE employees
  ALTER COLUMN last_name VARCHAR(75) NOT NULL;

-- eliminar columna
ALTER TABLE employees
  DROP COLUMN last_name;

-- renombrar columna de tabla
sp_rename 'employees.last_name', 'lname', 'COLUMN';

-- renombrar tabla
sp_rename 'employees', 'emps';

-- crear tabla local temporal

CREATE TABLE #employees
( employee_id INT PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY
);

-- crear tabla global temporal
CREATE TABLE ##employees
( employee_id INT PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  salary MONEY
);

-- crear vista
create view vw_Productos
as
Select * from Products;

CREATE TABLE dbo.Articulos (ID INT PRIMARY KEY, NOMBRE VARCHAR(100),STOCK DECIMAL (18,2))
GO

CREATE TABLE dbo.Movimientos (TRANSACCION INT,FECHA DATE DEFAULT(GETDATE()),ARTICULO_ID INT FOREIGN KEY
REFERENCES DBO.ARTICULOS(ID),CANTIDAD DECIMAL(18,2), TIPO CHAR(1) CHECK (TIPO ='I' OR TIPO = 'O'))
GO

-- Insertamos registros a la tabla Articulos
INSERT INTO dbo.Articulos(ID,NOMBRE,STOCK) VALUES (1,'Monitores',0),(2,'CPU',0),(3,'Mouse',0)
GO

-- Creamos los triggers para tener actualizado los articulos
CREATE TRIGGER dbo.MovimientosInsert ON dbo.Movimientos
FOR INSERT
AS
BEGIN
  -- No retorna el mensaje de cantidad de registros afectados
  SET NOCOUNT ON  
  UPDATE DBO.ARTICULOS
  SET STOCK = STOCK + T.PARCIAL
  FROM DBO.ARTICULOS A
  INNER JOIN
  ( SELECT ARTICULO_ID,
    SUM(CASE WHEN TIPO='I' THEN CANTIDAD ELSE -CANTIDAD END)
    AS PARCIAL FROM INSERTED
    GROUP BY ARTICULO_ID
   ) T
   ON   
   A.ID = T.ARTICULO_ID
END
GO

CREATE TRIGGER dbo.MovimientosDelete ON dbo.Movimientos
FOR DELETE
AS
BEGIN
  -- No retorna el mensaje de cantidad de registros afectados
  SET NOCOUNT ON 
  UPDATE dbo.Articulos
  SET STOCK = STOCK - T.PARCIAL
  FROM dbo.Articulos A
  INNER JOIN
  ( SELECT ARTICULO_ID,
    SUM(CASE WHEN TIPO='I' THEN CANTIDAD ELSE -CANTIDAD END)
    AS PARCIAL FROM DELETED
    GROUP BY ARTICULO_ID
   ) T
   ON
   A.ID = T.ARTICULO_ID
END
GO

--Probemos el ejercicio
-- Mostremos el Stock actual
SELECT A.ID,A.NOMBRE,A.STOCK FROM dbo.Articulos A

-- Insertemos un registro para el articulo 1
INSERT INTO dbo.Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO)
VALUES (1,1,GETDATE(),100,'I')

-- Mostremos el Stock actual para el ID 1
SELECT A.ID,A.NOMBRE,A.STOCK FROM dbo.Articulos A WHERE A.ID = 1

-- Insertemos otros registros
INSERT INTO dbo.Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO)
VALUES (2,1,GETDATE(),10,'I'), (3,1,GETDATE(),5,'O'), (4,2,GETDATE(),5,'I')

-- Mostremos el Stock actual para el ID 1
SELECT A.ID,A.NOMBRE,A.STOCK FROM dbo.Articulos A WHERE A.ID = 1

-- Eliminemos la transaccion (1) de cantidad = 100
DELETE FROM dbo.Movimientos WHERE TRANSACCION = 1

--Eliminemos la transaccion (3) de cantidad = 5
DELETE FROM dbo.Movimientos WHERE TRANSACCION = 3

-- Mostremos el stock actual de la tabla Articulos
SELECT A.ID,A.NOMBRE,A.STOCK FROM dbo.Articulos A

-- Elkiminamos todos los movimientos realizados
DELETE FROM dbo.Movimientos

--Deshabilitar los triggers
ALTER TABLE dbo.Movimientos DISABLE TRIGGER ALL

-- Mostremos lo que pasa se insertamos un registro en la tabla
-- Movimientos que tiene deshabilitados los triggers
INSERT INTO dbo.Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO)
VALUES (1,1,GETDATE(),100,'I')

-- Mostremos el stock actual de la tabla Articulos
SELECT A.ID,A.NOMBRE,A.STOCK FROM dbo.Articulos A

CREATE TABLE tablaPruebas ( 
 cve TINYINT
 , nombre VARCHAR(30)
 , fecha DATE
)

CREATE TRIGGER dbo.triggerTablaPruebas ON tablaPruebas
AFTER INSERT, UPDATE, DELETE
AS
 SELECT * FROM deleted; 
 SELECT * FROM inserted;

 INSERT INTO tablaPruebas
VALUES( 1, 'PEDRO' , '20130101' ) 
, ( 2 , 'JUAN', '20130403' )

UPDATE tablaPruebas
SET nombre = 'LUIS' , fecha = '20101212'
WHERE cve = 2

DELETE FROM tablaPruebas
WHERE cve = 1

--- CREAR BD
CREATE TABLE Dept
(
	Dept_No			INT				NOT NULL,
	DNombre			VARCHAR(50)		NULL,
	Loc				VARCHAR(50)		NULL
)
GO
CREATE TABLE Emp
(
	Emp_No			INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Oficio			VARCHAR(50)		NULL,
	Dir				INT				NULL,
	Fecha_Alt		SMALLDATETIME	NULL,
	Salario			NUMERIC(9,2)	NULL,
	Comision		NUMERIC(9,2)	NULL,
	Dept_No			INT				NULL
)
GO
CREATE TABLE Hospital
(
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Telefono		VARCHAR(50)		NULL,
	Num_Cama		INT				NULL
)
GO
CREATE TABLE Doctor
(
	Doctor_No		INT				NOT NULL,
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Especialidad	VARCHAR(50)		NULL
)
GO
CREATE TABLE Sala
(
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Num_Cama		INT				NULL
)
GO
CREATE TABLE Plantilla
(
	Empleado_No		INT				NOT NULL,
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Funcion			VARCHAR(50)		NULL,
	T				VARCHAR(15)		NULL,
	Salario			NUMERIC(9,2)	NULL
)
GO
CREATE TABLE Enfermo
(
	Inscripcion		INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Fecha_Nac		VARCHAR(50)		NULL,
	S				VARCHAR(2)		NULL,
	NSS				INT				NULL
)	
GO
--Insertar datos en la table Dept
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE')
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACIÓN','MADRID')
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA')
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCIÓN','SALAMANCA')
GO
--Insertar datos en la tabla Emp
INSERT INTO Emp( Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7369,'SANCHEZ','EMPLEADO',7902,'17/12/1980',10400,0,20),
(7499,'ARROYO','VENDEDOR',7698,'22/02/1981',208000,39000,30),
(7521,'SALA','VENDEDOR',689,'22/02/1981',162500,65000,30),
(7566,'JIMENEZ','DIRECTOR',7839,'02/04/1981',386750,0,20),
(7654,'MARTIN','VENDEDOR',7698,'28/09/1981',182000,182000,30),
(7698,'NEGRO','DIRECTOR',7839,'01/05/1981',370500,0,30),
(7782,'CEREZO','DIRECTOR',7839,'09/06/1981',318500,0,10),
(7788,'NINO','ANALISTA',7566,'30/03/1987',390000,0,20),
(7839,'REY','PRESIDENTE',0,'17/11/1981',650000,0,10),
(7844,'TOVAR','VENDEDOR',7698,'08/09/1981',195000,0,30),
(7876,'ALONSO','EMPLEADO',7788,'03/05/1987',143000,0,20),
(7900,'JIMENO','EMPLEADO',7698,'03/12/1981',123500,0,30),
(7902,'FERNANDEZ','ANALISTA',7566,'03/12/1981',390000,0,20),
(7934,'MUÑOZ','EMPLEADO',7782,'23/06/1982',169000,0,10),
(7119,'SERRA','DIRECTOR',7839,'19/11/1983',225000,39000,20),
(7322,'GARCIA','EMPLEADO',7119,'12/10/1982',129000,0,20)
GO
--Insertar datos en la tabla Hospital
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(19,'Provincial','O Donell 50','964-4256',502)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(18,'General','Atocha s/n','595-3111',987)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(22,'La Paz','Castellana 1000','923-5411',412)
INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES(45,'San Carlos','Ciudad Universitaria','597-1500',845)
GO
--Insertar datos en la tabla Doctor
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,386,'Cabeza D.','Psiquiatría')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,398,'Best D.','Urología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(19,435,'López A.','Cardiología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(22,453,'Galo D.','Pediatría')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,522,'Adams C.','Neurología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,585,'Miller G.','Ginecología')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(45,607,'Chuki P.','Pediatría')
INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES(18,982,'Cajal R.','Cardiología')
GO 
--Insertar datos en la tabla Sala
INSERT INTO SALA VALUES(1,22,'Recuperación',10)
INSERT INTO SALA VALUES(1,45,'Recuperación',15)
INSERT INTO SALA VALUES(2,22,'Maternidad',34)
INSERT INTO SALA VALUES(2,45,'Maternidad',24)
INSERT INTO SALA VALUES(3,19,'Cuidados Intensivos',21)
INSERT INTO SALA VALUES(3,18,'Cuidados Intensivos',10)
INSERT INTO SALA VALUES(4,18,'Cardiología',53)
INSERT INTO SALA VALUES(4,45,'Cardiología',55)
INSERT INTO SALA VALUES(6,19,'Psiquiátricos',67)
INSERT INTO SALA VALUES(6,22,'Psiquiátricos',118) 
GO
--Insertar datos en la tabla Plantilla
INSERT INTO Plantilla(Hospital_Cod,Sala_Cod,Empleado_No,Apellido, Funcion, T, Salario)
VALUES
(22,6,1009,'Higueras D.','Enfermera','T',200500),
(45,4,1280,'Amigo R.','Interino','N',221000),
(19,6,3106,'Hernández','Enfermero','T',275000),
(19,6,3754,'Díaz B.','Enfermera','T',226200),
(22,1,6065,'Rivera G.','Enfermera','N',162600),
(18,4,6357,'Karplus W.','Interino','T',337900),
(22,1,7379,'Carlos R.','Enfermera','T',211900),
(22,6,8422,'Bocina G.','Enfermero','M',183800),
(45,1,8526,'Frank H.','Enfermera','T',252200),
(22,2,9901,'Núñez C.','Interino','M',221000)
GO
--Insertar datos en la tabla Enfermo
INSERT INTO Enfermo(Inscripcion,Apellido,Direccion,Fecha_Nac,S,NSS)
VALUES
(10995,'Laguía M.','Goya 20','16-may-56','M',280862422),
(14024,'Fernández M.','Recoletos 50','21-may-60','F',284991452),
(18004,'Serrano V.','Alcalá 12','23-jun-67','F',321790059),
(36658,'Domin S.','Mayor 71','01-ene-42','M',160654471),
(38702,'Neal R.','Orense 11','18-jun-40','F',380010217),
(39217,'Cervantes M.','Perón 38','29-feb-52','M',440294390),
(59076,'Miller B.','López de Hoyos 2','16-sep-45','F',311969044),
(63827,'Ruiz P.','Ezquerdo 103','26-dic-80','M',100973253),
(64823,'Fraiser A.','Soto 3','10-jul-80','F',285201776),
(74835,'Benítez E.','Argentina','05-oct-57','M',154811767)


CREATE TRIGGER BORRARSALA
ON SALA
FOR DELETE
AS
DELETE FROM PLANTILLA FROM SALA, DELETED
WHERE SALA.SALA_COD = DELETED.SALA_COD
SELECT * FROM DELETED

DELETE FROM SALA WHERE SALA_COD = 1

CREATE TRIGGER MODIFICARSALA
ON SALA
FOR UPDATE
AS
UPDATE PLANTILLA
SET SALA_COD = INSERTED.SALA_COD
FROM PLANTILLA, INSERTED, DELETED
WHERE PLANTILLA.SALA_COD = DELETED.SALA_COD
SELECT * FROM INSERTED

UPDATE SALA SET SALA_COD = 8 WHERE SALA_COD = 2

CREATE TRIGGER BORRARHOSPITAL ON HOSPITAL
FOR DELETE
AS
DELETE FROM PLANTILLA FROM PLANTILLA,DELETED WHERE
PLANTILLA.HOSPITAL_COD = DELETED.HOSPITAL_COD
DELETE FROM SALA FROM SALA,DELETED WHERE
SALA.HOSPITAL_COD = DELETED.HOSPITAL_COD
DELETE FROM DOCTOR FROM DOCTOR,DELETED WHERE
DOCTOR.HOSPITAL_COD = DELETED.HOSPITAL_COD

DELETE FROM HOSPITAL WHERE HOSPITAL_COD = 45

CREATE TABLE Control_BD
(
EMP_NO INT NULL,
USUARIO VARCHAR(20) NULL,
FECHA DATETIME NULL,
OPERACION VARCHAR(15) NULL
)
GO
CREATE TRIGGER [DAR ALTA]
ON EMP
FOR INSERT
AS
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION)
SELECT INSERTED.EMP_NO, USER_NAME(), GETDATE(), 'INSERCION'
FROM INSERTED

INSERT INTO EMP(EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES(7455,'GANOZA','EMPLEADO',7902,'29/05/2015',15520,0,20)



CREATE TRIGGER MODIFHOSPITAL ON HOSPITAL
FOR UPDATE
AS
UPDATE PLANTILLA
SET HOSPITAL_COD = INSERTED.HOSPITAL_COD
FROM PLANTILLA, INSERTED, DELETED
WHERE PLANTILLA.HOSPITAL_COD = DELETED.HOSPITAL_COD
UPDATE SALA
SET HOSPITAL_COD = INSERTED.HOSPITAL_COD
FROM PLANTILLA, INSERTED, DELETED
WHERE SALA.HOSPITAL_COD = DELETED.HOSPITAL_COD
UPDATE DOCTOR
SET HOSPITAL_COD = INSERTED.HOSPITAL_COD
FROM DOCTOR, INSERTED, DELETED
WHERE DOCTOR.HOSPITAL_COD = DELETED.HOSPITAL_COD

CREATE TRIGGER ACTUALIZARPLANTILLA ON PLANTILLA
FOR UPDATE
AS
DECLARE @HOSPITAL INT
SELECT @HOSPITAL = I.HOSPITAL_COD
FROM HOSPITAL AS H
INNER JOIN INSERTED AS I
ON H.HOSPITAL_COD = I.HOSPITAL_COD
IF (@HOSPITAL IS NULL)
BEGIN
PRINT 'NO EXISTE EL CODIGO DE HOSPITAL'
UPDATE PLANTILLA SET HOSPITAL_COD = D.HOSPITAL_COD
FROM PLANTILLA AS H
, INSERTED AS I
, DELETED AS D
WHERE H.HOSPITAL_COD = I.HOSPITAL_COD
END
ELSE
PRINT 'EXISTE EL CODIGO EN EL HOSPITAL'

UPDATE PLANTILLA SET HOSPITAL_COD = 140 WHERE EMPLEADO_NO = 1009

ALTER TRIGGER [DAR ALTA]
ON EMP
FOR INSERT
AS
DECLARE @ERROR INT
BEGIN TRAN
INSERT INTO Control_BD (EMP_NO, USUARIO, FECHA, OPERACION)
SELECT INSERTED.EMP_NO, USER_NAME(), GETDATE(), 'INSERCION'
FROM INSERTED
SET @ERROR = @@ERROR
IF @@ERROR <> 0
BEGIN
ROLLBACK TRAN
PRINT 'EXISTE UN ERROR EN EL TRIGGER'
PRINT @@ERROR
END
ELSE
BEGIN
COMMIT TRAN
PRINT 'EMPLEADO INSERTADO CORRECTAMENTE'
END

INSERT INTO EMP(EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES(8741,'ZEGARRA','EMPLEADO',7902,'30/05/2015',15520,0,20)

CREATE TRIGGER [DAR BAJA]
ON EMP
FOR DELETE
AS
INSERT INTO Control_BD(EMP_NO,USUARIO,FECHA,OPERACION)
SELECT DELETED.EMP_NO,USER_NAME(),GETDATE(),'BAJA'
FROM DELETED

	
DELETE FROM EMP WHERE EMP_NO = 8741

ALTER TABLE Control_BD ADD HORA VARCHAR(10)
GO
CREATE TRIGGER [MODIFICAREMP]
ON EMP
FOR UPDATE
AS
DECLARE @HORA VARCHAR(10)
SET @HORA = CONVERT(CHAR(2),DATEPART(HH, GETDATE())) + ':'
+ CONVERT(CHAR(2),DATEPART(MI,GETDATE()))
+ ':' + CONVERT(CHAR(2),DATEPART(SS,GETDATE()))
INSERT INTO Control_BD(EMP_NO,USUARIO,FECHA,OPERACION,HORA)
SELECT DELETED.EMP_NO,USER_NAME(),GETDATE(),'MODIFICACION',@HORA
FROM DELETED, INSERTED
WHERE DELETED.EMP_NO = INSERTED.EMP_NO

UPDATE EMP SET APELLIDO = 'ARROYO' WHERE EMP_NO = 7499

DROP TRIGGER BORRARSALA
DROP TRIGGER MODIFICARSALA
DROP TRIGGER BORRARHOSPITAL
DROP TRIGGER [DAR ALTA]
DROP TRIGGER MODIFHOSPITAL
DROP TRIGGER ACTUALIZARPLANTILLA
DROP TRIGGER [DAR BAJA]
DROP TRIGGER [MODIFICAREMP]


if not exists (select * from sysobjects where name='cars' and xtype='U')
    create table cars (
        Name varchar(64) not null
    )
go


IF  NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[YourTable]') AND type in (N'U'))

BEGIN
CREATE TABLE [dbo].[YourTable](
   COLUMN1 VARCHAR(50),
   COLUMN2 VARCHAR(50),
   COLUMN3 VARCHAR(50),
   COLUMN4 VARCHAR(50)
) 
END


IF EXISTS (
        SELECT type_desc, type
        FROM sys.procedures WITH(NOLOCK)
        WHERE NAME = 'procname'
            AND type = 'P'
      )
     DROP PROCEDURE dbo.procname
GO

CREATE PROC dbo.procname

AS
BEGIN
 PRINT 'jajajja'
END

    GO
    EXECUTE dbo.procname 

-- SET ACEPTA UN SOLO VALOR 
-- SELECT RECOGE VARIOS VALORES 

/*
 
CREATE PROCEDURE uspTransferFromSavingsToCheckingAccount
                @CustomerID INT,
                @Amount     MONEY
AS
  BEGIN
    SET XACT_ABORT  ON
    SET NOCOUNT ON
    
    BEGIN TRY
      BEGIN TRAN
      
      UPDATE CheckingAccount
      SET    Balance = Balance + @Amount
      WHERE  CustomerID = @CustomerID
      
      UPDATE SavingAccount
      SET    Balance = Balance - @Amount
      WHERE  CustomerID = @CustomerID
      
      PRINT 'TRANSFER SUCCESSFUL.'
      
      COMMIT
    END TRY
    
    BEGIN CATCH
      ROLLBACK
      
      PRINT 'INSUFFICIENT AMOUNT IN SAVINGS.'
    END CATCH
  END
 
GO


REATE TABLE TT (num int)
GO
CREATE PROC SP1
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO TT(num) VALUES (630)
INSERT INTO TT(num) VALUES (890)
COMMIT TRANSACTION
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
-- Error Message
DECLARE @Err nvarchar(1000)
SET @Err = ERROR_MESSAGE()
RAISERROR (@Err,16,1)
END CATCH
GO
EXEC SP1
*/