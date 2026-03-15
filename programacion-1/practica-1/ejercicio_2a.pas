{Leer dos números enteros de teclado y calcular e informar el resultado de la división entera y el 
resto.  }

program DivisionEntera;
var
    num1, num2, cociente, resto: Integer;
begin
    Write('Ingrese el primer número entero: ');
    ReadLn(num1);
    Write('Ingrese el segundo número entero: ');
    ReadLn(num2);

    cociente := num1 div num2;
    resto := num1 mod num2;

    WriteLn('El resultado de la división entera es: ', cociente);
    WriteLn('El resto es: ', resto);
end.