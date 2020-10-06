
{10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos pares y la cantidad de dígitos impares que posee. }

program EjerciciosAdd;

procedure digitos_Pares_Inpares( numerosF:LongInt;var digitos_ParesF,digitos_InparesF:integer);
var
    digitos:integer;

begin
   
    
       while(numerosF<>0) do 
        begin
            digitos:=numerosF mod 10;
            if((digitos mod 2 )=0) then
            begin
                digitos_ParesF:=digitos_ParesF+1;
            end
            else
            begin
                digitos_InparesF:=digitos_InparesF+1;
            end;
            numerosF:=numerosF DIV 10;
         end;
end;
//_________________________________________________________________________________________

//_________________________________________________________________________________________

var 
    numeros:LongInt;
    digitos_Pares:integer;
    digitos_Inpares:integer;
    
begin   
    read(numeros);
    while numeros <> 123456 do
    begin
        digitos_Pares:=0;
        digitos_Inpares:=0;
        digitos_Pares_Inpares(numeros,digitos_Pares,digitos_Inpares);
        writeln('La cantidad de digitos pares es: ', digitos_Pares);
        writeln('La suma de todos sus digitos es: ',digitos_Inpares);
        read(numeros);
    end;
    
    
end.
//______________________________________________________________________________________________