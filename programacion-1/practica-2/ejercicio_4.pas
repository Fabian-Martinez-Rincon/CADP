{Un teatro necesita un programa que realice lo siguiente:
debe leer el precio de una entrada, la edad del comprador y tipo de función:
- ‘N’ (normal) o ‘E’ (especial).
Luego, debe calcular e informar el precio final de cobro de la entrada:
- si tiene menos de 12 años, obtiene 50% de descuento, y si tiene más de 65 años, obtiene 
30% de descuento.
- Además, si la función es especial ('E'), se suma un recargo del 20% al precio final.}

program Teatro;
var
    precioEntrada, precioFinal: Real;
    edad: Integer;
    tipoFuncion: Char;
begin
    Write('Ingrese el precio de la entrada: ');
    ReadLn(precioEntrada);
    Write('Ingrese la edad del comprador: ');
    ReadLn(edad);
    Write('Ingrese el tipo de funcion (N/E): ');
    ReadLn(tipoFuncion);

    precioFinal := precioEntrada;

    if edad < 12 then
        precioFinal := precioFinal * 0.5
    else if edad > 65 then
        precioFinal := precioFinal * 0.7;

    if UpCase(tipoFuncion) = 'E' then
        precioFinal := precioFinal * 1.2;

    WriteLn('El precio final de la entrada es: ', precioFinal:0:2);
end.