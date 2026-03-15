{Calcular e imprimir el promedio de 2 números enteros que se leen del teclado.}

program PromedioDosNumeros;
var
    num1, num2: integer;
    promedio: real;
begin
    writeln('Ingrese el primer número:');
    readln(num1);
    writeln('Ingrese el segundo número:');
    readln(num2);
    promedio := (num1 + num2) / 2;
    writeln('El promedio es: ', promedio:0:2);
end.