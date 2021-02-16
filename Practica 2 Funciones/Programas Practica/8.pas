
{. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada producto debe
leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
o Código de los dos productos más baratos.
o Código del producto de tipo “pantalón” más caro.
o Precio promedio.}

program EjerciciosAdd;

procedure leerProductos( var precioF:real;var codigoF:integer; var tipoF:string);
begin
    writeln('Ingrese precio del producto');
    readln(precioF);
    writeln('Ingrese codigo del producto');
    readln(codigoF);
    writeln('Ingrese tipo del producto');
    readln(tipoF);
    writeln('___________________________');
    
end;
//_________________________________________________________________________________________
procedure pantalonCaro(precio2:real;var Pant_Precio_MaxF:real;codigo2:integer; var Pantalon_CodigoF:integer;tipo2:string );
begin
    if tipo2='pantalon' then
    begin
        if(precio2>Pant_Precio_MaxF)then
          begin
          Pant_Precio_MaxF:=precio2;
          Pantalon_CodigoF:=codigo2;
    end;
    end;

end;
//______________________________________________________________________________________________
procedure productosBatatos(var precio_barato1F:real; precio_barato2F:real;precio_comparar:real;var Codigo_Mas_BaratoF:integer; var Codigo_SegundoMas_BaratoF:integer;codigo_comparar:integer);
begin
    if(precio_comparar<precio_barato1F) then
        begin
	    	precio_barato2F:=precio_barato1F;
		    Codigo_SegundoMas_BaratoF:=Codigo_Mas_BaratoF;
		    precio_barato1F:=precio_comparar;
			Codigo_Mas_BaratoF:=codigo_comparar;
		end
    else
		begin
	    	if(precio_comparar<precio_barato2F) then
				begin
					precio_barato2F:=precio_comparar;
					Codigo_SegundoMas_BaratoF:=codigo_comparar;
				end
		end;
end;
//_________________________________________________________________________________________
type    
    cadena=string[10];
var 
    precio_barato1,precio_barato2,promedio,Sumas_Promedio,Pant_Precio_Max,precio:real;
    Codigo_Mas_Barato,Codigo_SegundoMas_Barato,numero,i,codigo,Pantalon_Codigo:integer;
    tipo:string;
begin
    precio_barato1:=9999;
    precio_barato2:=9999;
    Codigo_Mas_Barato:=99999;
    Codigo_SegundoMas_Barato:=9999;
    promedio:=0;
    Sumas_Promedio:=0;
    Pantalon_Codigo:=-1;
    Pant_Precio_Max:=-1;
    numero:=3;
     for i:=1 to numero do 
         begin
         leerProductos(precio,codigo,tipo);
         productosBatatos(precio_barato1,precio_barato2,precio,Codigo_Mas_Barato,Codigo_SegundoMas_Barato,codigo);
         pantalonCaro(precio,Pant_Precio_Max,codigo,Pantalon_Codigo,tipo);
         Sumas_Promedio:=Sumas_Promedio+precio;
         end; 
     promedio:=Sumas_Promedio/numero;
     writeln('El codigo con Pantalon mas caro es: ' ,Pantalon_Codigo );
     writeln('El promedio de todos los productos es: ',promedio:2:2 );
     writeln('El producto mas barato es: ', Codigo_Mas_Barato );
     writeln('El segundo producto mas barato es: ',Codigo_SegundoMas_Barato );
        
end.
//______________________________________________________________________________________________