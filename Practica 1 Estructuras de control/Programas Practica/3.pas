//3. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se ingrese uno cuyo valor
//sea exactamente el doble de X (el primer número leído).

program untitled;

var
	NumeroReal: real;
	DobleReal: real;
begin
	NumeroReal:=0;
	DobleReal:=0;
	write('Ingrese un numero real: ');
	read(NumeroReal);
	while ((DobleReal/2)<>NumeroReal) do
		begin
			read(DobleReal);
			writeln('Su numero es ',DobleReal:2:1);
		end;
	write('El numero que es el doble del real es: ', DobleReal:2:1);
end.
