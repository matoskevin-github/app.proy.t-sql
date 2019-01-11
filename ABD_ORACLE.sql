create table Personal  (
CODPER      char(4) primary key,
NOMPER     varchar2(30) not null,
SUELDO        number(7,2) not null
  );
  
  /* Adicionar la columna DNI char(8) not null a la tabla */
   alter table Personal  
   add DNI char(8) not null;
   
/*Adicionar la columna estado_civil char(1) not null*/
    alter table Personal  
   add ESTADO_CIVIL char(1) not null;
 
 /*Modificar la columna Nomper a varchar2(40) not null*/
 alter table Personal  
 modify ( NOMPER   varchar2(40) );
 
 /*Adiconal una restriccion para chequear qu el sueldo > = 70*/
 
alter table Personal  
 ADD constraint chk_Sueldo check (Sueldo >= 750)
 
 /*Implementar dni unico*/
 alter table Personal  
 ADD constraint unq_DNI unique (DNI)
 
 /*verificar que la longitud del DNI sea 8*/
 alter table Personal  
 ADD constraint chk_DNI check (length(DNI) = 8);
 
 /*Validar que la columna estado_civil solo tenga valores S,C,D,V*/
 alter table Personal  
 ADD constraint chk_ESTADO_CIVIL check (ESTADO_CIVIL in ('S','C','V','D'));
 
insert into personal values ('1234','Luis Rios',800,'12345678','C');
insert into personal values ('4732','Luis Rios',800,'12345678','C');
insert into personal values ('4732','Carmen Diaz',650,'25722737','S');
insert into personal values ('4732','Carmen Diaz',750,'25722737','S');
insert into personal values ('7693','Raul Pozo',1700,'45627779','E');    

 describe Personal  

 select * from personal
 
 
 
 create table Estados_Civiles(
 CODEST char(1)  primary key,
 NOMEST varchar2(30) not null
 );
 
 /*Modificar NOMEST a varchar2(20)*/
 alter table Estados_Civiles
 modify ( NOMEST   varchar2(20) );
 
 describe Estados_Civiles
 
 insert into Estados_Civiles values ('C','Casado');
 insert into Estados_Civiles values ('D','Divorciado');
 insert into Estados_Civiles values ('S','Soltero');
 insert into Estados_Civiles values ('V','Viudo');
 
  alter table personal
  add constraint FK_Estado_Civil
  foreign key (ESTADO_CIVIL )
  references  Estados_Civiles (CODEST);
 
 describe personal
 