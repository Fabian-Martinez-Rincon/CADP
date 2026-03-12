program ej1e_tabla;
var
  n, i: integer;
begin
  writeln('Ingrese un numero del 0 al 9:');
  readln(n);

  if (n < 0) or (n > 9) then
    writeln('Numero fuera de rango')
  else
  begin
    for i := 1 to 10 do
      writeln(n, ' x ', i, ' = ', n * i);
  end;
end.
