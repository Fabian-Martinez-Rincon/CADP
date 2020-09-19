//6. Realizar un programa que lea información de una cartelera de cine. De cada película se lee el título y la duración (en
//minutos). La lectura finaliza cuando se ingresa la película “El hombre araña”, que debe procesarse. Se pide calcular e
//informar:
//○ El nombre de la película más larga.
//○ El porcentaje de películas que duran entre 90 y 120 minutos.
//○ La cantidad de películas que duran menos de 90 minutos
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
