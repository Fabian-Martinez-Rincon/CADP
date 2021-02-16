{12. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión
(medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea
igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}//Me falta terminar

 program Vectores;
 const
 dimF=200;
 type
    dias=1..31;
    str20=string[20];
    Viajes_marzo = record
    dia:dias;
    monto_dinero:Integer;
    Dist_recorrida:integer;
    end;
    vector =  Array [1..dimF] of Viajes_marzo;

//_________________________________________________________________________________
procedure Leer_viaje(var viajeF:Viajes_marzo);
begin
    with viajeF do begin
        WriteLn('Dia:');
        readln(dia);
        WriteLn('Monto del viaje:');
        ReadLn(monto_dinero);
        WriteLn('Distancia recorrida en KM:');
        ReadLn(Dist_recorrida);
    end;
end;
//_________________________________________________________________________________
procedure Leer_todo(var todos_viajes:vector;var viajeF2:Viajes_marzo;dimL:integer);
var
i:integer;
begin
    i:=1;
    Leer_viaje(viajeF2);
    //todos_viajes[i]:=viajeF2;
    while (i<dimF) and (todos_viajes[i].Dist_recorrida<>1)   do
    begin
        
        todos_viajes[i]:=viajeF2;
        i:=i+1;
        Leer_viaje(viajeF2);
        WriteLn('Hola mundo');
    end;
    dimL:=i;
end;

//_________________________________________________________________________________
var
    viajes:vector;
    viaje_indi:Viajes_marzo;
    dimL:integer;
begin
    dimL:=1;
   
    Leer_todo(viajes,viaje_indi,dimL);

    writeln('A_____________');
    

end.