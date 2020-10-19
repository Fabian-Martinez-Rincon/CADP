{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada centro se
lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de investigadores y la
cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y la lectura finaliza al leer
un centro con 0 investigadores, que no debe procesarse. Informar:
o Cantidad total de centros para cada universidad.
o Universidad con mayor cantidad de investigadores en sus centros.
o Los dos centros con menor cantidad de becarios.
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

