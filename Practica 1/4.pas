//4. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números reales. La lectura
//deberá finalizar al ingresar un valor que sea el doble de X o al leer el décimo número, en cuyo caso deberá informarse:
//“No se ha ingresado el doble de X”.

program untitled;
type
	numeros = 1 .. 10;

var
	NumeroReal: real;
	DobleReal: real;
	contador:numeros; 
begin
	contador:=1;
	DobleReal:=0;
	write('Ingrese un numero real: ');
	read(NumeroReal);
	while (DobleReal/2<>NumeroReal) and (contador<10) do
		begin
			contador:=contador+1;
			read(DobleReal);
			writeln('Su numero es ',DobleReal:2:1);
		end;
	write('El numero que es el doble del real es: ', DobleReal:2:1);
end.
