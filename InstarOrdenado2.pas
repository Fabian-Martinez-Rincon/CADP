program probando;
const   
    dimF = 4;
type
    cadena = string[40];
    vector = array [1..dimF] of integer;
//__________________________________________________________________________
Function DeterminarPosicion ( x: integer;  v:Vector): integer;
var 
    pos : integer;
begin
    pos:=1;
    while (pos<=dimF) and (x > v[pos]) do 
    begin
        pos:=pos+1;
    end;
    DeterminarPosicion:= pos;
end; 
//__________________________________________________________________________
Procedure Insertar (var v:vector;  pos:integer; elem:integer);
var 
    j: integer;
begin
    for j:= 4 downto pos do 
    begin
        v [ j +1 ] := v [ j ] ;
    end;
    v [ pos ] := elem; 
End;
//__________________________________________________________________________
Procedure InsertarElemOrd (var v: vector; elem : integer);
 var pos: integer;
Begin
   pos:= DeterminarPosicion (elem, v);    
   Insertar (v, pos, elem);
end;
//__________________________________________________________________________
procedure cargarV(var v:vector);
var
    i:integer;
begin
    for i:=1 to 4 do
    begin
        v[i]:=i*5;
    end;
end;
//__________________________________________________________________________
procedure ImprimirOrden(v:vector);
var
    i:integer;
begin
    for i:=1 to 4 do
    begin
        writeln(v[i]);
    end;
end;
//__________________________________________________________________________
procedure cargarV2(var v2:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        readln(v2[i]);
    end;
end;
//__________________________________________________________________________
var
    v:vector;
    v2:vector;
    i:integer;
begin
    cargarV2(v2);
    cargarV(v);
    for i:=1 to dimF do
    begin
        InsertarElemOrd(v,v2[i]);    
    end;
    
    writeln('__________');
    ImprimirOrden(v);
end.