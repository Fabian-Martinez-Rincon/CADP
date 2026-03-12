program ej1h_nivel_educativo;
var
  edad: integer;
begin
  writeln('Ingrese la edad del estudiante:');
  readln(edad);

  if edad < 7 then
    writeln('Pertenece a preescolar')
  else if edad <= 12 then
    writeln('Pertenece a primaria')
  else if edad <= 18 then
    writeln('Pertenece a secundaria')
  else
    writeln('Pertenece a universitario');
end.
