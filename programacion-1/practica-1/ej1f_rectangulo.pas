program ej1f_rectangulo;
var
  base, altura, area, perimetro: real;
begin
  writeln('Ingrese la base del rectangulo:');
  readln(base);
  writeln('Ingrese la altura del rectangulo:');
  readln(altura);

  area := base * altura;
  perimetro := 2 * (base + altura);

  writeln('Area: ', area:0:2);
  writeln('Perimetro: ', perimetro:0:2);
end.
