use importacionesNeptuno

go
create procedure usp_ListarCategorias
as
select IdCategor�a,NombreCategor�a,Descripci�n from Categor�as
go

go
create procedure usp_ListarProductosXCategoria
@IdCategoria int
as
select IdProducto,NombreProducto,IdProveedor,IdCategor�a,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
where IdCategor�a = @IdCategoria
go

go
create procedure usp_ListarProductos
as
select IdProducto,NombreProducto,IdProveedor,IdCategor�a,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
go

go
create procedure usp_ProductoDetalle
@IdProducto int
as
select IdProducto,NombreProducto,IdProveedor,IdCategor�a,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
where IdProducto = @IdProducto
go