program ej1i_jubilacion;
var
  edad, faltan, edadJubilacion: integer;
  sexo: char;
begin
  writeln('Ingrese la edad:');
  readln(edad);
  writeln('Ingrese el sexo (M/F):');
  readln(sexo);

  sexo := upcase(sexo);
  if (sexo = 'M') or (sexo = 'H') then
    edadJubilacion := 65
  else
    edadJubilacion := 60;

  faltan := edadJubilacion - edad;
  if faltan < 0 then
    faltan := 0;

  writeln('Anios que faltan para jubilarse: ', faltan);
end.
