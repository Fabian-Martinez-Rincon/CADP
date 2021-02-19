program Probando;
var
    c:integer;
//____________________________________________________
procedure calcular(var b, a:integer);
begin
    b:=10;
    while (b>0) do
    begin
        a := a+b;
        b:=b-2;
        c:=c-b;
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