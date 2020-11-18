{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse
}
program JugamosConListas;
type
    cliente=record
        dni:integer;
        numero:integer;
    end;
    
    listaEspera = ^nodo;
    nodo = record
        datos : cliente;
        sig : lista;
    end;

//______________________________________________________________________
procedure RecibirCliente (dni:integer; var L:listaEspera);
begin
  
end;
//______________________________________________________________________
procedure CargarLista(var ListaF:listaEspera);
var 
    c:cliente;
    numero:integer;
begin
    numero:=1;
    read(c.dni);
    while (c.dni <> 0) do 
        begin
            RecibirCliente(c.dni,ListaF);
            numero:=numero+1;
        end;
    
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
var
    L : listaEspera;
    
begin
    L := nil;
    CargarLista(L);
    
    
end.
