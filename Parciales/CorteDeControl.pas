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
    ant,act,nue:Lista;
begin
    new(nue);
    nue^.datos:=numero;
    act:=L;
    ant:=L;
    while (act <> Nil) and (act^.datos<numero)do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
    begin
        L:=nue;
    end
    else 
        begin
            ant^.sig:=nue;
        end;
    nue^.sig:=act;
end;
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
procedure ImprimirLista (L:Lista);
begin
    while L <> nil do
    begin
        WriteLn('nro: ',L^.datos);
        L:=L^.sig;
    end;
end;
//__________________________________________
procedure Problemas(L:Lista);
var
    contador:integer;
    actual:integer;
begin
    while L <> nil do
    begin
        actual:=L^.datos;
        contador:=0;
        while (L <> nil)and (actual=L^.datos) do
        begin
            contador:=contador+1;
            L:=L^.sig;
        end;
        WriteLn('El numero:: ',actual,'Nro: ',contador );
    end;
end;
//__________________________________________
var
    L:Lista;
begin
    L:=Nil;
    CargarLista(L);
    Problemas(L);
    //ImprimirLista(L);
end.