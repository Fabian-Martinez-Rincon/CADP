{ Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0 (que no debe procesarse). El programa deberá aplicar la operación leída con la secuencia
de números e imprimir el resultado final. Por ejemplo:
- Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
- Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir: 0 ( -10 + 5 + 6 + (-1) )}
program EjerciciosAdd;
procedure Numeros(signo2:char);
var
    i:integer;
    Ingresar_numero:integer;
begin
    writeln('Ingrese un numero: ');
    read(Ingresar_numero);
    while(Ingresar_numero<>0)do
    begin
        write(signo2);
        read(Ingresar_numero);
        
    end;
end;

var 
    signo:char;
    signo_confirmado:char;
begin
    signo_confirmado:='s';
    read(signo);
    writeln('La cosa es: ', signo);
    case(signo) of
    '+':begin   signo_confirmado:=signo;  
                Numeros(signo_confirmado); 
        end;
    '-':begin   signo_confirmado:=signo;
                Numeros(signo_confirmado);
        end;
    else write('error');
    end;
    
    
end.
