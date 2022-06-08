{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista queden
ordenados de manera ascendente (insertar ordenado).
}
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
//_________________________________________________    
procedure armarNodo(var L: lista; v: integer);
var
    uno,dos,tres:lista;
begin
    new(uno);
    uno^.num:=v;
    uno^.sig:=nil;
    dos:=L;
    tres:=L;
    while (dos <> Nil) and (dos^.num > v)  do
    begin
        tres:=dos;
        dos:=dos^.sig;
    end;

    if (dos = tres) then
    begin
        L:=uno;
    end
    else
        tres^.sig:=uno;    

    uno^.sig:=dos;
end;

//_________________________________________________
procedure imprimirLista(L:lista);
begin
    while (L<>nil) do
    begin
        WriteLn(L^.num);
        L:=L^.sig;
    end;
end;
//_________________________________________________
procedure aumentard(var pri:lista;numero:integer);
begin
    while (pri <> nil) do
    begin
        
        pri^.num:=pri^.num+numero;
        WriteLn(pri^.num);
        pri:=pri^.sig;
    end;
end;
//_________________________________________________
var
    pri : lista;
    valor : integer;
    numero:integer;
begin
    numero:=2;
    pri := nil;
    writeln('‘Ingrese un numero’');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('‘Ingrese un numero’');
        read(valor);
    end;
    imprimirLista(pri);
    //aumentard(pri,numero);
    {
        a) El programa lo unico que hace es cargar la lista, en orden contrario al que fueron ingresados, ya 
        que el ultimo se coloca siempre.
        b) 48 13 21 10
        c) Ya esta
        d) 
    }
end.