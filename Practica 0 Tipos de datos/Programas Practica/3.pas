//3. Implemente un programa que lea dos números reales e imprima el resultado de la división de los mismos con una
//precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2 , debe imprimir:
//El resultado de dividir 4,5 por 7,2 es 0,62
//Recuerde que para imprimir en pantalla números reales puede utilizar la notación: writeln(X:Y:Z), donde X es el
//número a imprimir, Y es el ancho (en cantidad de caracteres) que debe ocupar la impresión, y Z es la cantidad de
//decimales. Por ejemplo, sea el número pi=3.141592654:
//3.14 => writeln(pi,1,2);
//3.14 => writeln(pi,8,2) ; (observe que hay 4 espacios delante del número 3, necesarios para completar los 8
//caracteres de ancho)
//3,1415 => writeln(pi,1,4);

program untitled;

var
	numero_1: real;
	numero_2: real;
	resultado: real;

begin
	read(numero_1);
	read(numero_2);
	resultado:= numero_1 / numero_2;
	writeln('El resultado de la division es: ' , resultado:3:2);
	
	
end.

