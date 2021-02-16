{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la estructura.

}
program JugamosConListas;
type
    str20=string[20];
    cliente=record
        dni:integer;
        apellido:str20;
        nombre:str20;
        codPoliza:1..6;
        montoBasico:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos : cliente;
        sig : lista;
    end;
    vectorMontos = array [1..6] of Real;
//__________________________________________________________________
procedure InformarA(Lf:lista;Vf:vectorMontos);
var
    monto_total:real;
begin
    WriteLn('DNI:', Lf^.datos.dni);
    WriteLn('Apellido: ', Lf^.datos.apellido);
    WriteLn('Nombre: ',Lf^.datos.nombre);
    monto_total:=Vf[Lf^.datos.codPoliza]+Lf^.datos.montoBasico;
    WriteLn('Monto Total',monto_total);
end;
//__________________________________________________________________
procedure InformarB(L:lista);
var
    dig:integer;
    Contnueve:integer;
    Cumple:boolean;
begin
    Cumple:=false;
    Contnueve:=0;
    while (L^.datos.dni <> 0) and (Cumple <> True) do
    begin
        dig:=L^.datos.dni mod 10;
        if(dig = 9)then
        begin
            Contnueve:=Contnueve+1;
        end;
        if (Contnueve=2)then
        begin
            Cumple:=true;
        end;
        dig:=dig div 10;
    end;

end;
//__________________________________________________________________
procedure RecorrerLista(L:lista;V:vectorMontos);

begin
    while L<>nil do
    begin
        InformarA(L,V);
        InformarB(L);
        L:=L^.sig; 
    end;
end;
//__________________________________________________________________
procedure EliminarCliente (var L:lista;codigo:integer;var exito:Boolean);
var 
    ant, act:lista;
begin
    exito:=False;
    act:=L;
    while (act <> Nil) and (act^.datos.codPoliza<>codigo) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    
    exito:=true;
    if (act=L)then
        begin
            L:=act^.sig;
        end
    else
        begin
            ant^.sig:=act^.sig; 
        end;
        Dispose(act);
    
end;
//__________________________________________________________________
var
    L:lista;
    V:vectorMontos;
    codigo:integer;
    exito:Boolean;
begin
    L := nil;
    //CargarVectorMontos(V);
    //CargarLista(L);
    RecorrerLista(L,V);
    read (codigo);
    EliminarCliente(L,codigo,exito);
end.
