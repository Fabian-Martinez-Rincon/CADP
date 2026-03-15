{Declarar una constante con un valor entre 10 y 20, y leer un número de teclado. Calcular e 
informar el resultado de la multiplicación entre la constante y el número }
program Ejercicio1C;
const
    VALOR = 15;
var
    numero, resultado: Integer;
begin
    Write('Ingrese un numero: ');
    ReadLn(numero);
    resultado := VALOR * numero;
    WriteLn('El resultado de la multiplicacion es: ', resultado);
end.