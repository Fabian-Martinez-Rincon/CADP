program Probando;
var
    c:integer;
//____________________________________________________
procedure calcular(var b, a:integer);
begin
    b:=10;
    WriteLn('c: ',c);
    while (b>0) do
    begin
        a := a+b;//80 + 10, 90 + 8, 98 + 6, 104 + 4, 108 +2 = 110
        b:=b-2;
        c:=c-b;
        WriteLn('c: ',c);
    end;
    WriteLn('a=', a, ' b=', b, ' c=', c);
end;
//____________________________________________________
var
    a,b :integer;
begin
    b:=80;
    c:=30;
    WriteLn('a=', a, ' b=', b, ' c=', c);
    calcular(a,b);
    WriteLn('a=', a, ' b=', b, ' c=', c);
end.