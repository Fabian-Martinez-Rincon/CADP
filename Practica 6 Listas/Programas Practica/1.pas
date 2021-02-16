{a. Indicar qué hace el programa. Ingresa un nombre adelante
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
48 13 21 10
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.}
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
end;
//________________________________________________________________________________________________________
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

//________________________________________________________________________________________________________
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num) ;
        ListaF:= ListaF^.sig
    end;
end;
//________________________________________________________________________________________________________
procedure imprimirSuma(ListaF:lista;valorF:integer);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num+valorF) ;
        ListaF:= ListaF^.sig
    end;
end;
//________________________________________________________________________________________________________
var
    pri : lista;
    valor : integer;
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
    //c
    imprimirNodo(pri);
    //d
    ReadLn(valor);
    imprimirSuma(pri,valor);
end.
