
{9. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que posee y la suma de los mismos.
a. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el cual debe procesarse.}

program EjerciciosAdd;

procedure digitos_CantidadYSuma( numerosF:LongInt;var cantidad_numerosF,suma_numerosF:integer);
var
    digitos:integer;

begin
    
    while(numerosF<>0) do 
    begin
        digitos:=numerosF mod 10;
        cantidad_numerosF:=cantidad_numerosF+1;
        suma_numerosF:=suma_numerosF+digitos;
        numerosF:=numerosF DIV 10;
    end;
end;
//_________________________________________________________________________________________

//_________________________________________________________________________________________

var 
    numeros:LongInt;
    cantidad_numeros:integer;
    suma_numeros:integer;
    
begin   
    
    repeat  
    begin
        cantidad_numeros:=0;
        suma_numeros:=0;
        read(numeros);
        digitos_CantidadYSuma(numeros,cantidad_numeros,suma_numeros);
    end;
    until (suma_numeros=10);
    writeln('La cantidad de digitos es: ', cantidad_numeros);
    writeln('La suma de todos sus digitos es: ',suma_numeros);
    
end.
//______________________________________________________________________________________________