{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la lista que
son múltiplos de A}
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
        ListaF:= ListaF^.sig;
    end;
end;
//________________________________________________________________________________________________________
procedure MaximoLista(ListaF:lista;var maximoF:integer);
begin
    while (ListaF <>Nil) do
    begin
        if(ListaF^.num>maximoF)then
        begin
            maximoF:=ListaF^.num;
        end;
        ListaF:=ListaF^.sig  
    end;
end;
//________________________________________________________________________________________________________
procedure MinimoLista(ListaF:lista;var minimoF:integer);
begin
    while (ListaF <>Nil) do
    begin
        if(ListaF^.num<minimoF)then
        begin
            minimoF:=ListaF^.num;
        end;
        ListaF:=ListaF^.sig  
    end;
end;
//________________________________________________________________________________________________________

procedure MultiplosA(ListaF:lista;A:integer;var cont_multiplos:integer);
begin
    while (ListaF <>Nil) do
    begin
        if((ListaF^.num mod A) = 0)then
        begin
            cont_multiplos:=cont_multiplos+1;
        end;
        ListaF:=ListaF^.sig  
    end;
end;
//________________________________________________________________________________________________________
var
    pri : lista;
    valor : integer;
    maximo:integer;
    minimo:integer;
    A:integer;
    Cant_multiplos:integer;
begin
    Cant_multiplos:=0;
    minimo:=9999;
    pri := nil;
    maximo:=-1;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do
       begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    //C
    writeLn('C________');
    imprimirNodo(pri);
    //D
    writeLn('D________');
    ReadLn(valor);
    imprimirSuma(pri,valor);
    //3.A
    writeLn('3.A)________');
    MaximoLista(pri,maximo);
    WriteLn('El numero maximo de la lista es: ', maximo);
    //3.B
    MinimoLista(pri,minimo);
    WriteLn('El numero minimo de la lista es: ', minimo);
    //3.C
    Readln(A);
    MultiplosA(pri,A,Cant_multiplos);
    WriteLn('La cantidad de multiplos de A son: ', Cant_multiplos);
end.
