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
//_________________________________________________________________________________________________
procedure leer(var fecha_casamiento:fecha);
begin
    writeln('Ingrese el dia');
    ReadLn(fecha_casamiento.dia);
    writeln('Ingrese el mes');
    ReadLn(fecha_casamiento.mes);
    writeln('Ingrese el anio');
    ReadLn(fecha_casamiento.anio);
end;
//_________________________________________________________________________________________________
procedure leer_por_anio(var fecha_casamiento:fecha;var casamientos_verano:integer);
var 
    anio2018:integer;
begin
    anio2018:=2018;
    while(fecha_casamiento.anio<>anio2018) do
        begin
        leer(fecha_casamiento);
        //verano(fecha_casamiento.mes,casamietos_verano);
        end;
end;
//_________________________________________________________________________________________________
//funcion que no funciona
procedure verano(fecha_casamientof:fecha;var cont_casamientos:integer);
var
    enero:integer;
    febrero:integer;
    marzo:integer;
begin
    enero:=1;
    febrero:=2;
    marzo:=3;
    if (fecha_casamientof.mes = enero) or (fecha_casamientof.mes = febrero) or (fecha_casamientof.mes = marzo) then
    begin
        cont_casamientos:=cont_casamientos+1;
    end;
end;
//_________________________________________________________________________________________________
var
    a:fecha;
    contador_verano:integer;
begin
    contador_verano:=0;
    leer(a);
    leer_por_anio(a,contador_verano);
    writeln('Los casamientos que se realizaron en el verano son:',contador_verano);
end.