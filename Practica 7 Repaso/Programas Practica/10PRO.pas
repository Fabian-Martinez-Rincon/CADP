{
10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales
}
program repasoEj10;
    const 
        dimF=20;
    type
        cadena = string [40];
        rango=1..dimF;

        cult = record
            tipo:cadena;
            hectareas:integer;
            meses:integer;
        end;
        vectorCultivos= array [rango] of cult;
        empresa = record
            codigo:integer;
            nombre:cadena;
            estOpriv:cadena; //estatal:=false y privado = true
            nomCiudad:cadena;
            cultivos:vectorCultivos;
        end;
        lista = ^nodo;
        nodo = record
            datos:empresa;
            sig:lista;
        end;
//__________________________________
procedure LeerCul(var c:cult;var contador:rango);
begin
    readln(c.hectareas);
        if  (c.hectareas <> 0) then
        begin
            readln(c.tipo);
            readln(c.meses);
            contador:=contador+1
        end;
end;
//__________________________________
procedure LeerCultivos(var VC:vectorCultivos);
var
    contador:rango;
begin
    contador:=1;
    LeerCul(VC[contador],contador);
    while (VC[contador].hectareas <> 0) and (contador < dimF) do
    begin
        
        LeerCul(VC[contador],contador);
    end;
end;
//__________________________________
procedure LeerEmpresa(var E:empresa);
begin
    
    readln(E.codigo);
    if (E.codigo <> -1 ) then
    begin
        readln(E.nombre);
        readln(E.estOpriv);
        readln(E.nomCiudad);
        LeerCultivos(E.cultivos);
    end;
end;
//__________________________________
procedure agregarAdelante(var L:lista;E:empresa);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=E;
    nue^.sig:=L;
    L:=nue;
end;
//__________________________________
procedure LeerYAlmacenar(var L:lista);
var 
    E:empresa;
begin
    LeerEmpresa(E);
    while E.codigo <> -1 do
    begin
        agregarAdelante(L,E);
        LeerEmpresa(E);
    end;
    
end;
//__________________________________
procedure cumpleTringo(vc:vectorCultivos;var trigo:boolean);
var
    i:rango;
begin
    i:=1;
    trigo:=false;
    while (i<dimF) and (trigo=false) do
    begin
        if (vc[i].tipo = 'trigo') then
        begin
            trigo:=true;
        end;
        i:=i+1; 
    end;
    
end;
//__________________________________
function cumpleCeros(codigo:integer):boolean;
var
    ceros:integer;
    dig:integer;
begin
    ceros:=0;
    while (codigo <> 0) and (ceros <= 2) do
    begin
        dig:=codigo mod 10;
        if (dig = 0) then
        begin
            ceros:=ceros+1;  
        end;
        codigo:=codigo div 10;
    end;
    if (ceros >= 2) then
    begin
        cumpleCeros:=true;  
    end
    else
        begin
            cumpleCeros:=false;
        end;
end;
//__________________________________
procedure maxMaiz(vc:vectorCultivos;empresaMaiz,maximo);
var
    maximo:integer;
    i:integer;
begin
    maximo:=-1;
    for i:=1 to dimF do
    begin

    end;
end;
//__________________________________
procedure RecorrerLista(L:lista);
var
    trigo:boolean;
    PoseeCeros:boolean;
    empresaMaiz:cadena;
    maxTiempo:integer;
    nombreEmpresa:cadena;
    maximo:integer;
begin
    maxMaiz:=-1;
    while L <> nil do
    begin
        maximo:=-1;
        cumpleTringo(L^.datos.cultivos,trigo);
        PoseeCeros:= cumpleCeros(L^.datos.codigo);
        if (L^.datos.nomCiudad = 'San Miguel del Monte') and (trigo) and (PoseeCeros) then
        begin
            writeln(L^.datos.nombre);
        end;
        maxMaiz(L^.datos.cultivos,empresaMaiz,maximo);
        if (maximo>maxMaiz)then
        begin
            nombreEmpresa:=L^.datos.nombreEmpresa;
        end;
        L:=L^.sig;
    end;
end;
//__________________________________
var
    L:lista;
begin
    LeerYAlmacenar(L);
    RecorrerLista(L);
end.