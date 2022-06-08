{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número (que
es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número, en cuyo caso
sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes en
espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna el
número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista de
espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos los
clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por vez. El
ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}
type
    cliente = record
        dni:integer;
        numero:integer;
    end;
    listaEspera=^nodo;
    nodo = record
        dato:cliente;
        sig:listaEspera;
    end;
//________________________________________________
procedure RecibirCliente(var l:listaEspera;dni:integer);
var
    act,nue:listaEspera;
begin   
    writeln('Probando');
    new(nue);
    nue^.dato.dni:=dni;
    nue^.dato.numero:=nue^.dato.numero + 1; // Asigno un numero al cliente
    nue^.sig:=nil;
    if (l <> Nil) then
    begin
        act := l;
        while act^.sig <> nil do
            act:=act^.sig;
        act^.sig:=nue;
    end
    else
        l:=nue;


end;
//________________________________________________
{procedure AtenderCliente(var l:listaEspera;var c:cliente);
var
    act,ant:listaEspera;
begin
    act:=l;
    c.dni:=l^.dato.dni;
    c.numero:=l^.dato.numero;
    while (act <> nil) and (act^.dato.numero <> c.numero) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if act <> Nil then
    begin
        if (act = l) then
        begin
            l:=act^.sig;
        end
        else
            act^.sig:=act^.sig;
        Dispose(act);
    end;

end;}

//________________________________________________
procedure cargarListaEspera(var l:listaEspera);
var
    c:cliente;
begin
    WriteLn('Dni: '); ReadLn(c.dni);
    //l^.dato.numero:=0;
    writeln('Probandp');
    while (c.dni <> 0) do
    begin
        writeln('Probandp');
        RecibirCliente(l,c.dni);
        WriteLn('Dni: '); ReadLn(c.dni);
    end;
end;
//________________________________________________
procedure ImprimirLista(l:listaEspera);
var
    contador:integer;
begin
    contador:=0;
    while l <> nil do
    begin
        contador:=contador+1;
        WriteLn('Cliente: ',contador);
        WriteLn('Dni: ',l^.dato.dni);
        WriteLn('Numero: ',l^.dato.numero);
        writeln('');
        l:=l^.sig;
    end;
end;
//________________________________________________
var 
    l:listaEspera;
begin
    l:=Nil;
    cargarListaEspera(l);
    ImprimirLista(l);
end.