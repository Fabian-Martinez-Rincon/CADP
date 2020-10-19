{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la escuela
y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se ingresa ordenada
consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que lea la información de los
proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e informe:
o Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
o Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
o Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
} 
program tres;
type
    str20=string[20];
    centro=record
    nombre:str20;
    universidad:str20;
    cantidad_investigadores:integer;
    cantidad_becarios:integer;
end;
//_________________________________________________________________________________________________
procedure leer_centro(var centro_estudiantesF:centro);
begin
    writeln('Ingrese nombre abreviado del centro: ');
    ReadLn(centro_estudiantesF.nombre);
    writeln('Ingrese nombre de la universidad: ');
    ReadLn(centro_estudiantesF.universidad);
    writeln('Ingrese la cantidad de investigadores: ');
    ReadLn(centro_estudiantesF.cantidad_investigadores);
    writeln('Ingrese la cantidad de becarios: ');
    ReadLn(centro_estudiantesF.cantidad_becarios);
end;
//_________________________________________________________________________________________________
procedure mayor_cantidad_investigadores(centro_estudiantesF2:centro;var universidad_mayorF2:str20;var mayor_investigadoresF2:integer);
begin
    if centro_estudiantesF2.cantidad_investigadores>mayor_investigadoresF2 then
    begin
        mayor_investigadoresF2:=centro_estudiantesF2.cantidad_investigadores;
        universidad_mayorF2:=centro_estudiantesF2.universidad 
    end;
end;
//_________________________________________________________________________________________________
procedure centros_menores_becarios(centro_estudiantes:centro;var menor_cantidad1:integer;var menor_cantidad2:integer;var menor_becarios1:str20;var menor_becarios2:str20);
begin
  if (centro_estudiantes.cantidad_becarios<menor_becarios1)then
				begin
					menor_cantidad2:=menor_becarios1;   
					menor_becarios1:=centro_estudiantes.cantidad_becarios;
                    menor_becarios2:=menor_becarios1;
                    menor_becarios1:=centro_estudiantes.universidad;

				end
			else
				begin 
					if(centro_estudiantes.cantidad_becarios<menor_cantidad2) then
						begin
							menor_cantidad2:=centro_estudiantes.cantidad_becarios;
							menor_becarios2:=centro_estudiantes.universidad;
						end
				end;
end;




//_________________________________________________________________________________________________
var 
    centro_estudiantes:centro;
    mayor_investigadores:integer;
    universidad_mayor:str20;
    menor_becarios1:str20;
    menor_cantidad1:integer;
    menor_becarios2:str20;
    menor_cantidad2:integer;

begin
    menor_cantidad1:=9999;
    menor_cantidad2:=9999;
    menor_becarios1:='';
    menor_becarios2:='';
    mayor_investigadores:=-1;
    universidad_mayor:='';
    leer_centro(centro_estudiantes);
    while (centro_estudiantes.cantidad_investigadores <> 0) do
    begin
        leer_centro(centro_estudiantes);
        mayor_cantidad_investigadores(centro_estudiantes,universidad_mayor,mayor_investigadores);
        centros_menores_becarios:(centro_estudiantes,menor_cantidad1,menor_cantidad2,menor_becarios1,menor_becarios2);
    end;
end.

