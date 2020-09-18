//5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos
//los clientes. Los que le sobren se los quedará para él.
//a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la cantidad de clientes
//(Y), e imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada
//cliente, y la cantidad de caramelos que se quedará para sí mismo.
//b. Si cada caramelo tiene un valor de $1.60, imprima en pantalla el dinero que deberá cobrar el kiosquero.

program untitled;

var
	caramelos: integer;
	clientes: integer;
	promedio: integer;
	sobrantes: integer;
begin
	writeln('Ingrese la cantidad de caramelos: ');
	read(caramelos);
	writeln('Para cuantas personas? ');
	read(clientes);
	promedio:= caramelos div clientes;
	sobrantes:= caramelos mod clientes;
	writeln('A cada uno le da ', promedio);
	writeln('le sonbran ', sobrantes);
	
	
	
	
end.
