//6. Realizar un programa que lea una secuencia de caracteres hasta que se ingrese el carácter ‘*’ (que no debe procesarse).
//Se pide calcular e informar:
//○ La cantidad de ‘z’ (minúscula) y ’Z’ (mayúscula) leídas.
//○ El porcentaje de vocales leídas.
//○ Si aparece la sub-secuencia ‘ab’ dentro de la secuencia.


program ejemplo;
var
	caracter:char;
	contadorMin, contadorMay:integer;
begin
	contadorMin:=0;
	contadorMay:=0;
	read(caracter);
	while(caracter<>'*')do
		begin
			read(caracter);
			write('N: ',caracter);
			writeln('');
			if(caracter='z') then
				contadorMin:=contadorMin+1;
			if(caracter='Z') then
				contadorMay:=contadorMay+1;
		end;
	writeln('las z minusculas son: ', contadorMin);
	writeln('las Z mayusculas son: ', contadorMay);
end.
