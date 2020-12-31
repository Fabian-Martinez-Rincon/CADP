//6. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para ello, el programa
//debe leer el monto total en dólares de la transacción, el valor del dólar al día de la fecha y el porcentaje (en
//pesos) de la comisión que cobra el banco por la transacción. Por ejemplo, si la transacción se realiza por 10 dólares,
//el dólar tiene un valor 20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
//La transacción será de 213,61 pesos argentinos
//(resultado de multiplicar 10*20,54 y adicionarle el 4%)

program untitled;

var
	dolares: real;
	pesos: real;
begin
	write('Dolares: ');
	read(dolares);
	writeln('La transaccion realizada es de ', dolares:3:3);
	pesos:= ((dolares*75.32)+(((dolares*75.32)/100)*4));
	write('Su transaccion sera de ', pesos:3:3);
	
end.
