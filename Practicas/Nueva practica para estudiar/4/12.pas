{12. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta 
con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta con la 
siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión 
(medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando 
se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea 
igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}
const
    dimF = 200;
type
    rango_dias = 1..30;
    viaje = record
        dias:rango_dias;
        monto:integer;
        distancia:integer;
    end;
    vector = array [1..dimF] of viaje;
//________________________________________________
procedure leerViaje(var v:viaje);
begin
    WriteLn('dias: '); ReadLn(v.dias);
    WriteLn('monto: '); ReadLn(v.monto);
    WriteLn('distancia: '); ReadLn(v.distancia);
end;
//________________________________________________
procedure CargarVector(var v:vector;var dimL:integer);
var
    viaj:viaje;
begin
    leerViaje(viaj);
    while ((viaj.distancia <> 0) and (dimL<dimF)) do
    begin
        dimL:=dimL+1;
        v[dimL]:=viaj;
        leerViaje(viaj);
        
    end;
end;
//________________________________________________
procedure InformarB(v:vector;dimL:integer);
var 
    mont_promedio:real;
    total:integer;
    i:integer;
    distanciaMenor:integer;
    diaMenor:rango_dias;
    montoMenor:integer;
begin
    total:=0;
    distanciaMenor:=0;
    diaMenor:=1;
    montoMenor:=999;
    for i:=1 to dimL do
    begin
        total:=total+v[i].monto;
        if (v[i].monto<montoMenor) then
        begin
            distanciaMenor:=v[i].distancia;
            diaMenor:=v[i].dias;
            montoMenor:=v[i].monto;
        end;
    end;
    mont_promedio:=total/dimL;
    writeln('El promedio es: ', mont_promedio:2:2);
    WriteLn('La distancia en la que se cobro menos fue: ',distanciaMenor);
    WriteLn('El dia del mes que menos se cobro es: ', diaMenor);
end;
//________________________________________________
procedure borrarPos(var v:vector; var dimL:integer; pos:integer);
var
    i:integer;
begin
    if ((pos>=1) and (pos<=dimL)) then
    begin
        for i:=(pos+1) to dimL do
        begin
            v[i-1]:=v[i];
        end;
        dimL:=dimL-1;
    end;
end;
//________________________________________________
procedure EliminarC(var v:vector; var dimL:Integer);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        while (v[i].distancia = 100) do
        begin
            borrarPos(v,dimL,i);
        end;
    end;
end;
//________________________________________________
procedure imprimirVector(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        WriteLn(v[i].dias);
        WriteLn(v[i].distancia);
        WriteLn(v[i].monto);
    end;
end;
//________________________________________________
var
    v:vector;
    dimL:Integer;
begin
    dimL:=0;
    CargarVector(v,dimL);
    InformarB(v,dimL);
    EliminarC(v,dimL);
    imprimirVector(v,dimL);
end.