//1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los dos números es el
//menor. Si son iguales, se deberá informar en pantalla lo siguiente: “Los números leídos son iguales”

program untitled;

var
	numero_1: integer;
	numero_2: integer;
begin
	write('Ingrese N1 ');
	read(numero_1);
	write('Ingrese N2 ');
	read(numero_2);
	if (numero_1<numero_2) then
		write('El numero menor es: ',numero_1);
	if (numero_1>numero_2) then
		write('El numero menor es: ',numero_2);
	else
		write('Los numeros leidos son iguales ');
end.
