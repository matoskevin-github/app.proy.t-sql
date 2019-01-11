select * from compañiasdeenvios


create table tm_Compañias (
idCompañia int primary key identity,
Nombre varchar(60) not null,
Telefono varchar(60) not null
);

go
create trigger tgr_HistorialCompañias
on compañiasdeenvios
instead of insert
as
begin
	insert into tm_Compañias (Nombre,Telefono) 
	select nombreCompañia,telefono from inserted
end
go

insert compañiasdeenvios  values (20,'AAAAA','dasdsd');

select * from tm_Compañias

go
create trigger tgr_DescontarStockProductos
on detallesdepedidos
instead of insert
as
begin
	update productos set unidadesEnExistencia = unidadesEnExistencia - (select cantidad from inserted)
	where idproducto = (select idproducto from inserted)

end
go

select * from productos
select * from detallesdepedidos

insert detallesdepedidos values ('11077',75,8,50,0);