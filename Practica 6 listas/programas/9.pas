{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso
contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista
podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los elementos de la lista L mayores que A y menores que B.
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
    
    ORDEN:Boolean;
    mayor:integer;
begin
    ORDEN:=True;
    mayor:=-1; 
    while (pri <> nil) and (ORDEN=True)do
    begin
        if (pri^.num>mayor)then
        begin
            mayor:=pri^.num;
            WriteLN('bien');
        end
        else
        begin
            ORDEN:=False;
            WriteLN('NO ESTA ORDENADA');  
        end;
        pri:=pri^.sig;  
    end;
    EstaOrdenada:=ORDEN;
end;
//______________________________________________________________________
Procedure Eliminar (ElementoEliminar:integer;var pri:lista);
var ant, act: lista;
begin 
    act := pri;
  {Recorro mientras no se termine la lista y no encuentre el elemento}
    while  (act <> NIL)  and (act^.num <> ElementoEliminar) do 
    begin
        ant := act;
        act := act^.sig
    end;   
    if (act <> NIL) then
        begin
            if (act = pri) then
            begin 
                pri := act^.sig;
            end
            else
            begin 
             ant^.sig:= act^.sig;
            end;
            dispose (act);
        end;
 end;

//______________________________________________________________________
procedure Sublista (L:lista;A:integer;B:integer);
VAR
    nuevalista:lista;
begin
    nuevalista:=nil;
    while (L <>nil) do
    begin
        if (L^.num > A ) AND (L^.num < B) then
            begin
                armarNodo(nuevalista, L^.num);
                Writeln('Cumple ',L^.num);     
            end;
        L:=L^.sig;
    end;
    writeln('Cosa');
    imprimirNodo(nuevalista);
end;
//______________________________________________________________________
var
    pri : lista;
    valor : integer;
    ordenada:boolean;
    ElementoEliminar:integer;
    A:integer;
    B:integer;
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
    //A
    ordenada:=EstaOrdenada(pri);
    WriteLn(ordenada);
    //B
    //writeln('Ingrese el nombre que quiere eliminar');
    //ReadLn(ElementoEliminar);
    //Eliminar(ElementoEliminar,pri);
    imprimirNodo(pri);
    //C
    Write('Ingrese A: ');
    ReadLn(A);
    Write('Ingrese B: ');
    ReadLn(B);
    Sublista(pri,A,B);
end.
