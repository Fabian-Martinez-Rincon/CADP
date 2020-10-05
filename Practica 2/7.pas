
{7. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de números hasta
encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de pares en las que numB es
el doble de numA.
- Por ejemplo, si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores 4
(cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program EjerciciosAdd;
procedure ParesDobles( var DoblesB,pares:integer; numero1:integer ; numero2:integer);
var
    dobleB:integer;
begin
    dobleB:=numero1*2;
    if numero1 mod 2 = 0 then
    begin
      pares:=pares+1;
      writeln('numeroA es par'); 
    end;
    if numero2 mod 2 = 0 then
    begin
      pares:=pares+1;
      writeln('numeroB es par'); 
    end;
    if numero2>=dobleB then
    begin
      DoblesB:=DoblesB+1;
    end;
end;
//____________________________________________________________________________________________________________________
procedure secuenciaNumeros(var doblesF,paresF:integer;numAF:integer ; numBF:integer);
begin
    while(numAF<>0) or (numBF<>0) do
      begin
        read(numAF);
        read(numBF);
        writeln('(',numAF,',',numBF,')');
        ParesDobles(doblesF,paresF,numAF,numBF);
      end;
end;
//____________________________________________________________________________________________________________________
var 
    NumeroDoble,NumerosPares,numA,numB:integer;
begin
    NumeroDoble:=0;
    NumerosPares:=0;
    writeln('Ingrese una secuencia de numeros por ejem:(1,2) (3,4) (9,3) (7,14) (0,0)  ');
    read(numA);
    read(numB);
    writeln('(',numA,',',numB,')');
    ParesDobles(NumeroDoble,NumerosPares,numA,numB);
    secuenciaNumeros(NumeroDoble,NumerosPares,numA,numB);
    writeln('Termino');    
    writeln('La cantidad de numeros :',NumeroDoble); 
    writeln('La cantidad de numeros Pares es:',NumerosPares);       
    
        
end.
//____________________________________________________________________________________________________________________