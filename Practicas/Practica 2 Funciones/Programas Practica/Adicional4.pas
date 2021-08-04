{Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su perímetro.
a. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenidas del Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia (medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
o Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700 km) y mayor o igual que el de Marte (6.780 km).
o Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).
 }

program Ejercicio2;
procedure Leer_Datos(radiof:real;var diametrof:real;var perimetrof:real);
begin
    Writeln('Ingrese el radio: ');
    ReadLn(radiof);
    diametrof:=radiof/2;
    perimetrof:=3.14159265 * radiof;
    writeln('El diametro es: ', diametrof:5:2);
    writeln('El perimetro es: ', perimetrof:5:2);
end;
var
    radio,
    diametro,
    perimetro:real;
begin
    diametro:=0;
    perimetro:=0;
    Leer_Datos(radio,diametro,perimetro);
end.
