program sumador;
type
    vnums = array [1..10] of integer;
var 
    numeros : vnums;
    i:integer;
begin
    for i:=1 to 10 do
    begin
        numeros[i]:=i;
        WriteLn('nro: ', numeros[i]);
    end;
    WriteLn('_________________________');
    for i:=2 to 9 do
    begin
        numeros[i+1]:= numeros[i];
        //  2 + 1 = 3
        //  3 + 3 = 6
        //  4 + 6 = 10
        //  5 + 10 = 15
        //  6 + 15 = 21
        //  7 + 21 = 28
        //  8 + 28 = 36
        //  9 + 36 = 45 
        //  10 + 45 = 55
        WriteLn('i: ',i,' nro: ',numeros[i+1]);
    end;    
end.