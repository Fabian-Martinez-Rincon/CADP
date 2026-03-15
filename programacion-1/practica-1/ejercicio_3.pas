{
- El radio (R) del círculo (la mitad del diámetro).
- El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI * R^2 (PI = 3,14)
- El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula D*PI (o 
también PI*R*2). 
}

program Circulo;

const
    PI = 3.14;

var
    diametro, radio, area, perimetro: Real;

begin
    Write('Ingrese el diametro del circulo: ');
    ReadLn(diametro);

    radio := diametro / 2;
    area := PI * radio * radio;
    perimetro := PI * diametro;

    WriteLn('Radio: ', radio:0:2);
    WriteLn('Area: ', area:0:2);
    WriteLn('Perimetro: ', perimetro:0:2);
end.