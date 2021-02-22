program cosa;
type
    puntero = ^integer;
var
    p,q:puntero;
begin
    p := Nil;
    new(q);
    q^:=200;
    p:=q;
    p^:=150;
    Writeln(p^);
    Writeln(q^);
    New(q);
    q^:=300;
    q^:=p^;
    Writeln(p^);
    Writeln(q^);
    Dispose(p);
    q:=Nil;
    Writeln(p^);
    Writeln(q^);
end.