program ej1d_multiplo5;
var
  n: integer;
begin
  writeln('Ingrese un numero entero:');
  readln(n);

  if (n mod 5 = 0) then
    writeln('Es multiplo de 5')
  else
    writeln('No es multiplo de 5');
end.
