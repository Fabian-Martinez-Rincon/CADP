//2. Realizar un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si se lee la secuencia:
//3 5 6 2 3 10 98 8 -12 9
//deberá informar: “El mayor número leído fue el 98”
//a. Modificar el programa anterior para que, además de informar el mayor número leído, se informe el número de
//orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la misma secuencia:
//3 5 6 2 3 10 98 8 -12 9
//deberá informar: “El mayor número leído fue el 98, en la posición 7”

program ejemplo;

type
	bucle=0..10;

var
	numeros:integer;
	primer:integer;
	i:bucle;
	
begin
	primer:=0;
	numeros:=0;
	
	for i:=1 to 10 do begin
		write('numero: ');
		read(numeros);
		if(primer<numeros) then begin
			primer:=numeros;
		end
		else begin
			numeros:=primer;
		end;
			
	end;
	if(primer<numeros)then begin
		write('el numero mas grande es: ', numeros);
	end
	else begin
		write('el numero mas grande es: ', primer);
	end;
end.
