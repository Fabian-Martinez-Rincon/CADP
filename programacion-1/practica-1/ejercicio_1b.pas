{Leer base y altura de un rectángulo e imprimir el área y perímetro de este (área = base * altura, 
perímetro = 2*base + 2*altura).}

program Rectangulo;

var
    base, altura, area, perimetro: Real;

begin
    Write('Ingrese la base del rectángulo: ');
    ReadLn(base);
    Write('Ingrese la altura del rectángulo: ');
    ReadLn(altura);

    area := base * altura;
    perimetro := 2 * base + 2 * altura;

    WriteLn('El área del rectángulo es: ', area:0:2);
    WriteLn('El perímetro del rectángulo es: ', perimetro:0:2);
end.