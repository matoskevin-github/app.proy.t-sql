select * from compa�iasdeenvios


create table tm_Compa�ias (
idCompa�ia int primary key identity,
Nombre varchar(60) not null,
Telefono varchar(60) not null
);

go
create trigger tgr_HistorialCompa�ias
on compa�iasdeenvios
instead of insert
as
begin
	insert into tm_Compa�ias (Nombre,Telefono) 
	select nombreCompa�ia,telefono from inserted
end
go

insert compa�iasdeenvios  values (20,'AAAAA','dasdsd');

select * from tm_Compa�ias

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