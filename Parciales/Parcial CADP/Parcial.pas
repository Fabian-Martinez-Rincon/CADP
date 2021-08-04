program Parcial;
const 
    Mat=36;
type
    RangoMate = 1..Mat;
    cadena = string [40];
    VectorNotas = array [RangoMate] of integer;
    alumno = record 
        apellido:cadena;
        numero:integer;
        anioIng:integer;
        aprobadas:RangoMate;
        notas:VectorNotas;
    end;
    lista = ^nodo;
    nodo = record
        datos:alumno;
        sig:lista;
    end;
//__________________________________________________
procedure LeerNotas(var Vnotas:VectorNotas;aprobadas:RangoMate);
var
    i:RangoMate;
    nota:integer;
begin
    for i:=1 to aprobadas do
    begin
        writeln('Notas: ');readln(nota);
        Vnotas[i]:=nota;
    end;
end;
//__________________________________________________
procedure LeerAlumno(var a:alumno);
begin
    writeln('Numero: ');readln(a.numero);
    if a.numero <> -1 then
    begin
        writeln('Apellido: ');readln(a.apellido);
        writeln('Anio Ingreso: ');readln(a.anioIng);
        writeln('Aprobadas: ');readln(a.aprobadas);
        LeerNotas(a.notas,a.aprobadas);
    end;
end;
//__________________________________________________
procedure agregarAdelante(var L:lista;a:alumno);
var 
    nue:lista;
begin
    new(nue);
    nue^.datos:=a;
    nue^.sig:=L;
    L:=nue;
end;
//__________________________________________________
procedure procesarAlumnos(var L:lista);
var
    a:alumno;
begin
    LeerAlumno(a);
    while a.numero <> -1 do
    begin
        agregarAdelante(L,a);
        LeerAlumno(a);
    end;
end;
//__________________________________________________
procedure SNotas(vnotas:VectorNotas;var SumaNotas:integer; cant:integer);
var
    i:integer;
begin
    for i:=1 to cant do
    begin
        SumaNotas:=SumaNotas+vnotas[i];
    end;
end;
//__________________________________________________
procedure dosMejores(apellido:cadena;promedio:real;var alumno1,alumno2:cadena;var prom1,prom2:real);
begin
    if (promedio>prom1) then
    begin
        prom2:=prom1;
        alumno2:=alumno1;
        prom1:=promedio;
        alumno1:=apellido;
    end
    else
        begin
            if (promedio > prom2) then
            begin
                prom2:=promedio;
                alumno2:=apellido;
            end;
        end;
end;
//__________________________________________________
procedure MejoresPromedios(L:lista;var alumno1,alumno2:cadena);
var
    totalNotas:integer;
    SumaNotas:integer;
    promedio:real;
    promedio1:real;
    promedio2:real;
begin
    promedio1:=-1;
    promedio2:=-1;
    promedio:=0;
    while L <> nil do
    begin
        if (L^.datos.anioIng >=2015) then
        begin
            totalNotas:=L^.datos.aprobadas;
            SNotas(L^.datos.notas,SumaNotas,totalNotas);
            promedio:=SumaNotas/totalNotas;
            dosMejores(L^.datos.apellido,promedio,alumno1,alumno2,promedio1,promedio2);
        end;
        L:=L^.sig;
    end;
end;
//__________________________________________________
var
    L:lista;
    alumno1:cadena;
    alumno2:cadena;
begin
    alumno1:='e';
    alumno2:='e';
    L:=nil;
    procesarAlumnos(L);
    MejoresPromedios(L,alumno1,alumno2);
    writeln('El alumno con mejor promedio es :',alumno1);
    writeln('El alumno con el segundo mejor promedio es :',alumno2);
end.
