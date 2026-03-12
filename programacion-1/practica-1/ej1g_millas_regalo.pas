program ej1g_millas_regalo;
var
  millas, regalo: integer;
begin
  writeln('Ingrese la cantidad de millas del boleto:');
  readln(millas);

  regalo := millas div 100;
  writeln('Millas de regalo: ', regalo);
end.
