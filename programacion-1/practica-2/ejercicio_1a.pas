{Leer 2 números por teclado e imprimir el mayor. }

program ejercicio_1a;
var
  numero_1, numero_2: integer;
begin
  writeln('Ingrese el primer numero:');
  readln(numero_1);
  writeln('Ingrese el segundo numero:');
  readln(numero_2);

  if numero_1 > numero_2 then
    WriteLn('El numero mayo es ', numero_1)
  else
    WriteLn('El numero mayo es ', numero_2)
end.
