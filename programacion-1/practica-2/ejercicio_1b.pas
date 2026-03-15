{Leer un número desde teclado e imprimirlo si es par y  mayor que 10. }


program Ejercicio1b;
var
    numero: Integer;
begin
    Write('Ingrese un número: ');
    ReadLn(numero);
    if (numero mod 2 = 0) and (numero > 10) then
        WriteLn('El número ', numero, ' es par y mayor que 10.');
end.