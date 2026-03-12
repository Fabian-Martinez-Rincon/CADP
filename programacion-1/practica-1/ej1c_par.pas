program ej1c_par;
var
  n: integer;
begin
  writeln('Ingrese un numero entero:');
  readln(n);

  if (n mod 2 = 0) then
    writeln('Es par')
  else
    writeln('No es par');
end.
