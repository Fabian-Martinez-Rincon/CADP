{Leer un número e imprimirlo si es múltiplo de 3 o múltiplo de 5. }

program Ejercicio1c;
var
    numero: Integer;
begin
    Write('Ingrese un número: ');
    ReadLn(numero);
    if (numero mod 3 = 0) or (numero mod 5 = 0) then
        WriteLn('El número ', numero, ' es múltiplo de 3 o de 5.');
end.