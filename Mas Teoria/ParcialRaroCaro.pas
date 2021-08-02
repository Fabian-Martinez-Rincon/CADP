program raro;
const 
    meses12=12;
type
    cadena30 = string [30];
    rangoMes=1..12;
    venta = record
        Localidad:cadena30;
        monto:integer;
    end;
    listaMes=^nodo;
    nodo=record
        datos:venta;
        sig:listaMes;
    end;
    Ganancias2000 = array [rangoMes] of listaMes;
//______________________________________________________________

//______________________________________________________________
procedure LeerAnio(var V:Ganancias2000);
var
    L:listaMes;
    i:rangoMes;
    actual:rangoMes;
begin
    L:=nil;
    for i:=1 to 12 do
    begin
        while (V[i]^.datos.monto <> 0) do
        begin
            LeerVenta(V[i]^.datos);
            
        end;
    end; 
    
end;
//______________________________________________________________
var
    Vector:Ganancias2000;
begin
    LeerAnio(Vector);
    
end.
