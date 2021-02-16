{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2018. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de viaje.


}
program JugamosConListas;
type
    str20=string[20];
    viaje=record
        num_viaje:integer;
        cod_auto:integer;
        destino:str20;
        klrecorrido:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos : viaje;
        sig : lista;
    end;
//__________________________________________________________
procedure actualizarMaximos(L:lista;codmax1,codmax2:integer;var klmax1,klmax2:integer);
begin
    if(L^.datos.klrecorrido>klmax1)then
    begin
        klmax2:=klmax1;
        codmax2:=codmax1;
        klmax1:=L^.datos.klrecorrido;
        codmax1:=L^.datos.cod_auto;
    end
    else
        begin
            if (L^.datos.klrecorrido> klmax2)then
            begin
                klmax2:=L^.datos.klrecorrido;
                codmax2:=L^.datos.cod_auto;
            end;  
        end;
end;
//__________________________________________________________
procedure InsertarOrdenado (var ListaNueva:lista; V:viaje);
var 
    ant,nue,act:lista;
begin
    new(nue);
    nue^.datos:=V;
    act:=ListaNueva;
    ant:=ListaNueva;
    while (act <>nil) and (act^.datos.num_viaje<V.num_viaje) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if(ant = act)then
    begin
        ListaNueva:=nue;
    end
    else
    begin
        ant^.sig:=nue;
    end;    
end;
//__________________________________________________________
procedure RecorrerLista (var L:lista);
var
    cantKM:integer;
    act:integer;
    codmax1:integer;
    codmax2:integer;
    klmax1:integer;
    klmax2:integer;
    ListaNueva:lista;
begin
    ListaNueva:=nil;
    codmax1:=-1;
    codmax2:=-1;
    klmax1:=-1;
    klmax2:=-1;
    while L <> Nil do
    begin
        cantKM:=0;
        act:=L^.datos.cod_auto;
        while (L<>Nil) and (act=L^.datos.cod_auto) do
        begin
            if(L^.datos.klrecorrido>5)then
            begin
                InsertarOrdenado(ListaNueva,L^.datos);
            end;
            cantKM:=cantKM+L^.datos.klrecorrido;
            L:=L^.sig;  
        end;
        actualizarMaximos(L,codmax1,codmax2,klmax1,klmax2);
    end;
end;
//__________________________________________________________
var
    L:lista;
begin
    L := nil;
    //CargarLista(L); //Se dispone
    RecorrerLista(L);
end.
