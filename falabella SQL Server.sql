use master
create database falabella;
go

use falabella;
go

create table Paises (
	idPais  char(5) primary key not null,
    Detalle nchar(40) not null    
);

create table TipoDocumentos (
	idTipo  char(5) primary key not null,
    Detalle nchar(40) not null    
);

create table Clientes(
	idCliente       char(5) primary key not null,
	Nombre 	        nchar(50) not null,
    ApellidoPaterno nchar(50) not null,
    ApellidoMaterno nchar(50) not null,
    Email           nchar(80) not null,
    Clave           char(20) not null,
    idPais          char(5) not null,
    idTipo          char(5) not null,
    NDocumento      char(9) unique not null,
    Sexo            char(1) check(Sexo in ('M','F')),
    FechaNacimiento date not null,
    Celular         char(15) not null,
    foreign key (idPais) references Paises(idPais ),
    foreign key (idTipo) references TipoDocumentos(idTipo)
);


insert Paises values ( 'PA001', 'Afghanistán' );
insert Paises values ( 'PA002', 'Albania' );
insert Paises values ( 'PA003', 'Alemania' );
insert Paises values ( 'PA004', 'Andorra' );
insert Paises values ( 'PA005', 'Angola' );
insert Paises values ( 'PA006', 'Anguilla' );
insert Paises values ( 'PA007', 'Antigua y Barbuda' );
insert Paises values ( 'PA008', 'Arabia Saudita' );
insert Paises values ( 'PA009', 'Argelia' );
insert Paises values ( 'PA010', 'Argentina' );
insert Paises values ( 'PA011', 'Armenia' );
insert Paises values ( 'PA012', 'Australia' );
insert Paises values ( 'PA013', 'Austria' );
insert Paises values ( 'PA014', 'Azerbayán' );
insert Paises values ( 'PA015', 'Bahamas' );
insert Paises values ( 'PA016', 'Bahrein' );
insert Paises values ( 'PA017', 'Bangladesh' );
insert Paises values ( 'PA018', 'Barbados' );
insert Paises values ( 'PA019', 'Belarús' );
insert Paises values ( 'PA020', 'Bélgica' );
insert Paises values ( 'PA021', 'Belice' );
insert Paises values ( 'PA022', 'Benin' );
insert Paises values ( 'PA023', 'Bhután' );
insert Paises values ( 'PA024', 'Birmania' );
insert Paises values ( 'PA025', 'Bolivia' );
insert Paises values ( 'PA026', 'Bosnia-Herzegovina' );
insert Paises values ( 'PA027', 'Botswana' );
insert Paises values ( 'PA028', 'Brasil' );
insert Paises values ( 'PA029', 'Brunei' );
insert Paises values ( 'PA030', 'Bulgaria' );
insert Paises values ( 'PA031', 'Burkina Faso' );
insert Paises values ( 'PA032', 'Burundi' );
insert Paises values ( 'PA033', 'Cabo Verde' );
insert Paises values ( 'PA034', 'Camboya' );
insert Paises values ( 'PA035', 'Camerún' );
insert Paises values ( 'PA036', 'Canadá' );
insert Paises values ( 'PA037', 'Chad' );
insert Paises values ( 'PA038', 'Chile' );
insert Paises values ( 'PA039', 'China' );
insert Paises values ( 'PA040', 'Chipre' );
insert Paises values ( 'PA041', 'Colombia' );
insert Paises values ( 'PA042', 'Comoras' );
insert Paises values ( 'PA043', 'Congo' );
insert Paises values ( 'PA044', 'Congo, R. D.' );
insert Paises values ( 'PA045', 'Corea del Norte' );
insert Paises values ( 'PA046', 'Corea del Sur' );
insert Paises values ( 'PA047', 'Costa de Marfil' );
insert Paises values ( 'PA048', 'Costa Rica' );
insert Paises values ( 'PA049', 'Croacia' );
insert Paises values ( 'PA050', 'Cuba' );
insert Paises values ( 'PA051', 'Dinamarca' );
insert Paises values ( 'PA052', 'Djibouti' );
insert Paises values ( 'PA053', 'Ecuador' );
insert Paises values ( 'PA054', 'Egipto' );
insert Paises values ( 'PA055', 'El Salvador' );
insert Paises values ( 'PA056', 'Emiratos Arabes Unidos' );
insert Paises values ( 'PA057', 'Eritrea' );
insert Paises values ( 'PA058', 'Eslovaquia' );
insert Paises values ( 'PA059', 'Eslovenia' );
insert Paises values ( 'PA060', 'España' );
insert Paises values ( 'PA061', 'Estados Unidos' );
insert Paises values ( 'PA062', 'Estonia' );
insert Paises values ( 'PA063', 'Etiopia' );
insert Paises values ( 'PA064', 'Fiji' );
insert Paises values ( 'PA065', 'Filipinas' );
insert Paises values ( 'PA066', 'Finlandia' );
insert Paises values ( 'PA067', 'Francia' );
insert Paises values ( 'PA068', 'Gabon' );
insert Paises values ( 'PA069', 'Gambia' );
insert Paises values ( 'PA070', 'Georgia' );
insert Paises values ( 'PA071', 'Ghana' );
insert Paises values ( 'PA072', 'Grecia' );
insert Paises values ( 'PA073', 'Granada' );
insert Paises values ( 'PA074', 'Guatemala' );
insert Paises values ( 'PA075', 'Guinea' );
insert Paises values ( 'PA076', 'Guinea-Bissau' );
insert Paises values ( 'PA077', 'Guinea Ecuatorial' );
insert Paises values ( 'PA078', 'Guyana' );
insert Paises values ( 'PA079', 'Haiti' );
insert Paises values ( 'PA080', 'Honduras' );
insert Paises values ( 'PA081', 'Hungria' );
insert Paises values ( 'PA082', 'Islandia' );
insert Paises values ( 'PA083', 'India' );
insert Paises values ( 'PA084', 'Indonesia' );
insert Paises values ( 'PA085', 'Iran' );
insert Paises values ( 'PA086', 'Iraq' );
insert Paises values ( 'PA087', 'Irlanda' );
insert Paises values ( 'PA088', 'Israel' );
insert Paises values ( 'PA089', 'Italia' );
insert Paises values ( 'PA090', 'Jamaica' );
insert Paises values ( 'PA091', 'Japón' );
insert Paises values ( 'PA092', 'Jordania' );
insert Paises values ( 'PA093', 'Kazajstán' );
insert Paises values ( 'PA094', 'Kenia' );
insert Paises values ( 'PA095', 'Kirguistán' );
insert Paises values ( 'PA096', 'Kiribati' );
insert Paises values ( 'PA097', 'Kuwait' );
insert Paises values ( 'PA098', 'Laos' );
insert Paises values ( 'PA099', 'Letonia' );
insert Paises values ( 'PA100', 'Libano' );
insert Paises values ( 'PA101', 'Lesotho' );
insert Paises values ( 'PA102', 'Liberia' );
insert Paises values ( 'PA103', 'Libia' );
insert Paises values ( 'PA104', 'Liechtenstein' );
insert Paises values ( 'PA105', 'Lituania' );
insert Paises values ( 'PA106', 'Luxemburgo' );
insert Paises values ( 'PA107', 'Macedonia' );
insert Paises values ( 'PA108', 'Madagascar' );
insert Paises values ( 'PA109', 'Malawi' );
insert Paises values ( 'PA110', 'Malasia' );
insert Paises values ( 'PA111', 'Maldivas' );
insert Paises values ( 'PA112', 'Mali' );
insert Paises values ( 'PA113', 'Malta' );
insert Paises values ( 'PA114', 'Marruecos' );
insert Paises values ( 'PA115', 'Marshall' );
insert Paises values ( 'PA116', 'Mauricio' );
insert Paises values ( 'PA117', 'Mauritania' );
insert Paises values ( 'PA118', 'México' );
insert Paises values ( 'PA119', 'Micronesia' );
insert Paises values ( 'PA120', 'Moldova' );
insert Paises values ( 'PA121', 'Mónaco' );
insert Paises values ( 'PA122', 'Mongolia' );
insert Paises values ( 'PA123', 'Mozambique' );
insert Paises values ( 'PA124', 'Namibia' );
insert Paises values ( 'PA125', 'Naurú' );
insert Paises values ( 'PA126', 'Nepal' );
insert Paises values ( 'PA127', 'Nicaragua' );
insert Paises values ( 'PA128', 'Niger' );
insert Paises values ( 'PA129', 'Nigeria' );
insert Paises values ( 'PA130', 'Noruega' );
insert Paises values ( 'PA131', 'Nueva Zelandia' );
insert Paises values ( 'PA132', 'Omán' );
insert Paises values ( 'PA133', 'Países Bajos' );
insert Paises values ( 'PA134', 'Pakistán' );
insert Paises values ( 'PA135', 'Palau' );
insert Paises values ( 'PA136', 'Panamá' );
insert Paises values ( 'PA137', 'Papúa-Nueva Guinea' );
insert Paises values ( 'PA138', 'Paraguay' );
insert Paises values ( 'PA139', 'Perú' );
insert Paises values ( 'PA140', 'Polonia' );
insert Paises values ( 'PA141', 'Portugal' );
insert Paises values ( 'PA142', 'Qatar' );
insert Paises values ( 'PA143', 'Reino Unido' );
insert Paises values ( 'PA144', 'Rep. Centroafricana' );
insert Paises values ( 'PA145', 'Rep. Checa' );
insert Paises values ( 'PA146', 'Rep. Dominicana' );
insert Paises values ( 'PA147', 'Ruanda' );
insert Paises values ( 'PA148', 'Rumania' );
insert Paises values ( 'PA149', 'Rusia' );
insert Paises values ( 'PA150', 'Salomon Islands' );
insert Paises values ( 'PA151', 'Samoa' );
insert Paises values ( 'PA152', 'San Marino' );
insert Paises values ( 'PA153', 'San Cristóbal-Nevis' );
insert Paises values ( 'PA154', 'Santa Lucía' );
insert Paises values ( 'PA155', 'Santa Sede (Vaticano)' );
insert Paises values ( 'PA156', 'São Tomé y Principe' );
insert Paises values ( 'PA157', 'St.Vincente las Grenadinas' );
insert Paises values ( 'PA158', 'Senegal' );
insert Paises values ( 'PA159', 'Seychelles' );
insert Paises values ( 'PA160', 'Sierra Leona' );
insert Paises values ( 'PA161', 'Singapur' );
insert Paises values ( 'PA162', 'Siria' );
insert Paises values ( 'PA163', 'Somalia' );
insert Paises values ( 'PA164', 'Sri Lanka' );
insert Paises values ( 'PA165', 'Sudáfrica' );
insert Paises values ( 'PA166', 'Sudán' );
insert Paises values ( 'PA167', 'Suecia' );
insert Paises values ( 'PA168', 'Suiza' );
insert Paises values ( 'PA169', 'Suriname' );
insert Paises values ( 'PA170', 'Swazilandia' );
insert Paises values ( 'PA171', 'Tailandia' );
insert Paises values ( 'PA172', 'Taiwán' );
insert Paises values ( 'PA173', 'Tanzania' );
insert Paises values ( 'PA174', 'Tayikistán' );
insert Paises values ( 'PA175', 'Togo' );
insert Paises values ( 'PA176', 'Tonga' );
insert Paises values ( 'PA177', 'Trinidad y Tabago' );
insert Paises values ( 'PA178', 'Túnez' );
insert Paises values ( 'PA179', 'Turkmenistan' );
insert Paises values ( 'PA180', 'Turquia' );
insert Paises values ( 'PA181', 'Tuvalu' );
insert Paises values ( 'PA182', 'Ucraina' );
insert Paises values ( 'PA183', 'Uganda' );
insert Paises values ( 'PA184', 'Uruguay' );
insert Paises values ( 'PA185', 'Uzbekistán' );
insert Paises values ( 'PA186', 'Vanuatu' );
insert Paises values ( 'PA187', 'Venezuela' );
insert Paises values ( 'PA188', 'Vietnam' );
insert Paises values ( 'PA189', 'Yémen' );
insert Paises values ( 'PA190', 'Yugoslavia' );
insert Paises values ( 'PA191', 'Zambia' );
insert Paises values ( 'PA192', 'Zimbabwe' );
insert TipoDocumentos values ('DC001','DNI');
insert TipoDocumentos values ('DC002','Carnet de extranjería');
insert Clientes values ('C0001','Victor Kevin','Matos','Secce','matosseccevictor@outlook.com','MSvk76522916','PA139','DC001','765229165','M','1995-01-02','991589419');

select * from Clientes;