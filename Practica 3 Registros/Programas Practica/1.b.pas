{. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe la
cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe procesarse.
Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el nombre
del alumno con mejor promedio.}
program Registros;
type
    str20 = string[20];
    alumno = record
    codigo : integer;
    nombre : str20;
    promedio : real;
end;
procedure leer(var alu : alumno;var cant_alumnos:integer);
begin
    writeln('Ingrese el codigo del alumno');
    readln(alu.codigo);
    if (alu.codigo <> 0) then 
        begin
        writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
        writeln('Ingrese el promedio del alumno'); readln(alu.promedio);
        cant_alumnos:=cant_alumnos+1;
        end;
end;
procedure promedio(var nombre:str20;var promedio:real;var alumno_Destacado:str20;var promedio_mejor:real);
begin
    if (promedio>promedio_mejor)then
    begin
        promedio_mejor:=promedio;
        alumno_Destacado:=nombre;
    end;
end;
{ declaración de variables del programa principal }
var 
    a : alumno;
    cant_alumnos:integer;
    promedio_mejor:real;
    alumno_Destacado:str20;
{ cuerpo del programa principal }
begin
    cant_alumnos:=0;
    promedio_mejor:=-1;
    leer(a,cant_alumnos);
    promedio(a.nombre,a.promedio,alumno_Destacado,promedio_mejor);
    while a.codigo<>0 do
    begin
        leer(a,cant_alumnos);
        promedio(a.nombre,a.promedio,alumno_Destacado,promedio_mejor);

    end;
    writeln('la cantidad de alumnos que se ingresaron son: ', cant_alumnos);
    writeln('el alumno con mejor promedio es: ', alumno_Destacado);
end.
