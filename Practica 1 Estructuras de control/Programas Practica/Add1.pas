{ Realizar un programa que lea 3 números enteros y los imprima en orden descendente. Por ejemplo:
- Si se ingresan los valores: 4, -10 y 12; deberá imprimir: 12 4 -10}
program EjerciciosAdd;

var ordenar:integer;
numero1,numero2,numero3:integer;

begin
    ordenar:=0;
    write('Numero 1: ');
    read(numero1);
    write('Numero 2: ');
    read(numero2);
    write('Numero 3: ');
    read(numero3);
    if(numero2<numero1) and (numero3<numero1)then
    begin
      Writeln(numero1);
      if(numero3<numero2) then
        begin
           writeln(numero2);
           writeln(numero3);
        end
      else
        begin
          Writeln(numero3);
          writeln(numero2);
        end;
    end;
    if(numero1<numero2) and (numero3<numero2)then
    begin
      Writeln(numero2);
      if(numero3<numero1) then
        begin
           writeln(numero1);
           writeln(numero3);
        end
      else
        begin
          Writeln(numero3);
          writeln(numero1);
        end;
    end;
    if(numero1<numero3) and (numero2<numero3)then
    begin
      Writeln(numero3);
      if(numero1<numero2) then
        begin
           writeln(numero2);
           writeln(numero1);
        end
      else
        begin
          Writeln(numero1);
          writeln(numero2);
        end;
    end;
end.

