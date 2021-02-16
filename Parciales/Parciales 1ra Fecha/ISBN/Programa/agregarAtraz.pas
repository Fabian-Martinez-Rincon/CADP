program practica;
type
    lista=^nodo;
    nodo=record
        datos:integer;
        sig:lista;
    end;
//______________________________________________________
procedure imprimirLista (L:lista);
begin
    while L <> nil do
    begin
        Writeln('Cosa: ',L^.datos);
        L:=L^.sig;  
    end;
end;
//______________________________________________________

//______________________________________________________
procedure cargarL(var L:lista);
var
    nro:integer;
begin
    WriteLn('nro: ');ReadLn(nro);
    while nro <> -1 do
    begin
        agregarAtras(L,nro);
        WriteLn('nro: ');ReadLn(nro);
    end;
end;
//______________________________________________________
var
    l:lista;
begin
    cargarL(L);
    imprimirLista(L);
end.
