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
procedure relacion_docente_alumno(var colegioF:colegio;var relacion:real);
    
begin

    relacion:=colegioF.cant_alumnos/colegioF.cant_docentes;
    
end;

var
    a:colegio;
    unesco:real;
    relacion_profes:real;
    i:integer;
    total_escuelas:integer;
    escuelas_que_cumplen:integer;
begin
    escuelas_que_cumplen:=0;
    total_escuelas:=2400;
    relacion_profes:=0;
    unesco:=23.435;
    for i:=0 to total_escuelas do
    begin
        colegioF(a);
        relacion_docente_alumno(a,relacion_profes);
        if (a.localidad = 'La Plata') and (relacion_profes>unesco) then
        begin
            escuelas_que_cumplen:=escuelas_que_cumplen+1;
        end;
    end;
    writeln('La cantidad de escuelas que cumplen con lo sugerido es:',escuelas_que_cumplen);
    WriteLn('La relacion entre alumnos y profesores es: ', relacion_profes:4:2);
    
end.

