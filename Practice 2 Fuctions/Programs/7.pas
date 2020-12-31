{7. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números hasta
encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es
el doble de numA.
- Por ejemplo, si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4
(cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program EjerciciosAdd;
procedure cosa(numero1:integer ; var numero2:integer);
var 
    doble:integer;
begin
    doble:=numero1*2;
    if(numero2=doble) then
    begin
      Write('El numero B es el doble de numero A');
    end
    else 
    begin
        write('El numero B no es el doble de numero A');
    end;
end;

var 
    numA,numB:integer;
begin
    write('Ingrese una secuencia de numeros por ejem:(1,2) (3,4) (9,3) (7,14) (0,0)  ');
    read(numA);
    read(numB);
    cosa(numA,numB);
        
end.
