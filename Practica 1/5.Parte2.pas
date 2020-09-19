//5. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee código y
//precio (cada código es un número entre 1 y 200). Informar en pantalla:
//○ Los códigos de los dos productos más baratos.
//○ La cantidad de productos de más de 16 pesos con código par.
//○ El precio promedio

program ejemplo;

type
	codigos=0..200;

var
	i,codi,pares_mayores:codigos;
	precio,precio_promedio, promedio:real;
	productos:integer;
begin
	productos:=0;
	precio:=0;
	promedio:=0;
	codi:=0;
	precio_promedio:=0;
	pares_mayores:=0;
	for i:=1 to 10 do 
		begin
			write('Codigo del producto: ');
			read(codi);
			write('Precio del producto: ');
			read(precio);
			productos:=productos+1;
			precio_promedio:=precio_promedio+precio;
			if ((codi mod 2=0)) and (precio>16) then	
				pares_mayores:=pares_mayores+1;
				
		end;
	promedio:= precio_promedio/productos;
	writeln('el promedio es: ', promedio:3:3);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ', pares_mayores);
	
end.
