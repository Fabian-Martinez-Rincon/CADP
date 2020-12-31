{
10. Una compañía de venta de insumos agrícolas desea procesar la información de las
empresas a las que les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de meses que lleva el ciclo de
cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa se leen todos sus cultivos, hasta que se ingrese un
cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales
}
program diez;
const dimF=20;
type
    cultivo = record
        tipCultivo:integer;
        cantHec:integer;
        cantMeses:integer;
    end;
    vectorCultivos= array [1..dimF] of cultivo; 
    cadena20=string[40];
    empresa=record
        codigo:integer;
        nombre:cadena20;
        estOpriv:cadena20;
        nombreCiudad:cadena20;
        cult:vectorCultivos;
    end;
    lista=^nodo;
    nodo=record
        datos:empresa;
        sig:lista;
    end;
//______________________________________________________________
procedure LeerCultivo(var C:cultivo);
begin
    ReadLn(C.tipCultivo);
    ReadLn(c.cantHec);
    if (C.cantHec <> 0 ) then
    begin
        ReadLn(C.cantMeses);  
    end;
end;
//______________________________________________________________
procedure LeerVectorCultivos(var vc:vectorCultivos);
var
    dimL:integer;
    C:cultivo;
begin
    dimL:=0;
    LeerCultivo(C);
    while (C.cantHec <> 0) and (dimL<dimF) do
    begin
        dimL:=dimL+1;
        vc[dimL].tipCultivo:=C.tipCultivo;
        vc[dimL].cantHec:=C.cantHec;
        vc[dimL].cantMeses:=C.cantMeses;
        LeerCultivo(C);
    end;
end;
//______________________________________________________________
procedure LeerEmpresa(var E:empresa);
begin
    ReadLn(E.codigo);
    if E.codigo <> -1 then
    begin
        ReadLn(E.nombre);
        ReadLn(E.estOpriv);
        ReadLn(E.nombreCiudad);
        LeerVectorCultivos(E.cult);
    end;
end;
//______________________________________________________________
procedure agregarAdelante (var L:lista; E: empresa);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=E;
    nue^.sig:=L;
    L:=nue;
end;
//______________________________________________________________
procedure CargarEmpresa(var L:lista);
var 
    E:empresa;
begin
    LeerEmpresa(E);
    while (E.codigo <> -1) do
    begin
        agregarAdelante(L,E);
        LeerEmpresa(E);
    end;
end;
//______________________________________________________________
function pares(codigo:integer):Boolean;
var
    dig:integer;
    par:integer;    
begin
    par:=0;
    while (codigo <> 0) and (par >=2) do
    begin
        dig:=codigo mod 10;
        if (dig = 0) then
        begin
            par:=par+1;
        end;
    end;
    if par>=2 then
    begin
        pares:=true;
    end
    else
    begin
      pares:=false;
    end;
        
end;
//______________________________________________________________
procedure cultivanTrigo(vc:vectorCultivos;var trigo:Boolean);
begin
  
end;
//______________________________________________________________
procedure RecorrerLista(L:lista);
var 
    cumple:Boolean;
    trigo:boolean;
begin
    trigo:=False;
    cumple:=false;
    cultivanTrigo(L^.datos.cult,trigo);
    while L <> Nil do
    begin
        cumple:=pares(L^.datos.codigo);
        if (L^.datos.nombreCiudad = 'San Miguel del Monte') and () and (cumple=True)then
        begin
            WriteLn(L^.datos.nombre);
        end;
        L:=L^.sig;
    end;
end;
//______________________________________________________________
var
    L:lista;
begin
    L:=Nil;
    CargarEmpresa(L);
    RecorrerLista(L);
end.