{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el
número 100, el cual debe procesarse. Informar en pantalla:
○ El número máximo leído.
○ El número mínimo leído.
○ La suma total de los números leídos.}
program EjerciciosAdd;
procedure max(numero_ingresado:integer; var maximo:integer);

begin
    if(numero_ingresado>maximo) then
        maximo:=numero_ingresado;
end;
//____________________________________________________________________________________
procedure min(numero_ingresado1:integer; var minimo:integer);
 
begin
    if(numero_ingresado1<minimo) then
        minimo:=numero_ingresado1;
end;
//____________________________________________________________________________________
procedure suma(numero_ingresado2:integer; var total:integer); 
begin
    total:=total+numero_ingresado2;
end;
//____________________________________________________________________________________
var 
    i,numero,numero_maximo,numero_minimo,numero_total:integer;
begin
    numero:=0;
    numero_maximo:=-1;
    numero_minimo:=999;
    for i:=1 to 10 do
    begin
        read(numero);
        max(numero,numero_maximo);
        min(numero,numero_minimo);
        suma(numero,numero_total);
    end;
    writeln('El numero maximo es: ', numero_maximo );
    writeln('El numero minimos es: ', numero_minimo);
    writeln('La suma de todos los numeros es: ', numero_total);

        
end.
