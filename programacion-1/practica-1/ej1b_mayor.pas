program ej1b_mayor;
var
  base, altura, area, perimetro: real;
begin
  writeln('Ingrese la base del rectangulo:');
  readln(base);
  writeln('Ingrese la altura del rectangulo:');
  readln(altura);

  area := base * altura;
  perimetro := 2 * (base + altura);

  writeln('El area del rectangulo es: ', area:0:2);
  writeln('El perimetro del rectangulo es: ', perimetro:0:2);
end.
