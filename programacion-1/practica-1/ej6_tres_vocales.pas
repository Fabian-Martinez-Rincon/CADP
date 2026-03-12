program ej6_tres_vocales;
var
  c1, c2, c3: char;

function EsVocal(c: char): boolean;
begin
  c := upcase(c);
  EsVocal := (c = 'A') or (c = 'E') or (c = 'I') or (c = 'O') or (c = 'U');
end;

begin
  writeln('Ingrese tres caracteres (uno por linea):');
  readln(c1);
  readln(c2);
  readln(c3);

  if EsVocal(c1) and EsVocal(c2) and EsVocal(c3) then
    writeln('Los tres son vocales')
  else
    writeln('Al menos un caracter no era vocal');
end.
