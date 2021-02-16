{Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su perímetro.
a. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenidas del Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia (medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
o Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700 km) y mayor o igual que el de Marte (6.780 km).
o Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).
 }

program Ejercicio2;
type    
    letras20=String[20];
procedure Leer_Datos(radiof:real;var diametrof:real;var perimetrof:real);
begin
    
    diametrof:=radiof/2;
    perimetrof:=3.14159265 * radiof;
    writeln('El diametro es: ', diametrof:5:2,'km');
    writeln('El perimetro es: ', perimetrof:5:2,'km');
end;
//___________________________________________________________________________________________________
procedure Leer_Planeta(var nombref:letras20;var radiof:real;var distanciaf:real);
begin
    Writeln('Ingrese nombre del planeta: ');
    ReadLn(nombref);
    Writeln('Ingrese el radio en km: ');
    ReadLn(radiof);
    Writeln('Ingrese distancia con respecto a la Tierra en anios luz: ');
    ReadLn(distanciaf);
end;
//___________________________________________________________________________________________________
procedure Planetas_Mayores_Jupiter(perimetro:real;perimetro_Jupiter:real;var Cant_mayores_Jupiter:integer);
begin
    if(perimetro>perimetro_Jupiter)then
    begin
        Cant_mayores_Jupiter:=Cant_mayores_Jupiter+1;
    end;
end;
//___________________________________________________________________________________________________
var
    distancia,
    radio,
    diametro,
    perimetro:real;
    nombre:letras20;
    diametro_Tierra:Real;
    diametro_Marte:Real;
    perimetro_Jupiter:real;
    Cant_mayores_Jupiter:integer;
begin
    Cant_mayores_Jupiter:=0;
    perimetro_Jupiter:=439264; 
    diametro_Tierra:=12700;
    diametro_Marte:= 6780;
    distancia:=0;
    nombre:='';
    diametro:=0;
    perimetro:=0;
    radio:=1;
    while (radio <> 0) do
    begin
        Leer_Planeta(nombre, radio, distancia);
        Leer_Datos(radio,diametro,perimetro);
        //Diametro_Menor_Igual_Tierra(nombre,distancia,diametro,diametro_Tierra);
        Planetas_Mayores_Jupiter(perimetro,perimetro_Jupiter,Cant_mayores_Jupiter);
    end;
    writeln('La cantidad de planetas con mayor perimetro que jupiter es: ', Cant_mayores_Jupiter);
end.
