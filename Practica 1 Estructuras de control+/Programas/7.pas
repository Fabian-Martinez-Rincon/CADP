//7. Realizar un programa que lea el código, precio actual y nuevo precio de los productos de un almacén. La lectura finaliza
//al ingresar el código 32767 (que no debe procesarse). Para cada producto leído, el programa deberá indicar si el nuevo
//precio del producto supera en un 10% al precio anterior. Por ejemplo:
//- Si se ingresa el código 10382, con precio actual 40 y nuevo precio 44, deberá imprimir:
//“el aumento de precio del producto 10382 no supera el 10%”.
//- Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir:
//“el aumento de precio del producto 32767 es superior al 10%”.

program ejemplo;
var
	precio_actual, precio_nuevo,aumento:real;
	codigo:integer;
begin
	precio_actual:=0;
	precio_nuevo:=0;
	aumento:=0;
	write('Ingrese el codigo del producto: ');
	codigo:=0;
	read(codigo);
	while(codigo<>32767)do
		begin
			writeln('Ingrese el precio actual: ');
			read(precio_actual);
			writeln('El precio actual es: ',precio_actual:5:3);
			writeln('Ingrese el precio nuevo: ');
			read(precio_nuevo);
			writeln('El precio nuevo es: ',precio_nuevo:5:3);
			aumento:=((precio_nuevo-precio_actual)/precio_actual)*100;
			writeln('El porcentaje es: ', aumento:3:2);
		
		end;

end.
