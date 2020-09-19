//1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
//a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.

program ejemplo;

var
	i,numeros,mayores,suma:integer;
	
begin
	numeros:=0;
	mayores:=0;
	suma:=0;
	for i:=1 to 10 do begin
		write('Su numero es: ');
		read(numeros);
		suma:=suma+numeros;
		if(numeros>5) then
			mayores:=mayores+1;
	end;
	writeln('la suma de todos los numeros es: ',suma);
	writeln('Los numeros mayores son: ', mayores);

end.
