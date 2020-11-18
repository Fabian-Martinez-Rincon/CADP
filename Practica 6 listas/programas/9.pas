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

//______________________________________________________________________
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

//______________________________________________________________________
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num) ;
        ListaF:= ListaF^.sig
    end;
end;
//______________________________________________________________________
function EstaOrdenada (pri:lista):boolean;
var 
    anterior:integer;
    siguiente:integer;
    cosa:lista;
    ORDEN:Boolean;
begin
    ORDEN:=False;
    cosa:=nil;
    anterior:=pri^.num;
    cosa:=pri^.sig;
    siguiente:=cosa^.num;
    while (pri <> nil) and (ORDEN=False)do
    begin
        if (anterior>siguiente)then
        begin
            ORDEN:=true;
        end;
        anterior:=pri^.num;
        cosa:=pri^.sig;
        siguiente:=cosa^.num;
        pri:=pri^.sig;  
    end;
    EstaOrdenada:=ORDEN;
end;
//______________________________________________________________________
var
    pri : lista;
    valor : integer;
    ordenada:boolean;
begin
    ordenada:=false;
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
    ordenada:=EstaOrdenada(pri);
    WriteLn(ordenada);
end.
