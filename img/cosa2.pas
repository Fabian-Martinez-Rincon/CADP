program opcion_B;
type
    vector = array [1..10] of integer;
var
    v:vector;
    i,dimL:integer;
begin
    dimL:=0;
    for i:=1 to 6 do begin
        dimL:=dimL + 1;
        v[i]:=i;
    end;
end.