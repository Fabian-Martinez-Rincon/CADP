{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año 2017.
Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en
“a.”.
c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2017. La lectura finaliza al ingresar
el año 2018, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano
(enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar
el módulo realizado en “b.” para la lectura de fecha.}

program numero2;
type
    
    rango_dias=1..30;
    rango_mes=1..12;
    
    fecha=record
    dia:rango_dias;
        mes:rango_mes;
        anio:integer;
end;
procedure leer(var fecha_casamiento:fecha);
begin
    writeln('Ingrese el dia');
    ReadLn(fecha_casamiento.dia);
    writeln('Ingrese el mes');
    ReadLn(fecha_casamiento.mes);
    writeln('Ingrese el anio');
    ReadLn(fecha_casamiento.anio);
end;
var
    a:fecha;
begin
    leer(a);
end.