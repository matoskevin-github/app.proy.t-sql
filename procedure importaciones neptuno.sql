use importacionesNeptuno

go
create procedure usp_ListarCategorias
as
select IdCategoría,NombreCategoría,Descripción from Categorías
go

go
create procedure usp_ListarProductosXCategoria
@IdCategoria int
as
select IdProducto,NombreProducto,IdProveedor,IdCategoría,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
where IdCategoría = @IdCategoria
go

go
create procedure usp_ListarProductos
as
select IdProducto,NombreProducto,IdProveedor,IdCategoría,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
go

go
create procedure usp_ProductoDetalle
@IdProducto int
as
select IdProducto,NombreProducto,IdProveedor,IdCategoría,CantidadPorUnidad,PrecioUnidad,UnidadesEnExistencia,UnidadesEnPedido,Suspendido,imagen
from Productos
where IdProducto = @IdProducto
go