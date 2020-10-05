
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
    if(precio2>Pant_Precio_MaxF)then
    begin
      Pant_Precio_MaxF:=precio2;
      Pantalon_CodigoF:=codigo2;
    end;

end;
procedure promedio (precio3:integer;var Sumas_Promedio2:real;realnumero2:integer);
begin
  
end;
//_________________________________________________________________________________________
type    
    cadena=string[10];
var 
    Sumas_Promedio,Pant_Precio_Max,precio:real;
    numero,i,codigo,Pantalon_Codigo:integer;
    tipo:string;
begin
    Sumas_Promedio:=0;
    Pantalon_Codigo:=-1;
    Pant_Precio_Max:=-1;
    numero:=3;
     for i:=1 to numero do 
         begin
         leerProductos(precio,codigo,tipo);
    //productosBatatos();
         pantalonCaro(precio,Pant_Precio_Max,codigo,Pantalon_Codigo,tipo);
         promedio(precio,Sumas_Promedio,numeros);
         end; 
     writeln('El codigo con Pantalon mas caro es: ' ,Pantalon_Codigo );
        
end.
//______________________________________________________________________________________________