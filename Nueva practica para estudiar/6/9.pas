{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso
contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista
podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los
elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
descendente.
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
function EstaOrdenada(pri:lista):Boolean;
var
    cumple:Boolean;
    numero:integer;    
begin
    numero:=-1;
    cumple:=true;
    while ((pri <> nil) and (cumple)) do
    begin
        if (pri^.num>numero) then
        begin
            numero:=pri^.num;
        end
            else
                cumple:=False;
        pri:=pri^.sig;
    end;

    EstaOrdenada:=cumple;
end;
//_________________________________________________
procedure Eliminar (var L:lista;numero:integer);
begin
    while  do
  
end;
//_________________________________________________
var
    pri : lista;
    valor : integer;
    numero:integer;
    me:Boolean;
begin
    me:=False;
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
    me:=EstaOrdenada(pri);
    WriteLn(me);
    Eliminar(pri,numero);

end.