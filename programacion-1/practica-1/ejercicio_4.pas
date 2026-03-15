{ Realice un programa que informe el valor total en pesos de una transacción en dólares. Para ello, el programa debe leer:
- el monto total en dólares de la transacción
- el valor del dólar al día de la fecha
- y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción.
> Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 1425 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar: 

La transacción será de 14820 pesos argentinos (resultado de multiplicar 10*1425 y adicionarle el 4%)}

program TransaccionDolares;

var
    montoDolares, valorDolar, porcentajeComision, totalPesos, comision: Real;

begin
    Write('Ingrese el monto total en dolares: ');
    ReadLn(montoDolares);
    Write('Ingrese el valor del dolar en pesos: ');
    ReadLn(valorDolar);
    Write('Ingrese el porcentaje de comision del banco: ');
    ReadLn(porcentajeComision);

    totalPesos := montoDolares * valorDolar;
    comision := totalPesos * (porcentajeComision / 100);
    totalPesos := totalPesos + comision;

    WriteLn('La transaccion sera de ', totalPesos:0:2, ' pesos argentinos.');
end.