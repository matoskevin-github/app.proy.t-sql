-- consultas Northwind --

select * from products;
select * from suppliers;
select * from customers;
select * from orders;
select * from order_details;
select * from shippers;

-- Consulta N° 1
select CustomerID,CompanyName 
from Customers;
-- Consulta N° 2 alias de campo
select customerid "Codigo" 
from customers "Cliente";
-- Consulta N° 3
select customerid "Codigo" ,companyname "Cliente Extranjero"
from customers;
-- Consulta N° 4 
select * from products;
-- Consulta N° 5
select productID,productname,unitprice
from products;
-- Consulta N° 6
select country,city,companyname
from customers
order by country,city;
-- Consulta N° 7 Ejemplo de funcion top
select country,city,companyname
from customers
where rownum <= 5;
-- Consulta N° 8
select customerid  ,companyname 
from customers
where city = 'Madrid';
-- Consulta N° 9
select customerID,companyname,city
from customers
where city = 'Madrid' or city = 'Barcelona';
-- Consulta N° 10
select productID,ProductName,unitprice,categoryID
from products
where  CategoryID in ( 4,6) and UnitPrice >=  100;
 --where  (CategoryID = 4 or  CategoryID = 6) and UnitPrice >=  100;
-- Consulta N° 11
select * from order_details
where orderID = '10535';
-- Consulta N° 12
select productname,unitprice,unitprice * 0.18 "IGV", unitprice+(unitprice*0.18) "Total"
from Products
order by productname;
-- Consulta N° 13
select orderID,quantity,unitprice,unitprice*quantity "Importe",productid
from order_details
where productID = 11 or productID = 12
order by productID;
-- Consulta N° 14
select * from customers
where city in ('Madrid','Buenos Aires','London')
order by city;
-- Consulta N° 15
select  productname,unitprice
from products
where unitprice between 10 and 20
order by unitprice ;
-- Consulta N° 16
select companyname,city
from customers
where companyname like 'A%';
-- Consulta N° 17
select productname,unitprice
from products
where productname like 'C%' and (UnitPrice >= 10 and unitprice <= 20);
-- Consulta N° 18
select productname
from products
where productname like '__a%';
-- Consulta N° 19
select * 
from customers
where companyname like '__p%';
-- Consulta N° 20
select length('Sise') from dual;
-- Consulta N° 21
select companyname,length(companyname) "Longitud"
from customers;
-- Consulta N° 22
select productname,substr(productname,1,5) "Extraer 5 Caracteres"
from products;
-- Consulta N° 23
select productid || ' - '|| productname
from products;
-- Consulta N° 24
select concat(productid,productname)
from products;
-- Consulta N° 25
select companyname,lower(companyname) "Minuscula",upper(companyname) "Mayuscula"
from customers;
-- Consulta N° 26
SELECT LTRIM('  Examen') FROM DUAL;                --Devuelve “Examen”
SELECT LTRIM('   Examen', ' ') FROM DUAL;             --Devuelve “Examen”
SELECT LTRIM('0000Testing','0') FROM DUAL;            --Devuelve “Testing”
SELECT LTRIM('123123Total', 'Tota') FROM DUAL;       --Devuelve “Total”
SELECT LTRIM('123123Total123', '123') FROM DUAL;     --Devuelve “Total123”
SELECT LTRIM('xyxzyyyTotal', 'xyz') FROM DUAL;        --Devuelve “Total”
SELECT LTRIM('6372Total', '1234567890') FROM DUAL;    --Devuelve “Total”
-- Consulta N° 27
SELECT REPLACE('123123Ejemplo', '123') FROM DUAL;      --Devuelve “Ejemplo”
SELECT REPLACE('123Ejemplo123', '123') FROM DUAL;     --Devuelve “Ejemplo”
SELECT REPLACE('222Ejemplo', '2', '3') FROM DUAL;     --Devuelve “333Ejemplo”
SELECT REPLACE('0000123', '0') FROM DUAL;             --Devuelve “123”
SELECT REPLACE('0000123', '0', ' ') FROM DUAL;        --Devuelve “    123”
-- Consulta N° 28
SELECT RTRIM('Examen   ') FROM DUAL;                  --Devuelve “Examen”
SELECT RTRIM('Examen   ', ' ') FROM DUAL;             --Devuelve “Examen”
SELECT RTRIM('Testing0000','0') FROM DUAL;            --Devuelve “Testing”
SELECT RTRIM('Total123123', 'Total') FROM DUAL;      --Devuelve “Total”
SELECT RTRIM('123Total123123', '123') FROM DUAL;      --Devuelve “123Total”
SELECT RTRIM('Totalxyxzyyy', 'xyz') FROM DUAL;       --Devuelve “Total”
SELECT RTRIM('Total6372', '1234567890') FROM DUAL;    
-- Consulta N° 29
-- si es positivo cuenta desde el inicio si es negativo cuenta desde el final
SELECT SUBSTR('This is a test',6,2) FROM DUAL; --Devuelve “is”
SELECT SUBSTR('This is a test',6) FROM DUAL;   --Devuelve “is a test”
SELECT SUBSTR('TechOnTheNet',1,4) FROM DUAL;   --Devuelve “Tech”
SELECT SUBSTR('TechOnTheNet',-3,3) FROM DUAL; --Devuelve “Net”
SELECT SUBSTR('TechOnTheNet',-6,3) FROM DUAL; --Devuelve “The”
SELECT SUBSTR('TechOnTheNet',-8,2) FROM DUAL;--Devuelve “On”
-- Consulta N° 30
select companyname,companyname || ' ' || contactname
from customers;
-- Consulta N° 31
select productname,replace(productname,'a','u') "Reemplazar texto"
from products;
-- Consulta N° 32
select sysdate "Fecha Actual",
            EXTRACT(YEAR FROM sysdate) "Año Actual",
            EXTRACT(Month FROM sysdate) "Mes  Actual",
            EXTRACT(day FROM sysdate) "Dia  Actual"              
from dual;
-- Consulta N° 33
select to_char(sysdate, 'hh24:mi:ss') "Fecha Actual Formato Largo",
   extract(hour from to_timestamp(to_char(sysdate, 'dd-mon-yy hh24:mi:ss'))) "Hora Actual",
  extract(minute from to_timestamp(to_char(sysdate, 'dd-mon-yy hh24:mi:ss'))) "Minuto actual",
  extract(second from to_timestamp(to_char(sysdate, 'dd-mon-yy hh24:mi:ss'))) "Segundo Actual"
from dual;
-- Consulta N° 34
select to_char(sysdate, 'hh24:mi:ss')"Fecha Actual Formato Largo",
  to_char(sysdate, 'hh24') "Hora Actual",
  to_char(sysdate, 'mi') "Minuto actual",
  to_char(sysdate, 'ss')  "Segundo Actual"
 from dual;
-- Consulta N° 35
-- CAST (FechaX AS VARCHAR2);
select extract(hour from cast(sysdate as timestamp)) "Hora"from dual;
select extract(minute  from cast(sysdate as timestamp)) "Minuto" from dual;
select extract(second from cast(sysdate as timestamp)) "Segundo"from dual;
-- Consulta N° 36
select  * 
from orders
where extract(year from TO_DATE(orderdate, 'mm/dd/yyyy') ) = '1998';
-- Consulta N° 37
select orderid "Numero",orderdate "Fecha Pedido"
from orders
where extract(year from to_date(orderdate,'mm-dd-YY')) = '1998';
-- Consulta N° 38
select orderid,customerid,to_date( shippeddate,'mm-dd-YY')
from orders
where extract(year from to_date(orderdate,'mm-dd-YY'))  = '1997' 
              and extract(month from to_date(orderdate,'mm-dd-YY')) in (1,2);
-- Consulta N° 39
select orderid,customerid,to_date( orderdate,'MM-DD-YY')
from orders
where extract(year from to_date(orderdate,'MM-DD-YY'))  = '1997' 
              and extract(month from to_date(orderdate,'mm-dd-YY')) in (10,11,12);
-- Consulta N° 40
select * 
from orders
where orderdate between '15/01/1997' and '30/04/1997'
order by orderdate
-- Consulta N° 41
select CustomerID,CompanyName
  from Customers 
  where  CompanyName = 'Antonio Moreno Taquería'
-- Consulta N° 42
Select CustomerID,OrderID Numero,OrderDate,ShippedDate
 From Orders
 where (ShippedDate between '15/05/1997' and '30/05/1997') and CustomerID = 'ANTON'
-- Consulta N° 43
select  sysdate,
              TO_CHAR(SYSDATE,'yyyy') "Numero de Año",
              TO_CHAR(SYSDATE,'MONTH') "Nombre del Mes",
              TO_CHAR(SYSDATE,'MON') "Nombre del Mes Corto",
              TO_CHAR(SYSDATE,'dd') "Numero de Dia",
              TO_CHAR(SYSDATE,'mm') "Numero de Mes",
              TO_CHAR(SYSDATE,'q') "Numero de Trimestre",
              TO_CHAR(SYSDATE,'DAY') "Nombre de Dia",
              TO_DATE(SYSDATE,'YYYY-MM-DD') "Formato Tipo Date", -- formato tipo date para fechas utilizando todo el patron
              TO_CHAR(SYSDATE,'YYYY-MM-DD') "Formato Tipo Char" -- formato tipo texto para fechas utilizando todo el patron o su mascara
from dual;
-- Consulta N° 44
select sysdate"Fecha Actual",to_date(sysdate, 'dd/mm/yyyy') + 5 "Adelanto 5 Dias"  from dual;  -- adelantar 5 dias
select sysdate,add_months(sysdate,5) "Adelanto 5 Meses"from dual; -- adelantar 5 meses
select sysdate,add_months(sysdate,60) "Adelanto 5 Años" from dual; -- adelantar 5 años osea cada mes tiene 12 meses  12 * 5 = 60
select TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS') "Fecha Formato Largo"from dual;
SELECT to_char(sysdate + numtoyminterval(5, 'MONTH'), 'MM/DD/YYYY') FROM dual;
 SELECT to_char(sysdate + numtoyminterval(2, 'YEAR'), 'MM/DD/YYYY') FROM dual;
SELECT TO_CHAR(sysdate,'HH12') "Hora  Actual" from dual ;
SELECT TO_CHAR(sysdate,'MI') "Minuto Actual" from dual ;
SELECT TO_CHAR(sysdate,'SS') "Segundo Actual" from dual ;
-- Consulta N° 45
select orderid,orderdate,shippeddate,
         trunc(TO_NUMBER(TO_CHAR(  to_date(shippeddate,'mm/dd/yyyy')  - to_date( orderdate ,'mm/dd/yyyy') ))/12)  "Diferencia en Años"
from orders;
-- Consulta N° 46
-- Forma 1
select orderid,orderdate,shippeddate,
           to_date(shippeddate,'mm/dd/yyyy')  - to_date( orderdate ,'mm/dd/yyyy')  "Diferencia en Meses"
from orders;
-- Forma 2
select orderid,to_char(to_date(orderdate,'mm/dd/yyyy'), 'dd-mm-yy') ,to_char(to_date(shippeddate,'mm/dd/yyyy'), 'dd-mm-yy'),
       trunc(MONTHS_BETWEEN( to_date(shippeddate,'mm/dd/yyyy')  ,to_date( orderdate ,'mm/dd/yyyy') )) "Diferencia en Meses"
from orders;
-- Consulta N° 47
select orderid,to_char(to_date(shippeddate,'mm/dd/yyyy'), 'dd-mm-yy') ,to_char(to_date(shippeddate,'mm/dd/yyyy'), 'dd-mm-yy')
         --  to_date(shippeddate,'mm/dd/yyyy')  - to_date( orderdate ,'mm/dd/yyyy')  "Diferencia en Dias"
from orders;
-- Consulta N° 48
select add_months(sysdate,5) from dual;  -- adelantar 5 meses
select add_months(sysdate,-5) from dual; --quitarle 5 meses
select add_months(sysdate,1) from dual;  --adelantar 1 meses
-- Consulta N° 49

-- Consulta N° 50
-- Consulta N° 51
-- Consulta N° 52
-- Consulta N° 53
-- Consulta N° 54
-- Consulta N° 55
-- Consulta N° 56
-- Consulta N° 57
-- Consulta N° 58
-- Consulta N° 59
-- Consulta N° 60
-- Consulta N° 61
-- Consulta N° 62
-- Consulta N° 63
-- Consulta N° 64
-- Consulta N° 65
-- Consulta N° 66
-- Consulta N° 67
-- Consulta N° 68
-- Consulta N° 69
-- Consulta N° 70
-- Consulta N° 71
-- Consulta N° 72
-- Consulta N° 73
-- Consulta N° 74
-- Consulta N° 75
-- Consulta N° 76
-- Consulta N° 77
-- Consulta N° 78
-- Consulta N° 79
-- Consulta N° 80
-- Consulta N° 81
-- Consulta N° 82
-- Consulta N° 83
-- Consulta N° 84
-- Consulta N° 85
-- Consulta N° 86
-- Consulta N° 87
-- Consulta N° 88
-- Consulta N° 89
-- Consulta N° 90
-- Consulta N° 91
-- Consulta N° 92
-- Consulta N° 93
-- Consulta N° 94
-- Consulta N° 95
-- Consulta N° 96
-- Consulta N° 97
-- Consulta N° 98
-- Consulta N° 99
-- Consulta N° 100
