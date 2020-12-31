{13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A%B*,
donde:
- A es una secuencia de caracteres en la que no exista el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecieron en A y en la que aparezca a lo sumo 3
veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
 }


program EjerciciosAdd;
procedure A(letrasf:char;var contadorf:integer;var cumpleAf:boolean);
begin
    while(letrasf <> '$') and (letrasf <> '%')do
    begin
        readln(letrasf);
        contadorf:=contadorf+1;
    end;
//____________________________________________________________________________________________
    if (letrasf = '%') then
    begin
        cumpleAf:=true;
    end;
        
end;
//___________________________________________________________________________________________
procedure B(letrasfB:char;var contadorfB:integer;var cumpleB:boolean);
var 
    arroba:integer;
    contadorB:integer;
begin
    arroba:=0;
    contadorB:=0;
    cumpleB:=false;
    while(arroba<3) and (contadorB<contadorfB) and (letrasfB <> '*')   do
    begin
        readln(letrasfB);
        contadorB:=contadorB+1;
        if(letrasfB = '@' )then
        begin
            arroba:=arroba+1;
        end;
        
    end;
    if(letrasfB = '*') then
        begin
            cumpleB:=true;
        end;
    
    
    
end;

//___________________________________________________________________________________________
var
  letras:char;
  contador:integer;
  cumpleA:boolean;
begin
    contador:=0;
    cumpleA:=false;
    read(letras);
    A(letras,contador,cumpleA);
    if (cumpleA)then
    begin
        B(letras,contador,cumpleA);
    end;
end.