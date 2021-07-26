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
//_________________________________________________    
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
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
procedure maximo_elemento(pri:lista;var maximo:integer);
begin
    while pri <> nil do
    begin
        if (pri^.num > maximo) then
        begin
            maximo:=pri^.num
        end;
        pri:=pri^.sig;
    end;
end;
//_________________________________________________
procedure minimo_elemento(pri:lista;var maximo:integer);
begin
    while pri <> nil do
    begin
        if (pri^.num < maximo) then
        begin
            maximo:=pri^.num
        end;
        pri:=pri^.sig;
    end;
end;
//_________________________________________________
function function_Multiplos(pri:lista;A:Integer):integer;
var 
    contador:integer;
begin
    contador:=0;
    while pri <> nil do
    begin
        if ((pri^.num mod A) = 0 ) then
        begin
            contador:=contador+1;
        end;
        pri:=pri^.sig;
    end;
    function_Multiplos:=contador;
end;
//_________________________________________________
var
    pri : lista;
    valor : integer;
    numero:integer;
    maximo:integer;
    minimo:integer;
    cont_multiplos:integer;
    A:integer;
begin
    A:=1;
    cont_multiplos:=0;
    maximo:=-1;
    minimo:=999;
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
    maximo_elemento(pri,maximo);
    WriteLn('Maximo: ',maximo);
    minimo_elemento(pri,minimo);
    WriteLn('Minimo: ',minimo);
    cont_multiplos:=function_Multiplos(pri,A);
    WriteLn('Multiplos: ', cont_multiplos);
end.