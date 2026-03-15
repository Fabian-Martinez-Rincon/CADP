{Leer un número entero que representa una cantidad de minutos. Calcular e informar la cantidad de horas que representa y los minutos restantes. Ej.: 185 minutos son 3 horas y 5 minutos }

program MinutosAHoras;
var
    minutos, horas, minutosRestantes: integer;
begin
    write('Ingrese la cantidad de minutos: ');
    readln(minutos);
    horas := minutos div 60;
    minutosRestantes := minutos mod 60;
    writeln(minutos, ' minutos son ', horas, ' horas y ', minutosRestantes, ' minutos.');
end.