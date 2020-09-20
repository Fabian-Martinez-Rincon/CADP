//6. Realizar un programa que lea información de una cartelera de cine. De cada película se lee el título y la duración (en
//minutos). La lectura finaliza cuando se ingresa la película “El hombre araña”, que debe procesarse. Se pide calcular e
//informar:
//○ El nombre de la película más larga.
//○ El porcentaje de películas que duran entre 90 y 120 minutos.
//○ La cantidad de películas que duran menos de 90 minutos
program ejemplo;

type
	minutos=0..400;

var
	pelicula:string;
	pelicula_larga:string;
	duracion:minutos;
begin
	duracion:=90;
	writeln('Ingrese el titulo: ');
		readln(pelicula_larga);
		writeln('Ingrese la duracion de la pelicula: ');
		readln(duracion);
	
	repeat
		writeln('Ingrese el titulo: ');
		readln(pelicula);
		writeln('Ingrese la duracion de la pelicula: ');
		readln(duracion);
		
		if(pelicula>pelicula_larga)then begin
			pelicula_larga:=pelicula;
		end
		else begin
			pelicula:=pelicula_larga;
		end;
	until (pelicula='El hombre arana');
	if(pelicula<pelicula_larga)then
			begin
			write('El nombre mas largo es:', pelicula_larga);
			end
		else begin
			writeln('El nombre mas largo es: :',pelicula);
		end;
end.
