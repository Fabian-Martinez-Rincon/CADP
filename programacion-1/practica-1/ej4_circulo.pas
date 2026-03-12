program ej4_circulo;
const
  PI = 3.1416;
var
  d, r, area, perimetro: real;
begin
  writeln('Ingrese el diametro del circulo:');
  readln(d);

  r := d / 2;
  area := PI * r * r;
  perimetro := d * PI;

  writeln('Radio: ', r:0:2);
  writeln('Area: ', area:0:2);
  writeln('Perimetro: ', perimetro:0:2);
end.
