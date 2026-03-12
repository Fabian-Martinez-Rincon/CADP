program ej3_suma_tres_numeros;
var
  a, b, c, suma: integer;
begin
  writeln('Ingrese tres numeros enteros:');
  readln(a);
  readln(b);
  readln(c);

  suma := a + b + c;
  writeln('Suma usando variable adicional: ', suma);
  writeln('Suma sin variable adicional: ', a + b + c);
end.
