{Declarar una constante con un valor entre 50 y 100, y leer un número de teclado. Calcular e 
informar el resultado de la división entre la constante y el número}

program Ejercicio1d;

const
    VALOR = 75; // Valor entre 50 y 100

var
    numero: Integer;
    resultado: Real;

begin
    Write('Ingrese un numero: ');
    ReadLn(numero);

    if numero <> 0 then
    begin
        resultado := VALOR / numero;
        WriteLn('El resultado de la division es: ', resultado:0:2);
    end
    else
        WriteLn('Error: No se puede dividir por cero.');
end.