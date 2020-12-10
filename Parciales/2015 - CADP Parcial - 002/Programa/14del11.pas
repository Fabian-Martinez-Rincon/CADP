program Parcial;
const 
    dimF = 32;
type    
    codigo = 1..4;
    cadena =  string [40];
    info = record
        nombre:cadena;
        nota:integer;
    end;
    aprobadas=array [1..dimF] of info;
    alumno = record
        dni:integer;
        apellido:cadena;
        nombre:cadena;
        anioIngreso:integer;
        carrera:codigo;
        analitico:aprobadas;
    end;
    vector_contador = array [codigo] of integer;
    lista = ^nodo;
    nodo = record
        datos : alumno;
        sig : lista;
    end;
//____________________________________________________________________
procedure inicializarVector(var vc:vector_contador);
var
    i:codigo;
begin
    for i:=1 to 4 do
    begin
        vc[i]:=0;
    end;
end;
//____________________________________________________________________
procedure LeerAlumno(var a:alumno);
var
    dimL:integer;
begin
    writeln('DNI: ');           readln(a.dni);
    writeln('Apellido: ');      readln(a.apellido);
    writeln('Nombre: ');        readln(a.nombre);
    writeln('Anio Ingreso');    readln(a.anioIngreso);
    writeln('Carrera (1..4): ');readln(a.carrera);
    dimL:=0;
    while (dimL < dimF) and ((a.analitico)[dimF].nombre <> 'ZZZ') do
    begin
        writeln(dimL ,' Materia: ');readln((a.analitico)[dimL].nombre);
        writeln(dimL ,' nota: ');readln((a.analitico)[dimL].nota);
        dimL:=dimL+1;
    end;
end;
//____________________________________________________________________
procedure agregarAdelante (var L:lista;a:alumno);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=a;
    nue^.sig:=L;
    L:=nue;
end;
//____________________________________________________________________
procedure cargarAlumnos (var L:lista);
var
    a:alumno;
begin
    LeerAlumno(a);
    while a.dni <> -1 do
        agregarAdelante(L,a);
        LeerAlumno(a);
end;
//___________________________________________________
function tresImpares(dni:integer):boolean;
var
    dig:integer;
    impar:integer;
begin
    impar:=0;
    while (dni <> 0) and (impar <= 3) do
    begin
        dig:=dni mod 10;
        if (dig mod 2 = 1) then
        begin
            impar:=impar+1;
        end;
        dni:=dni div 10;
    end;
    if impar > 3 then
    begin
        tresImpares:=false;
    end
    else
        begin
            tresImpares:=true;
        end;
end;
//___________________________________________________
procedure CargarNotas(a:aprobadas;var cantNotas:integer;var totNotas);
var
    i:integer;
begin   
    for i:=1 to dimF do
    begin
        totNotas:=totNotas + (a[i].nota);
    end;
    cantNotas:=i;
end;
//___________________________________________________
procedure RecorrerLista (L:lista;var vc:vector_contador;var mejor:alumno);
var
    totNotas:real;
    cantNotas:integer;
    cumpleDNI:boolean;
    mejorProm:real;
    promedioIndi:real;
begin
    mejorProm:=-1;
    while (L <> nil) do
    begin
        promedioIndi:=0;
        vc[L^.datos.carrera]:=vc[L^.datos.carrera]+1;
        cumpleDNI := tresImpares(L^.datos.dni);
        if (cumpleDNI) then
        begin
            writeln(L^.datos.dni);
            writeln(L^.datos.nombre);
            writeln(L^.datos.apellido);
        end;
        CargarNotas(L^.datos.analitico,cantNotas,totNotas);
        promedioIndi:=totNotas/cantNotas;
        if (promedioIndi>mejorProm) then
        begin
            mejor:=L^.datos;
        end;
        L:=L^.sig;
    end;
end;
//____________________________________________________________________
procedure recorrerVector(vc:vector_contador; var codMenor1,codMenor2:codigo);
var
    menor1:integer;
    menor2:integer;
    i:integer;
begin
    menor1:=999;
    menor2:=999;
    for i:=1 to dimF do
    begin
        if vc[i]<menor1 then
        begin
            mejor2:=mejor1;
            codMenor2:=codMenor1;
            menor1:=vc[i];
            codMenor1:=i;
        end
        else
            begin
                if (vc[i]<menor2) then
                begin
                    menor2:=vc[i];
                    codMenor2:=i;
                end;
            end;
    end;
end;
//____________________________________________________________________
var
    vc:vector_contador;
    L:lista;
    codMenor1:codigo;
    codMenor2:codigo;
    mejorA:alumno;
begin
    inicializarVector(vc);
    cargarAlumnos(L);
    RecorrerLista(L,vc,mejorA);
    writeln(mejorA);
    recorrerVector(vc,codMenor1,codMenor2);
    writeln('El codigo de la carrera con menor numero de inscriptos es: ',codMenor1);
    writeln('El segundo codigo de la carrera con menor nro de inscriptos es: ',codMenor2);
end.