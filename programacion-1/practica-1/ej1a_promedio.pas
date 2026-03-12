program ej1a_promedio;
var
  num1, num2, promedio: real;
begin
  writeln('Ingrese el primer numero:');
  readln(num1);
  writeln('Ingrese el segundo numero:');
  readln(num2);

  promedio := (num1 + num2) / 2;
  writeln('El promedio es: ', promedio:0:2);
end.
