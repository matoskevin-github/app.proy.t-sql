set dateformat dmy

use master
if DB_ID('Platanitos') is not null
  drop database Platanitos
go

create database Platanitos
go

use Platanitos

create table Sexos(
  idSexo char(1) primary key not null,
  Detalle nchar(20) unique
);

create table Marcas (
  idMarca int identity primary key,
  Detalle nchar(20) unique 
);

create table Colores (
  idColor int identity primary key,
  Detalle nchar(20) unique 
);

create table Items (
  idItem int identity primary key, 
  Detalle nchar(30) unique 
);

create table Tallas (
  idTalla int identity primary key,
  Detalle char(15) unique 
);

create table Categorias (
  idCategoria int identity primary key,
  Detalle nchar(20) unique
);

create table CategoriaItem (
  idCategoriaItem int identity primary key,
  Detalle nchar(20) unique
);

create table CategoriaXCategoriaItem (
  idCategoriaItem int references CategoriaItem,
  idCategoria int references Categorias,
);

create table SubCategorias (
  idSubCategoria int identity primary key,
  idCategoria int references Categorias,
  Detalle nchar(35)
);

create table Productos (
  idProducto int identity primary key,
  idItem int references Items, 
  Detalle nchar(30) not null,
  idSubCategoria int references SubCategorias,
  idMarca int references Marcas,
  idColor int references Colores,
  Precio money not null,
  Nuevo bit not null,
  Imagen varchar(max) not null -- ruta local
);

create table ProductosColores (
  idProducto int references Productos,
  idColor int references Colores,
  idTalla int references Tallas,
  Stock int not null
);

create table Clientes (
  idCliente char(10) primary key not null,
  Nombres nchar(30) not null,
  Apellidos nchar(30) not null,
  DNI char(8) unique, 
  Genero char(1) check ( Genero in ('M','F') ),
  Correo nchar(50) unique,
  Password nchar(10) not null,
  Imagen image 
);

go

insert into Sexos values ('M','Masculino');
insert into Sexos values ('F','Femenino');

insert into Marcas values ('Adidas');
insert into Marcas values ('Reebok');
insert into Marcas values ('Puma');
insert into Marcas values ('Converse');
insert into Marcas values ('Nike');
insert into Marcas values ('New Balance');
insert into Marcas values ('CAT');
insert into Marcas values ('Umbro');
insert into Marcas values ('Dunkelvolk');
insert into Marcas values ('Vans');
insert into Marcas values ('DC');

insert into Colores values ('Negro');
insert into Colores values ('Blanco');
insert into Colores values ('Gris');
insert into Colores values ('Rosado');
insert into Colores values ('Rojo');
insert into Colores values ('Fucsia');
insert into Colores values ('Celeste');
insert into Colores values ('Verde');
insert into Colores values ('Azul');
insert into Colores values ('Acero');
insert into Colores values ('Olivo');
insert into Colores values ('Morado');
insert into Colores values ('Vino');
insert into Colores values ('Azulino / Azul');
insert into Colores values ('Camel');
insert into Colores values ('Gris / Blanco');
insert into Colores values ('Gris / Rojo');
insert into Colores values ('Musgo');
insert into Colores values ('Negro / Amarillo');
insert into Colores values ('Negro / Celeste');
insert into Colores values ('Gris / Negro');
insert into Colores values ('Gris Oscuro');
insert into Colores values ('Guinda');
insert into Colores values ('Negro / Blanco');
insert into Colores values ('Tan');
insert into Colores values ('Negro / Rojo');
insert into Colores values ('Negro /Gris');
insert into Colores values ('Marron');
insert into Colores values ('Negro / Azul');

insert into Items values ('Zapatilla de Hombre');
insert into Items values ('Zapatilla Botín de Hombre');
insert into Items values ('Zapato de Hombre');
insert into Items values ('Calzado de Hombre');
insert into Items values ('Sandalia de Hombre');

insert into Tallas values ('35'),('36'),('37'),('38'),('39'),('40'),('41'),('42'),('43');
insert into Tallas values ('39 - 7 US');
insert into Tallas values ('40.5 - 8 US');
insert into Tallas values ('41 - 8.5 US');
insert into Tallas values ('42 - 9 US');
insert into Tallas values ('42.5 - 9.5 US');
insert into Tallas values ('43 - 10 US');
insert into Tallas values ('44 - 10.5 US');
insert into Tallas values ('44.5 - 11 US');

insert into Categorias values ('MUJERES');
insert into Categorias values ('HOMBRES');
insert into Categorias values ('KIDS');
insert into Categorias values ('ZAPATILLAS');
insert into Categorias values ('CARTERAS');
insert into Categorias values ('ROPA');
insert into Categorias values ('ACCESORIOS');
insert into Categorias values ('CASA');
insert into Categorias values ('OFERTAS');
insert into Categorias values ('NOVEDADES');

insert into CategoriaItem values ('Zapatos');
insert into CategoriaItem values ('Botas');
insert into CategoriaItem values ('Sandalias');
insert into CategoriaItem values ('Zapatillas');
insert into CategoriaItem values ('Cuero');
insert into CategoriaItem values ('Accesorios');
insert into CategoriaItem values ('Ropa');

insert into CategoriaXCategoriaItem values (1,1);
insert into CategoriaXCategoriaItem values (1,2);
insert into CategoriaXCategoriaItem values (1,3);
insert into CategoriaXCategoriaItem values (1,4);
insert into CategoriaXCategoriaItem values (1,5);
insert into CategoriaXCategoriaItem values (2,4);
insert into CategoriaXCategoriaItem values (2,6);
insert into CategoriaXCategoriaItem values (2,7);
insert into CategoriaXCategoriaItem values (2,1);

insert into SubCategorias values (1,'Ballerinas');
insert into SubCategorias values (1,'Casual');
insert into SubCategorias values (1,'Comfort');
insert into SubCategorias values (1,'Cuñas');
insert into SubCategorias values (1,'Fiesta');
insert into SubCategorias values (1,'Flats');
insert into SubCategorias values (1,'Formal');
insert into SubCategorias values (1,'Oxfords');
insert into SubCategorias values (1,'Pantuflas');
insert into SubCategorias values (1,'Peep toes');
insert into SubCategorias values (1,'Plat. int');
insert into SubCategorias values (1,'Plataformas');
insert into SubCategorias values (1,'Pumps');
insert into SubCategorias values (1,'Suecos');
insert into SubCategorias values (1,'Tacos');
insert into SubCategorias values (1,'Botas largas');
insert into SubCategorias values (1,'Botines');
insert into SubCategorias values (1,'Sobre la rodilla');
insert into SubCategorias values (1,'Urban');
insert into SubCategorias values (1,'Espadrilles');
insert into SubCategorias values (1,'Playeras');
insert into SubCategorias values (1,'Caminar');
insert into SubCategorias values (1,'Correr');
insert into SubCategorias values (1,'Fashion');
insert into SubCategorias values (1,'Botas');
insert into SubCategorias values (1,'Mocasines');
insert into SubCategorias values (1,'Sandalias');

insert into SubCategorias values (2,'Skater');
insert into SubCategorias values (2,'Correr');
insert into SubCategorias values (2,'Urbano');
insert into SubCategorias values (2,'Futbol');
insert into SubCategorias values (2,'Outdoor');
insert into SubCategorias values (2,'Training');
insert into SubCategorias values (2,'Industrial');
insert into SubCategorias values (2,'Basquet');
insert into SubCategorias values (2,'Audífonos');
insert into SubCategorias values (2,'Billeteras');
insert into SubCategorias values (2,'Correas');
insert into SubCategorias values (2,'Lentes');
insert into SubCategorias values (2,'Relojes');
insert into SubCategorias values (2,'Fitness');
insert into SubCategorias values (2,'Gorros');
insert into SubCategorias values (2,'Maletines');
insert into SubCategorias values (2,'Mochilas');
insert into SubCategorias values (2,'Canguros');
insert into SubCategorias values (2,'Tomatodos');
insert into SubCategorias values (2,'Buzos');
insert into SubCategorias values (2,'Calcetines');
insert into SubCategorias values (2,'Camisas');
insert into SubCategorias values (2,'Casacas');
insert into SubCategorias values (2,'Chompas');
insert into SubCategorias values (2,'Poleras');
insert into SubCategorias values (2,'Polos');
insert into SubCategorias values (2,'Shorts');
insert into SubCategorias values (2,'Batas');
insert into SubCategorias values (2,'Boxer');
insert into SubCategorias values (2,'Pijamas');
insert into SubCategorias values (2,'Casual');
insert into SubCategorias values (2,'Mocasines');
insert into SubCategorias values (2,'Sandalias');
insert into SubCategorias values (2,'Vestir');

insert into SubCategorias values (3,'Bebitos');
insert into SubCategorias values (3,'Niñas');
insert into SubCategorias values (3,'Niños');

insert into SubCategorias values (4,'Kids');
insert into SubCategorias values (4,'Hombres');
insert into SubCategorias values (4,'Mujeres');

insert into SubCategorias values (5,'Deportivas');
insert into SubCategorias values (5,'Casual');
insert into SubCategorias values (5,'Fiesta');
insert into SubCategorias values (5,'Playeras');

insert into SubCategorias values (6,'Bikinis');
insert into SubCategorias values (6,'Buzos');
insert into SubCategorias values (6,'Calcetines');
insert into SubCategorias values (6,'Deportivo');
insert into SubCategorias values (6,'Kids');
insert into SubCategorias values (6,'Materno');
insert into SubCategorias values (6,'Polos');
insert into SubCategorias values (6,'Babydoll');
insert into SubCategorias values (6,'Batas');
insert into SubCategorias values (6,'Teens');
insert into SubCategorias values (6,'Lencería');
insert into SubCategorias values (6,'Pantys');
insert into SubCategorias values (6,'Pijamas');

insert into SubCategorias values (7,'Audífonos');
insert into SubCategorias values (7,'Billeteras');
insert into SubCategorias values (7,'Bufandas');
insert into SubCategorias values (7,'Canguros');
insert into SubCategorias values (7,'Carteritas');
insert into SubCategorias values (7,'Cartucheras');
insert into SubCategorias values (7,'Chullos');
insert into SubCategorias values (7,'Correas');
insert into SubCategorias values (7,'Dormitorio');
insert into SubCategorias values (7,'Fitness');
insert into SubCategorias values (7,'Gorros');
insert into SubCategorias values (7,'Joyeros');
insert into SubCategorias values (7,'Lentes');
insert into SubCategorias values (7,'Loncheras');
insert into SubCategorias values (7,'Maletines');
insert into SubCategorias values (7,'Mochilas');
insert into SubCategorias values (7,'Monederos');
insert into SubCategorias values (7,'Oficina');
insert into SubCategorias values (7,'Pareos y Pañuelos');
insert into SubCategorias values (7,'Peines');
insert into SubCategorias values (7,'Porta cosméticos');
insert into SubCategorias values (7,'Regalos');
insert into SubCategorias values (7,'Relojes');
insert into SubCategorias values (7,'Sombreros');
insert into SubCategorias values (7,'Toallas');
insert into SubCategorias values (7,'Tomatodos');

insert into SubCategorias values (8,'Accesorios de Cocina');
insert into SubCategorias values (8,'Accesorios de Habitación');
insert into SubCategorias values (8,'Accesorios de Oficina');
insert into SubCategorias values (8,'Dormitorio');
insert into SubCategorias values (8,'Electrodomesticos de Cocina');
insert into SubCategorias values (8,'Menaje de Cocina');
insert into SubCategorias values (8,'Posters');
insert into SubCategorias values (8,'Tecnología');





















































