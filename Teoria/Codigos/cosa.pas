program PUNTEROS;
type
    cadena50 = string[50];
    empleado = record
        ape_nom:cadena50;
        edad:integer;
        sueldo:real;
    end;
    vector = array [1..15] of ^empleado;
Var
   v:vector;
   e:empleado;
   i:integer;
   aux:integer;
begin
   aux:=0;
   for i:=1 to 10 do begin
    ReadLn(e.ape_nom,e.edad,e.sueldo);
    new(v[i]^); No se puede hacer new(v[i]^);
    v[i]^:=e;
    aux:=aux + 1;
   end;
    for i:=1 to 5 do
        v[i]^:=Nil; Son pelotudos?

end.