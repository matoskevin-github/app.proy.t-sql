-- "Server=DESKTOP-34VMVTI;Database=myDataBase;User Id=sa;Password=sql2014;"
use Northwind
go
create procedure usp_ListarClientes
as
select CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax
from Customers
go
select * from Customers


-- Detalle de Columnas
SELECT *
FROM Northwind.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Customers'