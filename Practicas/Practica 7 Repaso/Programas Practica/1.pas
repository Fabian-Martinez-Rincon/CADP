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
    vector_contador = array [genero] of integer;
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
procedure armarNodo(var L: lista; v: persona);
var
    aux : lista;
begin
    new(aux);
    aux^.datos := v;
    aux^.sig := L;
    L := aux;
end;
//______________________________________________________________________
procedure CargarLista (var Lf:lista);
var
    P:persona;
begin
    LeerPersona(P);
    repeat
        armarNodo(Lf,P);
        LeerPersona(P);
    until   (P.dni <> 3);//33555444 No me deja leer numeros de este tamaño un integer
end;
//______________________________________________________________________
procedure inicializarVector (var VC:vector_contador);
var 
    i:integer;
begin
    for i:=1 to 5 do
    begin
        VC[i]:=0;
    end;
end;
//______________________________________________________________________
procedure DosMax(Vc:vector_contador;var codmax1,codmax2:genero;var Vmax1,Vmax2:integer);
var
    i:integer;
begin
    for i:=1 to 5 do
    begin
        if Vc[i]>Vmax1 then
            begin
                Vmax2:=Vmax1;
                codmax2:=codmax1;
                Vmax1:=Vc[i];
                codmax1:=i;
            end
        else
            begin
                if (Vc[i]>Vmax2)then
                    begin
                        Vmax2:=Vc[i];
                        codmax2:=i;  
                    end;
                    
            end;
    end;
end;
//______________________________________________________________________
procedure RecorrerLista (L:lista);
var 
    codmax1:genero;
    codmax2:genero;
    ContPares:integer;
    Vcontador:vector_contador;
    tipo:genero;
    valorMax1:integer;
    valorMax2:integer;
begin
    valorMax1:=-1;
    valorMax2:=-1;
    inicializarVector(Vcontador);
    ContPares:=0;
    while L <> Nil do
    begin
        tipo:=L^.datos.codigo;
        DniPares(L^.datos.dni,ContPares);
        Vcontador[tipo]:=Vcontador[tipo]+1;
        L:=L^.sig;
        DosMax(Vcontador,codmax1,codmax2,valorMax1,valorMax2);
    end;
    WriteLn('La cantidad de personas cuyo DNI contiene mas digitos pares que impares: ', ContPares);
    WriteLn('El codigo mas elegido es: ', codmax1);
    WriteLn('El segundo codigo mas elegido es: ', codmax2);
end;
//______________________________________________________________________
procedure BorrarElemento (var L:lista;dni:integer;var exito:Boolean);
var 
    ant, act:lista;
begin
    exito:=False;
    act:=L;
    while (act <> Nil) and (act^.datos.dni<>dni) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> nil) then
    begin
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
end;
//______________________________________________________________________

var
    L:lista;
    exito:Boolean;
    dni:integer;
begin
    L := nil;
    CargarLista(L);
    RecorrerLista(L);
    readln(dni);
    BorrarElemento(L,dni,exito);
end.
