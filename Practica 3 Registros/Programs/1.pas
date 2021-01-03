{. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe la
cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe procesarse.
Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el nombre
del alumno con mejor promedio.}
program Registros;
type
    tr20 = string[20];
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
{ declaración de variables del programa principal }
var 
    a : alumno;
    cant_alumnos:integer;
{ cuerpo del programa principal }
begin
    cant_alumnos:=0;
    leer(a,cant_alumnos);
    while a.codigo<>0 do
    begin
        leer(a,cant_alumnos);
    end;
    writeln('la cantidad de alumnos que se ingresaron son: ', cant_alumnos);
end.
