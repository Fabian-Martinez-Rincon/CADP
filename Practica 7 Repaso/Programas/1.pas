{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse. Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
}
program JugamosConListas;
type
    str20=string[20];
    genero=1..5;
    persona=record
        dni:integer;
        apellido:str20;
        nombre:str20;
        edad:integer;
        codigo:genero;

    end;
    
    lista = ^nodo;
    nodo = record
        datos : persona;
        sig : lista;
    end;
//______________________________________________________________________
procedure LeerPersona(var Pf:persona);
begin
    with Pf do
    begin
        writeln('DNI:'); ReadLn(dni);
        writeln('APELLIDO:'); ReadLn(apellido);
        writeln('NOMBRE:'); ReadLn(nombre);
        writeln('EDAD:'); ReadLn(edad);
        writeln('CODIGO:'); ReadLn(codigo);
    end;
    
end;
//______________________________________________________________________
procedure DniPares (dni:Integer;var ContPares:integer);
var 
    par:integer;
    impar:integer;
    dig:integer;
begin
    par:=0;
    impar:=0;
    while (dni <> 0) do
    begin
        dig:= DNI mod 10;
        if((dig mod 2)= 0) then
            begin
                par:=par+1;
            end
        else
            begin
                impar:= impar +1;
            end;
        dni := dni DIV 10;
    end;
    if (impar<par)then
        begin
            ContPares:=ContPares+1;
        end
end;
//______________________________________________________________________
procedure CargarLista (var Lf:lista);
var
    P:persona;
begin
    LeerPersona(P);
    repeat
        LeerPersona(P);
    until   (P.dni <> 3);//33555444 No me deja leer numeros de este tamaño un integer
end;
//______________________________________________________________________
procedure RecorrerLista (L:lista);
var 
    ContPares:integer;
begin
    ContPares:=0;
    while L <> Nil do
    begin
        DniPares(L^.datos.dni,ContPares);
        L:=L^.sig;
    end;
end;
//______________________________________________________________________

var
    L:lista;
begin
    L := nil;
    CargarLista(L);
    RecorrerLista(L);
    
end.
