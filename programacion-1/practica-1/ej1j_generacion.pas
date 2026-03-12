program ej1j_generacion;
var
  anio: integer;
begin
  writeln('Ingrese su anio de nacimiento:');
  readln(anio);

  if (anio >= 1946) and (anio <= 1964) then
    writeln('Baby Boomers')
  else if (anio >= 1965) and (anio <= 1980) then
    writeln('Generacion X')
  else if (anio >= 1981) and (anio <= 1996) then
    writeln('Millennials')
  else if (anio >= 1997) then
    writeln('Generacion Z')
  else
    writeln('Generacion anterior a Baby Boomers');
end.
