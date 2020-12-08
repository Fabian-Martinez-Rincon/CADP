program CADPParcial;
type
    numero=integer;
    Lista=^nodo;
    nodo=record
        datos:numero;
        sig:Lista;
    end;
//__________________________________________
procedure InsertarOrdenado(var L:Lista;numero:integer);
var
    ant,act,nue:Lista
//__________________________________________
procedure CargarLista(var L:Lista);
var
    numero:integer;
begin
    writeln('Nro: ');ReadLn(numero);
    while numero <> -1 do
    begin
        InsertarOrdenado(L,numero);
        writeln('Nro: ');ReadLn(numero);  
    end;
    
end;
//__________________________________________
var
    L:Lista;
begin
    L:=Nil;
    CargarLista(L);
end.