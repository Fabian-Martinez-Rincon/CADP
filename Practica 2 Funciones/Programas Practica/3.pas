program ejercicio;
var
    a,x,c:char;
    cant:integer;
begin
    readln(a);
    readln(x);
    readln(c);
    cant:=0;
    while((c>a) and (c<x)) do  begin
        cant:=cant+1;
        readln(c);
    end;
    writeln(cant);        
end. 