//3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en TIC. De cada
//alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10). La lectura finaliza cuando
//se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura informar:
//○ La cantidad de alumnos aprobados (nota 8 o mayor).
//○ La cantidad de alumnos que obtuvieron un 7 como nota.

program ejemplo;

type
	bucle=0..10;
	cadena10=string[20];

var
	dni:integer;
	nombre:cadena10;
	nota, aprobados, siete:bucle;

	
	
begin
	nota:=0;
	dni:=0;
	aprobados:=0;
	siete:=0;
	repeat
		writeln('ingrese Su dni');
		readln(dni);
		writeln('ingrese Su nombre');
		readln(nombre);
		writeln('ingrese Su nota en EPA');
		readln(nota);
		if (nota>=8) then
			aprobados:=aprobados+1;
		if(nota=7) then
			siete:=siete+1;
	until (nombre='Zidane Zinedine');
	writeln('Los aprobados son: ', aprobados);
	writeln('Los que sacaron 7 son: ', siete);
	
end.
