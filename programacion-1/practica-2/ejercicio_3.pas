{Leer dos números. Calcular e informar el resultado de la división del primero por el segundo. Tener en cuenta que no se debe realizar la división si el segundo número es cero. }

program DivisionSegura;
var
    num1, num2: Real;
begin
    Write('Ingrese el primer número: ');
    ReadLn(num1);
    Write('Ingrese el segundo número: ');
    ReadLn(num2);

    if num2 <> 0 then
        WriteLn('El resultado de la división es: ', num1 / num2:0:2)
    else
        WriteLn('Error: No se puede dividir por cero.');
end.