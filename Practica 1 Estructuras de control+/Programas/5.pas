//5. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza cuando
//se ingresa el legajo -1, que no debe procesarse. Al finalizar la lectura, informar:
//○ La cantidad de alumnos leída.
//○ La cantidad de alumnos cuyo promedio supera 6.5.
//○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sea menor a 2500

program untitled;


var
	legajo: real;
	promedio: real;
	alumnos: integer;
	aprobados:integer;
	destacados: integer;
	nota:real;
begin
	legajo:=0;
	promedio:=0;
	alumnos:=0;
	aprobados:=0;
	destacados:=0;
	nota:=0;
	
	
	while (legajo<>-1) do
		begin
			write('Ingrese el legajo: ');
			read(legajo);
			alumnos:=alumnos+1;
			write('Ingrese Nota: ');
			read(nota);
			if (nota>6.5)then
				aprobados:=aprobados+1
			if(nota>8.5)then
				destacados:=destacados+1;

		end;
	promedio:=(alumnos/100)*destacados;
	writeln('La cantidad de alumnos leida es:' ,alumnos);
	writeln('los alumnos aprobaados es', aprobados);
	writeln('El promedio de los que tienen mas de 8.5 es: ', promedio:2:2);
	
end.
