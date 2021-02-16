{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As, con
el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año 2015 (1
docente cada 23,435 alumnos). Para ello,se cuenta con información de: CUE (código único de establecimiento), nombre
del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide implementar un programa que
procese la información y determine:
o Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
o CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
 El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad de
alumnos y la cantidad de docentes).
}
program tres;
type
    str20=string[20];
    colegio=record
    CUE:integer;
    nombre_establecimiento:str20;
    cant_docentes:integer;
    cant_alumnos:integer;
    localidad:str20;
end;
procedure colegioF(var establecimiento:colegio);
begin
    writeln('Ingrese CUE: ');
    ReadLn(establecimiento.CUE);
    writeln('Ingrese nombre del establecimiento: ');
    ReadLn(establecimiento.nombre_establecimiento);
    writeln('Ingrese cantidad de docentes: ');
    ReadLn(establecimiento.cant_docentes);
    writeln('Ingrese cantidad de alumnos: ');
    ReadLn(establecimiento.cant_alumnos);
    writeln('Ingrese localidad: ');
    ReadLn(establecimiento.localidad);

end;


var
    a:colegio;
begin
    colegioF(a);
    {Writeln(a.CUE);
    writeln(a.nombre_establecimiento);
    WriteLn(a.cant_docentes);
    WriteLn(a.cant_alumnos);
    WriteLn(a.localidad);}
end.

