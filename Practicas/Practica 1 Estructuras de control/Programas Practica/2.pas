//2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X se escribe
//|X| y se define como:
//|X| = X cuando X es mayor o igual a cero.
//|X| = -X cuando X es menor a cero.

program untitled;

var
	Numero_Real: real;
	Numero_Absoluto: real;
begin
	write('Ingrese un numero Real ');
	read(Numero_Real);
	if(Numero_Real<0) then
		Numero_Absoluto:=-(Numero_Real);
	if(Numero_Real>=0) then
		Numero_Absoluto:= Numero_Real;
	write('Su numero absoluto es: ', Numero_Absoluto:2:0);
	
end.
