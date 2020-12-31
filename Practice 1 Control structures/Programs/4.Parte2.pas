//4. Realizar un programa que lea 10 números enteros desde teclado. Informar en pantalla cuáles son los dos números
//mínimos leídos.
//a. Modificar el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual
//debe procesarse.
//b. Modificar el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el número 0, el cual
//no debe procesarse

program ejemplo;

type
	bucle=0..10;

var
	i:bucle;
	numero_uno,numero_dos,chico,chico2:integer;
begin
	numero_uno:=0;
	numero_dos:=0;
	chico:=0;
	chico2:=0;
	read(chico);
	for i:=0 to 10 do 
		begin
			write('Ingrese un numero: ');
			read(chico);
			if(chico>chico2)then
				chico:=chico2;
			if(chico<chico2)then
				chico2:=chico;
		end;
	
	if(chico<chico2) then
		begin
			writeln('el numero mas chico es',chico);
			writeln('el segundo numero mas chico es',chico2);
		end
	else
		begin
			writeln('el numero mas chico es',chico2);
			writeln('el segundo numero mas chico es',chico);
		end;
	
end.
