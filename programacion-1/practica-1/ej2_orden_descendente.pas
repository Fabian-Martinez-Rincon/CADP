program ej2_orden_descendente;
var
  a, b, c, aux: integer;
begin
  writeln('Ingrese tres numeros enteros:');
  readln(a);
  readln(b);
  readln(c);

  if a < b then
  begin
    aux := a;
    a := b;
    b := aux;
  end;

  if a < c then
  begin
    aux := a;
    a := c;
    c := aux;
  end;

  if b < c then
  begin
    aux := b;
    b := c;
    c := aux;
  end;

  writeln('Orden descendente: ', a, ' ', b, ' ', c);
end.
