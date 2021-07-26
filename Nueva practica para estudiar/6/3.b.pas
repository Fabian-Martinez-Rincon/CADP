{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
//_________________________________________________    
procedure armarNodo(var pri,ult: lista; per: integer);
var  nue : lista;

begin 
 new (nue);
 nue^.num:= per;
 nue^.sig := NIL;
 if pri <> Nil then 
    begin
      ult^.sig := nue;
    end 
                 
               else
               begin
                 pri := nue;
               end; 
                 
 ult := nue;

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
var
    pri,ult : lista;
    valor : integer;
    numero:integer;
begin
    numero:=2;
    pri := nil;
    ult:=Nil;
    writeln('‘Ingrese un numero’');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri,ult, valor);
        writeln('‘Ingrese un numero’');
        read(valor);
    end;
    imprimirLista(pri);
    {
        a) El programa lo unico que hace es cargar la lista, en orden contrario al que fueron ingresados, ya 
        que el ultimo se coloca siempre.
        b) 48 13 21 10
        c) Ya esta
        d) 
    }
end.