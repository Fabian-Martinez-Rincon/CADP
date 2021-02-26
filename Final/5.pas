program pregunta5;
type
    arreglo1 = array [1..100] of integer;
    arreglo2 = array [1..50] of integer;
//______________________________________________
procedure cargarArreglo(var a1:arreglo1);
var
    i:integer;
begin
    for i:=1 to 100 do
    begin
        a1[i]:=i;
    end;
end;
//______________________________________________
procedure impares(a1:arreglo1;var a2:arreglo2);
var
    contador:integer;
    i:integer;
begin
    contador:=1;
    for i:=1 to 100 do
    begin
        if ((a1[i] mod 2) = 1) then
        begin
            a2[contador]:=i;
            contador:=contador+1;
        end;
    end;
end;
//______________________________________________
procedure imprimirA2(a2:arreglo2);
var
    i:integer;
begin
    for i:=1 to 50 do
    begin
        writeln(a2[i]);
    end;
end;
//______________________________________________
var
    a1:arreglo1;
    a2:arreglo2;
begin
    cargarArreglo(a1);
    impares(a1,a2);
    imprimirA2(a2);
end.