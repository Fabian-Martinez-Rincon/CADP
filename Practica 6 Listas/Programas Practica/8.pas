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
var
    pri : lista;
    valor : integer;
//______________________________________________________________________
procedure armarNodo(var L: lista; v: integer);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.num := v;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.num < v) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;
//______________________________________________________________________
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num) ;
        ListaF:= ListaF^.sig
    end;
end;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do 
    begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirNodo(pri);
end.
