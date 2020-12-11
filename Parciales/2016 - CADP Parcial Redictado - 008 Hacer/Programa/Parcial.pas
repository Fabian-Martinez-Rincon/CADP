program Parcial;
const 
    dimF = 1000;
type     
    rango = 1..dimF;
    cadena = string [40];
    producto = record
        descripcion:cadena;
        precio:real;
    end;
    comercio = array [rango] of producto;
    venta record
        codVenta:integer;
        dni:integer;
        codProd:rango;
        unidades:integer
    end;
    lista = ^nodo;
    nodo = record
        datos:venta;
        sig:lista;
    end;
    vectorContador = array [rango] of integer;
//_____________________________________________
procedure LeerVenta(var V:venta);
begin
    readln(V.codVenta);
    readln(V.dni);
    readln(V.codProd);
    readln(V.unidades);
end;
//_____________________________________________
procedure agregarAdelante(var L:lista;v:venta);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=v;
    nue^sig:=L;
    L:=nue;        
end;
//_____________________________________________
procedure LeerYAlmacenarVentas(var L:lista);
var
    var V:venta;
begin
    LeerVenta(V);
    until   
        agregarAdelante(L,V);
        LeerVenta(V);
    repeat V.codVenta <> 2121
end;
//_____________________________________________
procedure recorrerVentas(L:lista;C:comercio);
var
    montoTotal:real;
    codmax:rango;
    codmin:rango;
    descripcionmax:cadena;
    descripcionmin:cadena;
    vendidasMax:integer;
    vendidasMiN:integer;
    contDNI:integer;
begin
    contDNI:=0;
    vendidasMax:=-1;
    vendidasMiN:=9999;
    while L <> nil do
    begin
        montoTotal:=0;
        writeln(L^.datos.codVenta);
        montoTotal:=montoTotal+(((L^.datos.unidades)*(C[L^.datos.codProd].precio));
        writeln(montoTotal);
        if (L^.datos.unidades>vendidasMax) then
        begin
            vendidasMax:=L^.datos.unidades;
            codmax:=L^.datos.codProd;
            descripcionmax:=C[L^.datos.codProd].descripcion;
        end;
        if (L^.datos.unidades<vendidasMiN) then
        begin
            vendidasMiN:=L^.datos.unidades;
            codmin:=L^.datos.codProd;
            descripcionmin:=C[L^.datos.codProd].descripcion;
        end;

        L:=L^.sig;
    end;
end;
//_____________________________________________
var
    L:lista;
    C:comercio;
begin
    L:=nil;
    CargarProductos(C);
    LeerYAlmacenarVentas(L);
    recorrerVentas(L,C);
end;