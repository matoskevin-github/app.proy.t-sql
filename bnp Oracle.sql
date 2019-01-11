create table Provincias(
 idProvincia number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table Departamentos(
 idDepartamento number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30) unique not null);

create table Prestamos(
 idPrestamo number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);
 
create table Distritos(--
 idDistrito number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table TiposTelefonos( --
 idTipoTelefono number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table GradoEstudios(--
 idGradoEstudio number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30) unique not null);

create table TipoCarnets( --
 idTipoCarnet number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table TipoDocumentoIdentidad( --
 idTipoDocumento number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table TipoLectores( --
 idTipoLector number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table EstadoDevolucionLibros(-- 
 idEstadoDevolucion number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table MotivosRestricciones(
 idMotivosRestriccion number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);
 
create table EstadoLectores(
 idEstadoLector number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);
 
create table Idiomas( -- 
 idIdioma number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table TiposLibros(
 idTipoLibro number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table Paises( --
 idPais number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(60)unique not null);

create table CategoriasLibros(
 idCategoriaLibro number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table Generos( --
 idGenero number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);
 
create table FormatosDigitales(
 idFormato number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);
 
create table DetalleStock( 
 idDetalleStock number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique not null);

create table TiposSalas(
 idTipoSala number generated always as identity(start with 1 increment by 1) primary key,
 Descripcion nchar(30)unique null);

create table PreciosCarnet(
 idPrecioCarnet number generated always as identity(start with 1 increment by 1) primary key,
 Vigencia nchar(30) not null,
 PrecioAnual decimal(4,2) not null,
 Decripcion nchar(80) not null);

create table SalaBiblioteca(
 idSalaBiblioteca number generated always as identity(start with 1 increment by 1) primary key,
 idTipoSala number references TiposSalas(idTipoSala),
 NombreSala nchar(40) not null,
 NumeroSala number not null,
 CantidadMinima number null,
 CantidadMaxima number null,
 Descripcion nchar(80) null);

create table Sedes( --
 idSede number generated always as identity(start with 1 increment by 1) primary key,
 RazonSocial nchar(45) not null,
 Ruc char(11)unique,
 Direccion nchar(55) not null,
 idDepartamento number references Departamentos (idDepartamento),
 idProvincia number references Provincias (idProvincia),
 idDistrito number references Distritos(idDistrito),
 Telefonos nchar(25) not null,
 Anexos nchar(20) not null,
 HorarioAtencion nchar(15) not null,
 HorarioCierre nchar(15) not null,
 PaginaWeb nchar(80) not null,
 EmailSede nchar(40) not null,
 Imagen blob);

create table Bibliotecarios( --
 idBibliotecario number generated always as identity(start with 1 increment by 1) primary key,
 Nombres nchar(40) not null,
 ApellidoPaterno nchar(40) not null,
 ApellidoMaterno nchar(40) not null,
 FechaNacimiento date not null,
 Sexo char(1) check (Sexo in ('M','F')),
 Dni char(8) unique,
 idSede number references Sedes (idSede),
 Direccion nchar(55) not null,
 Email nchar(40)not null,
 idTipoTelefono number references TiposTelefonos(idTipoTelefono),
 Telefonos nchar(25) not null,
 Imagen blob);
 
create table LoginUsuario( --
 idBibliotecario number generated always as identity(start with 1 increment by 1) primary key,
 Usuario char (25) not null,
 Contrasenia char (25) not null); -- cambiado X contraseña)

create table CarnetLector( --
 idLector number generated always as identity(start with 1 increment by 1) primary key,
 Nombres nchar(40) not null,
 ApellidoPaterno nchar(40) not null,
 ApellidoMaterno nchar(40) not null,
 FechaNacimiento date not null,
 Sexo char(1) check (Sexo in ('M','F')),
 idSede number references Sedes (idSede),
 idTipoLector number references TipoLectores (idTipoLector), 
 idGradoEstudio number references GradoEstudios (idGradoEstudio),
 idTipoDocumento number references  TipoDocumentoIdentidad (idTipoDocumento),
 Dni nchar(8)unique,
 idTipoCarnet number references TipoCarnets (idTipoCarnet),
 NumeroCarnet char(10) unique,
 Direccion nchar(55) not null,
 Telefonos nchar(25) not null,
 Celular nchar(20) not null,
 Imagen blob);

create table PagosLectores(
 idPago number generated always as identity(start with 1 increment by 1) primary key,
 idLector number references CarnetLector (idLector),
 FechaPago date default sysdate,
 FechaUso date default sysdate,
 FechaRenovacion date default sysdate,
 Importe decimal(4,2) not null,
 idEstadoLector number references EstadoLectores (idEstadoLector),
 Disponibilidad nchar(20) not null,
 Descripcion nchar(80) null);

create table Autores( 
 idAutor number generated always as identity(start with 1 increment by 1) primary key,
 Nombres nchar(50) not null,
 ApellidoPaterno nchar(40) not null,
 ApellidoMaterno nchar(40) not null,
 Seudonimo nchar(50) unique,
 idPais number references Paises (idPais),
 idIdioma number references Idiomas (idIdioma),
 Email nchar(40) null,
 PaginaWeb nchar(70)not null,
 Descripcion nchar(80) null,
 Imagen blob);

create table AutoresGeneros( --
 idAutor number generated always as identity(start with 1 increment by 1) primary key,
 idGenero number references Generos (idGenero) );

create table CategoriaLibrosAutores( --
 idAutor number generated always as identity(start with 1 increment by 1) primary key,
 idCategoriaLibro number references CategoriasLibros (idCategoriaLibro)); 

create table Editoriales( --
 idEditorial number generated always as identity(start with 1 increment by 1) primary key,
 idAutor number references Autores (idAutor),
 idPais number references Paises (idPais),
 RazonSocial nchar(80) not null,
 Direccion nchar(80) not null,
 Telefonos nchar(20) not null);

create table RegistroLibrosAutores(
 idLibro number generated always as identity(start with 1 increment by 1) primary key,
 idAutor number references Autores (idAutor),
 idCategoriaLibro number references CategoriasLibros (idCategoriaLibro),
 idTipoLibro number references TiposLibros (idTipoLibro),
 TituloOriginal nchar(45) not null,
 Titulo nchar(40) not null,
 ISBN char(17) unique,
 ISSN char(9) unique,
 Paginas nchar(12) not null,
 PesoFisico nchar(25) not null,
 FechaPublicacion char(4) not null,
 Imagen blob );

create table LibrosGeneros(
 idLibro number generated always as identity(start with 1 increment by 1) primary key,
 idGenero number references Generos (idGenero));

create table LibrosCopias(
 idLibro number generated always as identity(start with 1 increment by 1) primary key,
 idDetalleStock number references DetalleStock (idDetalleStock),
 CantidadMinima number not null,
 CantidadActual number not null);

create table LibrosDigitales(
 idLibro number generated always as identity(start with 1 increment by 1) primary key,
 idFormato number references FormatosDigitales (idFormato));
  
create table PrestamosInternos(
 idPrestamoInterno number generated always as identity(start with 1 increment by 1) primary key,
 idLector number references CarnetLector (idLector),
 idSalaBiblioteca number references SalaBiblioteca (idSalaBiblioteca),
 idBibliotecario number references Bibliotecarios (idBibliotecario),
 idSede number references Sedes (idSede),
 FechaPrestamo date default sysdate,
 FechaDevolucion date not null,
 Descripcion nchar(80) null);
 
create table PrestamosExternos(
 idPrestamoExterno number generated always as identity(start with 1 increment by 1) primary key,
 idLector number references CarnetLector (idLector),
 idBibliotecario number references Bibliotecarios (idBibliotecario),
 idSede number references Sedes (idSede),
 FechaPrestamo date default sysdate,
 FechaDevolucion date not null,
 Descripcion nchar(80) null);

create table RestriccionLectores(
 idRestriccion number generated always as identity(start with 1 increment by 1) primary key,
 idLector number references CarnetLector (idLector),
 idEstadoLector number references EstadoLectores (idEstadoLector),
 idMotivosRestriccion number references MotivosRestricciones(idMotivosRestriccion),
 Descripcion nchar(80) null); 

create table DevolucionLibrosInternos(
 idPrestamoInterno number references PrestamosInternos (idPrestamoInterno),
 idMotivosRestriccion number references MotivosRestricciones (idMotivosRestriccion));
 
create table DevolucionLibrosExternos(
 idPrestamoExterno number references PrestamosExternos (idPrestamoExterno),
 idMotivosRestriccion number references MotivosRestricciones (idMotivosRestriccion));
 
create table DetallePrestamosExternos(
 idPrestamoExterno number references PrestamosExternos (idPrestamoExterno),
 idLibro number references RegistroLibrosAutores (idLibro), 
 CantidadPrestada number not null); 
 
create table DetallePrestamosInternos(
 idPrestamoInterno number references PrestamosInternos(idPrestamoInterno),
 idLibro number references RegistroLibrosAutores (idLibro), 
 CantidadPrestada number not null);
 
create table DetalleReingresoInternos(
 idReingreso number generated always as identity(start with 1 increment by 1)primary key,
 idPrestamoInterno number references PrestamosInternos (idPrestamoInterno),
 idLibro number references RegistroLibrosAutores (idLibro),
 idEstadoLibros number references EstadoDevolucionLibros (idEstadoDevolucion), 
 CantidadPrestada number null);
 
create table DetalleReingresoExternos(
 idReingreso number generated always as identity(start with 1 increment by 1) primary key,
 idPrestamoExterno number references PrestamosExternos (idPrestamoExterno),
 idLibro number references RegistroLibrosAutores (idLibro), 
 CantidadPrestada number not null,
 idEstadoLibros number references EstadoDevolucionLibros(idEstadoDevolucion));

 ----------------------------------------- Registros -----------------------------------------
 
-- Provincias 
insert into Provincias (Descripcion)values ('Amazonas');
insert into Provincias (Descripcion)values ('Ancash');
insert into Provincias (Descripcion)values ('Apurimac');
insert into Provincias (Descripcion)values ('Arequipa');
insert into Provincias (Descripcion)values ('Ayacucho');
insert into Provincias (Descripcion)values ('Cajamarca');
insert into Provincias (Descripcion)values ('Cuzco');
insert into Provincias (Descripcion)values ('Huancavelica');
insert into Provincias (Descripcion)values ('Huanuco');
insert into Provincias (Descripcion)values ('Ica');
insert into Provincias (Descripcion)values ('Junin');
insert into Provincias (Descripcion)values ('La Libertad');
insert into Provincias (Descripcion)values ('Lambayeque');
insert into Provincias (Descripcion)values ('Lima');
insert into Provincias (Descripcion)values ('Loreto');
insert into Provincias (Descripcion)values ('Madre de Dios');
insert into Provincias (Descripcion)values ('Moquegua');
insert into Provincias (Descripcion)values ('Pasco');
insert into Provincias (Descripcion)values ('Piura');
insert into Provincias (Descripcion)values ('Puno');
insert into Provincias (Descripcion)values ('San Martin');
insert into Provincias (Descripcion)values ('Tacna');
insert into Provincias (Descripcion)values ('Tumbes');
insert into Provincias (Descripcion)values ('Ucayali');
-- Departamentos
insert into Departamentos (Descripcion)values ('Amazonas');
insert into Departamentos (Descripcion)values('Ancash');
insert into Departamentos (Descripcion)values('Apurimac');
insert into Departamentos (Descripcion)values('Arequipa');
insert into Departamentos (Descripcion)values('Ayacucho');
insert into Departamentos (Descripcion)values('Cajamarca');
insert into Departamentos (Descripcion)values('Cuzco');
insert into Departamentos (Descripcion)values('Huancavelica');
insert into Departamentos (Descripcion)values('Huanuco');
insert into Departamentos (Descripcion)values('Ica');
insert into Departamentos (Descripcion)values('Junin');
insert into Departamentos (Descripcion)values('La Libertad');
insert into Departamentos (Descripcion)values('Lambayeque');
insert into Departamentos (Descripcion)values('Lima');
insert into Departamentos (Descripcion)values('Loreto');
insert into Departamentos (Descripcion)values('Madre de Dios');
insert into Departamentos (Descripcion)values('Moquegua');
insert into Departamentos (Descripcion)values('Pasco');
insert into Departamentos (Descripcion)values('Piura');
insert into Departamentos (Descripcion)values('Puno');
insert into Departamentos (Descripcion)values('San Martin');
insert into Departamentos (Descripcion)values('Tacna');
insert into Departamentos (Descripcion)values('Tumbes');
insert into Departamentos (Descripcion)values('Ucayali');
-- Distritos
insert into Distritos (Descripcion) values('Ancon');
insert into Distritos (Descripcion) values('Ate');
insert into Distritos (Descripcion) values('Barranco');
insert into Distritos (Descripcion) values('Breña');
insert into Distritos (Descripcion) values('Carrabayllo');
insert into Distritos (Descripcion) values('Chaclacayo');
insert into Distritos (Descripcion) values('Chorrillos');
insert into Distritos (Descripcion) values('Cieneguilla');
insert into Distritos (Descripcion) values('Comas');
insert into Distritos (Descripcion) values('El Agustino');
insert into Distritos (Descripcion) values('Independencia');
insert into Distritos (Descripcion) values('Jesus Maria');
insert into Distritos (Descripcion) values('La Molina');
insert into Distritos (Descripcion) values('La Victoria');
insert into Distritos (Descripcion) values('Lima');
insert into Distritos (Descripcion) values('Lince');
insert into Distritos (Descripcion) values('Los Olivos');
insert into Distritos (Descripcion) values('Luringancho');
insert into Distritos (Descripcion) values('Lurin');
insert into Distritos (Descripcion) values('Magdalena del Mar');
insert into Distritos (Descripcion) values('Miraflores');
insert into Distritos (Descripcion) values('Pachacamac');
insert into Distritos (Descripcion) values('Pucusana');
insert into Distritos (Descripcion) values('Pueblo Libre');
insert into Distritos (Descripcion) values('Puente Piedra');
insert into Distritos (Descripcion) values('Punta Hermosa');
insert into Distritos (Descripcion) values('Punta Negra');
insert into Distritos (Descripcion) values('Rimac');
insert into Distritos (Descripcion) values('San Bartolo');
insert into Distritos (Descripcion) values('San Borja');
insert into Distritos (Descripcion) values('San Isidro');
insert into Distritos (Descripcion) values('San Juan de Lurigancho');
insert into Distritos (Descripcion) values('San Juan de Miraflores');
insert into Distritos (Descripcion) values('San Luis');
insert into Distritos (Descripcion) values('San Martin de Porres');
insert into Distritos (Descripcion) values('San Miguel');
insert into Distritos (Descripcion) values('Santa Anita');
insert into Distritos (Descripcion) values('Santa Rosa');
insert into Distritos (Descripcion) values('Santiago de Surco');
insert into Distritos (Descripcion) values('Surquillo');
insert into Distritos (Descripcion) values('Villa el Salvador');
insert into Distritos (Descripcion) values('Villa Maria del Triunfo');
-- TiposTelefonos
insert into TiposTelefonos (Descripcion) values ('Celular');
insert into TiposTelefonos (Descripcion) values ('Telefono Fijo');
insert into TiposTelefonos (Descripcion) values ('RPM');
insert into TiposTelefonos (Descripcion) values ('RPC');
-- GradoEstudios
insert into GradoEstudios (Descripcion) values ('Primaria');
insert into GradoEstudios (Descripcion) values ('Secundaria');
insert into GradoEstudios (Descripcion) values ('Instituto');
insert into GradoEstudios (Descripcion) values ('Tecnico');
insert into GradoEstudios (Descripcion) values ('Universidad');
insert into GradoEstudios (Descripcion) values ('Bachiller');
-- TipoCarnets
insert into TipoCarnets (Descripcion) values ('Lector');
insert into TipoCarnets (Descripcion) values ('Investigador');
-- TipoDocumentoIdentidad
insert into TipoDocumentoIdentidad (Descripcion) values ('DNI');
insert into TipoDocumentoIdentidad (Descripcion) values('Carnet de Extranjeria');
insert into TipoDocumentoIdentidad (Descripcion) values('Reg. Unico de Contribuyente');
insert into TipoDocumentoIdentidad (Descripcion) values('Pasaporte');
-- TipoLectores
insert into TipoLectores (Descripcion) values ('Estudiantes');
insert into TipoLectores (Descripcion) values('Universitarios');
insert into TipoLectores (Descripcion) values('Publico General');
-- MotivosRestricciones
insert into MotivosRestricciones (Descripcion) values ('Sin Restriccion');
insert into MotivosRestricciones (Descripcion) values ('No hubo Devolucion');
insert into MotivosRestricciones (Descripcion) values ('Devolucion Defectuosa');
insert into MotivosRestricciones (Descripcion) values ('Devolucion Correcta');
-- EstadoLectores
insert into EstadoLectores (Descripcion) values ('Lector Activado');
insert into EstadoLectores (Descripcion) values ('Lector Desactivado');
-- Idiomas
insert into Idiomas (Descripcion) values ('Ingles');
insert into Idiomas (Descripcion) values ('Español');
insert into Idiomas (Descripcion) values ('Frances');
insert into Idiomas (Descripcion) values ('Italiano');
insert into Idiomas (Descripcion) values ('Arabe');
insert into Idiomas (Descripcion) values ('Portugues');
insert into Idiomas (Descripcion) values ('Bengali');
insert into Idiomas (Descripcion) values ('Ruso');
insert into Idiomas (Descripcion) values ('Japones');
insert into Idiomas (Descripcion) values ('Chino Mandarin');
-- TiposLibros
insert into TiposLibros (Descripcion) values ('Pasta Gruesa');
insert into TiposLibros (Descripcion) values ('Pasta Delgada');
-- Paises
insert into Paises (Descripcion) values ('Afganistán');
insert into Paises (Descripcion) values ('Albania');
insert into Paises (Descripcion) values ('Alemania');
insert into Paises (Descripcion) values ('Andorra');
insert into Paises (Descripcion) values ('Angola');
insert into Paises (Descripcion) values ('Antigua y Barbuda');
insert into Paises (Descripcion) values ('Arabia Saudita');
insert into Paises (Descripcion) values ('Argelia');
insert into Paises (Descripcion) values ('Argentina');
insert into Paises (Descripcion) values ('Armenia');
insert into Paises (Descripcion) values ('Australia');
insert into Paises (Descripcion) values ('Austria');
insert into Paises (Descripcion) values ('Azerbaiyán');
insert into Paises (Descripcion) values ('Bahamas');
insert into Paises (Descripcion) values ('Bangladés');
insert into Paises (Descripcion) values ('Barbados');
insert into Paises (Descripcion) values ('Baréin');
insert into Paises (Descripcion) values ('Bélgica');
insert into Paises (Descripcion) values ('Belice');
insert into Paises (Descripcion) values ('Benín');
insert into Paises (Descripcion) values ('Bielorrusia');
insert into Paises (Descripcion) values ('Birmania');
insert into Paises (Descripcion) values ('Bolivia');
insert into Paises (Descripcion) values ('Bosnia y Herzegovina');
insert into Paises (Descripcion) values ('Botsuana');
insert into Paises (Descripcion) values ('Brasil');
insert into Paises (Descripcion) values ('Brunéi');
insert into Paises (Descripcion) values ('Bulgaria');
insert into Paises (Descripcion) values ('Burkina Faso');
insert into Paises (Descripcion) values ('Burundi');
insert into Paises (Descripcion) values ('Bután');
insert into Paises (Descripcion) values ('Cabo Verde');
insert into Paises (Descripcion) values ('Camboya');
insert into Paises (Descripcion) values ('Camerún');
insert into Paises (Descripcion) values ('Canadá');
insert into Paises (Descripcion) values ('Catar');
insert into Paises (Descripcion) values ('Chad');
insert into Paises (Descripcion) values ('Chile');
insert into Paises (Descripcion) values ('China');
insert into Paises (Descripcion) values ('Chipre');
insert into Paises (Descripcion) values ('Ciudad del Vaticano');
insert into Paises (Descripcion) values ('Colombia');
insert into Paises (Descripcion) values ('Comoras');
insert into Paises (Descripcion) values ('Corea del Norte');
insert into Paises (Descripcion) values ('Corea del Sur');
insert into Paises (Descripcion) values ('Costa de Marfil');
insert into Paises (Descripcion) values ('Costa Rica');
insert into Paises (Descripcion) values ('Croacia');
insert into Paises (Descripcion) values ('Cuba');
insert into Paises (Descripcion) values ('Dinamarca');
insert into Paises (Descripcion) values ('Dominica');
insert into Paises (Descripcion) values ('Ecuador');
insert into Paises (Descripcion) values ('Egipto');
insert into Paises (Descripcion) values ('El Salvador');
insert into Paises (Descripcion) values ('Emiratos Árabes Unidos');
insert into Paises (Descripcion) values ('Eritrea');
insert into Paises (Descripcion) values ('Eslovaquia');
insert into Paises (Descripcion) values ('Eslovenia');
insert into Paises (Descripcion) values ('España');
insert into Paises (Descripcion) values ('Estados Unidos');
insert into Paises (Descripcion) values ('Estonia');
insert into Paises (Descripcion) values ('Etiopía');
insert into Paises (Descripcion) values ('Filipinas');
insert into Paises (Descripcion) values ('Finlandia');
insert into Paises (Descripcion) values ('Fiyi');
insert into Paises (Descripcion) values ('Francia');
insert into Paises (Descripcion) values ('Gabón');
insert into Paises (Descripcion) values ('Gambia');
insert into Paises (Descripcion) values ('Georgia');
insert into Paises (Descripcion) values ('Ghana');
insert into Paises (Descripcion) values ('Granada');
insert into Paises (Descripcion) values ('Grecia');
insert into Paises (Descripcion) values ('Guatemala');
insert into Paises (Descripcion) values ('Guyana');
insert into Paises (Descripcion) values ('Guinea');
insert into Paises (Descripcion) values ('Guinea ecuatorial');
insert into Paises (Descripcion) values ('Guinea-Bisáu');
insert into Paises (Descripcion) values ('Haití');
insert into Paises (Descripcion) values ('Honduras');
insert into Paises (Descripcion) values ('Hungría');
insert into Paises (Descripcion) values ('India');
insert into Paises (Descripcion) values ('Indonesia');
insert into Paises (Descripcion) values ('Irak');
insert into Paises (Descripcion) values ('Irán');
insert into Paises (Descripcion) values ('Irlanda');
insert into Paises (Descripcion) values ('Islandia');
insert into Paises (Descripcion) values ('Islas Marshall');
insert into Paises (Descripcion) values ('Islas Salomón');
insert into Paises (Descripcion) values ('Israel');
insert into Paises (Descripcion) values ('Italia');
insert into Paises (Descripcion) values ('Jamaica');
insert into Paises (Descripcion) values ('Japón');
insert into Paises (Descripcion) values ('Jordania');
insert into Paises (Descripcion) values ('Kazajistán');
insert into Paises (Descripcion) values ('Kenia');
insert into Paises (Descripcion) values ('Kirguistán');
insert into Paises (Descripcion) values ('Kiribati');
insert into Paises (Descripcion) values ('Kuwait');
insert into Paises (Descripcion) values ('Laos');
insert into Paises (Descripcion) values ('Lesoto');
insert into Paises (Descripcion) values ('Letonia');
insert into Paises (Descripcion) values ('Líbano');
insert into Paises (Descripcion) values ('Liberia');
insert into Paises (Descripcion) values ('Libia');
insert into Paises (Descripcion) values ('Liechtenstein');
insert into Paises (Descripcion) values ('Lituania');
insert into Paises (Descripcion) values ('Luxemburgo');
insert into Paises (Descripcion) values ('Madagascar');
insert into Paises (Descripcion) values ('Malasia');
insert into Paises (Descripcion) values ('Malaui');
insert into Paises (Descripcion) values ('Maldivas');
insert into Paises (Descripcion) values ('Malí');
insert into Paises (Descripcion) values ('Malta');
insert into Paises (Descripcion) values ('Marruecos');
insert into Paises (Descripcion) values ('Mauricio');
insert into Paises (Descripcion) values ('Mauritania');
insert into Paises (Descripcion) values ('México');
insert into Paises (Descripcion) values ('Micronesia');
insert into Paises (Descripcion) values ('Moldavia');
insert into Paises (Descripcion) values ('Mónaco');
insert into Paises (Descripcion) values ('Mongolia');
insert into Paises (Descripcion) values ('Montenegro');
insert into Paises (Descripcion) values ('Mozambique');
insert into Paises (Descripcion) values ('Namibia');
insert into Paises (Descripcion) values ('Nauru');
insert into Paises (Descripcion) values ('Nepal');
insert into Paises (Descripcion) values ('Nicaragua');
insert into Paises (Descripcion) values ('Níger');
insert into Paises (Descripcion) values ('Nigeria');
insert into Paises (Descripcion) values ('Noruega');
insert into Paises (Descripcion) values ('Nueva Zelanda');
insert into Paises (Descripcion) values ('Omán');
insert into Paises (Descripcion) values ('Países Bajos');
insert into Paises (Descripcion) values ('Pakistán');
insert into Paises (Descripcion) values ('Palaos');
insert into Paises (Descripcion) values ('Panamá');
insert into Paises (Descripcion) values ('Papúa Nueva Guinea');
insert into Paises (Descripcion) values ('Paraguay');
insert into Paises (Descripcion) values ('Perú');
insert into Paises (Descripcion) values ('Polonia');
insert into Paises (Descripcion) values ('Portugal');
insert into Paises (Descripcion) values ('Reino Unido');
insert into Paises (Descripcion) values ('República Centroafricana');
insert into Paises (Descripcion) values ('República Checa');
insert into Paises (Descripcion) values ('República de Macedonia');
insert into Paises (Descripcion) values ('República del Congo');
insert into Paises (Descripcion) values ('República Democrática del Congo');
insert into Paises (Descripcion) values ('República Dominicana');
insert into Paises (Descripcion) values ('República Sudafricana');
insert into Paises (Descripcion) values ('Ruanda');
insert into Paises (Descripcion) values ('Rumanía');
insert into Paises (Descripcion) values ('Rusia');
insert into Paises (Descripcion) values ('San Cristóbal y Nieves');
insert into Paises (Descripcion) values ('San Marino');
insert into Paises (Descripcion) values ('San Vicente y las Granadinas');
insert into Paises (Descripcion) values ('Santa Lucía');
insert into Paises (Descripcion) values ('Santo Tomé y Príncipe');
insert into Paises (Descripcion) values ('Senegal');
insert into Paises (Descripcion) values ('Serbia');
insert into Paises (Descripcion) values ('Seychelles');
insert into Paises (Descripcion) values ('Sierra Leona');
insert into Paises (Descripcion) values ('Singapur');
insert into Paises (Descripcion) values ('Siria');
insert into Paises (Descripcion) values ('Somalia');
insert into Paises (Descripcion) values ('Sri Lanka');
insert into Paises (Descripcion) values ('Suazilandia');
insert into Paises (Descripcion) values ('Sudán');
insert into Paises (Descripcion) values ('Sudán del Sur');
insert into Paises (Descripcion) values ('Suecia');
insert into Paises (Descripcion) values ('Suiza');
insert into Paises (Descripcion) values ('Surinam');
insert into Paises (Descripcion) values ('Tailandia');
insert into Paises (Descripcion) values ('Tanzania');
insert into Paises (Descripcion) values ('Tayikistán');
insert into Paises (Descripcion) values ('Timor Oriental');
insert into Paises (Descripcion) values ('Togo');
insert into Paises (Descripcion) values ('Tonga');
insert into Paises (Descripcion) values ('Trinidad y Tobago');
insert into Paises (Descripcion) values ('Túnez');
insert into Paises (Descripcion) values ('Turkmenistán');
insert into Paises (Descripcion) values ('Turquía');
insert into Paises (Descripcion) values ('Tuvalu');
insert into Paises (Descripcion) values ('Ucrania');
insert into Paises (Descripcion) values ('Uganda');
insert into Paises (Descripcion) values ('Uruguay');
insert into Paises (Descripcion) values ('Uzbekistán');
insert into Paises (Descripcion) values ('Vanuatu');
insert into Paises (Descripcion) values ('Venezuela');
insert into Paises (Descripcion) values ('Vietnam');
insert into Paises (Descripcion) values ('Yemen');
insert into Paises (Descripcion) values ('Yibuti');
insert into Paises (Descripcion) values ('Zambia');
insert into Paises (Descripcion) values ('Zimbabue');
-- CategoriasLibros 
insert into CategoriasLibros (Descripcion) values ('Infantil');
insert into CategoriasLibros (Descripcion) values ('Juvenil');
insert into CategoriasLibros (Descripcion) values ('Personas Mayores');
-- Generos
insert into Generos(Descripcion) values ('Artes y Humanidades');
insert into Generos(Descripcion) values ('Poesias');
insert into Generos(Descripcion) values ('Influencias Literarias');
insert into Generos(Descripcion) values ('Cuentos');
insert into Generos(Descripcion) values ('Colecciones Basicas');
insert into Generos(Descripcion) values ('Ciencia y Tecnologia');
insert into Generos(Descripcion) values ('Ciencias Juridicas');
insert into Generos(Descripcion) values ('Economia y Administracion');
insert into Generos(Descripcion) values ('Idiomas');
insert into Generos(Descripcion) values ('Musica');
-- FormatosDigitales
insert into FormatosDigitales (Descripcion) values ('PDF'); 
insert into FormatosDigitales (Descripcion) values ('PPT o PPS'); 
insert into FormatosDigitales (Descripcion) values ('RAR');
insert into FormatosDigitales (Descripcion) values ('ISO');
insert into FormatosDigitales (Descripcion) values ('TXT');
insert into FormatosDigitales (Descripcion) values ('DOC');
insert into FormatosDigitales (Descripcion) values ('DOCX o XDOC');
insert into FormatosDigitales (Descripcion) values ('ODT');
insert into FormatosDigitales (Descripcion) values ('RTF');
insert into FormatosDigitales (Descripcion) values ('WPD');
insert into FormatosDigitales (Descripcion) values ('ODS');
insert into FormatosDigitales (Descripcion) values ('XLS');
-- DetalleStock
insert into DetalleStock (Descripcion) values ('Agotados');
insert into DetalleStock (Descripcion) values ('No Agotados');
-- TiposSalas
insert into TiposSalas (Descripcion) values ('Sala de Lectura'); 
insert into TiposSalas (Descripcion) values ('Sala para Invidentes');
insert into TiposSalas (Descripcion) values ('Sala Escolar');
insert into TiposSalas (Descripcion) values ('Sala Infantil');
-- PreciosCarnet
insert into PreciosCarnet(Vigencia,PrecioAnual,Decripcion) values ('1 año',40.0,'Se necesita DNI vigente para adquirirlo');
insert into PreciosCarnet(Vigencia,PrecioAnual,Decripcion) values ('1 año',20.0,'Se les otorga a solo escolares a ese precio');
insert into PreciosCarnet(Vigencia,PrecioAnual,Decripcion) values ('1 año',30.0,'Se les otorga universitarios a ese precio');
-- SalaBiblioteca
insert into SalaBiblioteca (idTipoSala,nombresala,NumeroSala,CantidadMinima,CantidadMaxima,Descripcion) values (1,'Sala Lectura',1,2,60,'Esta sala se uso solo para lectura');
insert into SalaBiblioteca (idTipoSala,nombresala,NumeroSala,CantidadMinima,CantidadMaxima,Descripcion) values (3,'Sala Escolar',2,4,50,'Esta sala se uso solo para Escolares');
insert into SalaBiblioteca (idTipoSala,nombresala,NumeroSala,CantidadMinima,CantidadMaxima,Descripcion) values (2,'Sala Invidentes',3,5,30,'Esta sala se uso solo para Personas Invidentes');
insert into SalaBiblioteca (idTipoSala,nombresala,NumeroSala,CantidadMinima,CantidadMaxima,Descripcion) values (4,'Sala Infantil',4,6,50,'Esta sala se uso solo para Niños con Sus Padres');
-- sedes
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede San Borja','20131379863','Av. De la Poesía 160 - San Borja',14,14,30,'420-1506','852 / 612','10:00 am','7:00 pm','www.bnp.com.edu','bnpSanBorja.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Comas','20131379864','Av. Los Angeles 125 - Comas',14,14,9,'349-5857','464','10:00 am','7:00 pm','www.bnp.com.edu','bnpComas.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede San Isidro','20131379865','Av. Proceres 220 - San Isidro',14,14,31,'422-1227','211','10:00 am','7:00 pm','www.bnp.com.edu','bnpSanIsidro.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Miraflores','20131379866','Av. San Cristobal 340 - Miraflores',14,14,21,'480-1506','212','9:00 am','6:00 pm','www.bnp.com.edu','bnpLaMolina.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Barranco','20131379867','Av. Dulce Tentacion 402- Barranco',14,14,3,'720-4521','220','9:00 am','6:00 pm','www.bnp.com.edu','bnpBarranco.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Chorrillos','20131379868','Av. San Toreto 216 - Chorrillos',14,14,7,'425-6548','115','9:00 am','6:00 pm','www.bnp.com.edu','bnpChorrillos.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Lima','20131379869','Av. Procesion 1194 - Lima',14,14,15,'465-1587','320','9:00 am','7:00 pm','www.bnp.com.edu','bnpLima.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Los Olivos','20131379870','Av. Farmacia 340 - Los Olivos',14,14,17,'445-1867','114','10:00 am','7:00 pm','www.bnp.com.edu','bnpLos Olivos.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Santa Anita','20131379871','Av. Huaratamba 2213 - Santa Anita',14,14,37,'456-1227','240','9:00 am','6:00 pm','www.bnp.com.edu','bnpSantaAnita.edu@hotmail.com',null);
insert into sedes (razonsocial,ruc,direccion,iddepartamento,idprovincia,iddistrito,telefonos,anexos,horarioatencion,horariocierre,paginaweb,emailsede,imagen) values ('Sede Surquillo','20131379872','Av. Tamboreal 156 - Surquillo',14,14,40,'469-1265','246','9:00 am','6:00 pm','www.bnp.com.edu','bnpSurquillo.edu@hotmail.com',null);
-- bibliotecarios
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Juan','Maccha','Victorio','04/05/1948','M','04580125',1,'psj.Doña Aventura 123','Juan _2023@hotmail.com',2,'420-1518',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Antony','Osores','Torres','24/10/1956','M','04580134',2,'psj.Angelica 136','TonyO@hotmail.com',2,'420-1456',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Raul','Sanchez','Prado','12/05/1960','M','04580138',3,'psj.Carrion 142','Prado_23@hotmail.com',2,'420-5423',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Jhonatan','Rios','Riveres','27/01/1962','M','04580142',4,'psj.Cobaba 320','Jhonatan_1507@hotmail.com',2,'420-6852',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Bryan','Rios','Rivera','24/05/1963','M','04580144',5,'psj.Yagua 330','Bryan_1456@hotmail.com',2,'420-1518',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Juan','Mejia','Rodriguez','30/07/1964','M','04580148',6,'psj.Simon Barria 317','Juan_1993@hotmail.com',2,'420-1246',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Clevert','Leon','Riojas','14/06/1972','M','04580152',7,'psj.Angeles 235','Leon_1@hotmail.com',2,'420-1518',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Adali','Casas','Osores','15/09/1956','F','04580154',8,'psj.Sarrumilla 425','Adali_17_l@hotmail.com',2,'420-1547',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Alex','Jara','Galban','18/08/1953','M','04580158',9,'psj.Cloreto 345','Alex_love@hotmail.com',2,'420-1518',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Carlos','Tristan','Tello','05/03/1957','M','04580162',10,'psj.Huanuco 324','Carlos_jack@hotmail.com',2,'420-5642',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Bernabé','Tornados','Arguedas','24/04/1970','F','04580164',1,'Av. San Martin 246','Bernabé_<3@hotmail.com',2,'420-6432',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Edwin','Lino','Claveles','09/05/1963','M','04580168',2,'Av. Puquio 146','Edwin.L@hotmail.com',2,'420-7654',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Elmer','Quiroz','Rosio','15/06/1958','M','04580172',3,'psj.La Libertad 465','Elmer_Rosio_15@hotmail.com',2,'420-7654',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Gerson','Fonseca','Rojas','16/07/1974','M','04580174',4,'psj.Alcides 135','Gerssitoh@hotmail.com',2,'420-7965',null);
insert into bibliotecarios (nombres,apellidopaterno,apellidomaterno,fechanacimiento,sexo,dni,idsede,direccion,email,idtipotelefono,telefonos,imagen) values  ('Hita','Conche','Chuquino','27/02/1971','F','04580178',5,'psj.Cañete 425','Hita_Chuquino12@hotmail.com',2,'420-4567',null);
-- LoginUsuario
insert into LoginUsuario (usuario,contrasenia) values ('JuanMacchaVictorio','123456');
insert into LoginUsuario (usuario,contrasenia) values ('AntonyOsoresTorres','123456');
insert into LoginUsuario (usuario,contrasenia) values ('RaulSanchezPrado','123456');
insert into LoginUsuario (usuario,contrasenia) values ('JhonatanRiosRiveres','123456');
insert into LoginUsuario (usuario,contrasenia) values ('BryanRiosRivera','123456');				   
insert into LoginUsuario (usuario,contrasenia) values ('JuanMejiaRodriguez','123456');
insert into LoginUsuario (usuario,contrasenia) values ('ClevertLeonRiojas','123456');					   
insert into LoginUsuario (usuario,contrasenia) values ('AdaliCasasOsores','123456');
insert into LoginUsuario (usuario,contrasenia) values ('AlexJaraGalban','123456');					   
insert into LoginUsuario (usuario,contrasenia) values ('CarlosTristanTello','123456');
insert into LoginUsuario (usuario,contrasenia) values ('BernabéTornadosArguedas','123456');
insert into LoginUsuario (usuario,contrasenia) values ('EdwinLinoClaveles','123456');			   
insert into LoginUsuario (usuario,contrasenia) values ('ElmerQuirozRosio','123456');						   
insert into LoginUsuario (usuario,contrasenia) values ('GersonFonsecaRojas','123456');
insert into LoginUsuario (usuario,contrasenia) values ('HitaConcheChuquino','123456');					   
-- CarnetLector						  
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Nelson','Olarte','Herrera','12/05/1995','M',5,2,5,1,'72935107',1,'4201517201','Psj.Daniel Alcides Carrion 136','520-1569','940018882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Belen','Alban','Flores','14/07/1994','F',2,1,1,1,'72935108',2,'6201517201','Psj.Chanca mote 125','452-5421','957018882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Juan','Ricapa','Tordisio','20/03/1995','M',2,3,4,1,'72935109',1,'4201517202','Psj.Almendra Carrion 1178','729-3456','940013252',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Melissa','Maccha','Vallejo','15/08/1995', 'F',4,2,5,1,'72935110',2,'6201517202','Psj.Piru 520','425-7854','940456882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Joselyn','Tello','Figueroa','13/06/1992', 'F',2,2,6,1,'72935111',2,'4201517203','Psj.Piedra Golda 220','879-2121','940457542',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Juana','Armas','Gutillo','12/10/1997', 'F',1,3,4,1,'72935112',2,'6201517203','Psj.Almenceres 315','596-4532','940464522',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Melissa','Losa','Zumbares','15/11/1996', 'F',10,1,2,1,'72935113',1,'4201517204','Psj.Arambiru 310','654-4545','945756882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Luz','Cayata','Jaimez','22/12/1995', 'F',1,3,3,1,'72935114',2,'6201517204','Psj.Piura 248','546-8778','940478882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Antony','Quesquen','Valdivia','17/05/1993', 'M',2,2,5,1,'72935115',2,'4201517205','Av. Charlon 246','452-5465','940325882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Ivan','Jimez','Ricuaz','24/01/1997', 'M',3,1,1,1,'72935116',2,'6201517205','Psj.Huanajuato 326','423-5454','940456458',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Luis','Rodriguez','Ordinola','16/08/1995', 'M',4,2,6,1,'72935117',2,'4201517206','Psj. Tamboreal 226','564-5458','940454752',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Jose','Tiznado','Mamani','26/03/1992', 'M',6,3,4,1,'72935118',1,'6201517206','Psj.Sipan 195','423-1546','940411882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Jorge','Torres','Ramos','04/05/1993', 'M',7,2,6,1,'72935119',2,'4201517207','Av. Arica 330','521-4789','940451282',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Erika','Flores','Ramos','28/08/1991', 'F',8,3,3,1,'72935120',2,'6201517207','Psj.Buen Señor 640','589-1551','940412432',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Juan','Barbaran','Baca','27/09/1989', 'M',9,2,5,1,'72935121',1,'4201517208','Psj.Tatira 364','435-5426','9404214682',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Claudio','Lopez','Figueroa','20/10/1991', 'M',10,1,2,1,'72935122',1,'6201517208','Psj.Tani Luz 172','354-8745','945726882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Sandy','Osores','Lopez','14/04/1990', 'F',1,2,6,1,'72935123',2,'4201517209','Psj.Colmena 193','425-6521','912456882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Mirella','Malca','Rioja','07/01/1992', 'F',2,3,3,1,'72935124',2,'6201517209','Psj.Arequipa 120','654-7887','940985882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Keyt','Estefany','Tipismama','17/03/1996', 'F',2,2,5,1,'72935125',1,'4201517210','Psj.Asuncion 272','425-1234','940456882',null);
insert into CarnetLector (nombres,apellidopaterno,apellidomaterno,fechaNacimiento,sexo,idsede,idtipolector,idgradoestudio,idtipodocumento,dni,idtipocarnet,numerocarnet,direccion,telefonos,celular,imagen) values ('Javier','Muñoz','Marquez','26/02/1990', 'M',4,3,5,1,'72935126',2,'6201517210','Psj.huanajeto 145','541-3698','996524582',null);
-- PagosLectores
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (1,'23/02/2013','25/02/2013','22/02/2014',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (2,'12/02/2013','12/02/2013','12/02/2014',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (3,'14/02/2013','14/02/2013','14/02/2014',30.0,1,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (4,'20/03/2013','20/03/2013','20/03/2014',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (5,'07/03/2013','07/03/2013','07/03/2014',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (6,'10/03/2013','10/03/2013','10/03/2014',30.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (7,'14/04/2013','14/04/2013','14/04/2014',40.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (8,'15/04/2013','15/04/2013','15/04/2014',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (9,'19/05/2013','19/05/2013','19/05/2014',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (10,'01/06/2013','01/06/2013','01/06/2014',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (11,'09/06/2013','09/06/2013','09/06/2014',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (12,'15/08/2013','15/08/2013','15/08/2014',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (10,'24/08/2013','24/08/2013','24/08/2014',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (11,'28/08/2013','28/08/2013','28/08/2014',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (12,'27/09/2013','27/09/2013','27/09/2014',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (13,'01/10/2013','01/10/2013','01/10/2014',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (14,'04/10/2013','04/10/2013','04/10/2014',30.0,1,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (15,'06/10/2013','06/10/2013','06/10/2014',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (16,'09/10/2013','09/10/2013','09/10/2014',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (17,'23/11/2013','23/11/2013','23/11/2014',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (18,'24/11/2013','24/11/2013','24/11/2014',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (19,'23/12/2013','23/12/2013','23/12/2014',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (20,'24/12/2013','24/12/2013','24/12/2014',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (1,'23/09/2014','25/09/2014','22/01/2015',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (2,'23/09/2014','25/09/2014','12/02/2015',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (3,'23/09/2014','25/09/2014','14/04/2015',30.0,1,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (4,'23/09/2014','25/09/2014','10/06/2015',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (5,'23/09/2014','25/09/2014','10/06/2015',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (6,'23/09/2014','25/09/2014','10/06/2015',30.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (7,'23/09/2014','25/09/2014','10/06/2015',40.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (8,'23/09/2014','25/09/2014','10/06/2015',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (9,'23/09/2014','25/09/2014','10/06/2015',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (10,'23/09/2014','25/09/2014','10/06/2015',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (11,'23/09/2014','25/09/2014','10/06/2015',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (12,'23/09/2014','25/09/2014','10/06/2015',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (10,'23/09/2014','25/09/2014','10/06/2015',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (11,'23/09/2014','25/09/2014','10/06/2015',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (12,'23/09/2014','25/09/2014','10/06/2015',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (13,'23/09/2014','25/09/2014','10/06/2015',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (14,'23/09/2014','25/09/2014','10/06/2015',30.0,1,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (15,'23/09/2014','25/09/2014','10/06/2015',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (16,'23/09/2014','25/09/2014','10/06/2015',40.0,1,'1 año','valido por 1 año c.General');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (17,'23/09/2014','25/09/2014','10/06/2015',20.0,1,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (18,'23/09/2014','25/09/2014','10/06/2015',30.0,2,'1 año','valido por 1 año c.Universitario');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (19,'23/09/2014','25/09/2014','10/06/2015',20.0,2,'1 año','valido por 1 año c.Escolar');
insert into PagosLectores (idlector,fechapago,fechauso,fecharenovacion,importe,idestadolector,disponibilidad,descripcion) values (20,'23/09/2014','25/09/2014','10/06/2015',30.0,2,'1 año','valido por 1 año c.Universitario');
-- RestriccionLectores
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (1,2,2,'No Devolvio los libros');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (2,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (3,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (4,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (5,2,3,'Devolucion de libros en mal estado');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (6,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (7,2,2,'Devolucion de libros en mal estado');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (8,2,2,'No Devolvio los libros');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (9,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (10,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (11,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (12,2,2,'No Devolvio los libros');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (13,2,3,'Devolucion con hojas rotas');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (14,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (15,2,3,'Devolucion de libros en mas estado');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (16,1,1,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (17,1,4,'puede obtener el carnet');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (18,2,3,'Devolucion defectuosa de libros');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (19,2,2,'No Devolvio los libros');
insert into RestriccionLectores(idlector,idestadolector,idmotivosrestriccion,descripcion) values (20,2,3,'Devolucion defectuosa de libros');
-- Autores
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Juan','Gelman','Burichson','Juan Gelman',9,2,'','http://es.wikipedia.org/wiki/Juan_Gelman','poeta, periodista, escritor, traductor',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Nicanor Segundo','Parra','Sandoval','Nicanor Parra',38,2,'','http://es.wikipedia.org/wiki/Nicanor_Parra','Poeta, profesor e investigador',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Gabriel José ','García','Márquez','Gabriel García Marquez',42,2,'','http://es.wikipedia.org/wiki/Gabriel_Garc%C3%ADa_M%C3%A1rquez','Escritor, periodista, editor, guionista',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Ana María','Matute','Ausejo','Ana María Matute',59,2,'','http://es.wikipedia.org/wiki/Ana_Mar%C3%ADa_Matute','Escritora, profesora',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Antonio','Gamoneda','Gamoneda','Antonio Gamoneda',59,2,'','http://es.wikipedia.org/wiki/Antonio_Gamoneda','Poeta',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Juan','Marse','Carbo','Juan Marsé',59,2,'','http://es.wikipedia.org/wiki/Juan_Mars%C3%A9','Escritor , Periodista',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Richard','Russo','Russo','Richard Russo',60,1,'','http://es.wikipedia.org/wiki/Richard_Russo','Novelista',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Toni','Morrison','Morrison','Toni Morrison',60,1,'','http://es.wikipedia.org/wiki/Toni_Morrison','Escritora',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Jean-Marie','Gustave','Le Clézio','Jean-Marie Le Clézio',66,3,'','http://es.wikipedia.org/wiki/Jean-Marie_Gustave_Le_Cl%C3%A9zio','Escritor, Traductor',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Doris','Lessing','Lessing','Doris Lessing',142,1,'','http://es.wikipedia.org/wiki/Doris_Lessing','Novelista',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Margaret','Drabble','Drabble','Margaret Drabble',142,1,'','http://es.wikipedia.org/wiki/Margaret_Drabble','Novelista, Critica Literaria',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Umberto','Eco','Eco','Umberto Eco',90,4,'','http://es.wikipedia.org/wiki/Umberto_Eco','Escritor, Filosofo',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Kazuo','Ishiguro','Ishiguro','Kazuo Ishiguro',92,9,'','http://es.wikipedia.org/wiki/Kazuo_Ishiguro','Novelista',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Sergio','Pitol','Demeneghi','Sergio Pitol',117,2,'','http://es.wikipedia.org/wiki/Sergio_Pitol','Escritor, Traductor, Diplomatico',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('José Emilio','Pacheco','Berny ','José Emilio Pacheco',117,2,'','http://es.wikipedia.org/wiki/Jos%C3%A9_Emilio_Pacheco','Escritor, Traductor',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Laura','Esquivel','Esquivel','Laura Esquivel',117,2,'','http://es.wikipedia.org/wiki/Laura_Esquivel','Guionista, Dramaturga, Docente',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Ernesto','Cardenal','Martinez','Ernesto Cardenal',127,2,'','http://es.wikipedia.org/wiki/Ernesto_Cardenal','Escritor, Poeta, Sacerdote',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Carlos','Fuentes','Macías','Carlos Fuentes Macías',136,2,'','http://es.wikipedia.org/wiki/Carlos_Fuentes','Novelista, Ensayista, Diplomatico',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Isabel','Allende','Llona','Isabel Allende',38,2,'','http://es.wikipedia.org/wiki/Isabel_Allende','Escritora',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Jorge Mario','Vargas','Llosa','Mario Vargas Llosa',139,2,'','http://es.wikipedia.org/wiki/Mario_Vargas_Llosa','Escritor, Politico',null);
insert into Autores (nombres,apellidopaterno,apellidomaterno,seudonimo,idpais,ididioma,email,paginaweb,descripcion,imagen) values ('Carlos Hugo','Garrido','Chalén','Carlos Garrido Chalén',139,2,'','http://es.wikipedia.org/wiki/Carlos_Hugo_Garrido_Chal%C3%A9n','Escritor, poeta',null);
-- AutoresGeneros
insert into AutoresGeneros(idgenero) values (2);
insert into AutoresGeneros(idgenero) values (5);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (4);
insert into AutoresGeneros(idgenero) values (2);
insert into AutoresGeneros(idgenero) values (5);
insert into AutoresGeneros(idgenero) values (5);
insert into AutoresGeneros(idgenero) values (4);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (1);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (7);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (3);
insert into AutoresGeneros(idgenero) values (4);
insert into AutoresGeneros(idgenero) values (7);
insert into AutoresGeneros(idgenero) values (2);
-- CategoriaLibrosAutores
insert into CategoriaLibrosAutores (idcategorialibro) values (3);
insert into CategoriaLibrosAutores (idcategorialibro) values (3);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (1);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (1);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (3);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (3);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
insert into CategoriaLibrosAutores (idcategorialibro) values (1);
insert into CategoriaLibrosAutores (idcategorialibro) values (3);
insert into CategoriaLibrosAutores (idcategorialibro) values (2);
-- Editoriales
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (1,9,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (2,38,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (3,42,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (4,59,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (5,59,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (6,59,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (7,60,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (8,60,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (9,66,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (10,142,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (11,142,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (12,90,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (13,92,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (14,117,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (15,117,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (16,117,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (17,127,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (18,136,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (19,38,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (20,139,'Grandes Libros','Calle Casagrande, 157 - SANTIAGO DE SURCO','(01)312-6034');
insert into Editoriales (idautor,idpais,razonsocial,direccion,telefonos) values (21,139,'Quad Graphics Perú S.A.','Avenida Los Frutales, 344 - ATE VITARTE','(01)205 3700');
-- RegistroLibrosAutores
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (4,1,2,'La pequeña vida','La pequeña vida','978-9972-58-110-7','2221-1757','250','60 gr.','1953',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (2,3,2,'Cancionero sin nombre','Cancionero sin nombre','978-9972-58-111-7','2222-1757','700','80 g','1937',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (1,3,1,'Violin y Otras Cuestiones','Violin y Otras Cuestiones','978-9972-58-112-7','2223-1757','650','76 g','1956',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (3,2,1,'La hojarasca','La hojarasca','978-9972-58-113-7','2224-1757','300','25 g','1955',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (5,2,1,'Libro del frío','Libro del frío','978-9972-58-114-7','2225-1757','320','25 g','1992',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (5,2,2,'Lapidas','Lapidas','978-9972-58-115-7','2226-1757','240','25 g','1986',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (6,2,1,'Encerrados con un solo juguete','Encerrados con un solo juguete','978-9972-58-116-7','2227-1757','420','59 g','1960',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (6,2,1,'Esta cara de la Luna','Esta cara de la Luna','978-9972-58-117-7','2228-1757','290','25 g','1962',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (7,2,2,'That Old Cape Magic','That Old Cape Magic','978-9972-58-118-7','2229-1757','300','25 g','2009',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (7,2,1,'Bridge of Sighs','Bridge of Sighs','978-9972-58-119-7','2230-1757','310','25 g','2007',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (8,1,1,'The Bluest Eye','Ojos azules','978-9972-58-120-7','2231-1757','270','25 g','1970',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (8,1,1,'Sula','Sula','978-9972-58-121-7','2232-1757','325','25 g','1973',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (9,2,2,'Le Procès-verbal','El atestado','978-9972-58-122-7','2233-1757','690','70 g','1963',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (9,2,1,'L`Extase matérielle','L`Extase matérielle','978-9972-58-123-7','2234-1757','500','25 g','1967',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (10,2,1,'Canta la hierba','Canta la hierba','978-9972-58-124-7','2235-1757','460','60 g','1950',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (10,2,1,'Martha Quest','Martha Quest','978-9972-58-125-7','2236-1757','300','25 g','1952',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (11,2,2,'The Sea Lady','The Sea Lady','978-9972-58-126-7','2237-1757','250','25 g','2006',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (11,2,2,'The Red Queen','The Red Queen','978-9972-58-127-7','2238-1757','300','25 g','2004',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (12,3,2,'Opera aperta','Opera aperta','978-9972-58-128-7','2239-1757','500','62 g','1962',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (12,3,1,'Diario mínimo','Diario mínimo','978-9972-58-129-7','2240-1757','610','68 g','1963',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (13,2,1,'A Pale View of Hills','Pálida luz en las colinas','978-9972-58-130-7','2241-1757','360','42 g','1982',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (13,2,1,'An Artist of the Floating World','Un artista del mundo flotante','978-9972-58-131-7','2242-1757','630','62 g','1986',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (14,3,2,'Infierno de todos','Infierno de todos','978-9972-58-132-7','2243-1757','290','25 g','1971',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (14,3,1,'El tañido de una flauta','El tañido de una flauta','978-9972-58-133-7','2244-1757','380','25 g','1973',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (15,2,1,'Los elementos de la noche','Los elementos de la noche','978-9972-58-134-7','2245-1757','390','48 g','1963',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (15,2,1,'El reposo del fuego','El reposo del fuego','978-9972-58-135-7','2246-1757','620','68 g','1966',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (16,2,1,'Como agua para chocolate','Como agua para chocolate','978-9972-58-136-7','2247-1757','460','46 g','1989',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (16,2,2,'La ley del amor','La ley del amor','978-9972-58-137-7','2248-1757','290','25 g','1995',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (17,2,1,'Hora 0','Hora 0','978-9972-58-138-7','2249-1757','380','25 g','1957',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (17,2,1,'Epigramas','Epigramas','978-9972-58-139-7','2250-1757','500','56 g','1961',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (18,2,2,'Las buenas conciencias','Las buenas conciencias','978-9972-58-140-7','2251-1757','630','62 g','1959',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (18,2,1,'Zona Sagrada','Zona Sagrada','978-9972-58-141-7','2252-1757','700','25 g','1967',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (19,1,1,'La casa de los espíritus','La casa de los espíritus','978-9972-58-142-7','2253-1757','490','56 g','1982',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (19,1,1,'La gorda de porcelana','La gorda de porcelana','978-9972-58-143-7','2254-1757','390','25 g','1984',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (20,3,1,'La ciudad y los perros','La ciudad y los perros','978-9972-58-144-7','2255-1757','520','64 g','1963',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (20,3,2,'Fonchito y la luna','Alfonsito en la luna','978-9972-58-145-7','2256-1757','630','70 g','2010',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (21,2,1,'Confesiones de un árbol','Confesiones de un árbol','978-9972-58-146-7','2257-1757','290','25 g','2007',null);
insert into RegistroLibrosAutores(idautor,idcategorialibro,idtipolibro,titulooriginal,titulo,isbn,issn,paginas,pesofisico,fechapublicacion,imagen) values  (21,2,1,'Idioma de los espejos','Idioma de los espejos','978-9972-58-147-7','2258-1757','430','25 g','2009',null);
-- LibrosGeneros
insert into LibrosGeneros (idgenero) values (4);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (1);
insert into LibrosGeneros (idgenero) values (1);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (1);
insert into LibrosGeneros (idgenero) values (6);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (4);
insert into LibrosGeneros (idgenero) values (4);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (5);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (4);
insert into LibrosGeneros (idgenero) values (3);
insert into LibrosGeneros (idgenero) values (4);
insert into LibrosGeneros (idgenero) values (2);
insert into LibrosGeneros (idgenero) values (2);
-- LibrosCopias
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,100);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,196);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,874);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,50);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,145);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,740);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,20);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,321);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,785);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (1,2,546);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,500);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (1,3,0);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,142);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,20);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,546);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,254);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,30);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,546);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,245);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,565);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,200);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,270);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,120);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,35);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,214);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,189);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (1,3,0);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,543);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,132);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,425);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,270);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,218);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,230);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,20);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,347);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,234);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,20);
insert into LibrosCopias (iddetallestock,cantidadminima,cantidadactual) values (2,3,546);
-- LibrosDigitales
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (6);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (3);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (6);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (3);
insert into LibrosDigitales (idformato) values (3);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (3);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (6);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (6);
insert into LibrosDigitales (idformato) values (3);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (6);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (1);
insert into LibrosDigitales (idformato) values (5);
insert into LibrosDigitales (idformato) values (1);
-- PrestamosInternos
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (1,1,2,2,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (2,1,3,1,'22/10/2014','29/10/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (3,1,4,2,'22/10/2014','22/12/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (4,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (5,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (6,1,3,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (7,1,3,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (8,1,3,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (9,1,4,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (10,1,5,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (11,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (12,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (13,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (14,1,7,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (15,1,4,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (16,1,5,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (17,1,6,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (18,1,2,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (19,1,5,3,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosInternos (idlector,idsalabiblioteca,idbibliotecario,idsede,fechaprestamo,fechadevolucion,descripcion) values (20,1,3,3,'22/10/2014','05/11/2014','verificar la devolucion');
-- PrestamosExternos
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (1,5,5,'22/10/2014','22/10/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (2,2,2,'22/10/2014','05/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (3,2,2,'22/10/2014','22/12/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (4,4,4,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (5,2,2,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (6,11,1,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (7,10,10,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (8,11,1,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (9,12,2,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (10,13,3,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (11,14,4,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (12,6,6,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (13,7,7,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (14,8,8,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (15,9,9,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (16,10,10,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (17,11,1,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (18,12,2,'22/10/2014','22/11/2014','verificar la devolucion');
insert into PrestamosExternos (idlector,idbibliotecario,idsede,fechaPrestamo,fechadevolucion,descripcion) values (19,2,2,'22/10/2014','22/11/2014','verificar la devolucion');
-- DetallePrestamosInternos							
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (1,1,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (2,2,3);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (3,3,5);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (4,1,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (5,4,1);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (6,6,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (7,8,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (8,6,5);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (9,10,1);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (10,12,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (11,20,1);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (12,15,4);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (13,3,5);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (14,17,1);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (15,5,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (16,16,1);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (17,13,3);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (18,8,4);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (19,9,2);
insert into DetallePrestamosInternos (idprestamointerno,idlibro,cantidadprestada) values (20,4,1);
-- 	DetallePrestamosExternos						 
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (1,4,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (2,2,4);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (3,6,5);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (4,1,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (5,15,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (6,6,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (7,3,4);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (8,16,5);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (9,6,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (10,7,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (11,5,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (12,19,4);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (13,20,5);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (14,14,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (15,1,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (16,17,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (17,3,4);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (18,12,5);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (19,9,2);
insert into DetallePrestamosExternos (idprestamoexterno,idlibro,cantidadprestada) values (19,8,2);
-- DevolucionLibrosInternos
insert into DevolucionLibrosInternos (idprestamointerno,idmotivosrestriccion) values (1,1);
insert into DevolucionLibrosInternos (idprestamointerno,idmotivosrestriccion) values (2,1);
insert into DevolucionLibrosInternos (idprestamointerno,idmotivosrestriccion) values (3,1);
insert into DevolucionLibrosInternos (idprestamointerno,idmotivosrestriccion) values (4,2);
-- DevolucionLibrosExternos
insert into DevolucionLibrosExternos (idprestamoexterno,idmotivosrestriccion) values (1,1);
insert into DevolucionLibrosExternos (idprestamoexterno,idmotivosrestriccion) values (2,2);
insert into DevolucionLibrosExternos (idprestamoexterno,idmotivosrestriccion) values (3,3);
insert into DevolucionLibrosExternos (idprestamoexterno,idmotivosrestriccion) values (4,3); 
-- DetalleReingresoInternos
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (1,1,1,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (2,2,2,3);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (3,3,1,5);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (4,1,2,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (5,4,1,1);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (6,6,1,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (7,8,3,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (8,6,1,5);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (9,10,2,1);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (10,12,1,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (11,20,2,1);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (12,15,1,4);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (13,3,2,5);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (14,17,1,1);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (15,5,1,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (16,16,1,1);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (17,13,2,3);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (18,8,1,4);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (19,9,2,2);
insert into DetalleReingresoInternos (idprestamointerno,idlibro,idestadolibros,cantidadprestada) values (20,4,2,1);
-- DetalleReingresoExternos
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (1,4,2,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (2,2,4,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (3,6,5,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (4,1,2,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (5,15,2,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (6,6,2,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (7,3,4,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (8,16,5,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (9,6,2,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (10,7,2,3);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (11,5,2,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (12,19,4,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (13,20,5,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (14,14,2,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (15,1,2,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (16,17,2,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (17,3,4,2);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (18,12,5,1);
insert into DetalleReingresoExternos (idprestamoexterno,idlibro,cantidadprestada,idestadolibros) values (19,9,2,1);

/*
drop table DetalleReingresoExternos;
drop table DetalleReingresoInternos; 
drop table DevolucionLibrosExternos; 
drop table DevolucionLibrosInternos; 
drop table RestriccionLectores;
drop table DetallePrestamosExternos; 
drop table PrestamosExternos;
drop table DetallePrestamosInternos;
drop table PrestamosInternos;
drop table LibrosDigitales; 
drop table LibrosCopias;
drop table LibrosGeneros;
drop table RegistroLibrosAutores;
drop table Editoriales;
drop table CategoriaLibrosAutores;
drop table AutoresGeneros;
drop table Autores;
drop table PagosLectores;
drop table CarnetLector;
drop table LoginUsuario;
drop table Bibliotecarios; 
drop table Sedes;
drop table SalaBiblioteca;
drop table PreciosCarnet;
drop table TiposSalas;
drop table DetalleStock;
drop table FormatosDigitales; 
drop table Generos;
drop table CategoriasLibros;
drop table Paises;
drop table TiposLibros;
drop table Idiomas;
drop table EstadoLectores; 
drop table MotivosRestricciones;
drop table EstadoDevolucionLibros;
drop table TipoLectores;
drop table TipoDocumentoIdentidad;
drop table TipoCarnets;
drop table GradoEstudios;
drop table TiposTelefonos;
drop table Distritos;
drop table Prestamos; 
drop table Departamentos;
drop table Provincias;
*/
































 









