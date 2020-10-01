{7. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números hasta
encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es
el doble de numA.
- Por ejemplo, si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4
(cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}
program EjerciciosAdd;
procedure max(numero_ingresado:integer; var maximo:integer);

begin
    if(numero_ingresado>maximo) then
        maximo:=numero_ingresado;
end;

var 
    numA,numB:integer;
begin
    read(numA);
    read(numB);
    numeros(numA,numB);
        
end.
