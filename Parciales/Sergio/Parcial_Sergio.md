```Pas
program cosa;
type
    vector = array [1..10] of integer;
//_____________________________________________________________
procedure cargarVector(var v:vector;var dimL:integer);
var
    i:integer;
begin
    for i:=1 to 10 do
        readln(v[i]);
    dimL:=10;
end;
//_____________________________________________________________
Procedure BorrarPos (var v:vector; var dimL:integer; pos:integer);
var 
    i: integer; 
Begin
    for i:= pos + 1  to   dimL  do
        v [ i - 1 ]  :=  v [ i] ;
    dimL := dimL - 1 ;         
End;
//_____________________________________________________________
procedure eliminarOcurrencias(var v:vector;var dimL:Integer;elemento:integer);
var
    i:Integer;
    numero:integer;
begin
    i:=1;
    numero:=0;
    while i<=dimL do
    begin
        if (v[i]=elemento) then
        begin
            numero:=v[i];
            while (numero = v[i]) and (i<=dimL) do
            begin
                BorrarPos (v,dimL,i);    
            end;
            i:=i+1;
        end
        else
            i:=i+1;
    end;
end;    
//_____________________________________________________________
procedure imprimirVector(v:vector;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
        writeln(v[i]);

end;
//_____________________________________________________________
var
    v:vector;
    dimL:integer;
    elemento:integer;
begin
    elemento:=3;
    cargarVector(v,dimL);
    WriteLn('___________');
    eliminarOcurrencias(v,dimL,elemento);
    imprimirVector(v,dimL);
end.
```
