-- listar Clientes
select * from Clientes;
-- listar nombre de los clientes
select nombrecliente from Clientes;
-- listar el nombre de cliente y nombre de contacto del cliente
select nombrecliente,nombrecontacto from Clientes;
-- listar nombre, saldo y saldo mas 100 soles del cliente
select nombrecliente,saldo,saldo + 100 
from Clientes;
-- concatenado el codigo y nombre del cliente
select idcliente || ' ' ||nombrecliente 
from Clientes;
-- concaternar texto
select 'El nombre del Cliente es : ' || nombrecliente as "Nombre Cliente"
from Clientes ;
-- clausula distinct
select distinct idPedido
from detallePedidos;
-- convertir a mayuscula
select upper('hello world') from dual;
insert into Categorias values  (9,upper('chatarra'));
insert into Categorias  values (11,'chatarra');
select * from categorias ;
-- convertir a mayuscula a cada palabra
select INITCAP('hello world') from dual;
-- convertir a minuscula
select lower('HELLO WORLD') from dual;
-- concatenar texto
select concat(idcliente,nombrecliente ) from clientes;
select idcliente || nombrecliente  from clientes;
select idcliente || ' ' || nombrecliente  from clientes;
select concat(concat(idcliente,' '),nombrecliente ) from clientes;
-- extraer texto
select substr('www.RebelionRider.com',5,14) from dual;
    -- error 1 substr
    select substr('www.RebelionRider.com',23,14) from dual;
     -- error 2 substr
    select substr('www.RebelionRider.com',5,23) from dual;
    -- error 3 substr
    select substr(50000-7,2,4) from dual;
    select substr(sysdate,4,3) from dual;
-- detalle de tabla
describe Clientes;
desc Clientes;
-- crear table pk y fk
create table Empleados (
  idEmpleado number(3) primary key,
  Nombre varchar(20) not null,
  Apellido varchar(20) not null,
  Dni char(10) unique
);
-- eliminar tabla 
drop table Empleados;
-- agregar primary key a la tabla empleados
create table Empleados (
  idEmpleado number(3)constraint pk_idEmpleado primary key,
  Nombre varchar(20) not null,
  Apellido varchar(20) not null,
  Dni char(10) unique
);
-- agregar primary key a la tabla empleados
create table Empleados (
  idEmpleado number(3),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null,
  Dni char(10) unique ,
  constraint pk_idEmpleado primary key (idEmpleado)
);
-- eliminar constraint de tabla
ALTER TABLE Empleados
DROP CONSTRAINT pk_idEmpleado;
-- agregar primary key a la tabla empleados
create table Empleados (
  idEmpleado number(3),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null,
  Dni char(10) unique  
);

ALTER TABLE Empleados
ADD CONSTRAINT pk_idEmpleado primary key (idEmpleado);

-- agregar 2 primary key a la tabla empleados
create table Empleados (
  idEmpleado number(3),
  Dni char(8),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null, 
  constraint pk_idEmpleado primary key (idEmpleado,Dni)  
);

alter table Empleados drop constraint pk_idEmpleado;
alter table Empleados add constraint pk_idEmpleado primary key (idEmpleado);

-- crear tabla
create table Distritos (
idDistrito number primary key,
Detalle varchar(20) not null
);
-- agregar foreign key 
create table Empleados (
  idEmpleado number(3),
  Dni char(8),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null, 
  iddDistrito number constraint fk_idDistrito references Distritos (idDistrito)
);

drop table Empleados;

-- agregar foreign key 
create table Empleados (
  idEmpleado number(3),
  Dni char(8),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null, 
  idDistrito number ,
  constraint fk_idDistrito foreign key(idDistrito) references Distritos (idDistrito)
);

-- agregar foreign key 
create table Empleados (
  idEmpleado number(3),
  Dni char(8),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null, 
  idDistrito number 
);

alter table Empleados add constraint fk_idDistrito foreign key (idDistrito) references Distritos(idDistrito);

-- borrado en cascada

alter table Empleados add constraint fk_idDistrito foreign key (idDistrito) references Distritos(idDistrito) on delete cascade;

-- renombrar un tabla
alter table Empleados rename to Trabajadores
-- agregar columna a una tabla
desc Distritos;
alter table Trabajadores add Descripcion varchar2(60) not null

-- Eliminar columna
desc Distritos;
alter table Trabajadores drop column Descripcion ;
-- renombrar columna
create table Empleados (
  idEmpleado number(3),
  Dni char(8),
  Nombre varchar(20) not null,
  Apellido varchar(20) not null, 
  idDistrito number 
);

alter table Empleados rename column idDistrito to Distrito;

-- cambiar atributos columna
alter table Empleados modify idEmpleado number(10);
-- clausula natural join
select p.nombre as Producto,c.nombre as Categoria
from Productos P natural join Categorias C using idCategoria
-- clausula join
select p.nombre as Producto,c.nombre as Categoria
from Productos P join Categorias C on (P.idCategoria = C.idCategoria )
-- combinacion de tablas right outer join con on
Select P.Nombre as Producto,C.Nombre as Categoria,P.Precio
from Productos P right outer join Categorias C on (P.idCategoria = C.idCategoria)
-- combinacion de tablas right outer join con using
Select P.Nombre as Producto,C.Nombre as Categoria,P.Precio
from Productos P right outer join Categorias C on (idCategoria)
-- combinacion de tablas right outer join con where
Select P.Nombre as Producto,C.Nombre as Categoria,P.Precio
from Productos P right outer join Categorias C using (idCategoria)
where P.Precio > 10
-- combinacion de tablas left outer join con on
select P.idPedido,C.NombreCliente
from Pedidos P left outer join Clientes C on (P.idCliente = C.idCliente)
-- combinacion de tablas left outer join con on
select P.idPedido,C.NombreCliente
from Pedidos P left join Clientes C on (P.idCliente = C.idCliente)
-- combinacion de tablas left outer join con on
select P.idPedido,C.NombreCliente
from Pedidos P left join Clientes C using (idCliente)
-- combinacion de tablas full outer join con on
select DP.idPedido,P.Nombre,DP.Precio,DP.Cantidad
from DetallePedidos DP full outer join Productos P on (DP.idProducto = P.idProducto)
-- combinacion de tablas full outer join con using
select DP.idPedido,P.Nombre,DP.Precio,DP.Cantidad
from DetallePedidos DP full outer join Productos P using (idProducto)
-- combinacion de tablas full outer join con using
select DP.idPedido,P.Nombre,DP.Precio,DP.Cantidad
from DetallePedidos DP full outer join Productos P using (idProducto)
where DP.Precio > 12
-- combinacion de tablas full outer join con using
select DP.idPedido,P.Nombre,DP.Precio,DP.Cantidad
from DetallePedidos DP full outer join Productos P using (idProducto)
where DP.Precio < 10
order by DP.Precio desc
-- clausula inner join con on
select p.nombre as Producto,c.nombre as Categoria
from Productos P inner join Categorias C on (P.idCategoria = C.idCategoria )
-- clausula inner join con using
select p.nombre as Producto,c.nombre as Categoria
from Productos P inner join Categorias C using (idCategoria )
-- clausula cross join
select p.nombre as Producto,c.nombre as Categoria
from Productos P cross join Categorias C
-- insertar datos formas
 -- forma 1
insert into Categorias (9,'Enlatados');
 -- forma 2
insert into Categorias (idcategoria,nombre) values (9,'Enlatados');
-- insertar datos con select
 -- forma 1
insert into Categorias 
select productos.idproducto,productos.nombre from Productos
where productos.idproducto >= 9 
-- forma 2
insert into Categorias (idCategoria,Nombre)
select productos.idproducto,productos.nombre from Productos
where productos.idproducto >= 9 
-- clausula delete
delete from Categorias
where idCategoria = 70 ;

delete from Categorias;
rollback;
-- eliminar contenido de tabla
truncate table DetallePedidos;
-- crear usuario 
create user iroman identified by jarvis
default tablespace users temporary tablespace temp
quota 20M on users
account unlock;

select * from dba_users where username = 'IROMAN';

drop user iroman;
show user;
-- otorgar permisos a usuarios
grant create table to system;
grant create synonym,create view,create sequence to system;
grant create procedure to system;
grant create trigger to system with admin option; 

grant select on Productos to system;

grant update,insert,index,delete,references on Productos to system;

grant all on Productos to system;

grant update (Nombre) on Productos to system;

grant update on Productos to system with grant option;
-- crear roles
create role demo1 not identified;

create role demo2 identified by password123;

create role demo3 identified externally;

create role demo4 identified globally;

-- otorgar permisos
grant create table to demo1 with admin option;

grant select on Productos to demo1;

-- pasar permisos
grant demo1 to demo2;
--sentencia case
select idcategoria,nombre,
( case idCategoria
 when 1 then 'Categoria Uno'
 when 2 then 'Categoria Dos'
 when 3 then 'Categoria Tres'
 when 4 then 'Categoria Cuatro'
 when 5 then 'Categoria Cinco'
 when 6 then 'Categoria Seis'
 else 'Vacio' end
) as Detalle
from Categorias;

select idproducto,nombre as Producto ,precio,stock,
(
  case 
  when precio = 10 then 'Precio es 10'
  when nombre like 'A%' then 'Comienza con A'
  when precio between 11 and 15 then 'Esta entre 11 y 15'
  else 'null' end
) as Descripcion
from Productos

-- clausula decode
select idProducto,Nombre,
decode (idProducto,
  '1' , 'Categoria Baja',
  '3' , 'Categoria Baja',
  '5' , 'Categoria Baja',
  'nulo'
) as Descripcion
from productos
-- crear directorio y permisos
create directory Ruta as 'C:\Nueva_carpeta';

-- permisos de directorio
grant read,write on directory ruta to hr;

-- crear vista
create view vw_Categorias
as
select idCategoria,Nombre
from Categorias

desc vw_Categorias
-- notas a la categoria se le puede hacer select,insert,update y delete
--crear sequencia 
create sequence sq_demo 
start with 1
increment by 2
maxvalue 10
minvalue 1
cache 3
cycle
order ;

create sequence sq_demo01;

select sq_demo.CURRVAL from dual;

select sq_demo.NEXTVAL from dual;
-- crear indices 
create unique index idx_idProducto on Productos(idProducto) tablespace users;

create unique index idx_idCategoria on Categorias(Nombre) ;

-- crear tablespace small

create smallfile tablespace rebellionrider
datafile 
   'C:\Nueva_carpeta\rebel1.dbf' size 100M,
   'C:\Nueva_carpeta\rebel2.dbf' size 100M
logging
extent management local autoallocate
segment space management auto;
-- crear tablespace big permanete
create bigfile tablespace rebellionrider2
datafile 
  'C:\Nueva_carpeta\rebel.dbf' size 1G
logging
extent management local autoallocate
segment space management auto;
-- eliminar tablespace
drop tablespace rebellionrider;
drop tablespace rebellionrider2;

-- crear tablespace temporal
create smallfile temporary tablespace rebellionrider
tempfile 
   'C:\Nueva_carpeta\rebel.dbf' size 100M
extent management local uniform size 1M;

create bigfile temporary tablespace rebellionrider
tempfile 
   'C:\Nueva_carpeta\rebel.dbf' size 100M
extent management local uniform size 1M;
-- crear undo tablespace
create smallfile undo tablespace tbsp_undo
datafile    'C:\Nueva_carpeta\rebel.dbf' size 100M
autoextend on next 500M
maxsize unlimited
retention noguarantee;

drop tablespace tbsp_undo;
-- clausula union
select productos.stock as Productos from Productos
union
select categorias.idcategoria as Categorias from Categorias;

select productos.stock as Productos from Productos
union all
select categorias.idcategoria as Categorias from Categorias;
-- clausula intersect
select productos.stock as Productos from Productos
intersect
select categorias.idcategoria as Categorias from Categorias;
-- clausula minus
select productos.stock as Productos from Productos
minus
select categorias.idcategoria as Categorias from Categorias;
-- clausula LPAD()
select lpad('Victor',20,'$') from dual;
-- clausula RPAD()
select rpad('Victor',20,'$') from dual;

select lpad(Nombre,20,'*')
from Productos;
-- funcion nvl
select nvl(null,0) from dual;

select nvl(null,0) + 100 from dual;
-- funcion nvl2
select nvl2(null,'Vacio',0) from dual;

select nvl2(1,'not null',0) from dual;
-- sentencia loop
set serveroutput on;

declare 
v_counter number := 0;
v_result number;
begin 
loop
  v_counter := v_counter + 1;
  v_result := 19 * v_counter;
  dbms_output.put_line('19' || ' X ' || v_counter || ' = ' || v_result);
  if v_counter >= 10 then
  exit;
  end if;
end loop;
end;

-- sentencia while

declare 
v_counter number := 1;
v_result number;
begin 
while v_counter <= 12   loop
  v_result := 12 * v_counter;
  dbms_output.put_line('19' || ' X ' || v_counter || ' = ' || v_result);
  v_counter := v_counter + 1;
end loop;
dbms_output.put_line('Outside the loop');
end;


declare 
v_test boolean := true;
v_counter number :=0;
begin 
while v_test loop
  v_counter := v_counter + 1;
  dbms_output.put_line(v_counter);
  if v_counter = 10 then
  v_test := false;
  end if;
end loop;
dbms_output.put_line('Outside the loop');
end;

-- sentencia for

begin
 for v_counter in 1 .. 10 loop
 dbms_output.put_line(v_counter);
 end loop;
end;

begin
 for v_counter in reverse 1 .. 10 loop
 dbms_output.put_line(v_counter);
 end loop;
end;

declare 
v_result number;
begin
 for v_counter in 1 .. 12 loop
  v_result := 12 * v_counter;
 dbms_output.put_line('12' || ' X ' || v_counter || ' = ' || v_result);
 end loop;
end;
-- sentencia if
set serveroutput on;
declare
  var_num number :=9;
begin
  if var_num < 10 then
    dbms_output.put_line('Es menor a 10');
  end if;
  dbms_output.put_line('Sentencia if terminada');
end;

declare
  var_nombre varchar(30) := 'Victor Kevin';
  var_apellido varchar(30) := 'Matos Secce';
begin
  if var_nombre = 'Victor Kevin' and var_apellido = 'Matos Secce' then
  dbms_output.put_line('Los Nombres coinciden.');
  end if;
end;
-- sentencia if else
set serveroutput on;
declare
  var_numero number := &enter_a_number;
begin
  if mod(var_numero,2) = 0 then
    dbms_output.put_line('El numero es par');
  else
    dbms_output.put_line('El numero es impar');
  end if;
end;
-- sentencia if else elseif
set setserveroutput on;
declare 
  var_numero number := &enter_a_number;
begin
  if var_numero = 1 then
    dbms_output.put_line('Dia Lunes');
  elsif var_numero = 2 then
    dbms_output.put_line('Dia Martes');
  elsif var_numero = 3 then
    dbms_output.put_line('Dia Miercoles');
  elsif var_numero = 4 then
    dbms_output.put_line('Dia Jueves');
  elsif var_numero = 5 then
    dbms_output.put_line('Dia Viernes');
  elsif var_numero = 6 then
    dbms_output.put_line('Dia Sabado');
  elsif var_numero = 7 then
    dbms_output.put_line('Dia Domingo');
  else
    dbms_output.put_line('Ingresar numeros de 1 a 7');
  end if;
end;
-- crear funcion en oracle
create or replace function fdu_ObtenerPrecioId(var_idProducto in number)
return number
as
  var_Precio number(10,2);
begin
  select Precio into var_Precio
  from Productos
  where idProducto = var_idProducto;
 return var_Precio;
end ;

create or replace function fdu_ObtenerPrecioId(var_idProducto in number)
return productos.precio%type
as
  var_Precio number(10,2);
begin
  select Precio into var_Precio
  from Productos
  where idProducto = var_idProducto;
 return var_Precio;
end fdu_ObtenerPrecioId;

-- ejecutar function 
declare
  var_precio number(10,2);
begin
  var_precio := fdu_ObtenerPrecioId(1);
  dbms_output.put_line('Valor del precio : ' || var_precio);
end;

-- ejecutar function 
EXEC DBMS_OUTPUT.PUT_LINE(fdu_ObtenerPrecioId(1));

-- ejecutar function 
select fdu_ObtenerPrecioId(1) from dual;

/*
las parametros de tipo in entrada
las parametros de tipo out salida
los parametros de tipo in out entrada - salida

*/

-- crear procedimientos almacenados
create or replace procedure usp_GuardarCategoria
( var_idCategoria in number,
  var_Nombre in nvarchar2)
is
begin
insert into Categorias values (var_idcategoria,var_nombre);
end;

-- ejecutar procedimiento
begin 
   usp_GuardarCategoria(9,'Enlatados');
end;

-- ejecutar procedimiento
exec  pck_Categorias.usp_GuardarCategoria(10,'XXXEnlatadosXXX');
select * from Categorias

-- ejecutar procedimiento
execute  usp_GuardarCategoria(11,'UUUEnlatadosUUU');

-- crear procedimientos almacenados
create or replace procedure usp_ActualizarCategoria
( var_idCategoria in number,
  var_Nombre in nvarchar2,
  var_Mensaje out varchar)
is
begin
  update Categorias set Nombre = var_Nombre
  where idCategoria = var_idCategoria;
  
  var_Mensaje:= 'Registro Actualizado';
exception
  when others then
  var_Mensaje:= 'Mensaje : ' || sqlerrm;
end usp_ActualizarCategoria;

declare
  var_Mensaje varchar(50);
begin
  usp_ActualizarCategoria(11,'XYYEnlatadosYYX',var_mensaje);
  dbms_output.put_line(var_mensaje);
end;

-- crear cursor explicitos
declare
 cursor var_cursor is select idCategoria,Nombre from Categorias;
begin
  for cat in var_cursor loop
    dbms_output.put_line('Codigo -> ' || cat.idCategoria || ' ------ ' ||'Descripcion -> ' || cat.Nombre );
  end loop;
end;

-- un cursor explicito almacena una sentencia select en memoria

-- crear cursor implicitos
declare
  
begin
  update Productos set Precio = Precio + 10
  where Precio > 150;
  if SQL%FOUND then
    dbms_output.put_line('Se actualizaron '|| SQL%ROWCOUNT || ' filas' );
  end if;
end;

declare
  var_cantidad number;
begin
  select idproducto into var_cantidad from Productos
  where Precio > 500 ;
  if SQL%NOTFOUND then
    dbms_output.put_line('No encontro registros');
    else
    dbms_output.put_line('Se encontro multiples registros');
  end if;
exception
  when NO_DATA_FOUND then
      dbms_output.put_line('No hay registros');
  when others then
       dbms_output.put_line('Otro error');
end;

/*
un cursor implicito funciona con sentencias dml
variable 
SQL%FOUND - si funciona la sentencia
SQL%NOTFOUND - si no funciona la sentencia
SQL%ROWCOUNT - cuenta registros afectados
*/

-- crear package en oracle
create or replace package pck_Categorias
as  
  function fdu_ObtenerPrecioId(var_idProducto in number)return number;
  procedure usp_GuardarCategoria(var_idCategoria in number,var_Nombre in nvarchar2);
  procedure usp_ActualizarCategoria( var_idCategoria in number,  var_Nombre in nvarchar2);
end ;

-- crear package body en oracle
CREATE OR REPLACE PACKAGE BODY pck_Categorias
as
 function fdu_ObtenerPrecioId(var_idProducto in number)
  return number as var_Precio number (10,2);
 begin
  select Precio into var_Precio
  from Productos
  where idProducto = var_idProducto;
 return var_Precio;
 end fdu_ObtenerPrecioId;
 
  procedure usp_GuardarCategoria ( var_idCategoria in number, var_Nombre in nvarchar2)
   is
  begin
  insert into Categorias values (var_idcategoria,var_nombre);
  end usp_GuardarCategoria ;
 
  procedure usp_ActualizarCategoria ( var_idCategoria in number, var_Nombre in nvarchar2)
    is
  begin
    update Categorias set Nombre = var_Nombre
    where idCategoria = var_idCategoria;  
  end usp_ActualizarCategoria; 


end pck_Categorias;


CREATE OR REPLACE PACKAGE "OPERACIONES_BASICAS" AS 
 PROCEDURE SUMAR(A NUMBER,B NUMBER);
 PROCEDURE RESTAR(A NUMBER,B NUMBER); 
END OPERACIONES_BASICAS;

CREATE OR REPLACE PACKAGE BODY "OPERACIONES_BASICAS" AS 
 PROCEDURE SUMAR(A NUMBER,B NUMBER) AS
  RESULTADO NUMBER(10);
 BEGIN 
  RESULTADO := A + B;
 END SUMAR;
 PROCEDURE RESTAR(A NUMBER,B NUMBER) AS
  RESULTADO NUMBER(10);
 BEGIN 
  RESULTADO := A - B;
 END RESTAR;
END OPERACIONES_BASICAS;

describe Clientes;

-- subConsultas

select * from Clientes
where idCliente = 'BOLID';

select nombrecliente,nombrecontacto,direccion from Clientes
where idCliente = 'BOTTM';

select nombrecliente,nombrecontacto,direccion from Clientes
where idCliente = (select idcliente from Clientes where idcliente = 'BOTTM');

select idcliente,nombrecliente,saldo
from Clientes
where Saldo = (Select min(Saldo) from Clientes);

select idcliente,nombrecliente,saldo
from Clientes
where Saldo = (Select max(Saldo) from Clientes);

-- crear vista e insertar datos

create or replace view vw_Categorias
as
select idcategoria,nombre from Categorias;

insert into vw_categorias values (9,'Enlatados');

update vw_categorias set nombre = 'XXXEnlatadosXXX'
where idcategoria = 9;

DELETE FROM vw_categorias WHERE idcategoria = 9;

describe vw_categorias;

-- PL/SQL
set serveroutput on;
declare
  var_valor1 number;
  var_valor2 number;
  var_Resultado number;
begin
  var_valor1:= 5;
  var_valor2:= 5;
  var_Resultado:=   var_valor1 + var_valor2 ;
  dbms_output.put_line('El Resultado es : ' || var_Resultado );
exception
  when others then
  dbms_output.put_line('Error al hacer operacion');
end ;

-- cursores con funcion fetch solo trae un dato
declare 
  var_nombre varchar(50);
  cursor crs_NombreClientes is select NombreCliente from Clientes;
begin 
  open crs_NombreClientes;
  fetch crs_NombreClientes into var_nombre;
  dbms_output.put_line('Nombre de Clientes -> ' ||var_nombre );
end;

declare 
  var_nombre varchar(50);
  cursor crs_NombreClientes is select NombreCliente from Clientes;
begin 
  open crs_NombreClientes;
  fetch crs_NombreClientes into var_nombre;
  dbms_output.put_line('Nombre de Clientes -> ' ||var_nombre );
  close crs_NombreClientes ; -- cierra el recorrido
end;

declare
  cursor crs_Productos is select idProducto,Nombre from Productos;
  var_idProducto number;
  var_Nombre varchar(50);
begin
  open crs_Productos;
  loop
  fetch crs_Productos into var_idProducto,var_Nombre;
  exit when (crs_Productos%notfound);
  dbms_output.put_line('Codigo -> '|| var_idproducto ||' - ' ||'Nombre Producto -> ' || var_Nombre);
  end loop;
  close crs_Productos;
end ;

-- atributos de un cursor implicito SQL%FOUND - SQL%NOTFOUND - SQL%ROWCOUNT

-- funciones de oracle

select power(25,2) from dual;

select sqrt(625) from dual;

select mod(5,2) from dual;

select ascii(64) from dual;

select ascii('A') from dual;

select floor(13.65) from dual;

select floor(13.70) from dual;

select ceil(13.70) from dual;

select round(15.70) from dual;


select length('AAAAAAAAA') from dual;

select reverse('elcaro') from dual;

select Upper('asd ddff') from dual;

select lower('ASD FFF') from dual;

select initcap('xx gff asd') from dual;


select ltrim('Oracle','o') from dual;

select trim('o' from 'Oracle') from dual;

select lpad('Oracle',5,'&&&&&') from dual;

select replace('raclo','Oracle') from dual;

select replace('raclo','Ora','Oracle') from dual;

-- funciones de fecha
select current_date from dual;

select add_months(sysdate, 1) from dual;

select months_between(sysdate,to_date('01/02/1995','dd/mm/yyyy')) from dual;

select NEXT_DAY(sysdate,'Lunes') from dual;

select LAST_DAY(sysdate) from dual;

-- Conversion de datos

select to_char(sysdate,'Day') from dual;


select to_date('Diciembre','mm') from dual;

select to_number('20') from dual;

select greatest(1,2,3),least(1,2,3) from dual;

-- crear sinonimos de objetos

create synonym S_Categoria for Categorias;

INSERT INTO S_Categoria VALUES  (10,'Otra Categoria' );

truncate table detallePedidos;
commit;

select * from productos
where stock is null;


select * from productos
where stock is not null;

-- rollback
INSERT INTO S_Categoria VALUES  (9,'Otra Categoria' );
rollback ;

select * from Categorias;

-- save point
INSERT INTO S_Categoria VALUES  (9,'Otra Categoria' );
savepoint CG ;

select * from Categorias;

-- formatear columnas

column Precio format 9.99.999.99;
select * from Productos;

-- manejo de constantes
set serveroutput on;
declare
  var_PI constant number(7,6) not null default 3.141592;
begin
  dbms_output.put_line(var_pi);
end;

-- manejo de variable
set serveroutput on;
declare
variable var_Nombre varchar2(30);
exec :var_Nombre:= 'Matos Secce Victor Kevin'; -- se asigna primero
begin
    :var_Nombre:= 'Victor Kevin'; -- se asigna segundo
    dbms_output.put_line(:var_Nombre);
end;

print :var_Nombre;

set autoprint on;
variable var_Resultado varchar2(30);
exec :var_Resultado :='Kevin Matos';

-- crear trigger oracle
create table SuperHeroes(
  nombre varchar2(20)
);
create or replace trigger tgr_SuperHeroes_insert
before insert on SuperHeroes
for each row
enable
declare
  var_Nombre varchar2(20);  
begin
  select user into var_Nombre
  from dual;
  dbms_output.put_line('Nombre Creado -> ' || var_Nombre);
end;

create or replace trigger tgr_SuperHeroes_update
before update on SuperHeroes
for each row
enable
declare
  var_Nombre varchar2(20);  
begin
  select user into var_Nombre
  from dual;
  dbms_output.put_line('Nombre Actualizado -> ' || var_Nombre);
end;

INSERT INTO superheroes values ('CXXXX');

update superheroes set nombre = 'YYYYYYY'
where nombre =  'CXXXX';

create or replace trigger tgr_superHeroes_dml
before insert or delete or update on superheroes
for each row
declare
  var_Usuario varchar2(30);
begin
  select user into var_Usuario from dual;
  if INSERTING then
    dbms_output.put_line('Accion de insert del usuario -> ' || var_Usuario);
  elsif DELETING then
    dbms_output.put_line('Accion de delete del usuario -> ' || var_Usuario);
  elsif UPDATING then
    dbms_output.put_line('Accion de update del usuario -> ' || var_Usuario);
  end if;
end;

describe productos

create table audit_Productos (
audit_idProducto number ,
audit_Nombre varchar(70) ,
audit_idCategoria number,
audit_Precio number(10,2) ,
audit_Stock number ,
audit_Usuario varchar(30),
audit_Fecha varchar(30),
audit_Estado varchar(30)
);

create or replace trigger tgr_Productos_audit
before insert or delete or update on Productos
for each row
enable
declare
  var_Usuario varchar(30);
  var_Fecha varchar(30);
begin
  select user,to_char(sysdate,'DD/MM/YYYY HH24:MI:SS')into var_Usuario,var_Fecha from dual;
   if INSERTING then
    insert into audit_Productos values (:new.IDPRODUCTO,:new.NOMBRE,:new.IDCATEGORIA,:new.PRECIO,:new.STOCK,var_Usuario,var_Fecha,'INSERT');    
  elsif DELETING then
    insert into audit_Productos values (:old.IDPRODUCTO,:old.NOMBRE,:old.IDCATEGORIA,:old.PRECIO,:old.STOCK,var_Usuario,var_Fecha,'DELETE'); 
  elsif UPDATING then
    insert into audit_Productos values (:new.IDPRODUCTO,:old.NOMBRE,:old.IDCATEGORIA,:old.PRECIO,:old.STOCK,var_Usuario,var_Fecha,'UPDATE'); 
  end if;
end;
  


insert into Productos values ( 100 ,'Gaseosa Coca Kola', 1 , 4.50 , 39 );

update Productos set nombre = 'Inca Kola' ,Precio = 5.80,stock = 2500
where idproducto = 100;

delete from productos where idproducto = 100;

describe Productos;
select * from audit_Productos;


create table audit_Categorias(
audit_idCategoria number,
audit_Nombre nvarchar2(50),
audit_Fecha nvarchar2(50)
);



create or replace trigger tgr_Categorias_audit
before insert or delete or update on Categorias
for each row
enable
declare
  var_Fecha varchar(30);
begin
  select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS')into var_Fecha from dual;
   if INSERTING then
     insert into audit_Categorias values (:new.idCategoria,:new.Nombre,var_Fecha);
  elsif DELETING then
     delete from audit_Categorias where audit_idCategoria = :old.idCategoria;
  elsif UPDATING then
    update  audit_Categorias set audit_Nombre = :new.Nombre,audit_Fecha = var_Fecha
    where audit_idCategoria = :old.idCategoria;
  end if;
end;


insert into categorias values (100,'Enlatados');

update Categorias set nombre = 'XXXEnlatados'
where idcategoria = 100;

delete from Categorias where idcategoria = 100;

select * from audit_categorias;

-- auditoria a esquema
create table schema_audit (
  ddl_Date date,
  ddl_User varchar2(35),
  object_Created varchar2(35),
  object_Name varchar2(35),
  ddl_Operation varchar2(35)
);

create or replace trigger audit_tr
after DDL on schema
begin
  insert into schema_audit values (sysdate, 
  sys_context('USERENV','CURRENT_USER'),
  ora_dict_obj_type,
  ora_dict_obj_name, 
  ora_sysevent);
end ;


create table Distritos (
idDistrito number,
Distrito varchar2(50) );

select * from schema_audit ;


-- auditoria de logeo
create table event_audit (
  event_type varchar(20),
  logon_date date,
  logon_time varchar(20),
  logof_date date,
  logof_time varchar(20)
);

create or replace trigger lgon_audit
after logon on schema
begin
  insert into event_audit values (
    ora_sysevent,
    sysdate,
    to_char(sysdate, 'hh24:min:ss'),
    null,
    null
  );
commit;
end;

DISC;

conn system/root;

/*
before antes de realizar la transaccion
after despues de realizar la transaccion
*/





