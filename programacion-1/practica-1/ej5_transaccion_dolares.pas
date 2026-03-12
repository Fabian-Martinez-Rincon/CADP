program ej5_transaccion_dolares;
var
  montoUSD, valorDolar, porcentajeComision, subtotal, total: real;
begin
  writeln('Ingrese monto en dolares:');
  readln(montoUSD);
  writeln('Ingrese valor del dolar en pesos:');
  readln(valorDolar);
  writeln('Ingrese porcentaje de comision del banco:');
  readln(porcentajeComision);

  subtotal := montoUSD * valorDolar;
  total := subtotal + (subtotal * porcentajeComision / 100);

  writeln('La transaccion sera de ', total:0:2, ' pesos argentinos');
end.
