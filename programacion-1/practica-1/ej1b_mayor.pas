program ej1b_mayor;
var
  num1, num2: real;
begin
  writeln('Ingrese el primer numero:');
  readln(num1);
  writeln('Ingrese el segundo numero:');
  readln(num2);

  if num1 > num2 then
    writeln('El mayor es: ', num1:0:2)
  else
    writeln('El mayor es: ', num2:0:2);
end.
