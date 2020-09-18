//4. Implemente un programa que lea el diámetro D de un círculo e imprima:
//a. El radio (R) del círculo (la mitad del diámetro)
//b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
//c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula D*PI (o también PI*R*2)

program untitled;

var
	diametro: real;
	radio: real;
	pi: real;
	area:real;
	perimetro:real;
begin
	pi:=3.14159265359;
	writeln('Ingrese el diametro: ');
	read(diametro);
	radio:= diametro / 2;
	area:=pi*(diametro*diametro);
	perimetro:=diametro*pi;
	writeln('El radio es: ' ,radio:2:3);
	writeln('El area es: ' , area:2:3);
	writeln('El perimetro es: ' , perimetro:2:3);
	
	
	
	
end.
