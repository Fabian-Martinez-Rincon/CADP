program CADPParcial;
type
    cadena=string[40];
    pelicula = record
        cod:integer;
        nombre:cadena;
        genero:1..8;
        puntProm:real;
    end;
    listaPeliculas = ^nodoP;
    nodoP=record
        datosP:pelicula;
        sigP:listaPeliculas;
    end;
    critica=record
        dni:integer;
        apellYNombre:cadena;
        codPel:integer;
        puntuaje:real;
    end;
    lista=^nodo;
    nodo = record
        dato:critica;
        sig:lista;
    end;
    vectorCriticas=array [1..8] of real;
//___________________________________________________________
procedure LeerC(var C:critica);
begin
    writeln('DNI: ');               ReadLn(C.dni);
    if C.dni <> -1 then
    begin
        writeln('Apellido y Nombre ');  ReadLn(C.apellYNombre);
        writeln('Codigo Pelicula: ');   ReadLn(C.codPel);
        writeln('Puntuaje: ');          ReadLn(C.puntuaje);
    end;
end;
//___________________________________________________________
procedure insertar(var L:lista;C:critica);
var
    act,ant,nue:lista;
begin
    new(nue);
    nue^.dato:=C;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.dato.codPel< C.codPel) do
    begin
        ant:=act;
        act:=act^.sig;
    end; 
    if (act = ant) then
    begin
        L:=nue;
    end
    else
        begin
            ant^.sig:=nue;
        end;
    nue^.sig:=act;
end;
//___________________________________________________________
procedure imprimir(L:lista);
begin
    while L <> nil do
    begin
        WriteLn('DNI: ',L^.dato.dni);
        WriteLn('Apellido y nombre: ',L^.dato.apellYNombre);
        WriteLn('Cod Peli: ',L^.dato.codPel);
        WriteLn('Puntaje: ',L^.dato.puntuaje);
        L:=L^.sig;
    end;
end;
//___________________________________________________________
procedure inicializarVC(var VC:vectorCriticas);
var
    i:integer;
begin
    for i:=1 to 8 do
    begin
        VC[i]:=0;
    end;
end;

//___________________________________________________________
procedure mayor(VC:vectorCriticas;var max:integer);
var
    i:integer;
    mayorNro:real;
begin
    mayorNro:=-1;
    for i:=1 to 8 do
    begin
        if (VC[i]>mayorNro)then
        begin
            mayorNro:=VC[i];
            max:=i;
        end;
    end;
end;
//___________________________________________________________
function descomponerDNI(dni:integer):Boolean;
var
    dig:integer;
    par:integer;
    impar:integer;
begin
    par:=0;
    impar:=0;
    while dni <> 0 do
    begin
        dig:=dni mod 10;
        if ((dig mod 2) = 0) then
        begin
            par:=par+1;
        end
        else
            begin
                impar:=impar+1;
            end;
        dni:=dni div 10;
    end; 
    if (par=impar) then
    begin
        descomponerDNI:=true;
    end
    else
        begin
            descomponerDNI:=false;
        end;
end;
//___________________________________________________________
procedure ActualizarLP(var LP:listaPeliculas);
var
    C:critica;
    L:lista;
    totalCriticas:real;
    cantCriticas:integer;
    promedio:real;
    VC:vectorCriticas;
    codMayor:integer;
    cumplePeI:Boolean;

begin
    codMayor:=-1;
    inicializarVC(VC);
    promedio:=0;
    cantCriticas:=0;
    totalCriticas:=0;
    L:=Nil;
    LeerC(C);
    while C.dni <> -1 do
    begin
        totalCriticas:=totalCriticas+C.puntuaje;
        VC[C.codPel]:=VC[C.codPel]+C.puntuaje;
        cantCriticas:=cantCriticas+1;
        cumplePeI:=descomponerDNI(C.dni);
        if (cumplePeI)then
            begin
              writeln('El apellido y nombre es: ',C.apellYNombre);
            end;
        insertar(L,C);
        LeerC(C);
        
    end;
    mayor(VC,codMayor);//B
    promedio:=totalCriticas/cantCriticas;
    imprimir(L);
end;
//___________________________________________________________
procedure eliminar (var LP:listaPeliculas;codigo:integer;exito:Boolean);
var
    ant,act:listaPeliculas;
begin
    exito:=False;
    act:=LP;
    while (act <> nil) and (act^.datosP.cod<>codigo) do
    begin
        ant:=act;
        act:=act^.sigP;
    end;
    if (act <> Nil) then
    begin
        exito:=true;
        if (act=LP) then
        begin
            LP:=act^.sigP;
        end
        else
            begin
              ant^.sigP:=act^.sigP;
            end;
        Dispose(act);
    end;
end;
//___________________________________________________________
var
    LP:listaPeliculas;
    codigo:integer;
    exito:Boolean;
begin
    LP:=Nil;
    //CargarListaPeliculas(LP);//Se dipone
    ActualizarLP(LP);
    ReadLn(codigo);
    eliminar(LP,codigo,exito);
end.