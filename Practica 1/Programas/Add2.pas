{Realizar un programa que lea tres caracteres e informe si los tres eran letras vocales o si al menos uno de ellos no lo era}
program EjerciciosAdd;
type   
    abcedario='a'..'z';
   contar=0..1;
var 

letra1,letra2,letra3:abcedario;
contador:contar;


begin

    contador:=0;
 
    writeln('Letra1:' );
    readln(letra1);
    writeln('Letra2:' );
    readln(letra2);
    writeln('Letra3:' );
    readln(letra3);
    if(letra1 ='a') or (letra1 ='e') or (letra1 ='i') or (letra1 ='o') or (letra1 ='u') then begin
        contador:=contador+1;
    end;
    if(letra2 ='a') or (letra2 ='e') or (letra2 ='i') or (letra2 ='o') or (letra2 ='u') then begin
        contador:=contador+1;
    end;
    if(letra3 ='a') or (letra3 ='e') or (letra3 ='i') or (letra3 ='o') or (letra3 ='u') then begin
        contador:=contador+1;
    end;
    if(contador>=1) then
    begin
        if(contador=3)then 
        begin
            write('Los tres caracteres son vocales');
        end
        else
        begin
            write('Al menos un caracter es una vocal');
        end
    end   
end.

