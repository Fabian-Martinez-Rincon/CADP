program opcio_A;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;
var
    l,nue:lista;
    i:integer;
begin
    l:=Nil;
    for i:=l to 6 do begin
        new(nue);
        nue^.dato:=i;
        nue^.sig:=l;
        l:=nue;
    end;
end.