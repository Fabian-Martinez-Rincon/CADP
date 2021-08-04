{Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
o Los códigos de los dos productos más baratos.
o La cantidad de productos de más de 16 pesos con código par.
 }

program Ejercicio2;
type
codigos=1..200;

//__________________________________________________________________________________________
procedure Leer_Datos(var num1:codigos;var num2 : real);
begin
    writeln('Ingrese codigo: ');
    read(num1);
    Writeln('Ingrese precio: ');
    read(num2);
    
end;
//__________________________________________________________________________________________
procedure Productos_Baratos(codigo:codigos;var primer_codigo_barato:codigos;var segundo_codigo_barato:codigos;precio:real;var primer_precio_barato:real;var segundo_precio_barato:real);
begin
  if (precio<primer_precio_barato)then
				begin
					segundo_codigo_barato:=primer_codigo_barato;   
					primer_codigo_barato:=codigo;
                    segundo_precio_barato:=primer_precio_barato;
                    primer_precio_barato:=precio;

				end
			else
				begin 
					if(precio<segundo_precio_barato) then
						begin
							segundo_codigo_barato:=codigo;
							segundo_precio_barato:=precio;
						end
				end;
end;
//__________________________________________________________________________________________
procedure Mayor_16Pe(codigo:codigos;precio:real;var mayores_pares:integer);
begin
    if(precio>16) and ((codigo mod 2) = 0) then
    begin
        mayores_pares:=mayores_pares+1; 
    end;
end;
var
    primer_codigo_barato,
    segundo_codigo_barato,
    codigo:codigos;
    primer_precio_barato,
    segundo_precio_barato,
    precio:real;
    mayores_pares,
    i:integer;
begin
    mayores_pares:=0;
    primer_codigo_barato:=200;
    segundo_codigo_barato:=200;
    primer_precio_barato:=9999;
    segundo_precio_barato:=9999;
    for i:=0 to 5 do
    begin
        Leer_Datos(codigo,precio);
        Productos_Baratos(codigo,primer_codigo_barato,segundo_codigo_barato,precio,primer_precio_barato,segundo_precio_barato);
        Mayor_16Pe(codigo,precio,mayores_pares);
    end;
    writeln('El codigo del producto mas barato es: ', primer_codigo_barato);
    writeln('El codigo del segundo producto mas barato es: ', segundo_codigo_barato);
    writeln('La cantidad de productos pares con precio mayor a 16 es: ', mayores_pares);
end.
