{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en
kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura
finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.

}
program JugamosConListas;
type
    anio=1900..2021;
    codigocamion=1..100;
    str20=string[20];
    camion=record
        patente:integer;
        anio_frafric:anio;
        capacidad:integer;
    end;
    viaje=record
        cod_viaje:integer;
        cod_camion:codigocamion;
        distancia:integer;
        ciudad_des:str20;
        anio_viaje:anio;
        dni_chofer:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos : viaje;
        sig : lista;
    end;
    vector_camiones = array [1..100] of camion;

//___________________________________________________________
procedure LeerViaje(var V:viaje);
begin
    readln(V.cod_viaje);
    readln(V.cod_camion);
    readln(V.distancia);
    readln(V.ciudad_des);
    readln(V.ciudad_des);
    readln(V.anio_viaje);
    readln(V.dni_chofer);
end;
//___________________________________________________________
procedure OrdenarLista(var L:lista;V:viaje);
var 
    nue:lista;
begin
    new(nue);
    nue^.datos:=V;
    nue^.sig:=L;
    L:=nue;
end;
//___________________________________________________________
procedure CargarLista(var L:lista);
var 
    V:viaje;
begin
    LeerViaje(V);
    while V.cod_viaje <> -1 do
    begin
        OrdenarLista(L,V);
        LeerViaje(V);
    end;
end;
//___________________________________________________________
procedure InformarA(V:viaje;var maxPatente,minPatente:integer;var maxKilometro,minKilometro:integer);
begin
    if V.distancia>maxKilometro then
    begin
        maxKilometro:=V.distancia;
        maxPatente:=V.cod_camion;
    end;
    if V.distancia<minKilometro then
    begin
        minKilometro:=V.distancia;
        minPatente:=V.cod_camion;
    end
end;
//___________________________________________________________
procedure InformarB (V:vector_camiones;var Cont:integer);
var i:integer;
begin
    for i:=1 to 100 do
    begin
        if V[i]<30.5 then
        begin
            Cont:=Cont+1;
        end;
    end;
end;
//___________________________________________________________
procedure InformarC (dni:integer;codigo:integer);
var
    dig:integer;
    cumple:boolean;
begin
    cumple:=false;
    while (dni<>0) and (cumple=true) do
    begin
        dig:=dni mod 10;
        if ((dig mod 2) = 0)then
        begin
            cumple:=false;
        end;
        dni:=dni div 10;
    end;
    if (cumple=true)then
    begin
        WriteLn(codigo);
    end;
end;
//___________________________________________________________
procedure RecorrerLista(L:lista;VC:vector_camiones);
var
    maxPatente:integer;
    maxKilometro:integer;
    minPatente:integer;
    minKilometro:integer;
    CapMayor:integer;
begin
    CapMayor:=0;
    maxPatente:=-1;
    maxKilometro:=-1;
    minPatente:=9999;
    minKilometro:=9999;
    while L<>nil do
    begin
        InformarA(L.datos,maxPatente,minPatente,maxKilometro,minKilometro);
        InformarB(VC,CapMayor);
        InformarC(L^.datos.dni_chofer,L^.datos.cod_viaje);
        L:=L^.sig;
    end;
end;
//___________________________________________________________
var
    L:lista;
    VC:vector_camiones;
begin
    L := nil;
    //CargarCamiones(VC); //Se dispone
    CargarLista(L);
    RecorrerLista(L,VC);
end.
